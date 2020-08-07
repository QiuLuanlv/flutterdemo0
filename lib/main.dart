import 'package:flutter/material.dart';

import 'first/launcher.dart';
import 'first/respage.dart';
import 'first/testfile.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('flutter comeon!!'),
        ),
        body: RouteNavigator(),
      ),
      routes: <String,WidgetBuilder>{
        'GesturePage':(BuildContext context) =>GesturePage(),
        'ResPage':(BuildContext context) =>ResPage(),
        'Launcher':(BuildContext context) =>Launcher(),
      },
    );
  }
}

class RouteNavigator extends StatefulWidget {
  @override
  _RouteNavigatorState createState() => _RouteNavigatorState();
}

class _RouteNavigatorState extends State<RouteNavigator> {
  bool byName=false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SwitchListTile(title:Text('${byName?'':'no'} by route name'),value: byName, onChanged: (value){
            setState(() {

            });
          },),
          _item('string1',GesturePage(),'GesturePage'),
          _item('string2',ResPage(),'ResPage'),
          _item('string3',Launcher(),'Launcher'),
        ],
      ),
    );
  }

  _item(String title, page, String routeName) {
    return Container(
      child: RaisedButton(
        onPressed: (){
          if(byName){
            Navigator.pushNamed(context, routeName);
          }else{
            Navigator.push(context, MaterialPageRoute(builder: (context)=>page));
          }
        },
        child: Text(title),),
    );
  }
}
