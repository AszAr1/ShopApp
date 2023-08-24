from uuid import uuid4
from django.db import models

from users.models import CustomUser


class Product(models.Model):
    CHOICES = (
        ('Sneakers', 'Sneakers'),
        ('Hoodies', 'Hoodies'),
    )
    SIZES = {'SHOES' : [25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50],
             'CLOTHES' : ['XXXS', 'XXS', 'XS', 'S', 'M', 'L', 'XL', 'XXL', 'XXXL']}
    id = models.UUIDField(primary_key=True, default=uuid4, editable=False)
    title = models.CharField(max_length=50, blank=False, unique=True)
    description = models.TextField(max_length=500, blank=True)
    content = models.TextField(max_length=500, blank=True)
    category = models.CharField(max_length=30, choices=CHOICES)
    price = models.DecimalField(decimal_places=2, max_digits=7, default=99.99)
    image = models.ImageField(null=True, blank=True)
    pub_date = models.DateTimeField(auto_now_add=True)

    def get_sizes(self):
        if self.category in self.CHOICES[1]:
            return self.SIZES['CLOTHES']
        elif self.category in self.CHOICES[0]:
            return self.SIZES['SHOES']            
        else:
            return []
        

class CartItem(models.Model):
    id = models.UUIDField(primary_key = True, default = uuid4, editable = False)
    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE, null=True)
    product = models.ForeignKey(Product, on_delete=models.CASCADE, null=True)
    quantity = models.PositiveIntegerField(blank=False, null=False)

    @property
    def item_total(self):
        return self.product.price * self.quantity



class Order(models.Model):
    PENDING = 0
    AWAITING_PAYMENT = 1
    AWAITING_FULLFILLMENT = 2
    AWAITING_SHIPMENT = 3
    PARTIALLY_SHIPPED = 4
    COMPLETED = 5
    SHIPPED = 6
    CANCELLED = 7
    DECLINED = 8
    REFUNDED = 9
    DISPUTED = 10
    
    STATUS_CHOICES = {
        PENDING: 'Pending',
        AWAITING_PAYMENT: 'Awaiting payment',
        AWAITING_FULLFILLMENT: 'Awaiting fulfillment',
        AWAITING_SHIPMENT: 'Awaiting shipment',
        PARTIALLY_SHIPPED: 'Partially shipped',
        COMPLETED: 'Completed',
        CANCELLED: 'Cancelled',
        DECLINED: 'Declined',
        REFUNDED: 'Refunded',
        DISPUTED: 'Disputed',
    }


    id = models.UUIDField(primary_key=True, default=uuid4, editable=False)
    customer = models.ForeignKey(CustomUser, on_delete=models.CASCADE, null=True)
    order_date = models.DateTimeField(auto_now_add=True)
    status = models.CharField(max_length=30, default=STATUS_CHOICES[PENDING], null=True, editable=False)
    

    def get_price(self) -> int:
        queryset = OrderItem.objects.filter(order=self.id)
        if len(queryset) > 0:
            return eval('+'.join([str(order_item.item_total) for order_item in queryset]))
        else:
            return 0
        

class OrderItem(models.Model):
    id = models.UUIDField(primary_key = True, default = uuid4, editable = False)
    product = models.ForeignKey(Product, on_delete=models.CASCADE, null=True)
    quantity = models.PositiveIntegerField()
    order = models.ForeignKey(Order, on_delete=models.CASCADE, null=True)

    @property
    def item_total(self):
        return self.product.price * self.quantity


class Favorite(models.Model):
    id = models.UUIDField(primary_key = True, default = uuid4, editable = False)
    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE, null=True)
    product = models.ForeignKey(Product, on_delete=models.CASCADE, null=True)

    