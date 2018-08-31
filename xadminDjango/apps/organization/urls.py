#!/usr/bin/python  
# -*- coding:utf-8 -*-  
from django.urls import path,include,re_path

from organization.views import Org, AddUserAskView,OrgHomeView

urlpatterns = [
    path('list/', Org.as_view()),
    path('addAsk/',AddUserAskView.as_view()),
    re_path(r'home/(?P<org_id>\d+)/$',OrgHomeView.as_view())
]