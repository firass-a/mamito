// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoreProductImpl _$$StoreProductImplFromJson(Map<String, dynamic> json) =>
    _$StoreProductImpl(
      id: json['id'] as String,
      nameAr: json['nameAr'] as String,
      nameFr: json['nameFr'] as String,
      nameEn: json['nameEn'] as String,
      price: (json['price'] as num).toDouble(),
      category: json['category'] as String,
      iconCode: (json['iconCode'] as num).toInt(),
      colorValue: (json['colorValue'] as num).toInt(),
      descriptionEn: json['descriptionEn'] as String? ?? '',
    );

Map<String, dynamic> _$$StoreProductImplToJson(_$StoreProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameAr': instance.nameAr,
      'nameFr': instance.nameFr,
      'nameEn': instance.nameEn,
      'price': instance.price,
      'category': instance.category,
      'iconCode': instance.iconCode,
      'colorValue': instance.colorValue,
      'descriptionEn': instance.descriptionEn,
    };

_$CartItemImpl _$$CartItemImplFromJson(Map<String, dynamic> json) =>
    _$CartItemImpl(
      product: StoreProduct.fromJson(json['product'] as Map<String, dynamic>),
      qty: (json['qty'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$$CartItemImplToJson(_$CartItemImpl instance) =>
    <String, dynamic>{'product': instance.product, 'qty': instance.qty};
