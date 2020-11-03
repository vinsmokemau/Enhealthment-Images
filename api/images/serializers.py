"""Images Serializers."""

# OS
import os

# Django
from django.core.files import File

# Django REST Framework
from rest_framework import serializers

# Model
from .models import (
    OriginalImage,
    EnhancementImage,
)

# Scikit Image
from skimage import (
    color,
    io,
    exposure,
)

import numpy as np


class EnhancementImageSerializer(serializers.ModelSerializer):

    class Meta:
        model = EnhancementImage
        fields = (
            'id',
            'method',
            'image',
        )



class OriginalImageSerializer(serializers.ModelSerializer):
    """."""

    enhancements = EnhancementImageSerializer(
        read_only=True,
        required=False,
        many=True
    )

    class Meta:

        model = OriginalImage
        fields = (
            'id',
            'name',
            'image',
            'enhancements',
        )

    def create(self, validated_data):
        new_original_image = OriginalImage.objects.create(**validated_data)
        img = np.uint8(
            color.rgb2gray(
                io.imread(
                    f'{new_original_image.image.file}')
                ) * 255
            )
        name = str(new_original_image.image)
        
        gc_name = name.replace('original_images/','gc_')
        eq_name = name.replace('original_images/','eq_')
        adapteq_name = name.replace('original_images/','adpteq_')
        
        gc = exposure.adjust_gamma(img, 2)
        eq = exposure.equalize_hist(img)
        adapteq = exposure.equalize_adapthist(img, clip_limit=0.05)

        io.imsave(gc_name, gc)
        io.imsave(eq_name, eq)
        io.imsave(adapteq_name, adapteq)

        gc_img = File(open(gc_name, 'rb'))
        eq_img = File(open(eq_name, 'rb'))
        adapteq_img = File(open(adapteq_name, 'rb'))

        gamma_enhancement = EnhancementImage(
            original=new_original_image,
            method='Gamma Correction',
        )
        equalize_enhancement = EnhancementImage(
            original=new_original_image,
            method='Gamma Correction',
        )
        adaptative_enhancement = EnhancementImage(
            original=new_original_image,
            method='Gamma Correction',
        )

        gamma_enhancement.image.save(gc_name, gc_img)
        equalize_enhancement.image.save(eq_name, eq_img)
        adaptative_enhancement.image.save(adapteq_name, adapteq_img)

        os.remove(gc_name)
        os.remove(eq_name)
        os.remove(adapteq_name)

        return new_original_image
