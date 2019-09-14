from django.http import HttpResponse
from django.shortcuts import render
from django.contrib.auth import authenticate
from garments.models import Pants, Shirts, TShirts
from django.http import HttpResponse
import json
import datetime
import sys

def user_login(request):
	return render(request, 'login.html')



# Login
def home(request):
	print(request)
	if request.method == 'POST':
		username = request.POST.get('username')
		password = request.POST.get('password')
		user = authenticate(username=username, password=password)
		if user is not None:
			return render(request, 'home.html')
		else:
			return render(request, 'login.html')
	else:
		return render(request, 'home.html')


def logout(request):
	return render(request, 'login.html')

def charts(request):
	product = request.GET.get('product')
	product_0bject = str_to_class(product)
	xfield = request.GET.get('xfield')
	yfield = request.GET.get('yfield')
	categories = []
	data = []
	pants = product_0bject.objects.all()
	for filedVal in pants:
		if xfield.strip() == 'purchaseddate':
			categories.append((getattr(filedVal, xfield)).strftime("%d %b"))
		elif xfield.strip() == 'price':
			categories.append(int(getattr(filedVal, xfield).amount))
		else:
			categories.append(getattr(filedVal, xfield))

		if yfield.strip() == 'purchaseddate':
			data.append((getattr(filedVal, yfield)).strftime("%d %b"))
		elif yfield.strip() == 'price':
			data.append(int(getattr(filedVal, yfield).amount))
		else:
			data.append(getattr(filedVal, yfield))

	text = {'text': yfield.capitalize()}
	chart = {
		'chart': {'type': 'column'},
		'title': {'text': xfield + ' ' + yfield},
		'xAxis': {'categories': categories},
		'yAxis': {'title': text},
		'series': [{'name': product, 'data': data}]
	}
	print(chart)
	dump = json.dumps(chart)
	return HttpResponse(dump, content_type='application/json')


def str_to_class(classname):
    return getattr(sys.modules[__name__], classname)