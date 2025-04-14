import 'package:dielegende_store/features/home/data/model/ProductModel.dart';
import 'package:dielegende_store/features/home/data/repo/HomeRepo.dart';
import 'package:dielegende_store/features/home/presentation/cubit/HomeState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomeCubit extends Cubit<HometState> {
  HomeCubit(this.homeRepo) : super(HomeInitial()) {
    pagingController.addPageRequestListener((pageKey) {
      print('Requesting page: $pageKey');
      fetchPage(pageKey);
    });
  }

  final HomeRepo homeRepo;
  static const _pageSize = 10;

  final PagingController<int, ProductModel> pagingController =
      PagingController(firstPageKey: 1);

  Future<void> fetchPage(int pageKey) async {
    try {
      print('Fetching data for page: $pageKey');
      final result = await homeRepo.fetchProduct(page: pageKey);

      result.fold(
        (failure) {
          pagingController.error = failure;
        },
        (newItems) {
          print('Received ${newItems.length} items for page: $pageKey');
          final isLastPage = newItems.length < _pageSize;
          if (isLastPage) {
            print('Last page reached.'); 
            pagingController.appendLastPage(newItems);
          } else {
            final nextPageKey = pageKey + 1;
            print('Appending next page: $nextPageKey');
            pagingController.appendPage(newItems, nextPageKey);
          }
        },
      );
    } catch (error) {
      pagingController.error = error;
    }
  }

  // @override
  // Future<void> close() {
  //   pagingController.dispose();
  //   return super.close();
  // }
}
