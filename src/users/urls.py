from django.urls import path 
from rest_framework.authtoken.views import obtain_auth_token

from .views import (CustomUserRegistrationAPIView, 
                    CustomUserAPIView, 
                    CustomUserProfileAPIView)

urlpatterns = [
    path('signup/', CustomUserRegistrationAPIView.as_view(), name='signup'),
    path('login/', obtain_auth_token, name='login'),
    path('users/', CustomUserAPIView.as_view(), name='users'),
    path('users/<str:username>/', CustomUserProfileAPIView.as_view(), name='profile'),
]