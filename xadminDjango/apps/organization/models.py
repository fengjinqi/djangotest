from datetime import datetime

from django.db import models

# Create your models here.
"""讲师信息表"""
class CityDict(models.Model):
    """
    城市
    """
    name = models.CharField(max_length=20,verbose_name='城市名称')
    desc = models.CharField(max_length=200,verbose_name='城市描述')
    add_time = models.DateTimeField(default=datetime.now)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name='城市'
        verbose_name_plural=verbose_name


class CourseOrg(models.Model):
    """
    机构课程
    """
    name = models.CharField(max_length=50,verbose_name='机构名称')
    desc = models.TextField(verbose_name='机构描述')
    catgory_choices = (
        ('pxjg','培训机构'),
        ('gr','个人'),
        ('gx','高校'),
    )
    catgory = models.CharField(max_length=24,choices=catgory_choices,verbose_name='类别',default='pxjg')
    click_nums = models.IntegerField(default=0, verbose_name='点击数')
    fav_nums = models.IntegerField(default=0, verbose_name='收藏数')
    image = models.ImageField(upload_to='org/%Y/%m', verbose_name='封面', max_length=200)
    address = models.CharField(max_length=1250,verbose_name='机构地址')
    students = models.IntegerField(default=0, verbose_name='学习人数')
    course_nums = models.IntegerField(default=0, verbose_name='课程数量')
    city = models.ForeignKey(CityDict,on_delete=models.CASCADE,verbose_name='所在城市')
    add_time = models.DateTimeField(default=datetime.now)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = '课程机构'
        verbose_name_plural = verbose_name


class Teacher(models.Model):
    """
    教师
    """
    org = models.ForeignKey(CourseOrg,on_delete=models.CASCADE,verbose_name='所属机构')
    name = models.CharField(max_length=50, verbose_name='教师名称')
    work_years = models.IntegerField(default=0,verbose_name='工作年限')
    work_company = models.CharField(max_length=50,verbose_name='就职公司')
    work_position = models.CharField(max_length=50, verbose_name='公司职位')
    points = models.CharField(max_length=50, verbose_name='教学特点')
    click_nums = models.IntegerField(default=0, verbose_name='点击数')
    fav_nums = models.IntegerField(default=0, verbose_name='收藏数')
    add_time = models.DateTimeField(default=datetime.now)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = '教师'
        verbose_name_plural = verbose_name