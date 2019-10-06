from django.http import HttpResponse
from django.shortcuts import render
from django.contrib.auth import authenticate
from garments.models import Pants, Shirts, TShirts, Dashboard
from garments.forms import SignUpForm
from django.contrib.auth.models import User
from django.http import HttpResponse
from django.shortcuts import redirect
import json
import datetime
import sys
from django.apps import apps
from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator

def user_login(request):
	return render(request, 'login.html')


def signupform(request):
	print("==========================form")
	form = SignUpForm(request.POST)
	print(form.is_valid())
	if form.is_valid():
		# form.save()
		username = form.cleaned_data.get('username')
		print(username)
		password = form.cleaned_data.get('password1')
		password = form.cleaned_data.get('password2')
		print(password)
		email = form.cleaned_data.get('email')
		print(email)
		user = authenticate(username=username, password=password)
		print(user)
	return render(request, 'signup.html', {'form':form})

def signup(request):
	print(request)
	form = SignUpForm(request.POST)
	print(form.is_valid())
	if form.is_valid():
		form.save()
		username = form.cleaned_data.get('username')
		print(username)
		password = form.cleaned_data.get('password1')
		print(password)
		email = form.cleaned_data.get('email')
		print(email)
		user = authenticate(username=username, password=password)
		print(user)
	return render(request, 'login.html')



# Login
# @login_required(login_url="")
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
	modelObject = product_0bject.objects.all()
	for filedVal in modelObject:
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
		'series': [{'name': product, 'data': data}],
		'plotOptions': {chartType: {
			'dataLabels': {'enabled': 'true'}
		}}
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
		print("updated",data)
		dashboardInstance.data = data
	print("===================sss1")
	dashboardInstance.save()
	print("===================sss2")
	return HttpResponse("success")

def getadddashboard(request):
	user = request.user
	dashboardName = request.GET.get('dashboardName')
	dashboardInstance = Dashboard.objects.get(name=dashboardName, user_id=user.id)
	chartData = dashboardInstance.data
	chartData = json.dumps(chartData)
	return HttpResponse(chartData, content_type='application/json')

# def getproduct(request):
# 	modelsNmae = apps.get_app_config('garments').get_models()
# 	print(modelsNmae)
# 	for model in modelsNmae:
# 		#modelinstance = str_to_class(model.capitalize())
# 		modelFiledList = [f.name for f in model._meta.get_fields()]
# 	print(modelsNmae)
# 	print(modelFiledList)
# 	return HttpResponse("success")



def getprofile(request):
	user = request.user
	data = {
		"first_name": user.first_name,
		"last_name": user.last_name,
		"email": user.email
	}
	data = json.dumps(data)
	return HttpResponse(data, content_type='application/json')


def str_to_class(classname):
	return getattr(sys.modules[__name__], classname)