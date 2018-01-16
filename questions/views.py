from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render , get_object_or_404
from questions.models import Question, Answer, Tag, Like, Profile
from django.db.models.aggregates import Count
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from questions.forms import *
from django.views.decorators.csrf import csrf_protect
from django.contrib.auth.decorators import login_required
from django.contrib.auth import login, authenticate, logout


def get_page(objects, page_size, page_number):
    paginator = Paginator(objects, page_size)
    try:
        result = paginator.page(page_number)
    except PageNotAnInteger:
        result = paginator.page(1)
    except EmptyPage:
        result = paginator.page(paginator.num_pages)
    return result

def get_GET_parameters(request):
    parameters = ''
    for parameter in (request.GET.items()):
        parameters += str(parameter[0] + '=' + parameter[1] + '&')
    return parameters
 
 
def get_best_members():
    return Profile.objects.order_by('rating')[:5]
 
 
def get_popular_tags():
    return Tag.objects.annotate(col_questions=Count('question')).order_by('-col_questions')[:16]
 
 
def new_questions_view(request):
    show_hot = True if int(request.GET.get('hot') or 0) else False
    questions = get_page(Question.objects.order_by('-rating' if show_hot else '-publication_date'), 3,
                         int(request.GET.get('page') or 1))
    return render(request, 'questions_base.html', {
                  'get_parameters': get_GET_parameters(request),
                  'questions': questions,
                  'best_members': get_best_members(),
                  'popular_tags': get_popular_tags(),
                  'show_hot': show_hot,
                  })

def questions(request):
    questions = get_page(Question.objects.order_by('-raiting' if hot_questions else '-publication_date'), 3,
                     int(request.GET.get('page') or 1))
    return render(request, 'question_list.html', {'questions': questions})

def question_detail(request, question_id):
    question = get_object_or_404(Question, pk = int(question_id))
    answers = Answer.objects.filter(question = question)#.order_by('-rating')
    return render(request, 'question_detail.html', {'question_detail': question,
        'answers':answers,
        'best_members':get_best_members(),
        'popular_tags':get_popular_tags(),
        })

@csrf_protect
def login(request):
    if request.method == 'POST':
        form = LoginForm(request.POST)
        if form.is_valid():
            user = authenticate(username=form.cleaned_data['login'],
                                password=form.cleaned_data['password'])
            if user is not None:
                login(request, user)
                return HttpResponseRedirect(request.GET['continue'])
            else:
                pass
                # No backend authenticated the credentials

    else:
        form = LoginForm()
    return render(request, 'login.html', {
                  'best_members': get_best_members(),
                  'popular_tags': get_popular_tags(),
                  'form': form,
                  })

    
@csrf_protect
def register(request):
    if request.method == 'POST':
        form = SignUpForm(request.POST, request.FILES)
        if form.is_valid():
            user = User.objects.create_user(username=form.cleaned_data['login'],
                                            first_name=form.cleaned_data['nickname'],
                                            email=form.cleaned_data['email'],
                                            password=form.cleaned_data['password'])
            user.save()
            user.profile.avatar = form.cleaned_data['avatar']
            user.save()
            return HttpResponseRedirect('/')
    else:
        form = SignUpForm()
    return render(request, 'register.html', {'form': form,})

@login_required
def settings(request):
    return render(request, 'settings.html')

def hot_questions(request):
    questions = get_page(Question.objects.order_by('-raiting' if hot_questions else '-publication_date'), 3,
                     int(request.GET.get('page') or 1))
    return render(request, 'hot_questions.html', {'questions': questions})

def tag(request):
    return render(request, 'tag.html')

def new_question(request):
    return render(request, 'new_question.html', {'form':QuestionForm(),})
