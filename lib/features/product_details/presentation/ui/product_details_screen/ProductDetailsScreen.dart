import 'package:dielegende_store/core/shared/widgets/CustomAppBar.dart';
import 'package:dielegende_store/features/home/data/model/ProductModel.dart';
import 'package:dielegende_store/features/product_details/presentation/ui/widgets/ProductDetailsItem.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final product = GoRouterState.of(context).extra as ProductModel;
    return Scaffold(
        appBar: const CustomAppBar(
          title: "Product Details",
        ),
        backgroundColor: Colors.white,
        body: ProductDetailsItem(productModel: product,));
  }
}
