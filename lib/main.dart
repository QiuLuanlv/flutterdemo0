import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'first/appLifecycle.dart';
import 'first/launcher.dart';
import 'first/respage.dart';
import 'first/testfile.dart';

void main() {
  runApp(DynamicTheme());
}

class DynamicTheme extends StatefulWidget {
  @override
  _DynamicThemeState createState() => _DynamicThemeState();
}

class _DynamicThemeState extends State<DynamicTheme> {
  Brightness _brightness = Brightness.dark;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Raleway',
        brightness: _brightness,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('flutter comeon!!'),
        ),
        body: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {

                setState(() {
                  if (_brightness == Brightness.dark) {
                    _brightness = Brightness.light;
                  } else {
                    _brightness = Brightness.dark;
                  }
                });
                print(_brightness);
              },
              child: Text('切换主题${_brightness}',style: TextStyle(fontFamily: 'AbrilFatface'),),
            ),
            RouteNavigator()
          ],
        ),
      ),
      routes: <String, WidgetBuilder>{
        'GesturePage': (BuildContext context) => GesturePage(),
        'ResPage': (BuildContext context) => ResPage(),
        'Launcher': (BuildContext context) => Launcher(),
        'AppLifecycle': (BuildContext context) => AppLifecycle(),
      },
    );
  }
}

class RouteNavigator extends StatefulWidget {
  @override
  _RouteNavigatorState createState() => _RouteNavigatorState();
}

class _RouteNavigatorState extends State<RouteNavigator> {
  bool byName = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SwitchListTile(
            title: Text('${byName ? '' : 'no'} by route name'),
            value: byName,
            onChanged: (value) {
              setState(() {
                byName=!byName;
              });
            },
          ),
          _item('string1', GesturePage(), 'GesturePage'),
          _item('string2', ResPage(), 'ResPage'),
          _item('string3', Launcher(), 'Launcher'),
          _item('string4', AppLifecycle(), 'AppLifecycle'),
        ],
      ),
    );
  }

  _item(String title, page, String routeName) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          if (byName) {
            Navigator.pushNamed(context, routeName);
          } else {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => page));
          }
        },
        child: Text(title),
      ),
    );
  }
}
