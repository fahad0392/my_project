# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import datetime


class Migration(migrations.Migration):

    dependencies = [
        ('garments', '0007_auto_20180222_2356'),
    ]

    operations = [
        migrations.AlterField(
            model_name='pants',
            name='purchaseddate',
            field=models.DateTimeField(verbose_name='Purchased Date', blank=True, default=datetime.datetime(2018, 2, 22, 23, 57, 4, 39283)),
        ),
        migrations.AlterField(
            model_name='shirts',
            name='purchaseddate',
            field=models.DateTimeField(verbose_name='Purchased Date', blank=True, default=datetime.datetime(2018, 2, 22, 23, 57, 4, 40318)),
        ),
    ]
