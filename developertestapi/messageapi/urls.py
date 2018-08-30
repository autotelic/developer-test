"""Url definitions."""
import os
from django.conf import settings
from django.conf.urls import url, include
from django.views.generic import TemplateView
from rest_framework import routers
from messageapi.msgs import views

router = routers.DefaultRouter()
router.register(r'messages', views.MessageViewSet)

with open(os.path.join(settings.BASE_DIR, 'README.md')) as f:
    md_content = ''.join(f.readlines())


class ReadmeView(TemplateView):

    template_name = 'readme.html'

    def get_context_data(self, **kwargs):
        return {'md_content': md_content}


urlpatterns = [
    url(r'^', include(router.urls)),
    url(r'^README/$', ReadmeView.as_view())
]
