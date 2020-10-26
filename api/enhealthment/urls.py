"""enhealthment URL Configuration."""
from django.conf import settings
from django.contrib import admin
from django.urls import path, include
from django.conf.urls.static import static

urlpatterns = [
    path('admin/', admin.site.urls),

    path('api/v1.0/', include('images.urls', namespace='images'))
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
