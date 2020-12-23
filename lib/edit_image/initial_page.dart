import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbasicc/edit_image/provider/edit_image_provider.dart';
import 'package:flutterbasicc/platformAwareWidgets/platform_alert_dialog.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:provider/provider.dart';

import 'model/photo_model.dart';

class InitialPage extends StatelessWidget {

  //이미지 선택창의 스크롤 위치를 기록, 다시 열었을 때 동일한 위치 나오게
  double scrollOffset = 0;

  int currentPage = -1;
  int lastPage = -1;

  int albumIndex = 0;

  _fetchNewMedia(BuildContext context) async {
    try{
      currentPage++;
      if(currentPage == lastPage +1) {
        var result = await PhotoManager.requestPermission();
        if(result) {
          //load the album list
          List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
            onlyAll: true,
            type: RequestType.image);

          List<AssetEntity> media =
              await albums[albumIndex].getAssetListPaged(currentPage, 60);
          List<Photo> photoList = media
          .map((e) => Photo(
            widget: FutureBuilder(
              future: e.thumbDataWithSize(200, 200),
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.done) {
                  return Stack(
                    children: [
                      Positioned.fill(
                        child: Image.memory(
                          snapshot.data,
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  );
                }
                return Container();
              },
            ),
            asset: e,
            isSelected: false
          )).toList();

          Provider.of<EditImageProvider>(context, listen: false).addPhoto(photoList);

          lastPage = currentPage;
        } else {
          PhotoManager.openSetting();
          /// if result is fail, you can call `PhotoManager.openSetting();`  to open android/ios applicaton's setting to get permission
        }
      }
    }catch(err) {
      print('err: ' + err.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _marginSide = _width * 0.053;
    double _safeAreaTop = MediaQuery.of(context).padding.top;
    double _safeAreaBottom = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      body: Center(
        child: buildListView(
          context, _safeAreaTop, _safeAreaBottom
        )
      ),
    );
  }

  Widget buildListView(
      BuildContext context, double safeAreaTop, double safeAreaBottom) {
    double _width = MediaQuery.of(context).size.width;

    return Consumer<EditImageProvider> (
      builder: (context, value, child) {
        List<Photo> preSelectedPhotoList = value.getPreSelectedPhotoList();

        return Container(
          width: _width,
          height: _width * 0.3,
          child: ListView(
            scrollDirection: Axis.horizontal,
            controller: ScrollController(),
            padding: EdgeInsets.only(left: _width * 0.043),
            children: [
              GestureDetector(
                onTap: () async{
                  await onImageButtonSelected(context, safeAreaTop, safeAreaBottom);

                },
                child: Container(
                  padding: EdgeInsets.only(
                    top: _width * 0.025, right: _width * 0.025,
                  ),
                  child: Container(
                    width: _width * 0.275,
                    height: _width * 0.275,
                    color: Colors.blue,
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: _width * 0.3 * (preSelectedPhotoList.length),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                        preSelectedPhotoList.length,
                          (index) {
                          return Stack(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                      top: _width * 0.025,
                                      right: _width * 0.025),
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          _width * 0.015),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: index == 0
                                                ? Border.all(
                                                color:
                                                Theme.of(context)
                                                    .primaryColor,
                                                width: _width * 0.007)
                                                : null),
//                                        child: AssetThumb(
//                                          asset: pReorderAssetList[index].,
//                                          width: (_width * 0.267).ceil(),
//                                          height: (_width * 0.267).ceil(),
//                                        ),
                                        child: Container(
                                          width: _width * 0.267,
                                          height: _width * 0.267,
                                          child: preSelectedPhotoList[index]
                                              .widget,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: _width * 0.003,
                                  top: _width * 0.003,
//                alignment: Alignment.topLeft,
                                  child: GestureDetector(
                                    onTap: () {
//                                      Provider.of<ReviewWriteProvider>(context,
//                                              listen: false)
//                                          .removeReviewAssetImage(index);
                                      Provider.of<EditImageProvider>(
                                          context,
                                          listen: false)
                                          .removeSelectedPhoto(index);
                                    },
                                    child: Icon(
                                      Icons.cancel,
                                      size: _width * 0.05,
                                      color: Color.fromRGBO(
                                          182, 182, 182, 1.0),
                                    ),
                                  ),
                                )
                              ]
                          );
                          }
                      )
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }

  ScrollController sController;

  Future onImageButtonSelected(BuildContext context, double safeAreaTop, double safeAreaBottom) async{
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    sController = ScrollController(initialScrollOffset: scrollOffset)
    ..addListener(() {
      scrollOffset = sController.position.pixels;
    });

    try {
      var result = await PhotoManager.requestPermission();
      if(!result) {
        var didConfirm = PlatformAlertDialog(
          title: '허가되지 않음',
          content: '설정에서 사진 라이브러리 접근을 허용해 주세요',
          confirmText: '확인'
        ).show(context);
        return;
      }
      PersistentBottomSheetController<String> bs = showBottomSheet(
        context: context,
        builder: (context) {
          return FutureBuilder<Object>(
            future: _fetchNewMedia(context),
            builder: (context, snapshot) {
              if(snapshot.connectionState != ConnectionState.done) {
                return Container();
              }
              return SafeArea(
                child: Container(
                  width: _width,
                    height: _height - safeAreaTop - safeAreaBottom,
                    color: Colors.white,
                  child: Consumer<EditImageProvider> (
                    builder: (context, value, child) {
                      List<Photo> photoList = value.getPhotoList() ?? [];
                      List<int> selectedPhotoList =
                          value.getSelectedPhotoList() ?? [];
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: _width,
                                height: _width * 0.162,
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Icon(
                                          Icons.clear,
                                          size: _width * 0.07,
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                          '리뷰 사진 선택',
                                        style: TextStyle(
                                          fontSize: _width * 0.053
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Provider.of<EditImageProvider>(
                                          context,
                                          listen: false)
                                            .determineSelectedPhoto();
                                        Navigator.of(context).pop('적용');
                                      },
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                          padding: EdgeInsets.all(
                                            _width * 0.053
                                          ),
                                          child: Text('적용',
                                            style: TextStyle(
                                              fontSize: _width * 0.043
                                            )
                                          ),
                                        ),
                                      ),
                                    )

                                  ],
                                ),
                            ),
                            NotificationListener<ScrollNotification>(
                              onNotification: (ScrollNotification scroll) {
                                _handleScrollEvent(scroll, context);
                                return;
                              },
                              child: Container(
                                width: _width,
                                height: _height -
                                    safeAreaTop -
                                    safeAreaBottom -
                                    _width * 0.162,
                                child: GridView.builder(
                                  controller: sController,
                                  itemCount: photoList.length,
                                  gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3),
                                  itemBuilder: (context, index) {
                                    try {
                                      return Container(
                                        child: Stack(
                                          children: [
                                            photoList[index].widget,
                                            Center(
                                              child: Container(
                                                width: _width / 3,
                                                height: _width / 3,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: photoList[index]
                                                            .isSelected
                                                            ? Theme.of(context)
                                                            .primaryColor
                                                            : Colors
                                                            .transparent,
                                                        width: _width * 0.01)),
                                              ),
                                            ),
                                            Positioned(
                                                top: 0,
                                                right: 0,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Provider.of<EditImageProvider>(
                                                        context,
                                                        listen: false)
                                                        .setIsSelected(index);
                                                  },
                                                  child: Container(
                                                    padding: EdgeInsets.only(
                                                        top: _width * 0.02,
                                                        right: _width * 0.02,
                                                        left: _width * 0.02,
                                                        bottom: _width * 0.02
                                                    ),
                                                    alignment:
                                                    Alignment.topRight,
                                                    width: _width * 0.1,
                                                    height: _width * 0.1,
//                                                    color: Colors.black,
                                                    child: Container(
                                                        width: _width * 0.053,
                                                        height: _width * 0.053,
                                                        decoration: BoxDecoration(
                                                            shape:
                                                            BoxShape.circle,
                                                            border: Border.all(
                                                                color: photoList[
                                                                index]
                                                                    .isSelected
                                                                    ? Colors
                                                                    .transparent
                                                                    : Color.fromRGBO(
                                                                    255,
                                                                    255,
                                                                    255,
                                                                    0.7),
                                                                width: _width *
                                                                    0.005),
                                                            color: photoList[index]
                                                                .isSelected
                                                                ? Theme.of(context)
                                                                .primaryColor
                                                                : Colors
                                                                .transparent),
                                                        child:
                                                        photoList[index]
                                                            .isSelected
                                                            ? Center(
                                                          child: Text(
                                                            (selectedPhotoList.indexOf(index) +
                                                                1)
                                                                .toString(),
                                                            textAlign:
                                                            TextAlign
                                                                .center,
                                                            style: Theme.of(context).textTheme.headline3.copyWith(
                                                                height:
                                                                1.2,
                                                                fontSize: _width *
                                                                    0.035,
                                                                color:
                                                                Colors.white),
//                                                                        style: TextStyle(
//                                                                          height: 1.0,
//                                                                            fontSize: _width * 0.03,
//                                                                            color: Colors.white
//                                                                        ),
                                                          ),
                                                        )
                                                            : null),
                                                  ),
                                                )),
                                          ],
                                        ),
                                      );
                                    } catch (err) {
                                      print('err: ' + err.toString());
                                      return Container();
                                    }
                                  },
                                ),
                              ),
                            )
                          ],
                      );
                    },
                  ),

                ),
              );
            }
          );
        }
      );
    }catch(err) {
      print('err: ' + 'onImageButtonSelected: ' + err.toString());
    }
  }

  void _handleScrollEvent(ScrollNotification scroll, BuildContext context) async{
    if(scroll.metrics.pixels / scroll.metrics.maxScrollExtent > 0.33) {
      if(currentPage == lastPage) {
        await _fetchNewMedia(context);
        await Future.delayed(Duration(milliseconds: 500));
      }
    }
  }

}