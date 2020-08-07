import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GesturePage extends StatefulWidget {
  @override
  _GesturePageState createState() => _GesturePageState();
}

class _GesturePageState extends State<GesturePage> {
  String printString='';
  double movex=0,movey=0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('stringstringingign'),
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: FractionallySizedBox(
          widthFactor: 1,
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: ()=>_printMsg('点击'),
                    onDoubleTap: ()=>_printMsg('双击'),
                    onLongPress: ()=>_printMsg('长按'),
                    onTapCancel: ()=>_printMsg('取消'),
                    onTapUp: (e)=>_printMsg('松开'),
                    onTapDown: (e)=>_printMsg('按下'),
                    child: Container(
                      padding: EdgeInsets.all(60),
                      decoration: BoxDecoration(color: Colors.blueAccent),
                      child: Text(
                        'clickme',
                            style:TextStyle(fontSize: 36,color: Colors.white),
                      ),
                    ),
                  ),
                  Text(printString)
                ],
              ),
              Positioned(
                left: movex,
                top: movey,
                child: GestureDetector(
                  onPanUpdate: (e)=>_doMove(e),
                  child: Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(color:Colors.amber,borderRadius: BorderRadius.circular(36)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _printMsg(String msg) {

    setState(() {
      printString+=' ,$msg';
    });
    print(printString);
  }

  _doMove(e) {
    setState(() {
      movey+=e.delta.dy;
      movex+=e.delta.dx;
    });
  }
}

