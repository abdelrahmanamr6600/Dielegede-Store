import 'package:dielegende_store/core/shared/widgets/CustomAppBar.dart';
import 'package:dielegende_store/core/utils/colors.dart';
import 'package:flutter/material.dart';

class BagScreen extends StatefulWidget {
  BagScreen({super.key});

  @override
  State<BagScreen> createState() => _BagScreenState();
}

class _BagScreenState extends State<BagScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "Bag",
      ),
      body: Center(child: Text("Bag Screen")),
    );
  }
}
