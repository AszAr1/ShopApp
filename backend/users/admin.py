from django.contrib import admin

from .models import CustomUser 


class UserAdmin(admin.ModelAdmin):
    filter_horizontal = ('groups', 'user_permissions',)

filter_horizontal = ('groups', 'user_permissions')

admin.site.register(CustomUser)