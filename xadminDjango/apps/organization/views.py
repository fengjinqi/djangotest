from django.shortcuts import render, render_to_response
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
from django.http import HttpResponse
import json
from django.views import View
# Create your views here.
from courses.models import Course
from organization.forms import AnotherUserForm
from .models import CourseOrg,CityDict
from courses.models import Course
class Org(View):

    def get(self,request):
        all_ogs = CourseOrg.objects.all()
        hot_orgs = all_ogs.order_by('-click_nums')[:3]
        all_citys = CityDict.objects.all()
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
    def get(self,request,org_id):
        course_org = CourseOrg.objects.get(id=int(org_id))
        all_courses = course_org.course_set.all()[:3]
        all_teachers = course_org.teacher_set.all()[:1]

        return render(request,'org-detail-homepage.html',{"all_courses":all_courses,"all_teachers":all_teachers})