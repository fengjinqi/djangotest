from django.shortcuts import render
from django.views.generic.base import View
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
from django.http import HttpResponse
from django.db.models import Q
# Create your views here.
from operations.models import UserFavorite, CourseComments, UserCourse
from .models import Course, CoursesResource

from utils.login_utils import LoginRequireUitls

class CourseListView(View):
    """公开课列表"""
    def get(self,request):
        all_courses = Course.objects.all().order_by('-add_time')
        hot_course = Course.objects.all().order_by('-click_nums')[:3]

        search = request.GET.get('keywords','')
        if search:
            all_courses = all_courses.filter(Q(name__icontains=search)|Q(detail__icontains=search)|Q(desc__icontains=search))
        # 排序
        sort = request.GET.get('sort', '')
        if sort:
            if sort == 'students':
                all_courses = all_courses.order_by('-students')
            elif sort == 'hot':
                all_courses = all_courses.order_by('-click_nums')
        # 分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(all_courses, 6, request=request)
        courses = p.page(page)
        return  render(request,'course-list.html',{"all_courses":courses,'sort':sort,'hot_course':hot_course})


class DetailView(View):
    """公开课详情"""
    def get(self,request,course_id):
        course = Course.objects.get(id=course_id)
        course.click_nums+=1
        course.save()
        tag = course.tag
        if tag:
            relete_course = Course.objects.filter(tag=tag)[:1]
        else:
            relete_course=[]
        has_fav_course=False
        has_fav_org=False
        if request.user.is_authenticated:
            if UserFavorite.objects.filter(user=request.user, fav_id=course.id, fay_type=1):
                has_fav_course = True
            if UserFavorite.objects.filter(user=request.user, fav_id=course.course_org.id, fay_type=2):
                has_fav_org = True
        return  render(request,'course-detail.html',{
            "course":course,
            "relete_course":relete_course,
            "has_fav_course":has_fav_course,

            "has_fav_org":has_fav_org
        })

class InfoView(LoginRequireUitls,View):
    """课程章节信息"""
    def get(self,request,course_id):
        course = Course.objects.get(id=int(course_id))
        course.students+=1
        course.save()
        #查询用户是否关联改课程

        user_cousers = UserCourse.objects.filter(user=request.user,course=course)
        if not user_cousers:
            user_course = UserCourse(user=request.user,course=course)
            user_course.save()
        user_cousers= UserCourse.objects.filter(course=course)
        user_id =[user_cousers.user_id for user_cousers in user_cousers]
        #取出所有课程id
        all_user_coursers = UserCourse.objects.filter(user_id__in=user_id)
        course_id =[user_cousers.course_id for user_cousers in all_user_coursers]
        courses = Course.objects.filter(id__in=course_id).order_by('-click_nums')[:5]
        print(Course.objects.filter(id__in=course_id),course_id)
        all = CoursesResource.objects.filter(lesson=course)

        return  render(request,'course-video.html',
                       {
                           "course":course,
                            "all":all,
                           "courses":courses
                       })


class CommentView(LoginRequireUitls,View):
    """课程评论"""
    def get(self,request,course_id):
        course = Course.objects.get(id=int(course_id))
        all = CoursesResource.objects.filter(lesson=course)
        all_comment = CourseComments.objects.all().order_by('-add_time')
        return render(request, 'course-comment.html',
                      {
                          "course": course,
                          "all": all,
                          "all_comment":all_comment
                      })

class AddComentView(View):
    """新增评论"""
    def post(self,request):
        if not request.user.is_authenticated:
            return HttpResponse('{"status":"fail","msg":"用户未登录"}')
        course_id = request.POST.get('course_id',0)
        comments = request.POST.get('comments','')
        if int(course_id) > 0 and comments:
            course_comment=CourseComments()
            course= Course.objects.get(id=int(course_id))
            course_comment.course=course
            course_comment.comments=comments
            course_comment.user=request.user
            course_comment.save()
            return HttpResponse('{"status":"success","msg":"添加成功"}')
        else:
            return HttpResponse('{"status":"fail","msg":"添加失败"}')