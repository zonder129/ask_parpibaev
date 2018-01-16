from django import forms
from django.contrib.auth.models import User
from re import match

class SignUpForm(forms.Form):
    login = forms.CharField(label='Login', min_length=5, max_length=128)
    email = forms.EmailField(label='Email', min_length=5, max_length=128)
    nickname = forms.CharField(label='Nickname', min_length=5, max_length=34)
    password = forms.CharField(widget=forms.PasswordInput, label='Password', min_length=5, max_length=128)
    password_again = forms.CharField(widget=forms.PasswordInput, label='Password again', min_length=5, max_length=128)
    avatar = forms.ImageField(required=False, label ='Avatar')


    def clean_login(self):
        login = self.cleaned_data['login']
        if User.objects.filter(username=login).exists():
            raise forms.ValidationError("Login already exists")
        return login


    def clean_nickname(self):
        nickname = self.cleaned_data['nickname']
        if User.objects.filter(first_name=nickname).exists():
            raise forms.ValidationError("Nickname already exists")
        return nickname


    def clean_email(self):
        email = self.cleaned_data['email']
        if User.objects.filter(email=email).exists():
            raise forms.ValidationError("Email already exists")
        return email


    def clean(self):
        form_data = self.cleaned_data
        if form_data['password'] != form_data['password_again']:
            raise forms.ValidationError("Passwords do not match")
        return form_data


class QuestionForm(forms.Form):
    title = forms.CharField(label='Title', min_length=5, max_length=128)
    text = forms.CharField(label='Text', widget=forms.Textarea(), min_length=8, max_length=2048)
    tag = forms.CharField(label='Tag', required=False, min_length=0, max_length=128)

    def clean_tag(self):
        cleaned_tag = self.cleaned_data['tag']
        if match('^[a-zA-Z0-9_ ,]*$', cleaned_tag) is None:
            raise forms.ValidationError('tag may only contain letters, numbers, spaces,'
                                        + ' underscores aand separated by comma.')
        print cleaned_tag
        return cleaned_tag

class LoginForm(forms.Form):
    login = forms.CharField(label='Login', min_length=5, max_length=128)
    password = forms.CharField(widget=forms.PasswordInput, label='Password', min_length=5, max_length=128)

    

class SettingsForm(forms.Form):
    login = forms.CharField(label='Login', min_length=5, max_length=128)
    email = forms.EmailField(label='Email', min_length=5, max_length=128)
    nickname = forms.CharField(label='Nickname', min_length=5, max_length=34)
    password = forms.CharField(widget=forms.PasswordInput, label='Password', min_length=5, max_length=128)
    avatar = forms.ImageField(required=False, label ='Avatar')
