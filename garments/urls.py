from django.conf.urls import patterns, url
from garments import views
from django.views.generic import TemplateView
from django.contrib.auth.decorators import login_required
print('-----------------------------')
urlpatterns = [
        url(r'^$', views.user_login, name='user_login'),
        url(r'^home/$', views.home, name='login'),
        url(r'^logout/$', views.logout, name='logout'),
        url(r'^charts/$', views.charts, name='charts'),
        url(r'^dashboard/$', views.dashboard, name='dashboard'),
        url(r'^adddashboard/$', views.adddashboard, name='adddashboard'),
        url(r'^getadddashboard/$', views.getadddashboard, name='getadddashboard'),
        url('^getprofile/$', views.getprofile, name='getprofile'),
        url('^signupform/$', views.signupform, name='signupform'),
        url('^signup/$', views.signup, name='signup'),
        # url('^getproduct/$', views.getproduct, name='getproduct')
        # url(r'^dashboard/', TemplateView.as_view(template_name='dashboard.html'),name='dashboard'),
]
