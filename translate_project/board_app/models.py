from django.db import models
from users_app.models import User

# Create your models here.
class Board(models.Model):
    board_id = models.AutoField(primary_key=True)
    board_title = models.CharField(max_length=100, blank=True, null=True)
    board_main_txt = models.TextField(blank=True, null=True)    
    category = models.ForeignKey('Category', models.DO_NOTHING, blank=True, null=True)
    language = models.ForeignKey('LanguageCode', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(User, models.DO_NOTHING, blank=True, null=True)
    reg_date = models.DateTimeField(auto_now_add=True)  
    lst_chg_date = models.DateTimeField(auto_now=True)

    class Meta:
        managed = False
        db_table = 'board'


class BoardComment(models.Model):
    comment_id = models.AutoField(primary_key=True)        
    board = models.ForeignKey(Board, models.DO_NOTHING)     
    user = models.ForeignKey(User, models.DO_NOTHING)
    comment_text = models.CharField(max_length=200, blank=True, null=True)
    reg_date = models.DateTimeField(auto_now_add=True)  
    lst_chg_date = models.DateTimeField(auto_now=True)

    class Meta:
        managed = False
        db_table = 'board_comment'
        unique_together = (('comment_id', 'board', 'user'),)

class Category(models.Model):
    category_id = models.CharField(primary_key=True, max_length=10)
    category_name = models.CharField(max_length=30, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'category'

    def __str__(self):
        return self.category_name

class LanguageCode(models.Model):
    language_id = models.CharField(primary_key=True, max_length=10)
    language_name = models.CharField(max_length=30, blank=True, null=True)

    def __str__(self):
        return self.language_name

    class Meta:
        managed = False
        db_table = 'language_code'