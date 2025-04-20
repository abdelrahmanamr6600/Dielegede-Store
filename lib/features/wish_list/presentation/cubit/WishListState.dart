import 'package:equatable/equatable.dart';


abstract class WishlistState extends Equatable {
  const WishlistState();

  @override
  List<Object?> get props => [];
}

class WishlistInitial extends WishlistState {}

class WishlistLoading extends WishlistState {
  final int productId;

  const WishlistLoading({required this.productId});

  @override
  List<Object?> get props => [productId];
}

class WishlistAdded extends WishlistState {
  final int productId;

  const WishlistAdded({required this.productId});

  @override
  List<Object?> get props => [productId];
}

class WishlistRemoved extends WishlistState {
  final int productId;

  const WishlistRemoved({required this.productId});

  @override
  List<Object?> get props => [productId];
}

class WishlistError extends WishlistState {
  final String message;
  final int productId;

  const WishlistError({required this.message, required this.productId});

  @override
  List<Object?> get props => [message, productId];
}
