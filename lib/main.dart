
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'navigator/tab_navigator.dart';

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
        body: FutureBuilder<CommonModel>(
          future: fetchPost(),
            builder: (BuildContext context, AsyncSnapshot<CommonModel> snapshot){
          switch(snapshot.connectionState){
            case ConnectionState.none:
              return Text('input a url start');
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator(),);
            case ConnectionState.active:
              return Text('');
            case ConnectionState.done:
              if(snapshot.hasError){
                return new Text(
                  '${snapshot.error}',
                  style: TextStyle(color: Colors.red),
                );
              }else{
                return new Column(
                  children: <Widget>[
                    Text('icon:${snapshot.data.icon}'),
                    Text('statusBarColor:${snapshot.data.statusBarColor}'),
                    Text('title:${snapshot.data.title}'),
                    Text('url:${snapshot.data.url}'),
                  ],
                );
              }
          }
        }),
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
      ),
    );
  }
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
