# Generated by Django 4.2.1 on 2023-08-08 19:21

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('products', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='product',
            name='what_product',
            field=models.CharField(choices=[('CLOTHES', (('T-SHIRTS', 'T-shirt'), ('HOODIES', 'Hoodie'), ('JACKETS', 'Jacket'), ('COATS', 'Coat'), ('SWEATSHIRTS', 'Sweatshirt'), ('SWEATERS', 'Sweater'), ('JEANS', 'Jeans'))), ('SHOES', (('SNEAKERS', 'Sneakers'), ('SHOES', 'Shoes'), ('HEELS', 'Heels'), ('BOOTS', 'Boots')))], max_length=30),
        ),
    ]
