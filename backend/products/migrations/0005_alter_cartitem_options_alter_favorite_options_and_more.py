# Generated by Django 4.1.10 on 2023-10-23 12:13

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('products', '0004_alter_product_image'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='cartitem',
            options={'verbose_name': 'Cart item', 'verbose_name_plural': 'Cart items'},
        ),
        migrations.AlterModelOptions(
            name='favorite',
            options={'verbose_name': 'Favorite', 'verbose_name_plural': 'Favorites'},
        ),
        migrations.AlterModelOptions(
            name='order',
            options={'verbose_name': 'Order', 'verbose_name_plural': 'Orders'},
        ),
        migrations.AlterModelOptions(
            name='orderitem',
            options={'verbose_name': 'Order item', 'verbose_name_plural': 'Order items'},
        ),
        migrations.AlterModelOptions(
            name='product',
            options={'verbose_name': 'Product', 'verbose_name_plural': 'Products'},
        ),
    ]