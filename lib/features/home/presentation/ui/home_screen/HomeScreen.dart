import 'package:dielegende_store/core/shared/widgets/HomeAppBar.dart';
import 'package:dielegende_store/core/utils/app_text_styles.dart';
import 'package:dielegende_store/core/utils/service_locator.dart';
import 'package:dielegende_store/features/home/presentation/cubit/HomeCubit.dart';
import 'package:dielegende_store/features/home/presentation/ui/widgets/CategorySection.dart';
import 'package:dielegende_store/features/home/presentation/ui/widgets/HomeProduct.dart';
import 'package:dielegende_store/features/home/presentation/ui/widgets/SliderBanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeCubit homeCubit;

  @override
  void initState() {
    super.initState();
    homeCubit = sl<HomeCubit>();
    if (homeCubit.pagingController.itemList == null ||
        homeCubit.pagingController.itemList!.isEmpty) {
      homeCubit.fetchPage(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: homeCubit,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(130.h),
          child: const SafeArea(child: HomeAppBar()),
        ),
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SliderBanner()),
            SliverToBoxAdapter(child: SizedBox(height: 10.h)),
            SliverToBoxAdapter(child: CategorySection()),
            const SliverToBoxAdapter(child: HomeProduct()),
          ],
        ),
      ),
    );
  }
}
