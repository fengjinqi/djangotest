from django.shortcuts import render,redirect
from django.http import HttpResponse
from django.contrib.auth import authenticate,login
from django.contrib.auth.backends import ModelBackend
from django.views.generic.base import View
from django.db.models import Q
from django.contrib.auth.hashers import make_password
# Create your views here.
from .models import UserProfile,EmailVerifyRecord
from .forms import LoginForm,RegisterForm,ForgetForm,ModifyForm
from utils import email_send

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
           #发送邮件
           email_send.send_register_email(username,"register")
           return redirect('/')
        else:
           return render(request,'register.html',{"register_form":register_form})

        return render(request,'register.html')


class ActiveUserView(View):
    """注册邮箱链接激活"""
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

