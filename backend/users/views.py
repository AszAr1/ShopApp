from django.contrib.auth.hashers import make_password
from rest_framework.generics import *
from rest_framework.mixins import *
from rest_framework.permissions import *
from rest_framework_simplejwt.views import TokenObtainPairView
from rest_framework.authtoken.models import Token 
from rest_framework.authtoken.serializers import AuthTokenSerializer
from rest_framework_simplejwt.exceptions import InvalidToken, TokenError
from .models import CustomUser
from .serializers import CustomUserSerializer


class CustomUserRegistrationAPIView(CreateAPIView):
    queryset = CustomUser.objects.all()
    serializer_class = CustomUserSerializer

    def create(self, request, *args, **kwargs):
        data = request.data.copy()
        print(data)
        data['password'] = make_password(data['password'])
        print(data)
        serializer = self.get_serializer(data=data)
        serializer.is_valid(raise_exception=True)
        print(serializer.validated_data)
        self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        headers['Access-Control-Allow-Origin'] = True
        print(headers)

        return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)


class CustomUserAuthorizationAPIView(TokenObtainPairView):
    def post(self, request, *args, **kwargs) -> Response:
        serializer = self.get_serializer(data=request.data)
        
        try:
            serializer.is_valid(raise_exception=True)
            
        except TokenError as e:
            raise InvalidToken(e.args[0])

        print(serializer.validated_data)
        return Response(serializer.validated_data, status=status.HTTP_200_OK)
    
    
class CustomUserProfileAPIView(RetrieveAPIView, UpdateAPIView):
    queryset = CustomUser.objects.all()
    serializer_class = CustomUserSerializer
    lookup_field = 'username'

    def get(self, request, *args, **kwargs):
        return super().get(request, *args, **kwargs)

    def patch(self, request, *args, **kwargs):
        return super().patch(request, *args, **kwargs)
    
class CustomUserLogOutAPIView(DestroyAPIView):
    queryset = Token.objects.all()
    serializer_class = AuthTokenSerializer

    def delete(self, request, *args, **kwargs):
        instance = Token.objects.filter(request.data['token'])[0]

        self.perform_destroy(instance)
        return Response(status=status.HTTP_204_NO_CONTENT)
    

class CustomUserAPIView(ListAPIView):
    queryset = CustomUser.objects.all()
    serializer_class = CustomUserSerializer