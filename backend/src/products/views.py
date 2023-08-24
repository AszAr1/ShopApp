from rest_framework.generics import *
from rest_framework.mixins import *
from rest_framework.permissions import *
from rest_framework.authentication import *
from rest_framework.viewsets import *
from django.urls import reverse, resolve

from .models import Product, Favorite, CartItem, Order, OrderItem
from .serializers import ProductSerializer, CartItemSerializer, FavoriteSerializer, OrderItemSerializer, OrderSerializer


class MainAPIView(ListCreateAPIView):
    queryset = Product.objects.all()
    serializer_class = ProductSerializer
    # authentication_classes = [SessionAuthentication]
    # permission_classes = [IsAuthenticated]

    def list(self, request, *args, **kwargs):
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

    def delete(self, request, *args, **kwargs):
        obj_id = request.data.get('id')
        obj = {}
        if obj_id is None or obj_id == '':
            obj = Favorite.objects.filter(user=self.request.user.id)[0]
        else:
            obj = Favorite.objects.filter(id=obj_id)[0]
        self.perform_destroy(obj)
        data = request.data.copy()
        return Response(data=data, status=status.HTTP_204_NO_CONTENT)


class ProductDetailAPIView(RetrieveDestroyAPIView, CreateAPIView):
    queryset = Product.objects.all()
    serializer_class = ProductSerializer
    lookup_field = 'title'


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
        data = request.data.copy()
        if not 'user' in data.keys():
            data['user'] = request.user.id
        else:
            if data['user'] == '':
                data['user'] = request.user.id

        serializer = self.get_serializer(data=data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        data = serializer.data.copy()
        return Response(data, status=status.HTTP_201_CREATED, headers=headers)
    
    def delete(self, request, *args, **kwargs):
        instance = self.get_object()
        obj = Favorite.objects.filter(product=instance.id, user=self.request.user.id)
        self.perform_destroy(obj)
        data = request.data.copy()
        data['smth'] = instance.id
        return Response(data=data, status=status.HTTP_204_NO_CONTENT)

            
class AddFavotiteAPIView(CreateAPIView):
    queryset = Favorite.objects.all()
    serializer_class = FavoriteSerializer

    def post(self, request, *args, **kwargs):
        data = request.data.copy()
        if not 'user' in data.keys():
            data['user'] = request.user.id
        else:
            if data['user'] == '':
                data['user'] = request.user.id

        serializer = self.get_serializer(data=data)
        
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        data['smth'] = self.request.user.id
        return Response(data, status=status.HTTP_201_CREATED, headers=headers)


class CartAPIView(ListCreateAPIView):
    queryset = CartItem.objects.all()
    serializer_class = CartItemSerializer
    # user_id = serializer_class.data.getter('pk')
    # queryset = BasketItem.objects.filter(user=user_id)
    # queryset = BasketItem.objects.all()

    def get_serializer(self, *args, **kwargs):
        if self.request.method == "POST":
            if 'quantity' in self.request.data.keys():
                serializer_class = OrderItemSerializer
            else: 
                serializer_class = OrderSerializer
        else: 
            serializer_class = CartItemSerializer

        kwargs.setdefault('context', self.get_serializer_context()) 
        return serializer_class(*args, **kwargs)
    


    def post(self, request, *args, **kwargs):
        return_data = request.data
        if not 'customer' in return_data.keys():
            return_data['customer'] = request.user.id  
        else:
            if return_data['customer'] == None:
                return_data['customer'] = request.user.id

        serializer = self.get_serializer(data=return_data)
        
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        
        order_id = serializer.data.get('id')
        return_data.pop("customer")

        for cart_item in CartItem.objects.filter(user=self.request.user.id):
            return_data['order'] = order_id
            product = ''.join(str(cart_item.product).split('(')[1:])[:-1]
            return_data['product'] = product
            return_data['quantity'] = cart_item.quantity

            serializer = self.get_serializer(data=return_data)
            
            serializer.is_valid(raise_exception=True)
            self.perform_create(serializer)

        return_data.clear()
        return_data['customer'] = self.request.user.id 
        return_data['order'] = order_id  

        return Response(return_data, status=status.HTTP_201_CREATED, headers=headers)
    

    def list(self, request, *args, **kwargs):
        list_queryset = CartItem.objects.filter(user=request.user.id)
        # list_queryset = CartItem.objects.all()

        page = self.paginate_queryset(list_queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = self.get_serializer(list_queryset, many=True)
        data = serializer.data.copy()
        # data.append()
        return Response(data)


class AddBasketItemAPIView(CreateAPIView):
    queryset = CartItem.objects.all()
    serializer_class = CartItemSerializer

    def post(self, request, *args, **kwargs):
        data = request.data.copy()
        if data['user'] == '':
            data['user'] = request.user.id


        serializer = self.get_serializer(data=data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        
        data['smth'] = self.request.user.id
        return Response(data, status=status.HTTP_201_CREATED, headers=headers)


class OrderAPIView(ListAPIView):
    queryset = Order.objects.all()
    serializer_class = OrderSerializer

class OrderItemAPIView(ListAPIView):
    queryset = OrderItem.objects.all()
    serializer_class = OrderItemSerializer