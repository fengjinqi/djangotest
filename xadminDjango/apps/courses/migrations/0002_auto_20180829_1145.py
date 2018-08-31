# Generated by Django 2.0.8 on 2018-08-29 11:45

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('courses', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='course',
            name='degree',
            field=models.CharField(choices=[('cj', '初级'), ('zj', '中级'), ('gj', '高级')], default='cj', max_length=10, verbose_name='难度级别'),
        ),
        migrations.AlterField(
            model_name='course',
            name='image',
            field=models.ImageField(max_length=200, upload_to='courses/%Y/%m', verbose_name='封面'),
        ),
    ]