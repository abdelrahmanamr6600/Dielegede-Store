import 'package:dielegende_store/features/bag/data/model/BagModel.dart';
import 'package:dielegende_store/features/bag/data/model/ExpiredProductsModel.dart';

abstract class Bagstate {}

class BagInitialState extends Bagstate {}

class BagLoadingState extends Bagstate {}

class BagActiveSuccessState extends Bagstate {
  final List<BagItem> bagItems;
  BagActiveSuccessState({required this.bagItems});
}

class BagExpiredSuccessState extends Bagstate {
  final List<ExpiredItem> expiredItems;
  BagExpiredSuccessState({required this.expiredItems});
}

class BagErrorState extends Bagstate {
  final String error;

  BagErrorState({required this.error});
}

class BagEmptyState extends Bagstate {}
class BagExpiredEmptyState extends Bagstate {}

class BagItemAddedSuccessState extends Bagstate {
  BagItemAddedSuccessState();
}

class BagItemRemovedState extends Bagstate {
  final String message;

  BagItemRemovedState({required this.message});
}

class BagItemAddedLoadingState extends Bagstate {}

class BagItemAddedErrorState extends Bagstate {
  final String error;

  BagItemAddedErrorState({required this.error});
}

class BagItemDeleteLoadingState extends Bagstate {}

class BagItemDeleteErrorState extends Bagstate {
  final String error;

  BagItemDeleteErrorState({required this.error});
}

class BagExpiredItemDeleteErrorState extends Bagstate {
  final String error;

  BagExpiredItemDeleteErrorState({required this.error});
}
