// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// import 'package:dielegende_store/core/utils/app_text_styles.dart';
// import 'package:dielegende_store/core/utils/colors.dart';
// import 'package:dielegende_store/core/utils/service_locator.dart';
// import 'package:dielegende_store/features/category/presentation/cubit/CategoryCubit.dart';
// import 'package:dielegende_store/features/category/presentation/cubit/CategoryState.dart';

// class CategoryScreen extends StatelessWidget {
//   const CategoryScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => sl<CategoryCubit>()..getCategory(),
//       child: Scaffold(
//         body: BlocBuilder<CategoryCubit, CategoryState>(
//           builder: (context, state) {
//             if (state is CategoryLoading) {
//               return const Center(
//                 child: CircularProgressIndicator(color: mainColor),
//               );
//             } else if (state is CategorySuccess) {
//               final categories = state.response.data.categories;

//               return Padding(
//                 padding: EdgeInsets.only(top: 30.h),
//                 child: SingleChildScrollView(
//                   child: StaggeredGrid.count(
//                     crossAxisCount: 4,
//                     mainAxisSpacing: 0,
//                     crossAxisSpacing: 0,
//                     children: _buildPatternItems(categories),
//                   ),
//                 ),
//               );
//             } else {
//               return const Center(child: Text("فشل في تحميل الفئات"));
//             }
//           },
//         ),
//       ),
//     );
//   }

//   List<StaggeredGridTile> _buildPatternItems(List<dynamic> categories) {
//     List<StaggeredGridTile> tiles = [];

//     if (categories.isEmpty) return tiles;

//     // أول عنصر كبير
//     tiles.add(
//       StaggeredGridTile.count(
//         crossAxisCellCount: 4,
//         mainAxisCellCount: 2,
//         child: CategoryItem(
//           imageUrl: "assets/images/popular.png",
//           name: categories[0].name,
//           textColor: Colors.white,
//           alignment: Alignment.bottomLeft,
//         ),
//       ),
//     );

//     // نبدأ من العنصر رقم 1
//     for (int i = 1; i < categories.length; i += 3) {
//       // الاتنين الصغيرين فوق بعض (على اليمين)
//       tiles.add(
//         StaggeredGridTile.count(
//           crossAxisCellCount: 2,
//           mainAxisCellCount: 4,
//           child: Column(
//             children: [
//               if (i + 1 < categories.length)
//                 Expanded(
//                   child: CategoryItem(
//                     imageUrl: "assets/images/women.png",
//                     name: categories[i + 1].name,
//                     textColor: mainColor,
//                     alignment: Alignment.center,
//                   ),
//                 ),
//               if (i + 2 < categories.length)
//                 Expanded(
//                   child: CategoryItem(
//                     imageUrl: "assets/images/kids.png",
//                     name: categories[i + 2].name,
//                     textColor: Colors.white,
//                     alignment: Alignment.center,
//                   ),
//                 ),
//             ],
//           ),
//         ),
//       );

//       // // العنصر الكبير (على اليسار)
//       if (i < categories.length) {
//         tiles.add(
//           StaggeredGridTile.count(
//             crossAxisCellCount: 2,
//             mainAxisCellCount: 4,
//             child: CategoryItem(
//               imageUrl: "assets/images/men.png",
//               name: categories[i].name,
//               textColor: Colors.white,
//               alignment: Alignment.bottomLeft,
//             ),
//           ),
//         );
//       }
//     }

//     return tiles;
//   }
// }

// class CategoryItem extends StatelessWidget {
//   final String imageUrl;
//   final String name;
//   final Color textColor;
//   final Alignment alignment;

//   const CategoryItem({
//     super.key,
//     required this.imageUrl,
//     required this.name,
//     required this.textColor,
//     required this.alignment,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage(imageUrl),
//           fit: BoxFit.cover,
//         ),
//         // borderRadius: BorderRadius.circular(12),
//       ),
//       alignment: alignment,
//       padding: const EdgeInsets.all(12),
//       child: Text(
//         name,
//         style: TextStyle(
//           color: textColor,
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }
// }
