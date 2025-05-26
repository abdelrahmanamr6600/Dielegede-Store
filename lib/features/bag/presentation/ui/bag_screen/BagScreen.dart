import 'package:dielegende_store/core/shared/widgets/CustomAppBar.dart';
import 'package:dielegende_store/core/utils/app_text_styles.dart';
import 'package:dielegende_store/core/utils/colors.dart';
import 'package:dielegende_store/core/utils/service_locator.dart';
import 'package:dielegende_store/features/bag/data/model/BagModel.dart';
import 'package:dielegende_store/features/bag/data/model/ExpiredProductsModel.dart';
import 'package:dielegende_store/features/bag/presentation/cubit/BagCubit.dart';
import 'package:dielegende_store/features/bag/presentation/cubit/BagState.dart';
import 'package:dielegende_store/features/bag/presentation/ui/widgets/BagItemExpired.dart';
import 'package:dielegende_store/features/bag/presentation/ui/widgets/BagItemLoadingSkeleton.dart';
import 'package:dielegende_store/features/bag/presentation/ui/widgets/BagItemProduct.dart';
import 'package:dielegende_store/features/bag/presentation/ui/widgets/bagList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class BagScreen extends StatefulWidget {
  const BagScreen({super.key});

  @override
  State<BagScreen> createState() => _BagScreenState();
}

class _BagScreenState extends State<BagScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);

    final bagCubit = BlocProvider.of<BagCubit>(context);
    bagCubit.getBagProducts();

    tabController.addListener(() {
      if (!tabController.indexIsChanging) {
        if (tabController.index == 0) {
          bagCubit.getBagProducts();
        } else {
          bagCubit.getExpiredBagProducts();
        }
      }
    });
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
      appBar: const CustomAppBar(title: "Bag"),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: const Color(0xFFF9F9F9),
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: TabBar(
              controller: tabController,
              indicator: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.circular(30.r),
              ),
              onTap: (index) {
                setState(() {});
              },
              dividerHeight: 0,
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.white,
              unselectedLabelColor: mainColor,
              unselectedLabelStyle: AppTextStyles.mainText()
                  .copyWith(fontSize: 16.sp, color: mainColor),
              labelStyle: AppTextStyles.mainText().copyWith(fontSize: 16.sp),
              splashFactory: NoSplash.splashFactory,
              tabs: const [
                Tab(text: "Active"),
                Tab(text: "Time End"),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: BlocBuilder<BagCubit, Bagstate>(
              builder: (context, state) {
                if (state is BagLoadingState) {
                  return BagLoadingWidget(tabController: tabController);
                } else if (state is BagEmptyState ||
                    state is BagExpiredEmptyState) {
                  return Lottie.asset(
                    "assets/images/empty_bag.json",
                    height: 150.h,
                    repeat: true,
                    fit: BoxFit.contain,
                  );
                } else if (state is BagErrorState) {
                  return Center(child: Text(state.error));
                } else if (state is BagActiveSuccessState ||
                    state is BagExpiredSuccessState) {
                  final bagCubit = BlocProvider.of<BagCubit>(context);

                  return TabBarView(
                    controller: tabController,
                    children: [
                      buildBagList(bagCubit.bagItems),
                      buildExpirdeBagList(bagCubit.expiredItems),
                    ],
                  );
                }

                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
