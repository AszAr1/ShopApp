from rest_framework.serializers import ModelSerializer, SerializerMethodField
from rest_framework.reverse import reverse

from .models import CustomUser


class CustomUserSerializer(ModelSerializer):
    see_more = SerializerMethodField(read_only=True)

    class Meta:
        model = CustomUser
        # fields = ['username', 'password', 'email', 'first_name', 'last_name']
        fields = ['username', 'password', 'email', 'first_name', 'last_name', 'profile_picture', 'see_more']


    def get_see_more(self, obj):
        request = self.context.get('request')
        if request is None:
            return None
        return reverse('profile', kwargs={'username': obj.username}, request=request)