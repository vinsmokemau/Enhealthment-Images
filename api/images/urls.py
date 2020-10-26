"""Images urls."""

# Django
from django.urls import include, path

# Django REST Framework
from rest_framework import routers

# Views
from .views import OriginalImageViewset

app_name = 'images'

router = routers.DefaultRouter()
router.register(r'images', OriginalImageViewset, basename='images')

urlpatterns = [
    path('', include(router.urls))
]
