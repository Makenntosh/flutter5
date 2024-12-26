import 'package:flutter/material.dart';
import 'package:flutter3/models/product.dart';
import 'package:flutter3/models/user.dart';
import 'package:flutter3/pages/catalog_page.dart';
import 'package:flutter3/pages/favorites_page.dart';
import 'package:flutter3/pages/profile_page.dart';

User user = User(
  "Гололобов Никита",
  "nik.gololobov91@mail.ru",
  "+71234567890",
  "assets/1.jpg",
);

class PageWrapper extends StatefulWidget {
  @override
  _PageWrapper createState() => _PageWrapper();
}

class _PageWrapper extends State<PageWrapper> {
  int _selectedPageIndex = 0;
  List<Product> _favoriteProducts = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _toggleFavorite(Product product) {
    setState(() {
      if (_favoriteProducts.contains(product)) {
        _favoriteProducts.remove(product);
      } else {
        _favoriteProducts.add(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = <Widget>[
      CatalogPage(
          favoriteProducts: _favoriteProducts, onFavoriteToggle: _toggleFavorite),
      FavoritesPage(
          onFavoriteToggle: _toggleFavorite, favoriteProducts: _favoriteProducts),
      ProfilePage(user: user)
    ];
    return Scaffold(
      body: _pages.elementAt(_selectedPageIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Главная"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Отложенное"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Профиль")
        ],
        currentIndex: _selectedPageIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}