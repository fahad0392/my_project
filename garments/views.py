from django.http import HttpResponse
from django.shortcuts import render
from django.contrib.auth import authenticate
from garments.models import Pants, Shirts, TShirts, Dashboard
from django.http import HttpResponse
from django.shortcuts import redirect
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
	chartType = request.GET.get('chartType') if request.GET.get('chartType') else 'column'
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
		'chart': {'type': chartType},
		'title': {'text': xfield + ' ' + yfield},
		'xAxis': {'categories': categories},
		'yAxis': {'title': text},
		'series': [{'name': product, 'data': data}]
	}
	print(chart)
	dump = json.dumps(chart)
	return HttpResponse(dump, content_type='application/json')

def dashboard(request):
	print("dashboard")
	user = request.user
	print(user)
	dashboarAll= Dashboard.objects.all()
	dashboardNameList = []
	for dashboard in dashboarAll:
		print(dashboard.user)
		if user == dashboard.user:
			dashboardNameList.append(dashboard.name)
	print(dashboardNameList)
	context = {
		"dashboardNameList": dashboardNameList,
	}
	return render(request, 'dashboard.html', context)

def adddashboard(request):
	user = request.user
	dashboardName = request.GET.get('dashboardName')
	print("pppppppppppppppppp")
	chartData = request.GET.get('chartData')
	print("ccccccccccccc",chartData)
	try:
		print("try")
		dashboardInstance, created = Dashboard.objects.get_or_create(user_id=user.id, name=dashboardName)
	except Exception as e:
		print(e)
	if created:
		dashboardInstance.user = user
		data = getattr(dashboardInstance, 'data')
		print(type(data))
		data = json.loads(data)
		data = {'chartData': {chartData}}
		dashboardInstance.data = data

	else:
		data = getattr(dashboardInstance, 'data')
		newdata = data['chartData']
		print(newdata)
		newdata.append(chartData)
		try:
			data = {'chartData': newdata}
		except Exception as e:
			print(e)
		dashboardInstance.data = data
	dashboardInstance.save()
	return HttpResponse("success")

def getadddashboard(request):
	user = request.user
	dashboardName = request.GET.get('dashboardName')
	dashboardInstance = Dashboard.objects.get(name=dashboardName)
	chartData = dashboardInstance.data
	chartData = json.dumps(chartData)
	return HttpResponse(chartData, content_type='application/json')


def str_to_class(classname):
    return getattr(sys.modules[__name__], classname)