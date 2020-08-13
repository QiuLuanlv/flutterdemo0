import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoApp extends StatefulWidget {
  @override
  _PhotoAppState createState() => _PhotoAppState();
}

class _PhotoAppState extends State<PhotoApp> {
  File _image;
  Future getImage() async{
    var image =await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
    _image = image;
    });
    print('拍照结果${image}');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('相机'),
        leading: BackButton(),
      ),
      body: Center(child: _image == null ? Text('没有选照片') : Image.file(_image)),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: '选照片',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
