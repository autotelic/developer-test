# -*- coding: utf-8 -*-
# Generated by Django 1.10.2 on 2016-10-26 03:53
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('msgs', '0003_auto_20161025_0501'),
    ]

    operations = [
        migrations.AlterField(
            model_name='message',
            name='text',
            field=models.TextField(),
        ),
    ]