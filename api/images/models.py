from django.db import models


class OriginalImage(models.Model):

	name = models.CharField('nombre', max_length=150)
	image = models.ImageField(upload_to='original_images')

    class Meta:
        verbose_name = "Imagen Original"
        verbose_name_plural = "Imagenes Originales"

    def __str__(self):
        return self.name


class EnhancementImage(models.Model):
    
    original = models.ForeignKey(
    	'OriginalImage',
    	verbose_name='imagen original',
    	related_name='enhancements',
    	on_delete=models.CASCADE,
    )
    method = models.CharField('metodo', max_length=50)
    image = models.ImageField(upload_to='enhancement_images')

    class Meta:
        verbose_name = "Imagen Mejorada"
        verbose_name_plural = "Imagenes Mejoradas"

    def __str__(self):
        return self.name
