import 'package:dielegende_store/features/bag/data/model/BagModel.dart';
import 'package:dielegende_store/features/bag/data/model/ExpiredProductsModel.dart';
import 'package:dielegende_store/features/bag/presentation/cubit/BagCubit.dart';
import 'package:dielegende_store/features/bag/presentation/cubit/BagState.dart';
import 'package:dielegende_store/features/bag/presentation/ui/widgets/BagItemExpired.dart';
import 'package:dielegende_store/features/bag/presentation/ui/widgets/BagItemProduct.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildBagList(List<BagItem> bagItem) {
  return ListView.builder(
    physics: const BouncingScrollPhysics(),
    itemCount: bagItem.length,
    padding: EdgeInsets.symmetric(horizontal: 5.w),
    itemBuilder: (context, index) {
      return BagProductItem(
        onDelete: () async {
         await context.read<BagCubit>().deleteItemFromBag(bagItem[index].id);
        },
        
        bagItem: bagItem[index],
      );
    },
  );
}

Widget buildExpirdeBagList(List<ExpiredItem> expiredBageItems) {
  return ListView.builder(
    physics: const BouncingScrollPhysics(),
    itemCount: expiredBageItems.length,
    padding: EdgeInsets.symmetric(horizontal: 5.w),
    itemBuilder: (context, index) {
      return ExpiredBagProductItem(
        onDelete: () {
          context
              .read<BagCubit>()
              .deleteExpiredItemFromBag(expiredBageItems[index].id);
        },
        bagItem: expiredBageItems[index],
      );
    },
  );
}
