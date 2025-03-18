import 'package:dielegende_store/core/shared/widgets/CustomAppBar.dart';
import 'package:dielegende_store/core/shared/widgets/ProductGridView.dart';
import 'package:dielegende_store/core/shared/widgets/SearchWidget.dart';
import 'package:flutter/material.dart';

class WishListScreen extends StatelessWidget {
  WishListScreen({super.key});

  final List<Map<String, dynamic>> products = [
    {
      "image": "assets/images/hoody.png",
      "title": "Cream Hoodie",
      "price": "199.99",
      "desc":
          "It is a long established fact that a reader will be distracted...",
      "rating": 4.9,
    },
    {
      "image": "assets/images/t-shirt.png",
      "title": "Black T-shirt",
      "price": "109.99",
      "desc":
          "It is a long established fact that a reader will be distracted by the readable content of a page w...",
      "rating": 4.7,
    },
    {
      "image": "assets/images/t-shirt.png",
      "title": "Black T-shirt",
      "price": "109.99",
      "desc":
          "It is a long established fact that a reader will be distracted by the readable content of a page w...",
      "rating": 4.7,
    },
    {
      "image": "assets/images/hoody.png",
      "title": "Cream Hoodie",
      "price": "199.99",
      "desc":
          "It is a long established fact that a reader will be distracted...",
      "rating": 4.9,
    },
    {
      "image": "assets/images/hoody.png",
      "title": "Cream Hoodie",
      "price": "199.99",
      "desc":
          "It is a long established fact that a reader will be distracted...",
      "rating": 4.9,
    },
    {
      "image": "assets/images/t-shirt.png",
      "title": "Black T-shirt",
      "price": "109.99",
      "desc":
          "It is a long established fact that a reader will be distracted by the readable content of a page w...",
      "rating": 4.7,
    },
    {
      "image": "assets/images/t-shirt.png",
      "title": "Black T-shirt",
      "price": "109.99",
      "desc":
          "It is a long established fact that a reader will be distracted by the readable content of a page w...",
      "rating": 4.7,
    },
    {
      "image": "assets/images/hoody.png",
      "title": "Cream Hoodie",
      "price": "199.99",
      "desc":
          "It is a long established fact that a reader will be distracted...",
      "rating": 4.9,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: 'Wish List',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [const SearchWidget(), ProductGridView(products: products)],
        ),
      ),
    );
  }
}
