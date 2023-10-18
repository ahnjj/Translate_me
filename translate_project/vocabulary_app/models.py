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
    id = models.BigIntegerField()
    language_id = models.ForeignKey('language_code', models.DO_NOTHING, db_column='language_id')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'vocabulary'

class Language_Code(models.Model):
    language_id = models.CharField(db_column='language_id', primary_key=True, max_length=10)  # Field name made lowercase.
    language_name = models.CharField(db_column='language_name', max_length=30)  # Field name made lowercase.

    def __str__(self):
        return self.language_name 

    class Meta:
        managed = False
        db_table = 'language_code'