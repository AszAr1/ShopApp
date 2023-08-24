from django.db import models
from django.contrib.auth.models import AbstractUser
from django_random_id_model import RandomIDModel

# from products.models import Order

class CustomUser(RandomIDModel, AbstractUser):
    profile_picture = models.ImageField(null=True, blank=True)
    # orders = models.ForeignKey(Order, default=None, on_delete=models.CASCADE)
    
    