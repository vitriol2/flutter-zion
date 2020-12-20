import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinch_zoom/pinch_zoom.dart';

class ImageListPage extends StatefulWidget {
  @override
  State createState() {
    return _ImageListPageState();
  }
}

class _ImageListPageState extends State<ImageListPage> {
  List<String> imageList = [
    'https://claus-s3-resized.s3.ap-northeast-2.amazonaws.com/w_600/1984_mapo_image1.jpg',
    'https://claus-s3-resized.s3.ap-northeast-2.amazonaws.com/w_600/1984_mapo_image2.jpg',
    'https://claus-s3-resized.s3.ap-northeast-2.amazonaws.com/w_600/1984_mapo_image3.jpg'
  ];

  int currentIndex = 0;
  bool isImageScaling = false;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
          width: _width,
          height: _height,
          child: SingleChildScrollView(
            controller: ScrollController(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'title'
                ),
                SizedBox(
                  height: 100,
                ),
                Container(
                  width: _width,
                  height: _width,
                  child: PageView.builder(
                    itemCount: imageList.length,
                    itemBuilder: (context, index) {
                      Widget image = InteractiveViewer(
                            child: Image.network('http://placerabbit.com/200/333'),
onInteractionEnd: (details) {

},
//                          zoomedBackgroundColor: Colors.black.withOpacity(0.5),
//                          resetDuration: const Duration(milliseconds: 100),
                          maxScale: 2.5,
                        minScale: 1.0,
                      );
                      image = Container(
                        child: image,
                        padding: EdgeInsets.all(5),
                      );

                      if (index == currentIndex) {
                        return Hero(
                          tag: imageList[index].toString(),
                          child: image,
                        );
                      } else {
                        return image;
                      }

                      return Container();
                    },
                    onPageChanged: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    controller: PageController(
                      initialPage: currentIndex,
                    ),
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Container(
                  width: _width,
                  height: 100,
                  color: Colors.red,
                )
              ],
    ),
          ),
//        child: Container(
//          color: Colors.black,
//          child: Container(
//            width: _width,
//            height: _width,
//            child: ExtendedImageGesturePageView.builder(
//              itemCount: imageList.length,
//              itemBuilder: (context, index) {
//                Widget image = ExtendedImage.network(
//                  imageList[index],
//                  initEditorConfigHandler: (state) {
//                    return EditorConfig(
//                        tickerDuration: Duration(milliseconds: 0),
//                        maxScale: 0.5,
//                        cropRectPadding: EdgeInsets.all(20.0),
//                        hitTestSize: 20,
//                        cropAspectRatio: 1,
//                        cornerPainter:
//                        ExtendedImageCropLayerPainterNinetyDegreesCorner(
//                            color: Colors.red, cornerSize: Size(30, 5)),
//                        hitTestBehavior: HitTestBehavior.opaque
//                    );
//                  },
//                  fit: BoxFit.contain,
//                  mode: ExtendedImageMode.gesture,
//                  initGestureConfigHandler: (state) {
//                    return GestureConfig(
//                        inPageView: true,
//                        initialScale: 1.0,
//                        minScale: 1.0,
//                        maxScale: 1.0,
//                        animationMaxScale: 3.0,
//                        animationMinScale: 1.0,
//                        gestureDetailsIsChanged: (details) {
////                      print('changed');
////                    if(details)
//                          if(details.totalScale != 1.0) {
//                            isImageScaling = true;
//                          }else {
//                            isImageScaling = false;
//                          }
//                        },
//                        //you can cache gesture state even though page view page change.
//                        //remember call clearGestureDetailsCache() method at the right time.(for example,this page dispose)
//                        cacheGesture: false);},
//                );
//                image = Container(
//                  child: image,
//                  padding: EdgeInsets.all(5),
//                );
//
//                if (index == currentIndex) {
//                  return Hero(
//                    tag: imageList[index].toString(),
//                    child: image,
//                  );
//                } else {
//                  return image;
//                }
//
//                return Container();
//              },
//              onPageChanged: (index) {
//                setState(() {
//                  currentIndex = index;
//                });
//              },
//              controller: PageController(
//                initialPage: currentIndex,
//              ),
//              scrollDirection: Axis.horizontal,
//            ),
//          ),
//        ),
        ));
  }
}
