import 'package:dielegende_store/core/errors/Failures.dart';
import 'package:dielegende_store/features/bag/data/model/BagModel.dart';
import 'package:dielegende_store/features/bag/data/model/ExpiredProductsModel.dart';
import 'package:dielegende_store/features/bag/data/repo/BagRepo.dart';
import 'package:dielegende_store/features/bag/presentation/cubit/BagState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BagCubit extends Cubit<Bagstate> {
  BagCubit(this.bagRepo) : super(BagInitialState());
  final BagRepo bagRepo;

  List<BagItem> bagItems = [];
  List<ExpiredItem> expiredItems = [];

  Future<void> getBagProducts() async {
    emit(BagLoadingState());
    try {
      final result = await bagRepo.getProductsBag();
      result.fold(
        (failure) => emit(BagErrorState(error: failure.errorMessage)),
        (bagResponse) {
          bagItems = bagResponse.data.bagItems;
          if (bagItems.isEmpty) {
            emit(BagEmptyState());
          } else {
            emit(BagActiveSuccessState(bagItems: bagItems));
          }
        },
      );
    } catch (e) {
      emit(BagErrorState(error: "Error loading bag: $e"));
    }
  }

  Future<void> getExpiredBagProducts() async {
    emit(BagLoadingState());
    try {
      final result = await bagRepo.getExpiredProducts();
      result.fold(
        (failure) => emit(BagErrorState(error: failure.errorMessage)),
        (bagResponse) {
          expiredItems = bagResponse.data.expiredItems;
          if (expiredItems.isEmpty) {
            emit(BagEmptyState());
          } else {
            emit(BagExpiredSuccessState(expiredItems: expiredItems));
          }
        },
      );
    } catch (e) {
      emit(BagErrorState(error: "Error loading expired items: $e"));
    }
  }

  Future<void> addToBag({
    required int productId,
    int? quantity,
    required Map<String, dynamic> selectedOptions,
  }) async {
    emit(BagItemAddedLoadingState());
    try {
      await bagRepo.addToBag(
          productId: productId, selectedOptions: selectedOptions);

      emit(BagItemAddedSuccessState());
    } catch (e) {
      if (e is Failure) {
        emit(BagItemAddedErrorState(error: e.toString()));
      } else {
        emit(BagItemAddedErrorState(
            error: "An error occurred while adding to bag: $e"));
      }
    }
  }

  Future<void> deleteItemFromBag(int id) async {
    final index = bagItems.indexWhere((item) => item.id == id);
    if (index == -1) return;

    final deletedItem = bagItems[index];

    bagItems.removeAt(index);
    emit(bagItems.isEmpty
        ? BagEmptyState()
        : BagActiveSuccessState(bagItems: List.from(bagItems)));

    final result = await bagRepo.deleteBagItem(id);

    result.fold(
      (failure) {
        bagItems.insert(index, deletedItem);
        emit(BagActiveSuccessState(bagItems: List.from(bagItems)));
        emit(BagItemDeleteErrorState(error: failure.errorMessage));
      },
      (_) {
      },
    );
  }

  Future<void> deleteExpiredItemFromBag(int id) async {
    final index = expiredItems.indexWhere((item) => item.id == id);
    if (index == -1) return;

    final deletedItem = expiredItems[index];

    expiredItems.removeAt(index);
    emit(expiredItems.isEmpty
        ? BagExpiredEmptyState()
        : BagExpiredSuccessState(expiredItems: List.from(expiredItems)));

    final result = await bagRepo.deleteBagItem(id);

    result.fold(
      (failure) {
        expiredItems.insert(index, deletedItem);
        emit(BagExpiredSuccessState(expiredItems: List.from(expiredItems)));
        emit(BagExpiredItemDeleteErrorState(error: failure.errorMessage));
      },
      (_) {
      },
    );
  }
}
