import 'package:flutter/material.dart';
class AppLifecycle extends StatefulWidget {
  @override
  _AppLifecycleState createState() => _AppLifecycleState();
}

class _AppLifecycleState extends State<AppLifecycle> with WidgetsBindingObserver {

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter应用生命周期'),
        leading: BackButton(),
      ),
      body: Container(
        child: Text('flutter应用生命周期'),
      ),
    );
  }

 @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    print('state=${state}');
    if(state==AppLifecycleState.paused){
      print('app进入后台');
    }else if(state==AppLifecycleState.resumed){
      print('app进入前台');
    }else if(state==AppLifecycleState.inactive){
      //不常用：应用程序处于非活动状态，并且未接收用户输入时调用 em 来了个电话
      print('');
    }
//    else if(state==AppLifecycleState.suspending){
//      //不常用：应用程序被挂起时调用，它不会再ios上触发
//      print('object');
//    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    // TODO: implement dispose
    super.dispose();
  }

}