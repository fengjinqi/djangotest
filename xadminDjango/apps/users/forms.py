#!/usr/bin/python  
# -*- coding:utf-8 -*-  

from django import forms

from captcha.fields import CaptchaField

class RegisterForm(forms.Form):
    """注册验证码"""
    email = forms.EmailField(required=True)
    password = forms.CharField(required=True,min_length=5)
    captcha = CaptchaField(error_messages={"invalid":'验证码错误'})

class ForgetForm(forms.Form):
    """找回密码验证码"""
    email = forms.EmailField(required=True)
    captcha = CaptchaField(error_messages={"invalid":'验证码错误'})


class ModifyForm(forms.Form):
    """重置密码"""
    password1 = forms.CharField(required=True,min_length=5)
    password2 = forms.CharField(required=True,min_length=5)


class LoginForm(forms.Form):
    """登录验证"""
    username = forms.CharField(required=True)
    password = forms.CharField(required=True,min_length=5)