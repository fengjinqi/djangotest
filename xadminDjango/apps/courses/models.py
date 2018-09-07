from datetime import datetime

from django.db import models
from organization.models import CourseOrg,Teacher
from DjangoUeditor.models import UEditorField
# Create your models here.
"""视频课程表"""

class Course(models.Model):

    """课程"""
    course_org = models.ForeignKey(CourseOrg,null=True,blank=True,verbose_name='课程机构',on_delete=models.CASCADE)
    name = models.CharField(max_length=50,verbose_name='课程名称')
    desc = models.CharField(max_length=300,verbose_name='课程描述')
    teacher = models.ForeignKey(Teacher,on_delete=models.CASCADE,verbose_name='讲师',null=True,blank=True)
    #detail = models.TextField(verbose_name='课程详情')
    detail = UEditorField(verbose_name=u'课程详情	',width=1000, height=400,  imagePath="courses/ueditor/", filePath="courses/ueditor/", default='')
    degree_choices=(
        ('cj','初级'),
        ('zj','中级'),
        ('gj','高级'),
    )
    degree = models.CharField(max_length=10,choices=degree_choices,default='cj',verbose_name='难度级别')
    learn_times = models.IntegerField(default=0,verbose_name='学习时长(分钟)')
    students = models.IntegerField(default=0,verbose_name='学习人数')
    fav_nums = models.IntegerField(default=0,verbose_name='收藏人数')
    is_banner =models.BooleanField(default=False,verbose_name='是否轮播')
    image = models.ImageField(upload_to='courses/%Y/%m',verbose_name='封面',max_length=200,blank=True,null=True)
    click_nums = models.IntegerField(default=0,verbose_name='点击数')
    category = models.CharField(max_length=20,verbose_name='课程类别',default='后端开发')
    tag = models.CharField(max_length=10,default='',verbose_name='课程标签')
    youneed_know = models.CharField(default='',max_length=300,verbose_name='课程须知')
    teacher_tell = models.CharField(max_length=300,default='',verbose_name='老师告诉')
    add_time = models.DateTimeField(default=datetime.now,verbose_name='添加时间')

    def __str__(self):
        return  self.name

    def get_zj_nums(self):
        #@获取课程章节数
        return self.lesson_set.all().count()

    def get_student_name(self):
        #获取学习用户
        return  self.usercourse_set.all()[:5]

    def get_teacher(self):
        return self.course_org.teacher_set.all().count()

    def get_lesson(self):
        return self.lesson_set.all()


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

    def get_lesson_viode(self):
        return self.video_set.all()


    class Meta:
        verbose_name='章节'
        verbose_name_plural=verbose_name


class Video(models.Model):
    """视频"""
    lesson = models.ForeignKey(Lesson,verbose_name='章节',on_delete=models.CASCADE)
    name = models.CharField(max_length=100, verbose_name='视频名')
    url = models.CharField(max_length=200,verbose_name='url地址',default='')
    learn_times = models.IntegerField(default=0, verbose_name='学习时长(分钟)')
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