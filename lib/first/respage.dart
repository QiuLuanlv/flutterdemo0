import 'package:flutter/material.dart';

void main () => runApp(ResPage());

class ResPage extends StatefulWidget {
  @override
  _ResPageState createState() => _ResPageState();
}

class _ResPageState extends State<ResPage> {

  double topDistance = 0.0;
  double leftDistance = 0.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("手势检测"),
              leading: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back),
            ),
            ),
            body: Stack(
              children: <Widget>[
                Positioned(
                  top: topDistance,
                  left: leftDistance,
                  child: GestureDetector(
                    child: CircleAvatar(child: Text("A"),),
                    onPanDown: (DragDownDetails e) {
                      print("用户手指按下：${e.globalPosition}");
                    },
//                    onVerticalDragUpdate:(DragUpdateDetails e) {
//                      setState(() {
//                        topDistance += e.delta.dy;
//                      });
//                    },
//                    onHorizontalDragUpdate:(DragUpdateDetails e) {
//                      setState(() {
//                        leftDistance += e.delta.dx;
//                      });
//                    },
                     onPanUpdate: (DragUpdateDetails e) {
                      print(e);
                      setState(() {
                        leftDistance += e.delta.dx;
                        topDistance += e.delta.dy;
                      });
                    },
                    onPanEnd: (DragEndDetails e){
                      print(e.velocity);
                    },
                  ),
                )
              ],
            )
        )
    );
  }
}