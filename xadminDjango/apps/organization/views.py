from django.shortcuts import render, render_to_response
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
from django.http import HttpResponse
import json
from django.views import View
from django.db.models import Q
# Create your views here.
from courses.models import Course
from operations.models import UserFavorite
from organization.forms import AnotherUserForm
from .models import CourseOrg, CityDict, Teacher


class Org(View):
    """授课机构列表"""
    def get(self,request):
        all_ogs = CourseOrg.objects.all()
        hot_orgs = all_ogs.order_by('-click_nums')[:3]
        all_citys = CityDict.objects.all()
        search = request.GET.get('keywords', '')
        if search:
            all_ogs = all_ogs.filter(Q(name__icontains=search) | Q(desc__icontains=search))
        #筛选城市
        city_id = request.GET.get('city','')
        if city_id:
            all_ogs = all_ogs.filter(city_id=int(city_id))
        # 类别筛选
        ct_id =request.GET.get('ct','')
        if ct_id:
            all_ogs = all_ogs.filter(catgory=ct_id)
        #排序
        sort =request.GET.get('sort','')
        if sort:
            if sort =='students':
                all_ogs = all_ogs.order_by('-students')
            elif sort =='course_nums':
                all_ogs = all_ogs.order_by('-course_nums')
        #分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

        p = Paginator(all_ogs,3, request=request)

        orgs = p.page(page)
        count = all_ogs.count()

        return render(
            request,'org-list.html',
            {
            "all_ogs":orgs,
             "all_citys":all_citys,
             'count':count,
             'city_id':city_id,
             'ct_id':ct_id,
            "hot_orgs":hot_orgs,
            "sort":sort
             }
        )


class AddUserAskView(View):
    """添加咨询信息"""

    def post(self,request):
        userAskForm = AnotherUserForm(request.POST)
        data={
            "status":False,
            "msg":""
        }
        if userAskForm.is_valid():
            userAskForm.save(commit=True)
            data["status"]=True
            data["msg"]="ok"
            return HttpResponse(json.dumps(data),content_type="application/json")
        else:
            data["status"] = False
            data["msg"] = userAskForm.errors
            print(data)
            return HttpResponse(json.dumps(data), content_type="application/json")


class OrgHomeView(View):
    """机构首页"""
    def get(self,request,org_id):
        current_page = 'home'
        course_org = CourseOrg.objects.get(id=int(org_id))
        all_courses = course_org.course_set.all()[:3]
        all_teachers = course_org.teacher_set.all()[:1]
        has_fav =False
        if request.user.is_authenticated:
            if UserFavorite.objects.filter(user=request.user,fav_id=course_org.id,fay_type=int(2)):
                has_fav=True
        print(course_org.desc)
        return render(request,'org-detail-homepage.html',{"all_courses":all_courses,"all_teachers":all_teachers,"course_org":course_org,"current_page":current_page,'has_fav':has_fav})


class CourseView(View):
    """机构列表"""
    def get(self,request,org_id):
        current_page = 'course'
        course_org = CourseOrg.objects.get(id=int(org_id))
        all_courses = course_org.course_set.all()
        all_teachers = course_org.teacher_set.all()
        has_fav =False
        if request.user.is_authenticated:
            if UserFavorite.objects.filter(user=request.user,fav_id=course_org.id,fay_type=int(2)):
                has_fav=True
        return render(request,'org-detail-course.html',{"all_courses":all_courses,"all_teachers":all_teachers,"course_org":course_org,"current_page":current_page,'has_fav':has_fav})


class DescView(View):
    """机构介绍"""
    def get(self,request,org_id):
        current_page = 'desc'
        course_org = CourseOrg.objects.get(id=int(org_id))
        all_courses = course_org.course_set.all()
        all_teachers = course_org.teacher_set.all()
        has_fav =False
        if request.user.is_authenticated:
            if UserFavorite.objects.filter(user=request.user,fav_id=course_org.id,fay_type=int(2)):
                has_fav=True
        return render(request,'org-detail-desc.html',{"all_courses":all_courses,"all_teachers":all_teachers,"course_org":course_org,"current_page":current_page,'has_fav':has_fav})


class TeachersView(View):
        """机构讲师"""
        def get(self, request, org_id):
            current_page = 'teachers'
            course_org = CourseOrg.objects.get(id=int(org_id))
            all_courses = course_org.course_set.all()
            all_teachers = course_org.teacher_set.all()
            has_fav = False
            if request.user.is_authenticated:
                if UserFavorite.objects.filter(user=request.user, fav_id=course_org.id, fay_type=int(2)):
                    has_fav = True
            return render(request, 'org-detail-teachers.html', {"all_courses":all_courses,"all_teachers":all_teachers,"course_org":course_org,"current_page":current_page,'has_fav':has_fav})


class AddFavView(View):
    """添加收藏"""
    def post(self,request):
        fav_id =request.POST.get('fav_id',0)
        fav_type = request.POST.get('fav_type','')
        if not request.user.is_authenticated:
            return HttpResponse('{"status":"fail","msg":"用户未登录"}')
        exits = UserFavorite.objects.filter(user=request.user,fav_id=int(fav_id),fay_type=int(fav_type))
        print(exits.values('fav_id'))
        if exits:
            exits.delete()
            if int(fav_type) == 1:
                course = Course.objects.get(id=int(fav_id))
                course.fav_nums -=1
                if course.fav_nums<0:
                    course.fav_nums =0
                course.save()
            elif int(fav_type) == 2:
                course_org = CourseOrg.objects.get(id=int(fav_id))
                course_org.fav_nums-=1
                if course_org.fav_nums < 0:
                    course_org.fav_nums = 0
                course_org.save()
            elif int(fav_type) == 3:
                teacher = Teacher.objects.get(id=int(fav_id))
                teacher.fav_nums -= 1
                if teacher.fav_nums < 0:
                    teacher.fav_nums = 0
                teacher.save()
            return HttpResponse('{"status":"success","msg":"收藏"}')
        else:
            user_fav=UserFavorite()
            if int(fav_id) > 0 and int(fav_type)>0:
                user_fav.user=request.user
                user_fav.fav_id=int(fav_id)
                user_fav.fay_type=fav_type
                user_fav.save()

                if int(fav_type) == 1:
                    course = Course.objects.get(id=int(fav_id))
                    course.fav_nums += 1
                    course.save()
                elif int(fav_type) == 2:
                    course_org = CourseOrg.objects.get(id=int(fav_id))
                    course_org.fav_nums += 1
                    course_org.save()
                elif int(fav_type) == 3:
                    teacher = Teacher.objects.get(id=int(fav_id))
                    teacher.fav_nums += 1
                    teacher.save()
                return HttpResponse('{"status":"success","msg":"已收藏"}')

            else:
                return HttpResponse('{"status":"fail","msg":"收藏出错"}')


class TeacherListView(View):
    """讲师列表"""
    def get(self,request):
        all_teachers = Teacher.objects.all()
        search = request.GET.get('keywords', '')
        if search:
            all_teachers = all_teachers.filter(
                Q(name__icontains=search) | Q(work_company__icontains=search) | Q(work_position__icontains=search))

        # 排序
        sort = request.GET.get('sort', '')
        if sort:
            if sort == 'hot':
                all_teachers = all_teachers.order_by('-click_nums')

        sorted_teacher = Teacher.objects.all().order_by('-click_nums')[:3]
        # 分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

        p = Paginator(all_teachers, 3, request=request)

        orgs = p.page(page)
        return  render(request,'teachers-list.html',{
            "all_teachers":orgs,
            "sorted_teacher":sorted_teacher,
            "sort":sort
        })


class TeacherListDetailView(View):
    def get(self,request,teacher_id):
        teacher = Teacher.objects.get(id=int(teacher_id))
        teacher.click_nums+=1
        teacher.save()
        all_coures=Course.objects.filter(teacher=teacher)

        has_teacher_faved=False
        if UserFavorite.objects.filter(user=request.user,fay_type=3,fav_id=teacher.id):
            has_teacher_faved=True
        has_org_faved = False
        if UserFavorite.objects.filter(user=request.user, fay_type=2, fav_id=teacher.org.id):
            has_org_faved = True

        sorted_teacher = Teacher.objects.all().order_by('-click_nums')[:3]
        return  render(request,'teacher-detail.html',{
            "teacher":teacher,
            "all_coures":all_coures,
            "sorted_teacher":sorted_teacher,
            "has_teacher_faved":has_teacher_faved,
            "has_org_faved":has_org_faved
        })