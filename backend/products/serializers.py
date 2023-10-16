from rest_framework.serializers import ModelSerializer, SerializerMethodField, HyperlinkedIdentityField
from rest_framework.reverse import reverse

from .models import Product, OrderItem, Order, CartItem, Favorite


class ProductSerializer(ModelSerializer):   
    sizes = SerializerMethodField(read_only=True)
    id = SerializerMethodField(read_only=True)
    # see_image = HyperlinkedIdentityField(view_name='product-image', lookup_field='image')
    see_more = HyperlinkedIdentityField(view_name='product-detail', lookup_field='pk')
    # image = SerializerMethodField(read_only=True)
    # see_image = SerializerMethodField(read_only=True)
    

    class Meta:
        model = Product
        fields = ["id", 'title', 'description', 'content', 'category', 'image', 'price', 'pub_date', 'see_more' , 'sizes']

    def get_sizes(self, obj):
        if not hasattr(obj, 'id') or not isinstance(obj, Product):
            return None
        return obj.get_sizes()
    
    def get_image(self, obj):
        if not hasattr(obj, 'id') or not isinstance(obj, Product):
            return None
        return obj.get_image()
    
    def get_id(self, obj):
        if not hasattr(obj, 'id') or not isinstance(obj, Product):
            return None
        return obj.id

    # def get_see_image(self, obj):
    #     request = self.context.get('request')
    #     if request is None:
    #         return None
    #     return reverse('product-image', kwargs={'image': str(obj.image.url)}, request=request)


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
