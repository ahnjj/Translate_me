from django.db import models

# Create your models here.
class Vocabulary(models.Model):
    vocabulary_id = models.BigIntegerField(db_column='vocabulary_id',primary_key=True)
    vocabulary_name = models.CharField(db_column='vocabulary_name', max_length=100)
    vocabulary_meaning = models.TextField(db_column='vocabulary_meaning')
    vocabulary_level = models.IntegerField(db_column='vocabulary_level')
    language_id = models.CharField(db_column='language_id', max_length=10)
    train_yn = models.BooleanField(db_column='train_yn')
    reg_date = models.DateField(db_column='reg_date')
    id = models.ForeignKey('Users_app_user', models.DO_NOTHING, db_column='id')
    language_id = models.ForeignKey('Language_code', models.DO_NOTHING, db_column='language_id')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'vocabulary'

class Language_code(models.Model):
    language_id = models.CharField(db_column='language_id', primary_key=True, max_length=10)  # Field name made lowercase.
    language_name = models.CharField(db_column='language_name', max_length=30)  # Field name made lowercase.

    def __str__(self):
        return self.language_name 

    class Meta:
        managed = False
        db_table = 'language_code'

class Users_app_user(models.Model):
    id = models.BigIntegerField(db_column='id', primary_key=True)
    username = models.CharField(db_column='username', max_length=150)
    userlevel = models.CharField(db_column='user_level', max_length=10)

    # def __str__(self):
    #     return self.username

    class Meta:
        managed = False
        db_table = 'users_app_user'

class User_test_result(models.Model):
    test_id = models.BigIntegerField(db_column='test_id', primary_key=True)
    id = models.ForeignKey('Users_app_user', models.DO_NOTHING, db_column='id')
    user_score = models.IntegerField(db_column='user_score')
    test_date = models.DateTimeField(db_column='test_date')
    user_test = models.CharField(db_column='user_test', max_length=100)

    class Meta:
        managed = False
        db_table = 'user_test_result'