# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import colorfield.fields
import datetime


class Migration(migrations.Migration):

    dependencies = [
        ('garments', '0008_auto_20180222_2357'),
    ]

    operations = [
        migrations.RenameField(
            model_name='pants',
            old_name='some_currency',
            new_name='price',
        ),
        migrations.RenameField(
            model_name='pants',
            old_name='some_currency_currency',
            new_name='price_currency',
        ),
        migrations.RenameField(
            model_name='shirts',
            old_name='some_currency',
            new_name='price',
        ),
        migrations.RenameField(
            model_name='shirts',
            old_name='some_currency_currency',
            new_name='price_currency',
        ),
        migrations.AlterField(
            model_name='pants',
            name='color',
            field=colorfield.fields.ColorField(max_length=18, default='#FF0000'),
        ),
        migrations.AlterField(
            model_name='pants',
            name='purchaseddate',
            field=models.DateTimeField(verbose_name='Purchased Date', default=datetime.datetime(2018, 2, 23, 11, 17, 23, 893459), blank=True),
        ),
        migrations.AlterField(
            model_name='shirts',
            name='color',
            field=colorfield.fields.ColorField(max_length=18, default='#FF0000'),
        ),
        migrations.AlterField(
            model_name='shirts',
            name='purchaseddate',
            field=models.DateTimeField(verbose_name='Purchased Date', default=datetime.datetime(2018, 2, 23, 11, 17, 23, 894791), blank=True),
        ),
    ]
