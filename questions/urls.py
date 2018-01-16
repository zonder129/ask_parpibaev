from django.conf.urls import url

from . import views
"""
from questions.views import question_list, question_detail,AboutView

urlpatterns = [
    url(r'^about$', AboutView.as_view(), name='about'),
    url(r'^&', questions_list, name='questions_list'),
    url(r'^(?<question_id>[0-9]+)/$', questions_detail, name='questions_detail'),
]
"""
'''
urlpatterns = [
	url(r'^$', views.index, name='index'),
]
'''

urlpatterns = [
    # ...
    #url(r'^$', views.search_form, name='search_form'),
    url(r'^$', views.questions, name='question_list'),
    url(r'^login/$', views.login, name='login'),
    url(r'^(?P<question_id>[0-9]+)/$', views.question_detail, name='question_detail'),
    url(r'^register/$', views.register, name='register'),
    url(r'^settings/$', views.settings, name='settings'),
    url(r'^hot_questions/$', views.hot_questions, name='hot_questions'),
    url(r'^tag/$', views.tag, name='tag'),
    #url(r'^$', views.base, name='base'),
    #url(r'^hot/$', views.hot, name='hot'),
    #url(r'^tag/$', views.tag, name='tag'),
    #url(r'^$', views.answer, name='answer'),
    #url(r'^login/$', views.login, name='login'),
    #url(r'^register/$', views.register, name='register'),
    url(r'^new_question/$', views.new_question, name='new_question'),


    # ...
]