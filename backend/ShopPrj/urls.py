from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('', include('products.urls')),
    path('user/', include('users.urls')),
    path('admin/', admin.site.urls),
]
