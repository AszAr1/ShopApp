from django.contrib import admin
from django.contrib.auth.admin import UserAdmin 

from .models import CustomUser 


class CumstomUserAdmin(UserAdmin):
    pass


admin.site.register(CustomUser, CumstomUserAdmin)   