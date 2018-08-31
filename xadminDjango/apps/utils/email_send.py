#!/usr/bin/python  
# -*- coding:utf-8 -*-  
from users.models import EmailVerifyRecord
from django.core.mail import send_mail
from xadminDjango.settings import EMAIL_FROM
from random import Random
import random
def random_str(randomlength=8):
    str=""
    chars="0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    lenght = len(chars)-1
    for i in range(randomlength):
        str+=chars[random.randint(0,lenght)]
    print(str)
    return str

def send_register_email(email,send_type='register'):
    code = random_str(16)
    EmailVerifyRecord.objects.create(code=code,email=email,send_type=send_type)
    email_title = ''
    email_body = ''
    if send_type =='register':
        email_title = '会飞的鱼晓晓激活链接'
        email_body = "请点击下面的链接激活你的账号:http://127.0.0.1:8000/active/{0}".format(code)
        send_stutas = send_mail(email_title,email_body,EMAIL_FROM,[email])
        if send_stutas:
            pass
    elif send_type == 'forget':
        email_title = '会飞的鱼晓晓密码重置链接'
        email_body = "请点击下面的链接重置密码:http://127.0.0.1:8000/reset/{0}".format(code)
        send_stutas = send_mail(email_title, email_body, EMAIL_FROM, [email])
        if send_stutas:
            pass
