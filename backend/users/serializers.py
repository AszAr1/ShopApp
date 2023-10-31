from rest_framework.serializers import ModelSerializer, SerializerMethodField, HyperlinkedIdentityField
from .models import CustomUser


class CustomUserSerializer(ModelSerializer):
    id = SerializerMethodField(read_only=True)
    see_more = HyperlinkedIdentityField(view_name='profile', lookup_field='username')

    class Meta:
        model = CustomUser
        # fields = ['username', 'password', 'email', 'first_name', 'last_name']
        fields = ['id', 'username', 'password', 'email', 'first_name', 'last_name', 'profile_picture', 'see_more']

    def get_id(self, obj):
        if not hasattr(obj, 'id') or not isinstance(obj, self.Meta.model):
            return None
        return obj.id