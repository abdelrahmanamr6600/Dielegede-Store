import 'package:dielegende_store/features/home/data/model/ProductModel.dart';
import 'package:dielegende_store/features/search/data/repo/SearchRepo.dart';
import 'package:dielegende_store/features/search/presentation/cubit/SearchState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchProductRepo searchProductRepo;

  SearchCubit(this.searchProductRepo) : super(SearchInitialState());

  List<ProductModel> allProducts = [];
  List<String> recentResearch = [];

void searchProducts(String query) async {
  if (isClosed) return;
  emit(SearchLoadingState());
  final result = await searchProductRepo.searchProducts(query);
  if (isClosed) return; 
  result.fold(
    (failure) {
      emit(SearchFailureState(failure));
    },
    (products) {
      emit(SearchSuccessState(products));
    },
  );
}


  void search(String query) {
    if (query.isEmpty) {
      emit(SearchSuccessState(allProducts));
    } else {
      final filtered = allProducts
          .where((product) =>
              product.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
      emit(SearchSuccessState(filtered));
      addSearchHistory(query);
    }
  }

  Future<void> loadRecentSearch() async {
    final box = await Hive.openBox<String>('searchBox');
    recentResearch = box.values.toList().reversed.toList();
    emit(SearchSuccessState(allProducts)); // للتحديث
  }

  Future<void> addSearchHistory(String query) async {
    final box = await Hive.openBox('searchBox');
    if (!box.values.contains(query)) {
      await box.add(query);
    }
    await loadRecentSearch();
  }

  Future<void> clearHistory() async {
    final box = await Hive.openBox('searchBox');
    await box.clear();
    recentResearch = [];
    emit(SearchSuccessState(allProducts));
  }

  Future<void> removeSearchItem(int index) async {
    final box = await Hive.openBox('searchBox');
    final key = box.keyAt(box.length - index - 1);
    await box.delete(key);
    await loadRecentSearch();
    emit(SearchSuccessState(allProducts));
  }
}
