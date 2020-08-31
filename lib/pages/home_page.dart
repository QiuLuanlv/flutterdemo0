import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
  
}

class _HomePageState extends State<HomePage>{
  List _imageUrls=[
    'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2127793287,3926661110&fm=26&gp=0.jpg',
    'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2127793287,3926661110&fm=26&gp=0.jpg',
    'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2127793287,3926661110&fm=26&gp=0.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
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
            )
          ],
        ),
      ),
    );
  }
  
}
