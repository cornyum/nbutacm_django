# Generated by Django 2.2.3 on 2021-02-15 08:58

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0003_activitygallery_activitygalleryphoto'),
    ]

    operations = [
        migrations.CreateModel(
            name='ConfigInfo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('index_photo_url', models.CharField(max_length=200, verbose_name='图片地址')),
            ],
            options={
                'verbose_name': '配置信息',
                'verbose_name_plural': '配置信息',
            },
        ),
    ]
