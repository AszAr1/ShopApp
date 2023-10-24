from django.urls import path 
from rest_framework.authtoken.views import ObtainAuthToken

from .views import (CustomUserRegistrationAPIView, 
                    CustomUserAPIView, 
                    CustomUserProfileAPIView)

urlpatterns = [
    path('signup/', CustomUserRegistrationAPIView.as_view(), name='signup'),
    path('login/', ObtainAuthToken.as_view(), name='login'),
    path('', CustomUserAPIView.as_view(), name='users'),
    path('<str:username>/', CustomUserProfileAPIView.as_view(), name='profile'),
]