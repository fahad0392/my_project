from django.contrib import admin
from garments.models import Pants, Shirts, TShirts, Shorts, Dashboard

class Pantsadmin(admin.ModelAdmin):
	list_display = ['size', 'color', 'quantity', 'purchaseddate', 'price']
	list_filter = ('quantity',)
	search_fields = ('size', 'purchaseddate')


class ShirtsAdmin(admin.ModelAdmin):
	list_display = ['size', 'color', 'quantity', 'purchaseddate', 'price']
	search_fields = ('size', 'purchaseddate')

class TShirtsAdmin(admin.ModelAdmin):
	list_display = ['size', 'color', 'quantity', 'purchaseddate', 'price']
	search_fields = ('size', 'purchaseddate')

class ShortsAdmin(admin.ModelAdmin):
	list_display = ['size', 'color', 'quantity', 'purchaseddate', 'price']
	search_fields = ('size', 'purchaseddate')

class DashboardAdmin(admin.ModelAdmin):
	list_display = ['user', 'name', 'data']
	search_fields = ('name', 'user')

# Register your models here.
admin.site.register(Pants, Pantsadmin)
admin.site.register(Shirts, ShirtsAdmin)
admin.site.register(TShirts, TShirtsAdmin)
admin.site.register(Shorts, ShortsAdmin)
admin.site.register(Dashboard, DashboardAdmin)
