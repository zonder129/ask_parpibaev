# encoding: utf-8
from __future__ import unicode_literals
from django.db import models
from django.contrib.auth.models import User
from django.dispatch import receiver
from django.db.models.signals import post_save



class Tag(models.Model):
	name = models.CharField(max_length=255,verbose_name=u'Имя')
	num_questions = models.IntegerField(null = True, blank = True)

	def __unicode__(self):
		return self.name

	class Meta:
		verbose_name=u'Тег'
		verbose_name_plural=u'Теги'


class Profile(models.Model):
	avatar = models.FileField()
	user = models.OneToOneField(User, on_delete=models.CASCADE,primary_key=True)
	
	@receiver(post_save, sender=User)
	def create_user_profile(sender, instance, created, **kwargs):
	    if created:
	        Profile.objects.create(user=instance)

	@receiver(post_save, sender=User)
	def save_user_profile(sender, instance, **kwargs):
	    instance.profile.save()

	class Meta:
		verbose_name = u'Пользователь'
		verbose_name_plural = u'Пользователи'



	def __unicode__(self):
		return self.user.username

class Question(models.Model):
	title = models.CharField(max_length=255,verbose_name=u'Заголовок')
	text = models.TextField(verbose_name=u'Текст')
	tag = models.ForeignKey(Tag, verbose_name=u'Тег', on_delete=models.CASCADE)
	author = models.ForeignKey(Profile, verbose_name=u'Aвтор')
	raiting = models.IntegerField(null = True, blank=True, default=0)

	def __unicode__(self):
		return self.title

	class Meta:
		verbose_name = u'Вопрос'
		verbose_name_plural = u'Вопросы'

class Answer(models.Model):
	text = models.TextField(verbose_name=u'Текст')
	question = models.ForeignKey(Question,verbose_name=u'вопрос')
	author = models.ForeignKey(Profile, verbose_name=u'Aвтор', null = True)
	raiting = models.IntegerField(null = True, blank=True, default=0)

	def __unicode__(self):
		return self.question.title

	class Meta:
		verbose_name = u'Ответ'
		verbose_name_plural = u'Ответы'

class Like(models.Model):
	author = models.ForeignKey(Profile, verbose_name=u'Автор', null = True)
	answer = models.ForeignKey(Answer, verbose_name=u'Ответ', null = True, blank = True)
	question = models.ForeignKey(Question, verbose_name=u'Вопрос', null = True, blank = True)

	def __unicode__(self):
		if not self.question:
			return '%s %s' % (self.author.user.username, self.answer.text)
		return '%s %s' % (self.author.user.username, self.question.title)

	class Meta:
		verbose_name = u'Рейтинг'
		verbose_name_plural = u'Рейтинги'
