
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
from django.shortcuts import render,redirect
from django.http import HttpResponse,HttpResponseRedirect
from django.contrib.auth import authenticate,login,logout
from django.contrib.auth.backends import ModelBackend
from django.views.generic.base import View
from django.db.models import Q
from django.contrib.auth.hashers import make_password
# Create your views here.
from courses.models import Course
from operations.models import UserCourse, UserFavorite, UserMessage
from organization.models import CourseOrg, Teacher
from .models import UserProfile, EmailVerifyRecord, Banner
from .forms import LoginForm, RegisterForm, ForgetForm, ModifyForm, UploadImageForm, UploadInfoForm
from utils import email_send,login_utils

class CustomBackend(ModelBackend):
    """进行邮箱登录验证"""
    def authenticate(self, request, username=None, password=None, **kwargs):
        try:
            user = UserProfile.objects.get(Q(username=username)|Q(email=username))
            if user.check_password(password):
                return user
        except Exception as e:
            return None


class LogingView(View):
    def get(self,request):
        return render(request, 'login.html')

    """进行登录from验证以及增加邮箱登录功能"""
    def post(self,request):
        login_form = LoginForm(request.POST)
        if login_form.is_valid():
            username = request.POST.get('username')
            password = request.POST.get('password')
            """登录验证"""
            user = authenticate(username=username, password=password)
            if user is not None:
                if user.is_active:
                    login(request, user)
                    return redirect('/')
                else:
                    return render(request, 'login.html', {"msg": "账号尚未激活"})
            else:
                return render(request, 'login.html', {"msg": "用户名或密码错误"})
        else:
            return render(request, 'login.html', {"login_form":login_form})

"""
函数方式
def user_login(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
      
        user = authenticate(username=username,password=password)
        if user is not  None:
            login(request,user)
            return redirect('/')
        else:
            return render(request, 'login.html',{"msg":"用户名或密码错误"})
    elif request.method == 'GET':
        return render(request,'login.html')
"""


class LogoutsView(View):
    def get(self,request):
        logout(request)

        return redirect('/')


class RegisterView(View):
    """注册账号"""
    def get(self,request):
        register_form = RegisterForm()
        return render(request,'register.html',{"register_form":register_form})

    def post(self,request):

        register_form = RegisterForm(request.POST)
        if register_form.is_valid():
           username = request.POST.get('email')
           if UserProfile.objects.filter(username=username):
               return render(request, 'register.html', {"msg": "账号已存在","register_form":register_form})
           password = request.POST.get('password')
           UserProfile.objects.create(username=username,email=username,password=make_password(password))
           UserProfile.objects.filter(email=username).update(is_active=False)
           #写入欢迎注册消息
           userMessage =UserMessage()
           userMessage.user=UserProfile.objects.get(username=username).id
           userMessage.message='欢迎来到会飞的鱼，晓晓'
           userMessage.save()
           #发送邮件
           email_send.send_register_email(username,"register")
           return redirect('/')
        else:
           return render(request,'register.html',{"register_form":register_form})

        return render(request,'register.html')


class ActiveUserView(View):
    """获取注册邮箱链接激活"""
    def get(self,request,active_code):
        all_code = EmailVerifyRecord.objects.filter(code=active_code)
        if all_code:
            for code in all_code:
                email = code.email
                UserProfile.objects.filter(email=email).update(is_active=True)
                return redirect('login/')
        else:
            return render(request,'active_fail.html')


class ForgetPwdView(View):
    """找回密码"""
    def get(self,request):
        forget_form = ForgetForm()
        return  render(request,'forgetpwd.html',{"forget_form":forget_form})

    def post(self,request):
        forget_form = ForgetForm(request.POST)
        if forget_form.is_valid():
            email = request.POST.get('email')
            email_send.send_register_email(email, "forget")
            return render(request, 'send_success.html')
        else:
            return render(request, 'forgetpwd.html', {"forget_form": forget_form})


class ResetUserView(View):
    """找回密码邮箱链接激活"""
    def get(self,request,active_code):
        all_code = EmailVerifyRecord.objects.filter(code=active_code)
        if all_code:
            for code in all_code:
                email = code.email
                return render(request,'password_reset.html',{"email":email})
        else:
            return render(request, 'forgetpwd.html')


class Modify(View):
    """忘记密码修改"""
    def post(self,request):
         modify_form = ModifyForm(request.POST)
         if modify_form.is_valid():
             pwd1 = request.POST.get('password1')
             pwd2 = request.POST.get('password2')
             email = request.POST.get('email')
             if pwd1!=pwd2:
                 return render(request,'password_reset.html',{"email":email,"msg":"密码不一致"})
             UserProfile.objects.filter(email=email).update(password=make_password(pwd2))
             return redirect('/login/')
         else:
             email = request.POST.get('email')
         return render(request, 'password_reset.html', {"email": email, "modify_form":modify_form})


class UserListView(View):
    """用户个人中心"""
    def get(self,request):
        return render(request,'usercenter-info.html')

    def post(self,request):

        user_info = UploadInfoForm(request.POST,instance=request.user)
        if user_info.is_valid():
            user_info.save()
            return HttpResponse('{"status":"success"}')
        return HttpResponse(
            '{"status":"failure"}'
        )


class UploadImageView(login_utils.LoginRequireUitls,View):
    """修改头像"""
    def post(self,request):
        image = UploadImageForm(request.POST,request.FILES)
        if image.is_valid():
            msg = image.cleaned_data['image']
            request.user.image=msg
            request.user.save()
        return HttpResponse('ok')


class UserUpdateModify(View):
    """个人中心密码修改"""
    def post(self,request):
         modify_form = ModifyForm(request.POST)
         if modify_form.is_valid():
             pwd1 = request.POST.get('password1')
             pwd2 = request.POST.get('password2')
             if pwd1!=pwd2:
                 return HttpResponse('{"status":"faile","msg":"密码不一致"}')
             user =request.user
             user.password=make_password(pwd2)
             user.save()
             return HttpResponse('{"status":"success"}')
         else:
             return HttpResponse('{"status":"faile","msg":"填写错误"}')


class SendEMailView(login_utils.LoginRequireUitls,View):
    """发送邮箱验证码"""
    def get(self,request):
        email =request.GET.get('email','')
        if UserProfile.objects.filter(email=email):
            return HttpResponse('{"email":"邮箱已经存在"}')
        email_send.send_register_email(email, "update_email")
        return HttpResponse('{"status":"success"}')


class UpdateEmailView(login_utils.LoginRequireUitls,View):
    """修改邮箱"""
    def post(self,request):
        email = request.POST.get('eamil','')
        code = request.POST.get('code','')
        exitsed = EmailVerifyRecord.objects.filter(email=email,code=code,send_type='update_email')
        if exitsed:
            user =request.user
            user.email=email
            user.save()
        else:
            return HttpResponse('{"email":"验证码出错"}')


class MyCourseView(login_utils.LoginRequireUitls,View):
    """我的课程"""

    def get(self,request):
        user_courses = UserCourse.objects.filter(user=request.user)
        print(user_courses)
        return render(request,'usercenter-mycourse.html',{"user_courses":user_courses})


class MyFavOrgView(login_utils.LoginRequireUitls, View):
    """我的收藏"""
    def get(self, request):
        org_list=[]
        fav_orgs = UserFavorite.objects.filter(user=request.user,fay_type=2)
        for org in fav_orgs:
            org_id = org.fav_id
            orgs = CourseOrg.objects.get(id=org_id)
            org_list.append(orgs)
        return render(request, 'usercenter-fav-org.html', {"org_list": org_list})


class MyTeacherView(login_utils.LoginRequireUitls, View):
    """我的收藏授课讲师"""
    def get(self, request):
        teacher_list=[]
        fav_teachers = UserFavorite.objects.filter(user=request.user,fay_type=3)
        for org in fav_teachers:
            teachers_id = org.fav_id
            orgs = Teacher.objects.get(id=teachers_id)
            teacher_list.append(orgs)
        return render(request, 'usercenter-fav-teacher.html', {"teacher_list": teacher_list})


class MyFavCourseView(login_utils.LoginRequireUitls, View):
    """我的收藏课程"""
    def get(self, request):
        course_list=[]
        fav_course = UserFavorite.objects.filter(user=request.user,fay_type=1)
        for org in fav_course:
            course_id = org.fav_id
            orgs = Course.objects.get(id=course_id)
            course_list.append(orgs)
        return render(request, 'usercenter-fav-course.html', {"course_list": course_list})


class MyMessageView(View):
    """我的消息"""
    def get(self,request):
        print(request.user.id)
        all_message = UserMessage.objects.filter(user=request.user.id)
        all_unread_message = UserMessage.objects.filter(user=request.user.id,has_read=False)
        for mess in all_unread_message:
            mess.has_read=True
            mess.save()
        # 分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(all_message, 3,request=request)
        orgs = p.page(page)
        return render(request,'usercenter-message.html',{"orgs":orgs})


class IndexView(View):
    """首页"""
    def get(self,request):
        all_banner = Banner.objects.all().order_by('index')
        courses = Course.objects.filter(is_banner=False)[:6]
        banner_course = Course.objects.filter(is_banner=False)[:3]
        course_org = CourseOrg.objects.all()[:15]
        return render(request,'index.html',{
            'all_banner':all_banner,
            "courses":courses,
            "banner_course":banner_course,
            "course_org":course_org
        })

class LoginUnsafeView(View):
    def get(self, request):
        return render(request, 'login.html')

    def post(self,request):
        username = request.POST.get('username')
        password = request.POST.get('password')
        import pymysql
        conn = pymysql.connect(host='127.0.0.1',user='root',password='root',db='testdjango',charset='utf8')
        cursor=conn.cursor()
        sql="select * from users_userprofile where email='%s' and password='%s'"%(username,password)
        result=cursor.execute(sql)
        print(result)
        for i in cursor.fetchall():
            print(i,'90')
        return HttpResponse('ok')


def page_not_found(request,**kwargs):
    """全局404"""
    from django.shortcuts import render_to_response
    response = render_to_response('404.html',{})
    response.status_code = 404
    return response

def page_error(request,**kwargs):
    """全局404"""
    from django.shortcuts import render_to_response
    response = render_to_response('500.html',{})
    response.status_code = 500
    return response