from django.db import models

# Create your models here.

from django.db import models

# Create your models here.

class Actor(models.Model):
    name = models.CharField(max_length=500)
    age = models.IntegerField()

class Movie(models.Model):
    title = models.CharField(max_length=500)
    year = models.IntegerField()
    actors = models.ManyToManyField(Actor, related_name='movies')
    # actors : 영화에 출연한 사람들 목록, 하나의 영화에 여러 배우
    # category_set => categories(Category클래스에서 연결 이름을 categories로 설정)

class Category(models.Model):
    name = models.CharField(max_length=500)
    movies = models.ManyToManyField(Movie, related_name='categories')
    # 하나의 영화에 여러 장르

class User(models.Model):
    name = models.CharField(max_length=500)
    country = models.CharField(max_length=500)
    email = models.CharField(max_length=500)
    age = models.IntegerField()
    # score_set

class Score(models.Model):
    content = models.CharField(max_length=500)
    value = models.IntegerField()
    movie = models.ForeignKey(Movie, on_delete=models.CASCADE)
    user = models.ForeignKey(User, on_delete=models.CASCADE)