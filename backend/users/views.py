from distutils.sysconfig import customize_compiler
from django.contrib.auth.hashers import make_password
from rest_framework.generics import CreateAPIView, RetrieveUpdateAPIView, UpdateAPIView, ListAPIView 
from rest_framework.mixins import Response, status
from rest_framework.permissions import AllowAny
from rest_framework.parsers import MultiPartParser, FormParser
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer
from rest_framework_simplejwt.views import TokenObtainPairView

from .models import CustomUser
from .serializers import CustomUserSerializer


class CustomUserRegistrationAPIView(CreateAPIView):
    queryset = CustomUser.objects.all()
    serializer_class = CustomUserSerializer
    permission_classes = [AllowAny]

    def create(self, request):
        data = request.data.copy()
        data['password'] = make_password(request.data['password'])
        serializer = CustomUserSerializer(data=data, context={'request': request})
        serializer.is_valid(raise_exception=True)
        serializer.save()
        headers = self.get_success_headers(serializer.data)
        user = CustomUser.objects.get(username=data['username'])

        token_data = TokenObtainPairSerializer().validate({
            'username': request.data['username'], 
            'password': request.data['password'],
        })
        token_data['user'] = {
            'username': user.username, 
            'email': user.email, 
            'profile-picture': user.profile_picture.url if user.profile_picture != '' else None
        }
        return Response(token_data, status=status.HTTP_201_CREATED, headers=headers)


class CustomUserAuthorizationAPIView(TokenObtainPairView):
    permission_classes = [AllowAny]

    def post(self, request):
        if not 'username' in request.data.keys():
            return Response(data={"error": 'No user with this username'}, status=status.HTTP_404_NOT_FOUND)

        user = CustomUser.objects.get(username=request.data['username'])
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        data = serializer.validated_data.copy()
        data['user'] =  {
            'username': user.username, 
            'email': user.email, 
            'profile-picture': user.profile_picture.url if user.profile_picture != '' else None
        }
        return Response(data=data)


class CustomUserProfileAPIView(RetrieveUpdateAPIView):
    queryset = CustomUser.objects.all()
    serializer_class = CustomUserSerializer
    lookup_field = 'username'

    def patch(self, request, *args, **kwargs):
        data = request.data.copy()
        if 'password' in request.data.keys():
           data['password'] = make_password(data['password']) 
        print(data)
        instance = self.get_object()
        serializer = self.get_serializer(instance, data=data, partial=True)
        serializer.is_valid(raise_exception=True)
        self.perform_update(serializer)
        print(serializer.data)
        return Response(serializer.data)
    

class ChangeProfilePictureAPIView(UpdateAPIView):
    queryset = CustomUser.objects.all()
    serializer_class = CustomUserSerializer
    parser_classes = [MultiPartParser, FormParser]
    permission_classes = [AllowAny]
        

class CustomUserAPIView(ListAPIView):
    queryset = CustomUser.objects.all()
    serializer_class = CustomUserSerializer
    permission_classes = [AllowAny]