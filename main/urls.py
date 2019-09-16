from django.conf.urls import url, include
from django.contrib import admin
from main import settings
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from django.conf.urls.static import static

# from settings import STATIC_ROOT, DEBUG, AMD_client, SMSBOT_ENABLED, IV2PO_VIEW_ENABLED, DISCHARGE_SOON_VIEW_ENABLED
print("main urls.py")
urlpatterns = [
    # Examples:
    # url(r'^$', 'main.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^jet/', include('jet.urls', 'jet')),
    url(r'^admin/', include(admin.site.urls)),
    url(r'^', include('garments.urls'))


]+static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
urlpatterns += staticfiles_urlpatterns()