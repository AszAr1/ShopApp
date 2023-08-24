from rest_framework.serializers import ModelSerializer, SerializerMethodField, HyperlinkedIdentityField
from rest_framework.reverse import reverse

from .models import Product, OrderItem, Order, CartItem, Favorite


class ProductSerializer(ModelSerializer):   
    sizes = SerializerMethodField(read_only=True)
    # see_more = SerializerMethodField(read_only=True)
    see_more = HyperlinkedIdentityField(view_name='product-detail', lookup_field='title')


    class Meta:
        model = Product
        fields = ['pk', 'title', 'description', 'content', 'category', 'price', 'image', 'pub_date', 'see_more' , 'sizes']

    # def get_see_more(self, obj):
    #     request = self.context.get('request')
    #     if request is None:
    #         return None
    #     return reverse('product-detail', kwargs={'title': obj.title}, request=request)

    def get_sizes(self, obj):
        if not hasattr(obj, 'id'):
            return None
        if not isinstance(obj, Product):
            return None
        return obj.get_sizes()
    

class OrderItemSerializer(ModelSerializer):
    class Meta:
        model = OrderItem
        fields = ['order', 'product', 'quantity', 'item_total']


class OrderSerializer(ModelSerializer):
    price = SerializerMethodField(read_only=True)
    
    class Meta:
        model = Order
        fields = ['id', 'customer', 'order_date', 'status', 'price'] 
                   

    def get_price(self, obj):
        if not hasattr(obj, 'id'):
            return None
        if not isinstance(obj, Order):
            return None
        return obj.get_price()



class FavoriteSerializer(ModelSerializer):
    class Meta:
        model = Favorite
        fields = ['id', 'user', 'product']


class CartItemSerializer(ModelSerializer):
    class Meta:
        model = CartItem
        fields = ['id', 'user', 'product', 'quantity', 'item_total']
