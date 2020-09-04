import 'package:flutter_demo/main.dart';

class GridNavModel{
  final String hotel;
  final String flight;
  final String travel;

  GridNavModel({this.hotel,this.flight,this.travel});

  factory GridNavModel.fromJson(Map<String,dynamic>json){
    return json!=null
        ? GridNavModel(
            hotel: json['hotel'],
            flight: json['flight'],
            travel: json['travel']
          )
          : null;
  }
}

class GridNavItem{
  final String startColor;
  final String endColor;
  final CommonModel mainItem;
  final CommonModel item1;
  final CommonModel item2;
  final CommonModel item3;
  final CommonModel item4;

  GridNavItem({
    this.startColor,
    this.endColor,
    this.mainItem,
    this.item1,
    this.item2,
    this.item3,
    this.item4
  });

  factory GridNavItem.fromJson(Map<String,dynamic>json){
    return GridNavItem(
        startColor: json['startColor'],
        endColor: json['endColor'],
        mainItem: CommonModel.fromJson(json['mainItem']),
        item1: CommonModel.fromJson(json['item1']),
        item2: CommonModel.fromJson(json['item2']),
        item3: CommonModel.fromJson(json['item3']),
        item4: CommonModel.fromJson(json['item4']),
    );
  }
}