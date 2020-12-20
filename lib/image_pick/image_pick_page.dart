import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:storage_path/storage_path.dart';

import 'file.dart';

class ImagePickPage extends StatefulWidget {
  ImagePickPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State createState() {
    return _ImagePickPageState();
  }
}

class _ImagePickPageState extends State<ImagePickPage> {
  List<FileModel> files;
  FileModel selectedModel;
  String image;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getImagesPath();
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Row(
                children: [
                  Icon(Icons.clear),
                  DropdownButtonHideUnderline(
                      child: DropdownButton(
                    items: getItems(),
                    onChanged: (d) {}    ,
                  ))
                ],
              ),
              Text('Next', style: TextStyle(color: Colors.blue))
            ],
          ),
          Divider(),
          Builder(
//            stream: null,
              builder: (context) {
            print('image: ' + Image.file(
              File(image),
              height: _height,
              width: _width,
            ).toString());
            return Container(
                height: MediaQuery.of(context).size.height * 0.45,
                child: image != null
                    ? Image.file(
                        File(image),
                        height: _height,
                        width: _width,
                      )
                    : Container());
          }),
          Divider(),
        ],
      ),
    ));
  }

  void getImagesPath() async {
    try{
      print(1);
      var imagePath = await StoragePath.imagesPath;
      print(2);
      var images = await jsonDecode(imagePath) as List;
      print(3);
      files = images.map<FileModel>((e) => FileModel.fromJson(e)).toList();
      print(4);
      if (files != null && files.length > 0)
        setState(() {
          selectedModel = files[0];
          image = files[0].files[0];
        });
      print('getImagesPath: files: ' + files.toString());
    } catch(err) {
      print('getImagesPath: ' + err.toString());
    }

  }

  List<DropdownMenuItem> getItems() {
    return files
            .map((e) => DropdownMenuItem(
                  child: Text(e.folder),
                  value: e,
                ))
            .toList() ??
        [];
  }
}
