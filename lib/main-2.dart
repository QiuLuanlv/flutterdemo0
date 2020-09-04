import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'navigator/tab_navigator.dart';
import 'package:shared_preferences/shared_preferences.dart';

const CITY_NAMES=['1','2','3','4','5','6','7','8','9','0'];
const CITY_NAMES2={
  '上海':['huangpu','xuhui','pudong','putuo'],
  '沈阳':['tiexi','shenhe','heping'],
};

void main() => runApp(MyApp());

//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter之旅',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      home: TabNavigator(),
//    );
//  }
//}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String showResult='';
  Future<CommonModel> fetchPost() async{
    final response=await http.get('http://www.devio.org/io/flutter_app/json/test_common_model.json');
    Utf8Decoder utf8decoder=Utf8Decoder();
    final result=json.decode(utf8decoder.convert(response.bodyBytes));
    return CommonModel.fromJson(result);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('future/futurebuilder'),
        ),

        //-------------------------------------------
//        body: FutureBuilder<CommonModel>(
//          future: fetchPost(),
//            builder: (BuildContext context, AsyncSnapshot<CommonModel> snapshot){
//          switch(snapshot.connectionState){
//            case ConnectionState.none:
//              return Text('input a url start');
//            case ConnectionState.waiting:
//              return Center(child: CircularProgressIndicator(),);
//            case ConnectionState.active:
//              return Text('');
//            case ConnectionState.done:
//              if(snapshot.hasError){
//                return new Text(
//                  '${snapshot.error}',
//                  style: TextStyle(color: Colors.red),
//                );
//              }else{
//                return new Column(
//                  children: <Widget>[
//                    Text('icon:${snapshot.data.icon}'),
//                    Text('statusBarColor:${snapshot.data.statusBarColor}'),
//                    Text('title:${snapshot.data.title}'),
//                    Text('url:${snapshot.data.url}'),
//                  ],
//                );
//              }
//          }
//        }),
      //--------------------------------------
//        body: Column(
//          children: <Widget>[
//            InkWell(
//              onTap: (){
//                fetchPost().then((CommonModel value){
//                  setState(() {
//                    showResult='返回：\nstatusBarColor:${value.statusBarColor},\nurl:${value.url}';
//                  });
//                });
//              },
//              child: Text(
//                'click me',
//                style: TextStyle(fontSize: 26),
//              ),
//            ),
//            Text(showResult)
//          ],
//        ),
//        body: Container(
//          child: ListView(
//            children:  _buildList(),
//          ),
//        ),
          body: GridView.count(crossAxisCount: 2,children: _buildGrid(),),
      ),
    );
  }

  List<Widget> _buildGrid(){
    return CITY_NAMES.map((city)=>_itemGrid(city)).toList();
  }

  List<Widget> _buildList(){
    List<Widget> widgets=[];
    CITY_NAMES2.keys.forEach((key) {
      print(CITY_NAMES2[key]);
      widgets.add(_item(key,CITY_NAMES2[key]));
    });
    return widgets;
  }

  Widget _itemGrid(String city){
    return Container(
      height: 20,
      margin: EdgeInsets.only(bottom: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.lightBlueAccent),
      child: Text(
        city,
        style: TextStyle(color: Colors.white,fontSize: 20),
      ),
    );
  }

  Widget _item(String city,List<String> subCities){
    return ExpansionTile(
        title: Text(
          city,
          style: TextStyle(color: Colors.blueAccent,fontSize: 20),
        ),
        children: subCities.map((subCity) => _buildSub(subCity)).toList(),
    );


  }

  Widget _buildSub(String subCity){
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        height: 50,
        margin: EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(color: Colors.lightBlueAccent),
        child:Text(subCity),
      ),
    );
  }

//  List<Widget> _buildList(){
//    return CITY_NAMES.map((city) => _item(city)).toList();
//  }

//  Widget _item(city){
//    return Container(
//      width: 160,
//      margin: EdgeInsets.only(right: 5),
//      alignment: Alignment.center,
//      decoration: BoxDecoration(color: Colors.teal),
//      child: Text(
//        city,
//        style: TextStyle(
//          color: Colors.white,
//          fontSize: 20
//        ),
//      ),
//    );
//  }
}



class CommonModel{
  final String icon;
  final String title;
  final String url;
  final String statusBarColor;
  final bool hideAppBar;

  CommonModel({this.icon, this.title, this.url, this.statusBarColor, this.hideAppBar});
  factory CommonModel.fromJson(Map<String, dynamic> json){
    return CommonModel(
      icon: json['icon'],
      title: json['title'],
      url: json['url'],
      statusBarColor: json['statusBarColor'],
      hideAppBar: json['hideAppBar'],
    );
  }

}
