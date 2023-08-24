from django.urls import path 

from .views import (MainAPIView, 
                    ProductDetailAPIView, 
                    FavoritesAPIView, 
                    AddFavotiteAPIView, 
                    CartAPIView, 
                    OrderAPIView, 
                    OrderItemAPIView, 
                    AddBasketItemAPIView)


urlpatterns = [
    path('', MainAPIView.as_view(), name='main'),
    path('products/<str:title>/', ProductDetailAPIView.as_view(), name='product-detail'),
    path('favorites/', FavoritesAPIView.as_view(), name='favorites'),
    path('favorites/add/', AddFavotiteAPIView.as_view(), name='add-favorite'),
    path('cart/', CartAPIView.as_view(), name='cart'),
    path('cart/add/', AddBasketItemAPIView.as_view(), name='add-cart-item'),
    path('orders/items/', OrderItemAPIView.as_view(), name='order-items'),
    path('orders/', OrderAPIView.as_view(), name='orders'),
]