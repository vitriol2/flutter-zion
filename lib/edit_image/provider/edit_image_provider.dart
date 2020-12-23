import 'package:flutter/cupertino.dart';
import 'package:flutterbasicc/edit_image/model/photo_model.dart';

class EditImageProvider with ChangeNotifier {
  String TAG = 'EditImageProvider: ';

  List<Photo> _photoList = List<Photo>();
  List<int> _selectedPhotoList = List<int>();
  List<int> _preSelectedPhotoList = List<int>();
  List<Photo> _prePhotoList = [];

  List<Photo> getPhotoList() {

    return _photoList;
  }

  Future<void> setPhotoList() async{
    print('setPhotoList');

    //photoList
    _photoList = List<Photo>();
    _prePhotoList.forEach((element) {
      _photoList.add(new Photo(widget: element.widget, isSelected: element.isSelected));
    });

    //selectedPhotoList
    _selectedPhotoList = List<int>();
    _preSelectedPhotoList.forEach((element) {
      _selectedPhotoList.add(element);
    });
//    _selectedPhotoList = _preSelectedPhotoList;
  }


  List<int> getSelectedPhotoList() {

    print('getSelectedPhotoList');
    return _selectedPhotoList;
  }

  List<Photo> getPreSelectedPhotoList() {
    print('getSelectedPhotoList');
    List<Photo> selectedPhotoList = _preSelectedPhotoList.map((e) => _prePhotoList[e]).toList();
    if(selectedPhotoList.length > 0) {
      print('getSelectedPhotoList esset: ' + selectedPhotoList[0].asset.toString());
    }
    return selectedPhotoList;
  }


  //'적용'눌렀을 때
  void determineSelectedPhoto() {
    _selectedPhotoList.forEach((e) {
      _preSelectedPhotoList.add(e);
    });
    _prePhotoList = _photoList;

//      _prePhotoList=_photoList;
    notifyListeners();
  }

  void addPhotoAtFirst(List<Photo> photoList) {

    print('addPhotoAtFirst');


    _prePhotoList = new List.from(photoList);
    _prePhotoList.forEach((element) {
      _photoList.add(new Photo(widget: element.widget, asset: element.asset, isSelected: element.isSelected));
    });


    notifyListeners();
  }

  void addPhoto(List<Photo> photoList) {

    _photoList.addAll(photoList);
    notifyListeners();
  }

  void setIsSelected(int photoIndex) {
    print('setIsSelected');
    if (_photoList[photoIndex].isSelected == true) {
      //이미 선택되어있는 사진을 취소
      _photoList[photoIndex].isSelected = false;
      _selectedPhotoList.remove(photoIndex);

//      if (_selectedPhotoList.length > 0) {
//        _isPhotoInput = true;
//      } else {
//        _isPhotoInput = false;
//      }
    } else {

      //이미지 새로 선택
      _photoList[photoIndex].isSelected = true;
      _selectedPhotoList.add(photoIndex);

//      if (_selectedPhotoList.length > 0) {
//        _isPhotoInput = true;
//      } else {
//        _isPhotoInput = false;
//      }
    }


    notifyListeners();
  }

  /**
   * reviewWritePage에서 삭제할때랑 bottomSheet에서 삭제할 때 다 고렿해야해, 지금 반응 다르
   */

  void removeSelectedPhoto(int selectedPhotoIndex) {
    _prePhotoList[_preSelectedPhotoList[selectedPhotoIndex]]
        .isSelected = false;
    _selectedPhotoList.removeAt(selectedPhotoIndex);
    _preSelectedPhotoList.removeAt(selectedPhotoIndex);
//    _photoList[_photoList.indexOf(_selectedPhotoList[selectedPhotoIndex]));

//    if (_preSelectedPhotoList.length > 0) {
//      _isPhotoInput = true;
//    } else {
//      _isPhotoInput = false;
//    }


    notifyListeners();
  }
}