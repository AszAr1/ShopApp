from django.urls import path 
from rest_framework_simplejwt.views import (
    TokenRefreshView, 
    TokenVerifyView, 
    TokenBlacklistView,
)
from .views import (
    CustomUserRegistrationAPIView, 
    CustomUserAuthorizationAPIView, 
    CustomUserAPIView, 
    CustomUserProfileAPIView,
)


urlpatterns = [
    path('signup/', CustomUserRegistrationAPIView.as_view(), name='signup'),
    path('login/', CustomUserAuthorizationAPIView.as_view(), name='login'),
    path('logout/', TokenBlacklistView.as_view(), name='login'),
    path('users/', CustomUserAPIView.as_view(), name='users'),
    path('profile/<str:username>/', CustomUserProfileAPIView.as_view(), name='profile'),
    path('token/refresh/', TokenRefreshView.as_view(), name='token'),
    path('token/verify/', TokenVerifyView.as_view(), name='token'),
]