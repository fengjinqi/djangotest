#!/usr/bin/python  
# -*- coding:utf-8 -*-  
import xadmin
from .models import Course,Lesson,Video,CoursesResource

class CourseAdmin(object):

    list_display = ['name', 'desc', 'detail', 'degree','learn_times','students','fav_nums','image','click_nums','add_time']
    search_fields = ['name', 'desc', 'detail', 'degree','learn_times','students','fav_nums','image','click_nums']
    list_filter = ['name', 'desc', 'detail', 'degree','learn_times','students','fav_nums','image','click_nums','add_time']
    list_per_page=12
    style_fields = {'detail': 'ueditor'}
@xadmin.sites.register(Lesson)
class LessonAdmin(object):
    list_display = ['course', 'name', 'add_time']
    search_fields = ['course', 'name']
    list_filter = ['course__name', 'name', 'add_time']


@xadmin.sites.register(Video)
class VideoAdmin(object):
    list_display = ['lesson', 'name', 'add_time']
    search_fields = ['lesson', 'name']
    list_filter = ['lesson', 'name', 'add_time']

@xadmin.sites.register(CoursesResource)
class CoursesResourceAdmin(object):
    list_display = ['lesson', 'name','download', 'add_time']
    search_fields = ['lesson', 'name']
    list_filter = ['lesson', 'name', 'add_time']


xadmin.site.register(Course,CourseAdmin)
