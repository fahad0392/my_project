# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import jsonfield.fields
import datetime


class Migration(migrations.Migration):

    dependencies = [
        ('garments', '0012_auto_20190915_2301'),
    ]

    operations = [
        migrations.AlterField(
            model_name='dashboard',
            name='data',
            field=jsonfield.fields.JSONField(blank=True, null=True, default="{'chartData':{}}"),
        ),
        migrations.AlterField(
            model_name='pants',
            name='purchaseddate',
            field=models.DateTimeField(verbose_name='Purchased Date', blank=True, default=datetime.datetime(2019, 9, 16, 3, 18, 25, 888253)),
        ),
        migrations.AlterField(
            model_name='shirts',
            name='purchaseddate',
            field=models.DateTimeField(verbose_name='Purchased Date', blank=True, default=datetime.datetime(2019, 9, 16, 3, 18, 25, 889256)),
        ),
        migrations.AlterField(
            model_name='shorts',
            name='purchaseddate',
            field=models.DateTimeField(verbose_name='Purchased Date', blank=True, default=datetime.datetime(2019, 9, 16, 3, 18, 25, 891262)),
        ),
        migrations.AlterField(
            model_name='tshirts',
            name='purchaseddate',
            field=models.DateTimeField(verbose_name='Purchased Date', blank=True, default=datetime.datetime(2019, 9, 16, 3, 18, 25, 890261)),
        ),
    ]
