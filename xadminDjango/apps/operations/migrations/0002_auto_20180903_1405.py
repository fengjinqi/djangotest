# Generated by Django 2.0.8 on 2018-09-03 14:05

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('operations', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='userfavorite',
            name='fay_type',
            field=models.CharField(choices=[('1', '课程'), ('2', '课程机构'), ('3', '讲师')], default='1', max_length=10, verbose_name='收藏类型'),
        ),
    ]
