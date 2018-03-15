from jet.dashboard.dashboard_modules import google_analytics_views
from django.contrib import admin
from django.conf.urls import url, include
# from settings import STATIC_ROOT, DEBUG, AMD_client, SMSBOT_ENABLED, IV2PO_VIEW_ENABLED, DISCHARGE_SOON_VIEW_ENABLED

urlpatterns = [
    # Examples:
    # url(r'^$', 'main.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^jet/', include('jet.urls', 'jet')),
    url(r'^jet/dashboard/', include('jet.dashboard.urls', 'jet-dashboard')),
    url(r'^admin/', include(admin.site.urls)),
    url(r'^garments/', include('garments.urls'))
]
