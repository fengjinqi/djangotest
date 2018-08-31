from datetime import datetime

from django.db import models

# Create your models here.
from django.contrib.auth.models import AbstractUser

"""用户登录表单"""
class UserProfile(AbstractUser):
    """
    用户
    """
    nick_name = models.CharField(max_length=50,verbose_name='昵称',default='')
    birday = models.DateField(verbose_name='生日',null=True,blank=True)
    gender_choices=(
        ('male','男'),
        ('female','女')
    )
    gender = models.CharField(max_length=6,choices=gender_choices,default='female')
    address = models.CharField(max_length=100,default='')
    mobile = models.CharField(max_length=11,null=True,blank=True)
    image = models.ImageField(upload_to='image/%Y/%m',default='image/defalut')

    class Meta:
        verbose_name='用户信息'
        verbose_name_plural=verbose_name

    def __str__(self):
        return self.username


class EmailVerifyRecord(models.Model):
    """邮箱"""
    code = models.CharField(max_length=20,verbose_name='验证码')
    email = models.EmailField(max_length=50,verbose_name='邮箱')
    send_choices=(
        ('register','注册'),
        ('forget','找回密码')
    )
    send_type = models.CharField(verbose_name='验证码类型',max_length=10,choices=send_choices,default='forget')
    send_time = models.DateTimeField(default=datetime.now,verbose_name='发送时间')

    def __str__(self):
        return self.email

    class Meta:
        verbose_name='邮箱验证码'
        verbose_name_plural=verbose_name


class Banner(models.Model):
    """ 轮播"""
    title = models.CharField(max_length=100,verbose_name='标题')
    image = models.ImageField(upload_to='banner/%Y/%m',verbose_name='轮播图',max_length=100)
    url = models.URLField(max_length=200,verbose_name='访问地址')
    index = models.IntegerField(default=100,verbose_name='顺序')
    add_time = models.DateTimeField(default=datetime.now,verbose_name='添加时间')

    class Meta:
        verbose_name='轮播图'
        verbose_name_plural=verbose_name