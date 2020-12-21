import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CountriesField extends StatefulWidget {

  @override
  State createState() {
    return _CountriesFieldState();
  }
}

class _CountriesFieldState extends State<CountriesField>{

  final FocusNode _focusNode = FocusNode();

  OverlayEntry _overlayEntry;

  final LayerLink _layerLink = LayerLink();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusNode.addListener(() {
      if(_focusNode.hasFocus) {
        this._overlayEntry = this._createOverlayEntry();
        Overlay.of(context).insert(this._overlayEntry);
      } else {
        this._overlayEntry.remove();
      }
    });
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject();
    var size = renderBox.size;

    //localToGlobal: 상대적인 좌표 -> 절대적인 좌표
    //local에서는 (0,0)의 좌표에 있어도 전체화면에서 보면 (0+@, 0+@)자너 그렇게 절대적인 좌표를 구하는거야.
    var offset = renderBox.localToGlobal(Offset.zero);
    print('offset: ' + offset.toString());

    return OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
//        top: offset.dy + size.height + 5.0,
          width: size.width,
          child: CompositedTransformFollower(
            link: this._layerLink,
            showWhenUnlinked: false,
            offset: Offset(0.0, size.height + 5.0),
            child: Material(
              elevation: 4.0,
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                children: [
                  ListTile(
                    title: Text('Syria')
                  ),
                  ListTile(
                    title: Text('Lebanon')
                  )
                ],
              ),
            ),
          ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: this._layerLink,
      child: TextFormField(
        focusNode: this._focusNode,
        decoration: InputDecoration(
            labelText: 'Country'
        ),
      ),
    );
  }
}