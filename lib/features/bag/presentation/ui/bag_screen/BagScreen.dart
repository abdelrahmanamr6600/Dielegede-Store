import 'package:dielegende_store/core/shared/widgets/CustomAppBar.dart';
import 'package:dielegende_store/core/utils/app_text_styles.dart';
import 'package:dielegende_store/core/utils/colors.dart';
import 'package:dielegende_store/features/bag/presentation/ui/widgets/BagItemProduct.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BagScreen extends StatefulWidget {
  const BagScreen({super.key});

  @override
  State<BagScreen> createState() => _BagScreenState();
}

class _BagScreenState extends State<BagScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: "Bag",
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            decoration: BoxDecoration(
                color: const Color(0xFFF9F9F9),
                borderRadius: BorderRadius.circular(30.r)),
            child: TabBar(
              dividerHeight: 0.0,
              controller: tabController,
              indicator: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.circular(30.r),
              ),
              onTap: (index) {
                setState(() {});
              },
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.white,
              unselectedLabelColor: mainColor,
              unselectedLabelStyle: AppTextStyles.mainText
                  .copyWith(fontSize: 16.sp, color: mainColor),
              labelStyle: AppTextStyles.mainText.copyWith(
                fontSize: 16.sp,
              ),
              splashFactory: NoSplash.splashFactory,
              tabs: const [
                Tab(
                  text: "Active",
                ),
                Tab(
                  text: "Time End",
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: TabBarView(controller: tabController, children: [
              buildBagItems(false),
              buildBagItems(true),
            ]),
          )
        ],
      ),
    );
  }
}

Widget buildBagItems(bool timeEnded) {
  return ListView.builder(
    physics: BouncingScrollPhysics(),
    itemCount: 5,
    padding: EdgeInsets.symmetric(horizontal: 5.w),
    itemBuilder: (context, index) {
      return BagProductItem(timeEnded: timeEnded);
    },
  );
}
