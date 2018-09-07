#!/usr/bin/python
# -*- coding:utf-8 -*-
from django.contrib.auth.decorators import login_required
from  django.utils.decorators import method_decorator

class LoginRequireUitls(object):
    @method_decorator(login_required(login_url='/login'))
    def dispatch(self,request,*args,**kwargs):
        return super(LoginRequireUitls,self).dispatch(request,*args,**kwargs)