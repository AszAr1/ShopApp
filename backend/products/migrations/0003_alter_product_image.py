# Generated by Django 4.1.10 on 2023-10-14 20:37

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('products', '0002_alter_cartitem_id_alter_favorite_id_alter_order_id_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='product',
            name='image',
            field=models.ImageField(blank=True, null=True, upload_to='source'),
        ),
    ]
