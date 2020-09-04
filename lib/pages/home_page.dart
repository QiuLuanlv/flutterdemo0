import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_demo/dao/home_dao.dart';
import 'package:flutter_demo/model/home_model.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
const APPBAR_SCROLL_OFFSET=100;
class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
  
}

class _HomePageState extends State<HomePage>{
  List _imageUrls=[
    'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1898565886,53348875&fm=26&gp=0.jpg',
    'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3442736072,448372868&fm=26&gp=0.jpg',
    'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2127793287,3926661110&fm=26&gp=0.jpg',
  ];
  double appBarAplha=0;
  String resultString='';

  @override
  void initState(){
    super.initState();
    loadData();
  }

  _onScroll(offset){
    double alpha=offset/APPBAR_SCROLL_OFFSET;
    if(alpha<0){
      alpha=0;
    }else if(alpha>1){
      alpha=1;
    }
    setState(() {
      appBarAplha=alpha;
    });

  }

//  loadData(){
//    HomeDao.fetch().then((result){
//      setState(() {
//        resultString =json.encode(result);
//      });
//    }).catchError((onError){
//      setState(() {
//        resultString =onError.toString();
//      });
//    });
//  }

  loadData() async{
    try{
      HomeModel model=await HomeDao.fetch();
      setState(() {
        resultString =json.encode(model.config);
      });
    }catch(e){
      setState(() {
        resultString =e.toString();
      });
    }

    print('打印返回：：${resultString}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: <Widget>[
          MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: NotificationListener(
                onNotification: (scrollNotification){
                  if(scrollNotification is ScrollUpdateNotification &&
                      scrollNotification.depth==0){
                    //滚动且是列表滚动的时候
                    _onScroll(scrollNotification.metrics.pixels);
                  }
                },
                child: ListView(
                  children: <Widget>[
                    Container(
                      height: 160,
                      child: ListView(
                        children: <Widget>[
                          Swiper(
                            itemCount: _imageUrls.length,
                            autoplay: true,
                            itemBuilder: (BuildContext context,int index){
                              return Image.network(_imageUrls[index],fit: BoxFit.fill,);
                            },
                            pagination: SwiperPagination(),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 800,
                      child: ListTile(
                        title: Text(resultString),
                      ),
                    ),
                  ],
                ),
              )
          ),
          Opacity(
            opacity: appBarAplha,
            child: Container(
              height: 80,
              decoration: BoxDecoration(color: Colors.black12),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top:20),
                  child: Text('首页'),
                ),
              ),
            ),
          ),
        ],
      )

    );
  }
  
}
