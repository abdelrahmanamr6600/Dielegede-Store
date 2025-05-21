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
  String searchQuery = "";
  void searchProducts(String query) {
    searchQuery = query;
    pagingController.refresh();
  }

  final HomeRepo homeRepo;
  static const _pageSize = 20;

  final PagingController<int, ProductModel> pagingController =
      PagingController(firstPageKey: 1);

  Future<void> fetchPage(int pageKey) async {
    try {
     print('Fetching data for page: $pageKey with query: $searchQuery');
      final result = await homeRepo.fetchProduct(page: pageKey, query: searchQuery);


      result.fold(
        (failure) {
          print('Error fetching page: $pageKey, Error: $failure');
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
      print(error);
      pagingController.error = error;
    }
  }

  @override
  Future<void> close() {
    pagingController.dispose();
    return super.close();
  }
}
