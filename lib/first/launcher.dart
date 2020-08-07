import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main () => runApp(Launcher());

class Launcher extends StatefulWidget {
  @override
  _LauncherState createState() => _LauncherState();
}

class _LauncherState extends State<Launcher> {

  /**
      const RaisedButton({
      Key key,
      @required VoidCallback onPressed,
      ValueChanged<bool> onHighlightChanged,//水波纹高亮变化回调,按下返回true,抬起返回false
      ButtonTextTheme textTheme,//按钮的主题
      Color textColor,//文字的颜色
      Color disabledTextColor,//按钮禁用时候文字的颜色
      Color color,//按钮的背景颜色
      Color disabledColor,//按钮被禁用的时候显示的颜色
      Color highlightColor,//点击或者toch控件高亮的时候显示在控件上面，水波纹下面的颜色
      Color splashColor,//水波纹的颜色
      Brightness colorBrightness,//按钮主题高亮
      double elevation,//按钮下面的阴影
      double highlightElevation,//高亮时候的阴影
      double disabledElevation,//按下的时候的阴影
      EdgeInsetsGeometry padding,
      ShapeBorder shape,//设置形状
      Clip clipBehavior = Clip.none,
      MaterialTapTargetSize materialTapTargetSize,
      Duration animationDuration,
      Widget child,
      })
   */

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("第三方应用"),
              leading: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back),
            ),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: Text('打开浏览器'),
                      onPressed: ()=>_launcherURL(),
                  ),
                  RaisedButton(
                    child: Text('打开Map'),
                    onPressed: ()=>_openMap(),
                  ),
                  RaisedButton(
                    onPressed: () {},
                    child: Text("textColor文本的颜色，color背景颜色，highlightColor按钮按下的颜色"),
                    textColor: Color(0xffff0000),
                    color: Color(0xfff1f1f1),
                    highlightColor: Color(0xff00ff00),
                  ),
                  RaisedButton(
                    onPressed: () {},
                    child: Text("disabledTextColor禁用时文本颜色，disabledColor禁用时背景颜色"),
                    disabledTextColor: Color(0xff999999),
                    disabledColor: Color(0xffff0000),
                  ),
                  RaisedButton(
                    onPressed: () {},
                    child: Text("splashColor水波的颜色，disabledColor禁用时背景颜色"),
                    splashColor: Color(0xffff0000),
                  ),
                  RaisedButton(
                    onPressed: () {},
                    child: Text("colorBrightness按钮主题高亮 Brightness.light"),
                    colorBrightness: Brightness.light,
                  ),
                  RaisedButton(
                    onPressed: () {},
                    child: Text("colorBrightness按钮主题高亮 Brightness.dark"),
                    colorBrightness: Brightness.dark,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20.0),
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text(
                          "elevation按钮下面的阴影,highlightElevation高亮时候的阴影,disabledElevation按下的时候的阴影"),
                      elevation: 5.0,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20.0),
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text(
                          "elevation按钮下面的阴影,highlightElevation高亮时候的阴影,disabledElevation按下的时候的阴影"),
                      highlightElevation: 5,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20.0),
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text(
                          "elevation按钮下面的阴影,highlightElevation高亮时候的阴影,disabledElevation按下的时候的阴影"),
                      disabledElevation: 5.0,
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {},
                    child: Text(
                        "onHighlightChanged 水波纹高亮变化回调,按下返回true,抬起返回false"),
                    onHighlightChanged: (bool b) {
                      print(b);
                    },
                  ),
                  RaisedButton(
                    onPressed: () {
                      print("点击了");
                    },
                    child: Text("onPressed点击事件"),
                  ),
                ],
              ),
            )
        )
    );
  }

  _launcherURL() async{
    const url='https://baidu.com';
    if(await canLaunch(url)){
      await launch(url);
    }else{
      throw 'Could not launch $url';
    }
  }

  _openMap() async{
    const url='geo:52.32,4.917';//app提供者提供的 schema

    if(await canLaunch(url)){
      await launch(url);
    }else{
      //ios
      const url ="http://maps.apple.com/?ll=52.32,4.917";
      if(await canLaunch(url)){
        await launch(url);
      }else{
        throw 'Could not launch $url';
      }
    }
  }
}