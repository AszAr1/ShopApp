from django.db import models
from django_random_id_model import RandomIDModel

from users.models import CustomUser


class Product(RandomIDModel, models.Model):
    CHOICES = (
        ('Sneakers', 'Sneakers'),
        ('Hoodies', 'Hoodies'),
    )
    SIZES = {'SHOES' : [25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50],
             'CLOTHES' : ['XXXS', 'XXS', 'XS', 'S', 'M', 'L', 'XL', 'XXL', 'XXXL']}
    title = models.CharField(max_length=50, blank=False, unique=True)
    description = models.TextField(max_length=1000, blank=True)
    content = models.TextField(max_length=1000, blank=True)
    category = models.CharField(max_length=30, choices=CHOICES)
    price = models.DecimalField(decimal_places=2, max_digits=7, default=99.99)
    image = models.ImageField(null=True, blank=True)
    pub_date = models.DateTimeField(auto_now_add=True)

    class Meta:
        verbose_name = "Product"
        verbose_name_plural = "Products"

    def get_sizes(self):
        if self.category in self.CHOICES[1]:
            return self.SIZES['CLOTHES']
        elif self.category in self.CHOICES[0]:
            return self.SIZES['SHOES']            
        else:   
            return []
        
    def __str__(self) -> str:
        return f"{self.title}"


class CartItem(RandomIDModel, models.Model):
    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE, null=True)
    product = models.ForeignKey(Product, on_delete=models.CASCADE, null=True)
    quantity = models.PositiveIntegerField(blank=False, null=False)

    class Meta:
        verbose_name = "Cart item"
        verbose_name_plural = "Cart items"

    @property
    def item_total(self):
        return self.product.price * self.quantity

    def __str__(self) -> str:
        return f"{self.user} - {self.product}"


class Order(RandomIDModel, models.Model):
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

    customer = models.ForeignKey(CustomUser, on_delete=models.CASCADE, null=True)
    order_date = models.DateTimeField(auto_now_add=True)
    status = models.CharField(max_length=30, default=STATUS_CHOICES[PENDING], null=True)

    class Meta:
        verbose_name = "Order"
        verbose_name_plural = "Orders"
    
    def get_price(self) -> int:
        queryset = OrderItem.objects.filter(order=self.id)
        if len(queryset) > 0:
            return eval('+'.join([str(order_item.item_total) for order_item in queryset]))
        else:
            return 0

    def __str__(self) -> str:
        return f"{self.customer} - {self.pk}"
        

class OrderItem(RandomIDModel, models.Model):
    product = models.ForeignKey(Product, on_delete=models.CASCADE, null=True)
    quantity = models.PositiveIntegerField()
    order = models.ForeignKey(Order, on_delete=models.CASCADE, null=True)

    class Meta:
        verbose_name = "Order item"
        verbose_name_plural = "Order items"

    @property
    def item_total(self):
        return self.product.price * self.quantity
    
    def __str__(self) -> str:
        return f"{self.order} - {self.product}"


class Favorite(RandomIDModel, models.Model):
    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE, null=True)
    product = models.ForeignKey(Product, on_delete=models.CASCADE, null=True)

    class Meta:
        verbose_name = "Favorite"
        verbose_name_plural = "Favorites"

    def __str__(self) -> str:
        return f"{self.user} - {self.product}"