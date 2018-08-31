from datetime import datetime

from django.db import models
from organization.models import CourseOrg
# Create your models here.
"""视频课程表"""

class Course(models.Model):

    """课程"""
    course_org = models.ForeignKey(CourseOrg,null=True,blank=True,verbose_name='课程机构',on_delete=models.CASCADE)
    name = models.CharField(max_length=50,verbose_name='课程名称')
    desc = models.CharField(max_length=300,verbose_name='课程描述')
    detail = models.TextField(verbose_name='课程详情')
    degree_choices=(
        ('cj','初级'),
        ('zj','中级'),
        ('gj','高级'),
    )
    degree = models.CharField(max_length=10,choices=degree_choices,default='cj',verbose_name='难度级别')
    learn_times = models.IntegerField(default=0,verbose_name='学习时长(分钟)')
    students = models.IntegerField(default=0,verbose_name='学习人数')
    fav_nums = models.IntegerField(default=0,verbose_name='收藏人数')
    image = models.ImageField(upload_to='courses/%Y/%m',verbose_name='封面',max_length=200)
    click_nums = models.IntegerField(default=0,verbose_name='点击数')
    add_time = models.DateTimeField(default=datetime.now,verbose_name='添加时间')

    def __str__(self):
        return  self.name

    class Meta:
        verbose_name='课程'
        verbose_name_plural=verbose_name


class Lesson(models.Model):
    """章节"""
    course = models.ForeignKey(Course,verbose_name='课程',on_delete=models.CASCADE)
    name = models.CharField(max_length=100,verbose_name='章节名')
    add_time = models.DateTimeField(default=datetime.now,verbose_name='添加时间')

    def __str__(self):
        return self.name

    class Meta:
        verbose_name='章节'
        verbose_name_plural=verbose_name


class Video(models.Model):
    """视频"""
    lesson = models.ForeignKey(Lesson,verbose_name='章节',on_delete=models.CASCADE)
    name = models.CharField(max_length=100, verbose_name='视频名')
    add_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')

    def __str__(self):
        return self.name

    class Meta:
        verbose_name='视频'
        verbose_name_plural=verbose_name

class CoursesResource(models.Model):
    lesson = models.ForeignKey(Course, verbose_name='课程', on_delete=models.CASCADE)
    name = models.CharField(max_length=100, verbose_name='名称')
    download = models.FileField(upload_to='course/resource/%Y/%m',verbose_name='文件视频上传')
    add_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')

    def __str__(self):
        return  self.name

    class Meta:
        verbose_name='课程资源'
        verbose_name_plural=verbose_name