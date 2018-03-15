# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import datetime


class Migration(migrations.Migration):

    dependencies = [
        ('garments', '0002_auto_20180222_2245'),
    ]

    operations = [
        migrations.AlterField(
            model_name='pants',
            name='purchaseddate',
            field=models.DateTimeField(blank=True, default=datetime.datetime(2018, 2, 22, 22, 55, 11, 55987)),
        ),
    ]
