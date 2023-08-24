from rest_framework.generics import *
from rest_framework.mixins import *
from rest_framework.permissions import *

from .models import CustomUser
from .serializers import CustomUserSerializer

class CustomUserRegistrationAPIView(CreateAPIView):
    queryset = CustomUser.objects.all()
    serializer_class = CustomUserSerializer

    def perform_create(self, serializer):
        serializer.save()


class CustomUserProfileAPIView(RetrieveAPIView, UpdateAPIView):
    queryset = CustomUser.objects.all()
    serializer_class = CustomUserSerializer
    lookup_field = 'username'

    def get(self, request, *args, **kwargs):
        return super().get(request, *args, **kwargs)

    # def list(self, request, *args, **kwargs):
    #     queryset = CustomUser.objects.filter(id=self.request.user.id)

    #     page = self.paginate_queryset(queryset)
    #     if page is not None:
    #         serializer = self.get_serializer(page, many=True)
    #         return self.get_paginated_response(serializer.data)

    #     serializer = self.get_serializer(queryset, many=True)
    #     return Response(serializer.data)
    
    # def update(self, request, *args, **kwargs):
    #     kwargs['partial'] = True
    #     partial = kwargs.pop('partial', False)
    #     instance = self.get_object()
    #     data = request.data.copy()
    #     if data['password'] == '':
    #         data['password'] = instance.password
    #     if data['username'] == '':
    #         data['username'] = instance.username
    #     if data['first_name'] == '':
    #         data['first_name'] = instance.first_name
    #     if data['last_name'] == '':
    #         data['last_name'] = instance.last_name
    #     if data['email'] == '':
    #         data['email'] = instance.email
    #     serializer = self.get_serializer(instance, data=data, partial=partial)
    #     serializer.is_valid(raise_exception=True)
    #     self.perform_update(serializer)

    #     if getattr(instance, '_prefetched_objects_cache', None):
    #         # If 'prefetch_related' has been applied to a queryset, we need to
    #         # forcibly invalidate the prefetch cache on the instance.
    #         instance._prefetched_objects_cache = {}

    #     return Response(serializer.data)

    def patch(self, request, *args, **kwargs):
        return super().patch(request, *args, **kwargs)



class CustomUserLoginAPIView(CreateAPIView):
    queryset = CustomUser.objects.all()
    serializer_class = CustomUserSerializer


    def perform_authentication(self, request):
        return super().perform_authentication(request)


class CustomUserAPIView(ListAPIView):
    queryset = CustomUser.objects.all()
    serializer_class = CustomUserSerializer