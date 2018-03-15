# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import datetime


class Migration(migrations.Migration):

    dependencies = [
        ('garments', '0006_auto_20180222_2354'),
    ]

    operations = [
        migrations.AlterField(
            model_name='pants',
            name='purchaseddate',
            field=models.DateTimeField(blank=True, verbose_name='Purchased Date', default=datetime.datetime(2018, 2, 22, 23, 56, 17, 905108)),
        ),
        migrations.AlterField(
            model_name='shirts',
            name='purchaseddate',
            field=models.DateTimeField(blank=True, verbose_name='Purchased Date', default=datetime.datetime(2018, 2, 22, 23, 56, 17, 906234)),
        ),
    ]
