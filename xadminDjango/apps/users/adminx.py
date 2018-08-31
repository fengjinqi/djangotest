#!/usr/bin/python  
# -*- coding:utf-8 -*-  
import xadmin
from xadmin import views
from .models import EmailVerifyRecord,Banner

#TODO 全局配置

class BaseSetting(object):
    """增加修改主题"""
    enable_themes = True
    use_bootswatch = True


class GlobalSetting(object):
    """页头页脚title"""
    site_title = '会飞的鱼'
    site_footer = '会飞的鱼'
    menu_style = 'accordion'#左侧设置菜单下拉

class EmailVerifyRecordAdmin(object):
    list_display = ['code','email','send_type','send_time']
    search_fields = ['code','email','send_type']
    list_filter=['code','email','send_type']

@xadmin.sites.register(Banner)
class BannerAdmin(object):
    list_display = ['title', 'image', 'url', 'index','add_time']
    search_fields = ['title', 'image', 'url', 'index']
    list_filter = ['title', 'image', 'url', 'index','add_time']


xadmin.site.register(EmailVerifyRecord,EmailVerifyRecordAdmin)
xadmin.site.register(views.BaseAdminView,BaseSetting)
xadmin.site.register(views.CommAdminView,GlobalSetting)