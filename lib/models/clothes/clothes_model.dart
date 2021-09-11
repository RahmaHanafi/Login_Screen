import 'package:flutter/material.dart';

class Clothes {
  final String clothesType;
  Clothes({required this.clothesType,});
}

class Jackets extends Clothes{
  String jacketModel;
  String image;
  double price;
  Jackets({required this.jacketModel,required this.image,required this.price}) : super(clothesType: 'Jackets');
}

class TShirts extends Clothes{
  String nameModel;
  String image;
  double price;
  TShirts({required this.nameModel,required this.image,required this.price}) : super(clothesType: 'T-Shirts');
}

List<Jackets> jackets=[
  Jackets(jacketModel: 'Normal Jacket', image: 'https://www.pleinoutlet.com/dw/image/v2/BBKQ_PRD/on/demandware.static/-/Sites-plein-master-catalog/default/dw33d58632/images/large/SS16-CW213388_01IW_sf.jpg?sw=603&sh=768', price: 72),
  Jackets(jacketModel: 'Leather Jacket', image: 'https://ean-images.booztcdn.com/selected-femme/1300x1700/g/sel16071712_cblack_v179099.jpg', price: 89),
  Jackets(jacketModel: 'Leather Jacket', image: 'https://www.goodshop.pk/image/cache/catalog/leather/real/coats%20pakistan-1000x1000.jpg', price: 99),
];

List<TShirts> shirts=[
  TShirts(nameModel: 'White t-shirt', image: 'https://cdn.shopify.com/s/files/1/0013/7743/5701/products/narcos-digital-graphics-basic-t-shirt-white-pod-ravin_118_540x.jpg?v=1569193508', price: 27),
  TShirts(nameModel: 'black t-shirt', image: 'https://static.zara.net/photos///2021/I/0/2/p/1198/303/800/2/w/1920/1198303800_6_2_1.jpg?ts=1626436299286', price: 22),
];