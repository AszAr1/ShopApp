# Generated by Django 4.1.10 on 2023-10-25 18:33

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('products', '0005_alter_cartitem_options_alter_favorite_options_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='order',
            name='status',
            field=models.CharField(default='Pending', max_length=30, null=True),
        ),
    ]
