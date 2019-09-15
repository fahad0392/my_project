from django.http import HttpResponse
from django.shortcuts import render


def index(request):
	context_dict = {'boldmessage': "BOLD MESSAGE"}
	return render(request, 'rango/index.html', context_dict)
    