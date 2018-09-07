#!/usr/bin/python  
# -*- coding:utf-8 -*-  
import xadmin
from .models import UserAsk,CourseComments,UserFavorite,UserMessage,UserCourse

class UserAskAdmin(object):
    list_display = ['name', 'mobile', 'course_name', 'add_time']
    search_fields = ['name', 'mobile', 'course_name']
    list_filter = ['name', 'mobile', 'course_name', 'add_time']

@xadmin.sites.register(CourseComments)
class CourseCommentsAdmin(object):
    list_display = ['user', 'course', 'comments', 'add_time']
    search_fields = ['user', 'course', 'comments']
    list_filter = ['user', 'course', 'comments', 'add_time']

@xadmin.sites.register(UserFavorite)
class UserFavoriteAdmin(object):
    list_display = ['user', 'fav_id', 'fay_type', 'add_time']
    search_fields = ['user', 'fav_id', 'fay_type']
    list_filter =  ['user', 'fav_id', 'fay_type', 'add_time']

@xadmin.sites.register(UserMessage)
class UserMessageAdmin(object):
    list_display = ['user', 'message', 'has_read', 'add_time']
    search_fields = ['user', 'message', 'has_read']
    list_filter =  ['user', 'message', 'has_read', 'add_time']

@xadmin.sites.register(UserCourse)
class UserCourseAdmin(object):
    list_display = ['user', 'course','add_time']
    search_fields = ['user', 'course']
    list_filter =  ['user__username', 'course','add_time']

xadmin.site.register(UserAsk,UserAskAdmin)
#xadmin.site.register(UserCourse)