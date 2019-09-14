from django.conf.urls import patterns, url
from garments import views
print('-----------------------------')
urlpatterns = [
        url(r'^$', views.user_login, name='user_login'),
        url(r'^home/$', views.home, name='login'),
        url(r'^logout/$', views.logout, name='logout'),
        url(r'^charts/$', views.charts, name='charts')
]
