# Generated by Django 2.0.8 on 2018-08-31 09:44

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0004_auto_20180829_1145'),
    ]

    operations = [
        migrations.AlterField(
            model_name='emailverifyrecord',
            name='send_type',
            field=models.CharField(choices=[('register', '注册'), ('forget', '找回密码')], default='forget', max_length=10, verbose_name='验证码类型'),
        ),
    ]
