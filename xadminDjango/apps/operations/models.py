from datetime import datetime

from django.db import models

# Create your models here.
from courses.models import Course
from users.models import UserProfile
"""用户学习表"""

class UserAsk(models.Model):
    """
    用户咨询信息
    """
    name = models.CharField(max_length=20,verbose_name='姓名')
    mobile = models.CharField(max_length=11,verbose_name='手机')
    course_name = models.CharField(max_length=50,verbose_name='姓名')
    add_time = models.DateTimeField(default=datetime.now,verbose_name='添加时间')

    def __str__(self):
        return self.name

    class Meta:
        verbose_name='用户咨询'
        verbose_name_plural =verbose_name


class CourseComments(models.Model):
    """
    课程评论
    """
    user =models.ForeignKey(UserProfile,verbose_name='用户',on_delete=models.CASCADE)
    course =models.ForeignKey(Course,verbose_name='课程',on_delete=models.CASCADE)
    comments = models.CharField(max_length=200,verbose_name='评论')
    add_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')

    def __str__(self):
        return self.course.name

    class Meta:
        verbose_name ='课程评论'
        verbose_name_plural=verbose_name


class UserFavorite(models.Model):
    """用户收藏"""
    user = models.ForeignKey(UserProfile, verbose_name='用户', on_delete=models.CASCADE)
    fav_id = models.IntegerField(default=0,verbose_name='数据id')
    fay_choices = (
        (1,'课程'),
        (2,'课程机构'),
        (3,'讲师')
    )
    fay_type = models.IntegerField(choices=fay_choices,default=1,verbose_name='收藏类型')
    add_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')

    def __str__(self):
        return self.user.username

    class Meta:
        verbose_name ='用户收藏'
        verbose_name_plural=verbose_name


class UserMessage(models.Model):
    """
    消息
    """
    user = models.IntegerField(default=0,verbose_name='接收用户')
    message = models.CharField(max_length=500,verbose_name='消息内容')
    has_read = models.BooleanField(default=False,verbose_name='是否已读')
    add_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')

    def __str__(self):
        return self.message

    class Meta:
        verbose_name ='用户消息'
        verbose_name_plural=verbose_name


class UserCourse(models.Model):
    """
    用户课程
    """
    user = models.ForeignKey(UserProfile, verbose_name='用户', on_delete=models.CASCADE)
    course = models.ForeignKey(Course, verbose_name='课程', on_delete=models.CASCADE)
    add_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')

    def __str__(self):
        return self.user.username

    class Meta:
        verbose_name ='用户课程'
        verbose_name_plural=verbose_name