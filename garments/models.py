from django.db import models
from django.contrib.auth.models import User, Group
from datetime import datetime
from djmoney.models.fields import MoneyField
from colorfield.fields import ColorField
from jsonfield import JSONField

# Create your models here
class Pants(models.Model):
	SIZE_CHOICES = (
        ('S', 'Small'),
        ('M', 'Medium'),
        ('L', 'Large'),
        ('XL', 'Extra Large'),
        ('XXL',  'Extra Extra Lage'),
    )

	size = models.CharField(max_length=15, choices=SIZE_CHOICES, default='M')
	color = ColorField(default='#FFF9F0')
	quantity = models.IntegerField(default=1)
	purchaseddate = models.DateTimeField(default=datetime.now(), blank=True ,verbose_name = 'Purchased Date')
	price = MoneyField(decimal_places=2, default=0, default_currency='INR', max_digits=11)


	class Meta:
		verbose_name = 'Pant'

class Shirts(models.Model):
	SIZE_CHOICES = (
        ('S', 'Small'),
        ('M', 'Medium'),
        ('L', 'Large'),
        ('XL', 'Extra Large'),
        ('XXL',  'Extra Extra Lage'),
    )

	size = models.CharField(max_length=5, choices=SIZE_CHOICES, default='M')
	color = ColorField(default='#FFF9F0')
	quantity = models.IntegerField(default=1)
	purchaseddate = models.DateTimeField(default=datetime.now(), blank=True ,verbose_name = 'Purchased Date')
	price = MoneyField(decimal_places=2, default=0, default_currency='INR', max_digits=11)


	class Meta:
		verbose_name = 'Shirt'

class TShirts(models.Model):
	SIZE_CHOICES = (
        ('S', 'Small'),
        ('M', 'Medium'),
        ('L', 'Large'),
        ('XL', 'Extra Large'),
        ('XXL',  'Extra Extra Lage'),
    )

	size = models.CharField(max_length=5, choices=SIZE_CHOICES, default='M')
	color = ColorField(default='#FFF9F0')
	quantity = models.IntegerField(default=1)
	purchaseddate = models.DateTimeField(default=datetime.now(), blank=True ,verbose_name = 'Purchased Date')
	price = MoneyField(decimal_places=2, default=0, default_currency='INR', max_digits=11)


	class Meta:
		verbose_name = 'TShirt'

class Shorts(models.Model):
	SIZE_CHOICES = (
        ('S', 'Small'),
        ('M', 'Medium'),
        ('L', 'Large'),
        ('XL', 'Extra Large'),
        ('XXL',  'Extra Extra Lage'),
    )

	size = models.CharField(max_length=5, choices=SIZE_CHOICES, default='M')
	color = ColorField(default='#FFF9F0')
	quantity = models.IntegerField(default=1)
	purchaseddate = models.DateTimeField(default=datetime.now(), blank=True ,verbose_name = 'Purchased Date')
	price = MoneyField(decimal_places=2, default=0, default_currency='INR', max_digits=11)


	class Meta:
		verbose_name = 'Short'


class Dashboard(models.Model):
	user = models.ForeignKey(User)
	name = models.CharField(max_length=30, blank=False)
	data = JSONField(default='{"chartData":{}}',null=True, blank=True)
