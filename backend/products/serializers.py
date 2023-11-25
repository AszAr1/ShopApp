from rest_framework.serializers import ModelSerializer, SerializerMethodField, HyperlinkedIdentityField

from .models import Product, OrderItem, Order, CartItem, Favorite


class GetID():
    class Meta:
        model = None

    def get_id(self, obj):
        if not hasattr(obj, 'id') or not isinstance(obj, self.Meta.model):
            return None
        return obj.id


class ProductSerializer(ModelSerializer, GetID):   
    sizes = SerializerMethodField(read_only=True)
    id = SerializerMethodField(read_only=True)
    see_more = HyperlinkedIdentityField(view_name='product-detail', lookup_field='pk')

    class Meta:
        model = Product
        fields = ["id", 'title', 'description', 'content', 'category', "image", 'price', 'pub_date', 'see_more' , 'sizes']

    def get_sizes(self, obj):
        if not hasattr(obj, 'id') or not isinstance(obj, Product):
            return None
        return obj.get_sizes()


class OrderItemSerializer(ModelSerializer, GetID):
    id = SerializerMethodField(read_only=True)

    class Meta:
        model = OrderItem
        fields = ["id", 'order', 'product', 'quantity', 'item_total']


class OrderSerializer(ModelSerializer, GetID):
    price = SerializerMethodField(read_only=True)
    id = SerializerMethodField(read_only=True)
    
    class Meta:
        model = Order
        fields = ['id', 'customer', 'order_date', 'status', 'price'] 
                   
    def get_price(self, obj):
        if not hasattr(obj, 'id'):
            return None
        if not isinstance(obj, Order):
            return None
        return obj.get_price()
    

class FavoriteSerializer(ModelSerializer, GetID):
    id = SerializerMethodField(read_only=True)    

    class Meta:
        model = Favorite
        fields = ['id', 'user', 'product']


class CartItemSerializer(ModelSerializer, GetID):
    id = SerializerMethodField(read_only=True) 

    class Meta:
        model = CartItem
        fields = ['id', 'user', 'product', 'quantity', 'item_total']