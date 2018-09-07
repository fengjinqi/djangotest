#!/usr/bin/python  
# -*- coding:utf-8 -*-  
from django.urls import path,include,re_path

from users.views import UserListView, UploadImageView, UserUpdateModify, SendEMailView, UpdateEmailView, MyCourseView, \
    MyFavOrgView, MyTeacherView, MyFavCourseView, MyMessageView

urlpatterns = [
    path('info/',UserListView.as_view()),
    path('image/upload',UploadImageView.as_view(),name='image/upload'),
    path('upload/pwd/',UserUpdateModify.as_view(),name='upload/pwd'),
    path('sendemail_code/',SendEMailView.as_view(),name='sendemail_code'),
    path('UpdateEmailView/',UpdateEmailView.as_view(),name='UpdateEmailView'),
    path('MyCourseView/',MyCourseView.as_view(),name='MyCourseView'),
    path('MyFavOrgView/',MyFavOrgView.as_view(),name='MyFavOrgView'),
    path('MyTeacherView/',MyTeacherView.as_view(),name='MyTeacherView'),
    path('MyFavCourseView/',MyFavCourseView.as_view(),name='MyFavCourseView'),
    path('MyMessageView/',MyMessageView.as_view(),name='MyMessageView'),
]