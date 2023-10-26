from rest_framework.generics import *
from rest_framework.mixins import *
from rest_framework.permissions import *
from rest_framework.authentication import *
from rest_framework.filters import SearchFilter, OrderingFilter
from django_filters.rest_framework import DjangoFilterBackend

from .models import Product, Favorite, CartItem, Order, OrderItem
from .serializers import (ProductSerializer, 
                          CartItemSerializer, 
                          FavoriteSerializer, 
                          OrderItemSerializer, 
                          OrderSerializer)


class MainAPIView(ListCreateAPIView):
    queryset = Product.objects.all()
    serializer_class = ProductSerializer
    filter_backends = [SearchFilter, OrderingFilter, DjangoFilterBackend]
    filterset_fields = ['category'] 
    search_fields = ['category', 'title', 'description']
    ordering_fields = ['price']

    def perform_create(self, serializer):
        title = serializer.validated_data.get('title')
        description = serializer.validated_data.get('description') or None
        content = serializer.validated_data.get('content') or None
        if content is None:
           content = title
        if description is None:
            description = title

        serializer.save()
  

class HoodiesListAPIView(ListAPIView):
    queryset = Product.objects.filter(category='Hoodies')
    serializer_class = ProductSerializer


class SneakersListAPIView(ListAPIView):
    queryset = Product.objects.filter(category='Sneakers')
    serializer_class = ProductSerializer


class FavoritesAPIView(ListAPIView, DestroyAPIView):
    queryset = Favorite.objects.all()
    serializer_class = FavoriteSerializer

    def list(self, request, *args, **kwargs):
        queryset = Favorite.objects.filter(user=request.user.id)

        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)
    
    def delete(self, request, *args, **kwargs):
        obj_id = request.data.get('id')
        obj = {}
        if obj_id is None or obj_id == '':
            obj = Favorite.objects.filter(user=self.request.user.id)[0]
        else:
            obj = Favorite.objects.get(id=obj_id)
        self.perform_destroy(obj)
        data = request.data.copy()
        return Response(data=data, status=status.HTTP_204_NO_CONTENT)


class ProductDetailAPIView(RetrieveDestroyAPIView, CreateAPIView):
    queryset = Product.objects.all()
    serializer_class = ProductSerializer
    lookup_field = 'pk'

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
    
    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        serializer = self.get_serializer(instance)
        return Response(serializer.data)

    def post(self, request, *args, **kwargs):
        data = self.request.data.copy()
        data['user'] = request.user.id
        print(data['user'])
        serializer = self.get_serializer(data=data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)
    
    def delete(self, request, *args, **kwargs):
        instance = self.get_object()
        data = dict()
        data['smth'] = instance.id
        self.perform_destroy(instance)
        return Response(data=data, status=status.HTTP_204_NO_CONTENT)


class CartAPIView(ListAPIView):
    queryset = CartItem.objects.all()
    serializer_class = CartItemSerializer 

    def list(self, request, *args, **kwargs):
        queryset = CartItem.objects.filter(user=request.user.id)

        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)


class OrderAPIView(ListAPIView):
    queryset = Order.objects.all()
    serializer_class = OrderSerializer

    def list(self, request, *args, **kwargs):
        queryset = Order.objects.filter(customer=request.user.id)

        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)


class OrderItemAPIView(RetrieveAPIView):
    queryset = Order.objects.all()
    serializer_class = OrderSerializer
    lookup_field = 'pk'

    def retrieve(self, request, *args, **kwargs):
        queryset = OrderItem.objects.filter(order=kwargs['pk'])
        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = OrderItemSerializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = OrderItemSerializer(queryset, many=True)
        return Response(serializer.data)