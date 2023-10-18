from django.db import models

class Gamevocab(models.Model):
    game_vocab_id = models.BigAutoField(primary_key=True)
    game_vocab = models.CharField(max_length=100)
    game_stage = models.BigIntegerField()
    language_id = models.CharField(max_length=10)

    class Meta:
        managed = False
        db_table = 'GameVocab'
