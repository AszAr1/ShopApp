from django.urls import path
from django.conf import settings
from django.conf.urls.static import static

from .views import (AddCartItemAPIView, 
                    AddFavoriteAPIView, 
                    MainAPIView, 
                    ProductDetailAPIView, 
                    FavoritesAPIView, 
                    CartAPIView, 
                    OrdersAPIView, 
                    HoodiesListAPIView, 
                    SneakersListAPIView,)


urlpatterns = [
    path('', MainAPIView.as_view(), name='main'),
    path('products/hoodies/', HoodiesListAPIView.as_view(), name='hoodies'),
    path('products/sneakers/', SneakersListAPIView.as_view(), name='sneakers'),
    path('products/<int:pk>/', ProductDetailAPIView.as_view(), name='product-detail'),
    path('favorites/', FavoritesAPIView.as_view(), name='favorites'),
    path('favorites/add/', AddFavoriteAPIView.as_view(), name='add-favorite'),
    path('cart/', CartAPIView.as_view(), name='cart'),
    path('cart/add/', AddCartItemAPIView.as_view(), name='add-cart-item'),
    path('orders/', OrdersAPIView.as_view(), name='orders'),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)