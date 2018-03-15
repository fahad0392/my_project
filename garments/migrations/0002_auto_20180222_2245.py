# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import datetime


class Migration(migrations.Migration):

    dependencies = [
        ('garments', '0001_initial'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='pants',
            options={'verbose_name': 'Pant'},
        ),
        migrations.AlterField(
            model_name='pants',
            name='purchaseddate',
            field=models.DateTimeField(blank=True, default=datetime.datetime(2018, 2, 22, 22, 45, 10, 763134)),
        ),
    ]
