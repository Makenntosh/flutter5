import 'package:flutter/material.dart';
import 'package:flutter3/components/product_item.dart';
import 'package:flutter3/models/product.dart';

// Список товаров
final List<Product> products = [
  Product(
    "1727088258",
    "Демисезонное пальто",
    "Демисезонное пальто из полушерстяной ткани, утепленное синтепоном. Модель полуприталенного силуэта с узким английским воротником, прорезными карманами и застежкой на пуговицы.",
    "assets/1.jpg",
    "2519 руб.",
  ),
  Product(
    "1727108578",
    "Классическое пальто",
    "Пальто в классическом стиле со съемной утепленной синтепоном подстежкой на молнии с трикотажным воротником. Модель полуприталенного силуэта с английским воротником, прорезными карманами и застежкой на пуговицы.",
    "assets/2.jpg",
    "2238 руб.",
  ),
  Product(
    "1727127024",
    "Демисезонное пальто",
    "Демисезонное пальто из полушерстяной ткани, утепленное синтепоном. Модель полуприталенного силуэта с узким английским воротником, прорезными карманами и застежкой на пуговицы.",
    "assets/3.jpg",
    "4441 руб.",
  ),
  Product(
    "1727127095",
    "Демисезонное пальто",
    "Демисезонное пальто из полушерстяной ткани, утепленное синтепоном. Модель полуприталенного силуэта с узким английским воротником, прорезными карманами и застежкой на пуговицы.",
    "assets/4.jpg",
    "2469 руб.",
  ),
  Product(
    "1727127227",
    "Классическое пальто",
    "Пальто в классическом стиле со съемной утепленной синтепоном подстежкой на молнии с трикотажным воротником. Модель полуприталенного силуэта с английским воротником, прорезными карманами и застежкой на пуговицы.",
    "assets/5.jpg",
    "1007 руб.",
  ),
];

// Страница главного экрана
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Диалог для добавления нового товара
  void _showAddProductDialog() {
    final TextEditingController idController = TextEditingController();
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final TextEditingController imageUrlController = TextEditingController();
    final TextEditingController priceController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Добавить новый товар'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: idController,
                  decoration: const InputDecoration(labelText: 'Артикул'),
                ),
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(labelText: 'Название'),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(labelText: 'Описание'),
                ),
                TextField(
                  controller: imageUrlController,
                  decoration: const InputDecoration(labelText: 'URL изображения'),
                ),
                TextField(
                  controller: priceController,
                  decoration: const InputDecoration(labelText: 'Цена'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Отмена'),
            ),
            TextButton(
              onPressed: () {
                final newProduct = Product(
                  idController.text,
                  titleController.text,
                  descriptionController.text,
                  imageUrlController.text,
                  priceController.text,
                );

                setState(() {
                  products.add(newProduct);
                });

                Navigator.of(context).pop();
              },
              child: const Text('Сохранить'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Каталог товаров",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 6 / 12,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemCount: products.length,
              itemBuilder: (BuildContext ctx, index) {
                return ProductItem(product: products[index]);
              })),
      floatingActionButton: Stack(
        children: [
          Positioned(
            bottom: 40,
            right: 0,
            child: SizedBox(
              height: 70,
              width: 70,
              child: FloatingActionButton(
                onPressed: () => _showAddProductDialog(),
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                enableFeedback: true,
                child: const Icon(Icons.add),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

