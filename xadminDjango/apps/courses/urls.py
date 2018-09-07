#!/usr/bin/python  
# -*- coding:utf-8 -*-  
from django.urls import path,include,re_path
from .views import CourseListView,DetailView,InfoView,CommentView,AddComentView
urlpatterns = [
    path('list/',CourseListView.as_view()),
    re_path(r'^detail/(?P<course_id>\d+)/$',DetailView.as_view(),),
    re_path(r'^info/(?P<course_id>\d+)/$',InfoView.as_view()),
    re_path(r'^comment/(?P<course_id>\d+)/$',CommentView.as_view()),
    re_path(r'^add_comment/$',AddComentView.as_view()),
]