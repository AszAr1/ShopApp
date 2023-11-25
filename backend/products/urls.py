from django.urls import path
from django.conf import settings
from django.conf.urls.static import static

from .views import (MainAPIView, 
                    ProductDetailAPIView, 
                    FavoritesAPIView, 
                    CartAPIView, 
                    OrdersAPIView, 
                    HoodiesListAPIView, 
                    SneakersListAPIView,)


urlpatterns = [
    path('', MainAPIView.as_view(), name='main'),
    path('products/hoodies/', HoodiesListAPIView.as_view(), name='product-hoodies'),
    path('products/sneakers/', SneakersListAPIView.as_view(), name='product-sneakers'),
    path('products/<int:pk>/', ProductDetailAPIView.as_view(), name='product-detail'),
    path('favorites/', FavoritesAPIView.as_view(), name='favorites'),
    path('cart/', CartAPIView.as_view(), name='cart'),
    path('orders/', OrdersAPIView.as_view(), name='orders'),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)