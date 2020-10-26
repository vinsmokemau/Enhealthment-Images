"""Images vies."""

# Django REST Framework
from rest_framework import viewsets

# Serializers
from .serializers import OriginalImageSerializer

# Models
from .models import (
    OriginalImage,
)


class OriginalImageViewset(viewsets.ModelViewSet):
    """docstring for OriginalImageViewset."""

    queryset = OriginalImage.objects.all()
    serializer_class = OriginalImageSerializer
