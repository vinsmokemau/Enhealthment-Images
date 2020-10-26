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

    def create(self, validated_data):
    	print(validated_data)
    	new_original_image = OriginalImage.objects.create(**validated_data)
    	return new_original_image
