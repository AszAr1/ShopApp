from django.contrib.auth.hashers import make_password
from rest_framework.generics import *
from rest_framework.mixins import *
from rest_framework.permissions import *
from rest_framework_simplejwt.views import TokenObtainPairView
from rest_framework_simplejwt.tokens import RefreshToken
from rest_framework_simplejwt.serializers import TokenRefreshSerializer
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
        serializer.is_valid(raise_exception=True)

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
    
    def put(self, request, *args, **kwargs):
        return super().put(request, *args, **kwargs)
    

class CustomUserLogOutAPIView(DestroyAPIView):
    serializer_class = TokenRefreshSerializer
    permission_classes = (IsAuthenticated,)
    def post(self, request):
        try:
            refresh_token = request.data["refresh_token"]
            token = RefreshToken(refresh_token)
            token.blacklist()   
            return Response(status=status.HTTP_205_RESET_CONTENT)
        except Exception as e:
            return Response(status=status.HTTP_400_BAD_REQUEST)


class CustomUserAPIView(ListAPIView):
    queryset = CustomUser.objects.all()
    serializer_class = CustomUserSerializer