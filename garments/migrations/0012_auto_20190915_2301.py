# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import jsonfield.fields
import datetime
import colorfield.fields
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('garments', '0011_auto_20180223_1946'),
    ]

    operations = [
        migrations.CreateModel(
            name='Dashboard',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, serialize=False, auto_created=True)),
                ('name', models.CharField(max_length=30)),
                ('data', jsonfield.fields.JSONField(blank=True, null=True)),
                ('user', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.AlterField(
            model_name='pants',
            name='color',
            field=colorfield.fields.ColorField(max_length=18, default='#FFF9F0'),
        ),
        migrations.AlterField(
            model_name='pants',
            name='purchaseddate',
            field=models.DateTimeField(verbose_name='Purchased Date', blank=True, default=datetime.datetime(2019, 9, 15, 23, 1, 55, 918057)),
        ),
        migrations.AlterField(
            model_name='pants',
            name='size',
            field=models.CharField(max_length=15, default='M', choices=[('S', 'Small'), ('M', 'Medium'), ('L', 'Large'), ('XL', 'Extra Large'), ('XXL', 'Extra Extra Lage')]),
        ),
        migrations.AlterField(
            model_name='shirts',
            name='color',
            field=colorfield.fields.ColorField(max_length=18, default='#FFF9F0'),
        ),
        migrations.AlterField(
            model_name='shirts',
            name='purchaseddate',
            field=models.DateTimeField(verbose_name='Purchased Date', blank=True, default=datetime.datetime(2019, 9, 15, 23, 1, 55, 918057)),
        ),
        migrations.AlterField(
            model_name='shorts',
            name='color',
            field=colorfield.fields.ColorField(max_length=18, default='#FFF9F0'),
        ),
        migrations.AlterField(
            model_name='shorts',
            name='purchaseddate',
            field=models.DateTimeField(verbose_name='Purchased Date', blank=True, default=datetime.datetime(2019, 9, 15, 23, 1, 55, 918057)),
        ),
        migrations.AlterField(
            model_name='tshirts',
            name='color',
            field=colorfield.fields.ColorField(max_length=18, default='#FFF9F0'),
        ),
        migrations.AlterField(
            model_name='tshirts',
            name='purchaseddate',
            field=models.DateTimeField(verbose_name='Purchased Date', blank=True, default=datetime.datetime(2019, 9, 15, 23, 1, 55, 918057)),
        ),
    ]
