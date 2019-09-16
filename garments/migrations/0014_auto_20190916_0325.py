# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import jsonfield.fields
import datetime


class Migration(migrations.Migration):

    dependencies = [
        ('garments', '0013_auto_20190916_0318'),
    ]

    operations = [
        migrations.AlterField(
            model_name='dashboard',
            name='data',
            field=jsonfield.fields.JSONField(blank=True, null=True, default='{"chartData":[]}'),
        ),
        migrations.AlterField(
            model_name='pants',
            name='purchaseddate',
            field=models.DateTimeField(verbose_name='Purchased Date', blank=True, default=datetime.datetime(2019, 9, 16, 3, 25, 16, 688487)),
        ),
        migrations.AlterField(
            model_name='shirts',
            name='purchaseddate',
            field=models.DateTimeField(verbose_name='Purchased Date', blank=True, default=datetime.datetime(2019, 9, 16, 3, 25, 16, 689995)),
        ),
        migrations.AlterField(
            model_name='shorts',
            name='purchaseddate',
            field=models.DateTimeField(verbose_name='Purchased Date', blank=True, default=datetime.datetime(2019, 9, 16, 3, 25, 16, 691493)),
        ),
        migrations.AlterField(
            model_name='tshirts',
            name='purchaseddate',
            field=models.DateTimeField(verbose_name='Purchased Date', blank=True, default=datetime.datetime(2019, 9, 16, 3, 25, 16, 690492)),
        ),
    ]
