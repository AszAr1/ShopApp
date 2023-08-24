from django.contrib import admin

from .models import Order, OrderItem, Product, Favorite, CartItem


admin.site.register([Order, OrderItem, Product, Favorite, CartItem ])