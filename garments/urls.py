from django.conf.urls import patterns, url
from garments import views
from django.views.generic import TemplateView
print('-----------------------------')
urlpatterns = [
        url(r'^$', views.user_login, name='user_login'),
        url(r'^home/$', views.home, name='login'),
        url(r'^logout/$', views.logout, name='logout'),
        url(r'^charts/$', views.charts, name='charts'),
        url(r'^dashboard/$', views.dashboard, name='dashboard'),
        url(r'^adddashboard/$', views.adddashboard, name='adddashboard'),
        url(r'^getadddashboard/$', views.getadddashboard, name='getadddashboard'),
        # url(r'^dashboard/', TemplateView.as_view(template_name='dashboard.html'),name='dashboard'),
]
