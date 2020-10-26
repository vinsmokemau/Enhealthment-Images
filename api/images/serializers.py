"""Images Serializers."""

# Django REST Framework
from rest_framework import serializers

# Model
from .models import OriginalImage


class OriginalImageSerializer(serializers.ModelSerializer):
    """."""

    class Meta:

        model = OriginalImage
        fields = (
            'id',
            'name',
            'image',
        )
