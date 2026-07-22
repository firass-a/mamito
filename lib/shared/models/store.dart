import 'package:freezed_annotation/freezed_annotation.dart';

part 'store.freezed.dart';
part 'store.g.dart';

@freezed
class StoreProduct with _$StoreProduct {
  const factory StoreProduct({
    required String id,
    required String nameAr,
    required String nameFr,
    required String nameEn,
    required double price,
    required String category,
    required int iconCode,
    required int colorValue,
    @Default('') String descriptionEn,
  }) = _StoreProduct;

  factory StoreProduct.fromJson(Map<String, dynamic> json) =>
      _$StoreProductFromJson(json);
}

@freezed
class CartItem with _$CartItem {
  const factory CartItem({
    required StoreProduct product,
    @Default(1) int qty,
  }) = _CartItem;

  factory CartItem.fromJson(Map<String, dynamic> json) => _$CartItemFromJson(json);
}
