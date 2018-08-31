#!/usr/bin/python  
# -*- coding:utf-8 -*-
from django import forms

from operations.models import UserAsk


class UserAskForm(forms.Form):
    name = forms.CharField(required=True,min_length=2,max_length=20)
    phone = forms.CharField(required=True,max_length=11,min_length=11)
    course_name =forms.CharField(required=True,min_length=5,max_length=50)

class AnotherUserForm(forms.ModelForm):
    class Meta:
        model = UserAsk
        fields = ['name','mobile','course_name']