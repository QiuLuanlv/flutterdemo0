import 'package:flutter_demo/main.dart';
import 'package:flutter_demo/model/config_model.dart';
import 'package:flutter_demo/model/grid_nav_model.dart';
import 'package:flutter_demo/model/sale_box_model.dart';

class HomeModel{
  final ConfigModel config;
  final List<CommonModel> bannerList;
  final List<CommonModel> localNavList;
  final List<CommonModel> subNavList;
  final GridNavModel gridNav;
  final SaleBoxModel salesBox;

  HomeModel({this.config,this.bannerList,this.localNavList,this.subNavList,this.gridNav,this.salesBox});

  factory HomeModel.fromJson(Map<String,dynamic>json){
    var localNavListJson =json['localNavList'] as List;
    List<CommonModel> localNavList =localNavListJson.map((i)=>CommonModel.fromJson(i)).toList();

    var bannerListJson =json['bannerList'] as List;
    List<CommonModel> bannerList =bannerListJson.map((i)=>CommonModel.fromJson(i)).toList();

    var subNavListJson =json['subNavList'] as List;
    List<CommonModel> subNavList =localNavListJson.map((i)=>CommonModel.fromJson(i)).toList();

    return HomeModel(
      localNavList: localNavList,
      bannerList: bannerList,
      config: ConfigModel.fromJson(json['config']),
      gridNav: GridNavModel.fromJson(json['gridNav']),
      salesBox: SaleBoxModel.fromJson(json['salesBox']),
    );
  }

}