import 'package:dielegende_store/core/shared/fun/getLocation.dart';
import 'package:dielegende_store/core/shared/widgets/HomeAppBar.dart';
import 'package:dielegende_store/core/utils/secure_storage_helper.dart';
import 'package:dielegende_store/features/category/presentation/cubit/CategoryCubit.dart';
import 'package:dielegende_store/features/category/presentation/cubit/CategoryState.dart';
import 'package:dielegende_store/features/home/presentation/cubit/HomeCubit.dart';
import 'package:dielegende_store/features/home/presentation/ui/widgets/CategorySection.dart';
import 'package:dielegende_store/features/home/presentation/ui/widgets/HomeProductHeader.dart';
import 'package:dielegende_store/features/home/presentation/ui/widgets/HomeProductGrid.dart';
import 'package:dielegende_store/features/home/presentation/ui/widgets/SliderBanner.dart';
import 'package:dielegende_store/features/home/presentation/ui/widgets/StoreSection.dart';
import 'package:dielegende_store/features/store/presentation/cubit/StoreCubit.dart';
import 'package:dielegende_store/features/store/presentation/cubit/StoreState.dart';
import 'package:dielegende_store/features/wish_list/presentation/cubit/WishListCubit.dart';
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
  late CategoryCubit categoryCubit;
  late StoreProductsCubit storeProductsCubit;

  String? _currentAddress;

  @override
  void initState() {
    super.initState();
    // _getLocation();
    homeCubit = context.read<HomeCubit>();
    categoryCubit = context.read<CategoryCubit>();
    storeProductsCubit = context.read<StoreProductsCubit>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!storeProductsCubit.isClosed &&
          storeProductsCubit.state is! AllStoreSuccessState) {
        storeProductsCubit.getAllStores();
      }

      if (!categoryCubit.isClosed && categoryCubit.state is! CategorySuccess) {
        categoryCubit.getCategory();
      }

      final token = SecureStorageHelper.getToken();
      if (token != null && token.toString().isNotEmpty) {
        context.read<WishListCubit>().loadFavorites();
      }
    });
    _initData();
    // context.read<FollowStoreCubit>().loadFollwedIds();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(150.h),
          child: SafeArea(child: HomeAppBar(currentAddress: _currentAddress)),
        ),
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SliderBanner()),
            SliverToBoxAdapter(child: SizedBox(height: 10.h)),
            const SliverToBoxAdapter(child: StoreSection()),
            SliverToBoxAdapter(child: SizedBox(height: 10.h)),
            SliverToBoxAdapter(child: CategorySection()),
            const HomeProductHeader(),
            const HomeProductGrid(),
          ],
        ));
  }

  void _initData() async {
    final address = await LocationHelper.getCurrentAddress();
    setState(() {
      _currentAddress = address;
    });
  }
}
