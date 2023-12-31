# Generated by Django 4.2.6 on 2023-10-17 05:20

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Vocabulary',
            fields=[
                ('vocabulary_id', models.BigIntegerField(db_column='vocabulary_id', primary_key=True, serialize=False)),
                ('vocabulary_name', models.CharField(db_column='vocabulary_name', max_length=100)),
                ('vocabulary_meaning', models.TextField(db_column='vocabulary_meaning')),
                ('vocabulary_level', models.IntegerField(db_column='vocabulary_level')),
                ('language_id', models.CharField(db_column='language_id', max_length=10)),
                ('reg_date', models.DateField(db_column='reg_date')),
                ('id', models.BigIntegerField()),
            ],
            options={
                'db_table': 'vocabulary',
                'managed': False,
            },
        ),
    ]
