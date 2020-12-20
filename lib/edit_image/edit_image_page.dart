import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditImagePage extends StatefulWidget {

  @override
  State createState() {
    return _EditImagePageState();
  }
}

class _EditImagePageState extends State<EditImagePage>{

  GlobalKey<ExtendedImageEditorState> editorKey = GlobalKey<ExtendedImageEditorState>();

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: _width,
              height: _width,
              child: ExtendedImage.network(
                  'https://claus-s3-resized.s3.ap-northeast-2.amazonaws.com/w_600/1984_mapo_image1.jpg',
//          mode: ExtendedImageMode.gesture,
//          initGestureConfigHandler: (state) {
//            return GestureConfig(
//              minScale: 1.0,
//              animationMinScale: 0.7,
//              maxScale: 1.0,
//              animationMaxScale: 3.5,
//              speed: 0.7,
//              inertialSpeed: 100.0,
//              initialScale: 1.0,
//              inPageView: false,
//              initialAlignment: InitialAlignment.center,
//            );
//          },
                fit: BoxFit.contain,
                mode: ExtendedImageMode.editor,
                extendedImageEditorKey: editorKey,
                initEditorConfigHandler: (state) {
                  return EditorConfig(
                    tickerDuration: Duration(milliseconds: 0),
                      maxScale: 8.0,
                      cropRectPadding: EdgeInsets.all(20.0),
                      hitTestSize: 20,
                      cropAspectRatio: 1,
                    cornerPainter: ExtendedImageCropLayerPainterNinetyDegreesCorner(
                      color: Colors.red,
                      cornerSize: Size(30, 5)
                    )
                  );
                },
              ),
            ),
            SizedBox(height: 40,),
            RawMaterialButton(onPressed: () {
              editorKey.currentState.rotate(right: true);
//            editorKey.currentState.reset();
            },
              child: Container(
                width: 100,
                height: 60,
                color: Colors.grey,
                child: Center(
                  child: Text('오른쪽으로 회전'),
                ),
              ),
            ),
            SizedBox(height: 40,),
            RawMaterialButton(onPressed: () {
//              editorKey.currentState.rotate(right: true);
              editorKey.currentState.reset();
            },
              child: Container(
                width: 100,
                height: 60,
                color: Colors.grey,
                child: Center(
                  child: Text('오른쪽으로 회전'),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}