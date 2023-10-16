from django.urls import path 

from .views import (MainAPIView, 
                    ImageAPIView,
                    ProductDetailAPIView, 
                    FavoritesAPIView, 
                    AddFavotiteAPIView, 
                    CartAPIView, 
                    OrderAPIView, 
                    OrderItemAPIView, 
                    HoodiesListAPIView, 
                    SneakersListAPIView, 
                    AddBasketItemAPIView,)


urlpatterns = [
    path('', MainAPIView.as_view(), name='main'),
    path('products/hoodies/', HoodiesListAPIView.as_view(), name='product-hoodies'),
    path('products/sneakers/', SneakersListAPIView.as_view(), name='product-sneakers'),
    path('products/<int:pk>/', ProductDetailAPIView.as_view(), name='product-detail'),
    path('source/<str:image>/', ImageAPIView.as_view(), name='product-image'),
    path('favorites/', FavoritesAPIView.as_view(), name='favorites'),
    path('favorites/add/', AddFavotiteAPIView.as_view(), name='add-favorite'),
    path('cart/', CartAPIView.as_view(), name='cart'),
    path('cart/add/', AddBasketItemAPIView.as_view(), name='add-cart-item'),
    path('orders/items/', OrderItemAPIView.as_view(), name='order-items'),
    path('orders/', OrderAPIView.as_view(), name='orders'),
]