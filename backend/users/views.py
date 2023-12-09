from django.contrib.auth.hashers import make_password
from rest_framework.generics import *
from rest_framework.mixins import *
from rest_framework.permissions import *
from rest_framework.parsers import *
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer
from rest_framework_simplejwt.views import TokenObtainPairView

from .models import CustomUser
from .serializers import CustomUserSerializer


class CustomUserRegistrationAPIView(CreateAPIView):
    queryset = CustomUser.objects.all()
    serializer_class = CustomUserSerializer

    def create(self, request, *args, **kwargs):
        data = request.data.copy()
        data['password'] = make_password(data['password'])
        serializer = self.get_serializer(data=data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        user = CustomUser.objects.get(username=request.data['username'])
        try:
            profile_picture = user.profile_picture.url
        except ValueError:
            profile_picture = None
        user_data = {'username': user.username, 'email': user.email, 'profile-picture': profile_picture or None}
        token_data = TokenObtainPairSerializer().validate({'username': request.data['username'], 'password': request.data['password']})
        token_data['user'] = user_data
        return Response(token_data, status=status.HTTP_201_CREATED, headers=headers)


class CustomUserAuthorizationAPIView(TokenObtainPairView):
    def post(self, request, *args, **kwargs) -> Response:
        if not 'username' in request.data.keys():
            return Response(status=status.HTTP_404_NOT_FOUND)
        
        user = CustomUser.objects.get(username=request.data['username'])
        try:
            profile_picture = user.profile_picture.url
        except ValueError:
            profile_picture = None
        user_data = {'username': user.username, 'email': user.email, 'profile-picture': profile_picture or None}
        print(request.data) 
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        data = serializer.validated_data.copy()
        data['user'] = user_data
        return Response(data=data, status=status.HTTP_200_OK)
    
    
class CustomUserProfileAPIView(RetrieveAPIView, UpdateAPIView):
    queryset = CustomUser.objects.all()
    serializer_class = CustomUserSerializer
    lookup_field = 'username'
    # permission_classes = [AllowAny]
    parser_classes = [MultiPartParser, FormParser]

    def get(self, request, *args, **kwargs):
        return super().get(request, *args, **kwargs)

    def patch(self, request, *args, **kwargs):
        # print(request.user)
        # serializer = CustomUserSerializer(request.user, request.data, partial=True)
        # serializer.is_valid(raise_exception=True)
        # serializer.save()
        # return Response(serializer.data)
        return super().patch(request, *args, **kwargs)
    
    def put(self, request, *args, **kwargs):
        # print(request.data)
        # print(request.data['profile_picture'])
        # image: InMemoryUploadedFile = request.data['profile_picture'] 
        # print(image.name)
        # print(image.)
        return super().put(request, *args, **kwargs)


class CustomUserAPIView(ListCreateAPIView):
    queryset = CustomUser.objects.all()
    serializer_class = CustomUserSerializer

    def post(self, request, *args, **kwargs):
        print(request.data)
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)