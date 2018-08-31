"""xadminDjango URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path,include,re_path
from django.views.generic import TemplateView
import xadmin
from django.views.static import serve

from organization.views import Org
from users.views import LogingView, RegisterView, ActiveUserView, ForgetPwdView, ResetUserView, Modify
from xadminDjango import settings

urlpatterns = [
    path('xadmin/', xadmin.site.urls),
    path('',TemplateView.as_view(template_name='index.html')),
    path('login/',LogingView.as_view()),
    path('register/',RegisterView.as_view()),
    path('captcha/', include('captcha.urls')),
    re_path(r'^active/(?P<active_code>.*)/$',ActiveUserView.as_view()),
    path('forget/',ForgetPwdView.as_view(),name='forge'),
    re_path(r'^reset/(?P<active_code>.*)/$',ResetUserView.as_view()),
    re_path(r'^modify/$',Modify.as_view()),
    re_path(r'^org/',include('organization.urls')),
    re_path(r'^media/(?P<path>.*)$', serve, {'document_root':settings.MEDIA_ROOT})#配置文件上传html显示

]
