#!/usr/bin/python  
# -*- coding:utf-8 -*-  
from django.urls import path,include,re_path

from organization.views import Org, AddUserAskView,OrgHomeView,CourseView,DescView,TeachersView,AddFavView,TeacherListView,TeacherListDetailView

urlpatterns = [
    path('list/', Org.as_view()),
    path('addAsk/',AddUserAskView.as_view()),
    #@课程机构
    re_path(r'home/(?P<org_id>\d+)/$',OrgHomeView.as_view()),
    re_path(r'course/(?P<org_id>\d+)/$',CourseView.as_view()),
    re_path(r'desc/(?P<org_id>\d+)/$',DescView.as_view()),
    re_path(r'teachers/(?P<org_id>\d+)/$',TeachersView.as_view()),
    #@收藏
    re_path(r'add_fav/', AddFavView.as_view()),
    #讲师列表
    re_path(r'teachers/list', TeacherListView.as_view(),name='teachers/list'),
    re_path(r'teachers/detail/(?P<teacher_id>\d+)/$', TeacherListDetailView.as_view(),name='teachers/detail'),
]