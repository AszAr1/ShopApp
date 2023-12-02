from rest_framework.generics import *
from rest_framework.mixins import *
from rest_framework.permissions import *
from rest_framework.authentication import *
from rest_framework.filters import SearchFilter, OrderingFilter
from django_filters.rest_framework import DjangoFilterBackend

from .models import Product, Favorite, CartItem, Order, OrderItem
from .serializers import (
    ProductSerializer, 
    CartItemSerializer, 
    FavoriteSerializer, 
    OrderItemSerializer, 
    OrderSerializer,
)


class MainAPIView(ListAPIView):
    queryset = Product.objects.all()
    serializer_class = ProductSerializer
    filter_backends = [SearchFilter, OrderingFilter, DjangoFilterBackend]
    filterset_fields = ['category'] 
    search_fields = ['category', 'title', 'description']
    ordering_fields = ['price']
    permission_classes = [AllowAny]

    def list(self, request, *args, **kwargs):
        self.queryset = self.filter_queryset(self.queryset)
        self.queryset = self.queryset[:int(request.query_params['filter'])] if 'filter' in request.query_params else self.queryset
        return super().list(request, *args, **kwargs)

    def perform_create(self, serializer):
        title = serializer.validated_data.get('title')
        description = serializer.validated_data.get('description') or None
        content = serializer.validated_data.get('content') or None 
        if content is None:
           content = title
        if description is None:
            description = title

        serializer.save()
  

class FavoritesAPIView(ListAPIView, DestroyAPIView):
    queryset = Favorite.objects.all()
    serializer_class = FavoriteSerializer
    permission_classes = [IsAuthenticated]

    def list(self, request, *args, **kwargs):
        favorite_queryset = Favorite.objects.filter(user=request.user.id)
        data = FavoriteSerializer(favorite_queryset, many=True).data
        for datum in data:
            product = ProductSerializer(Product.objects.get(id=datum['product']), context={'request': request}).data
            datum.update({'product': product})
        return Response(data=data, status=status.HTTP_200_OK)
    
    def delete(self, request, *args, **kwargs):
        if request.data.get('id') is None or request.data.get('id') == '':
            return Response(status=status.HTTP_400_BAD_REQUEST)
        
        Favorite.objects.get(id=request.data.get('id')).delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


class ProductDetailAPIView(RetrieveDestroyAPIView, CreateAPIView):
    queryset = Product.objects.all()
    serializer_class = ProductSerializer
    lookup_field = 'pk'
    permission_classes = [IsAuthenticatedOrReadOnly]

    def get_serializer(self, *args, **kwargs):
        if self.request.method == "POST":
            if 'quantity' in self.request.data.keys():
                serializer_class = CartItemSerializer
            else: 
                serializer_class = FavoriteSerializer
        else: 
            serializer_class = ProductSerializer

        kwargs.setdefault('context', self.get_serializer_context()) 
        return serializer_class(*args, **kwargs)
    
    def post(self, request, *args, **kwargs):
        data = self.request.data.copy()
        data['user'] = request.user.id
            
        serializer = self.get_serializer(data=data)
        if serializer.__class__.__name__ is FavoriteSerializer.__name__ and Favorite.objects.filter(user=data['user'], product=data['product']).exists():
            return Response(data={"message": "This product is already in Favorites"}, status=status.HTTP_400_BAD_REQUEST)

        serializer.is_valid(raise_exception=True)
        serializer.save()
        headers = self.get_success_headers(serializer.data)
        return Response(status=status.HTTP_201_CREATED, headers=headers)
    
    def delete(self, request, *args, **kwargs):
        instance = self.get_object()
        self.perform_destroy(instance)
        return Response(status=status.HTTP_204_NO_CONTENT)


class CartAPIView(ListCreateAPIView):
    queryset = CartItem.objects.all()
    serializer_class = CartItemSerializer 
    permission_classes = [IsAuthenticated]

    def list(self, request, *args, **kwargs):
        data = CartItemSerializer(CartItem.objects.filter(user=request.user.id), many=True).data
        for datum in data:
            product = ProductSerializer(Product.objects.get(id=datum['product']), context={'request': request}).data
            datum.update({'product': product})
        return Response(data=data, status=status.HTTP_200_OK)
    
    def post(self, request, *args, **kwargs):
        if len(CartItem.objects.filter(user=request.user.id)) == 0:
            return Response(data={"message": "No products in cart"}, status=status.HTTP_400_BAD_REQUEST)
        
        order_serializer = OrderSerializer(data={'user': request.user.id})
        order_serializer.is_valid(raise_exception=True)
        order_serializer.save()
        headers = self.get_success_headers(order_serializer.validated_data)
        cart_items = CartItem.objects.filter(user=request.user.id)
        order_id = Order.objects.filter(user=request.user.id).last().id
        print(order_serializer['id'])

        for item in cart_items:
            item_data = {"product": item.product.id, 'quantity': item.quantity, 'order': order_id}
            order_item_serializer = OrderItemSerializer(data=item_data)
            order_item_serializer.is_valid(raise_exception=True)
            order_item_serializer.save()

        cart_items.delete()

        return Response(status=status.HTTP_201_CREATED, headers=headers)


class OrdersAPIView(ListAPIView):
    queryset = Order.objects.all()
    serializer_class = OrderSerializer
    permission_classes = [IsAuthenticated]

    def list(self, request, *args, **kwargs):
        orders = OrderSerializer(self.queryset.filter(user=request.user.id), many=True).data
        
        for order in orders:
            products = [item.product for item in OrderItem.objects.filter(order=order['id'])]
            order['products'] = ProductSerializer(products, many=True, context={'request': request}).data
            
        return Response(orders, status=status.HTTP_200_OK)


class HoodiesListAPIView(ListAPIView):
    queryset = Product.objects.filter(category='Hoodies')
    serializer_class = ProductSerializer
    permission_classes = [IsAuthenticatedOrReadOnly]

    def filter_queryset(self, request, queryset):
        return queryset[:int(request.query_params['filter'])] if 'filter' in request.query_params else queryset

    def list(self, request, *args, **kwargs):
        self.queryset = self.filter_queryset(request, self.get_queryset())
        return Response(self.get_serializer(self.queryset, many=True).data, status=status.HTTP_200_OK)
    

class SneakersListAPIView(ListAPIView):
    queryset = Product.objects.filter(category='Sneakers')
    serializer_class = ProductSerializer
    permission_classes = [IsAuthenticatedOrReadOnly]

    def filter_queryset(self, request, queryset):
        return queryset[:int(request.query_params['filter'])] if 'filter' in request.query_params else queryset

    def list(self, request, *args, **kwargs):
        self.queryset = self.filter_queryset(request, self.get_queryset())
        return Response(self.get_serializer(self.queryset, many=True).data, status=status.HTTP_200_OK)