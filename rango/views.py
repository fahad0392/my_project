from django.http import HttpResponse
from django.shortcuts import render


def index(request):
	context_dict = {'boldmessage': "DESPLAYING BOLD MESSAGE"}
	return render(request, 'rango/index.html', context_dict)
    #return HttpResponse("Rango says hey there world! fahad")