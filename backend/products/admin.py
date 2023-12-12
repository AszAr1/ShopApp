from django.contrib import admin

from .models import Order, OrderItem, Product, Favorite, CartItem


class ProductAdmin(admin.ModelAdmin):
    fields = ('title', 'description', 'content', 'category', "image", 'price',)


class OrderAdmin(admin.ModelAdmin):
    fields = ('user',)


class OrderItemAdmin(admin.ModelAdmin):
    fields = ('order', 'product', 'quantity',)


class FavoriteAdmin(admin.ModelAdmin):
    fields = ('user', 'product',)


class CartItemAdmin(admin.ModelAdmin):
    fields = ('user', 'product', "quantity",)


admin.site.register(Product, ProductAdmin)
admin.site.register(Favorite, FavoriteAdmin)
admin.site.register(CartItem, CartItemAdmin)
admin.site.register(Order, OrderAdmin)
admin.site.register(OrderItem, OrderItemAdmin)