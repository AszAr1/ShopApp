from django.db import models
from django.contrib.auth.models import AbstractUser
from uuid import uuid4


class CustomUser(AbstractUser):
    id = models.UUIDField(primary_key=True, default=uuid4, editable=False)
    profile_picture = models.ImageField(null=True, blank=True)
    # orders = models.ForeignKey(Order, default=None, on_delete=models.CASCADE)
    