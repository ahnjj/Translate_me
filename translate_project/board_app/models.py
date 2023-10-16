from django.db import models

# Create your models here.
class Board(models.Model):
    board_id = models.AutoField(primary_key=True)
    board_title = models.CharField(max_length=100, blank=True, null=True)
    board_main_txt = models.TextField(blank=True, null=True)
    category = models.ForeignKey('Category', models.DO_NOTHING, blank=True, null=True)
    language = models.ForeignKey('LanguageCode', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey('UserInfo', models.DO_NOTHING, blank=True, null=True)
    reg_date = models.DateTimeField(blank=True, null=True)
    lst_chg_date = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'board'


class BoardComment(models.Model):
    comment_id = models.AutoField(primary_key=True)  # The composite primary key (comment_id, board_id, user_id) found, that is not supported. The first column is selected.
    board = models.ForeignKey(Board, models.DO_NOTHING)
    user = models.ForeignKey('UserInfo', models.DO_NOTHING)
    comment_text = models.CharField(max_length=200, blank=True, null=True)
    reg_date = models.DateTimeField(blank=True, null=True)
    lst_chg_date = models.DateTimeField(blank=True, null=True)

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

class LanguageCode(models.Model):
    language_id = models.CharField(primary_key=True, max_length=10)
    language_name = models.CharField(max_length=30, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'language_code'



class UserInfo(models.Model):
    user_id = models.CharField(primary_key=True, max_length=30)
    user_password = models.CharField(max_length=30, blank=True, null=True)
    user_name = models.CharField(max_length=150, blank=True, null=True)
    user_email = models.CharField(max_length=254, blank=True, null=True)
    user_website_url = models.CharField(max_length=50, blank=True, null=True)
    joined_date = models.DateField(blank=True, null=True)
    frst_login_date = models.DateField(blank=True, null=True)
    is_superuser = models.IntegerField(blank=True, null=True)
    is_staff = models.IntegerField(blank=True, null=True)
    is_active = models.IntegerField(blank=True, null=True)
    user_language = models.CharField(max_length=10, blank=True, null=True)
    user_level = models.CharField(max_length=10, blank=True, null=True)
    avatar = models.CharField(max_length=100, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'user_info'