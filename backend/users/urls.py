from django.urls import path 
from rest_framework_simplejwt.views import TokenObtainPairView

from .views import (
    CustomUserRegistrationAPIView, 
    CustomUserAuthorizationAPIView, 
    CustomUserAPIView, 
    CustomUserProfileAPIView,
)

urlpatterns = [
    path('signup/', CustomUserRegistrationAPIView.as_view(), name='signup'),
    path('login/', CustomUserAuthorizationAPIView.as_view(), name='login'),
    path('logout/', CustomUserAuthorizationAPIView.as_view(), name='login'),
    path('', CustomUserAPIView.as_view(), name='users'),
    path('<str:username>/', CustomUserProfileAPIView.as_view(), name='profile'),
]