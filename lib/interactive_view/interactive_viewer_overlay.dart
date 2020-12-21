import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterbasicc/interactive_view/provider/interactiver_provider.dart';
import 'package:provider/provider.dart';

class InteractiveViewerOverlay extends StatefulWidget {
  final Widget child;
  final double maxScale;
  bool isScaling;
  BuildContext context;

  InteractiveViewerOverlay(
      {Key key,
      @required this.child,
      this.maxScale,
      this.isScaling,
      this.context})
      : super(key: key);

  @override
  _InteractiveViewerOverlayState createState() =>
      _InteractiveViewerOverlayState();
}

class _InteractiveViewerOverlayState extends State<InteractiveViewerOverlay>
    with SingleTickerProviderStateMixin {
  var viewerKey = GlobalKey();
  Rect placeholder;
  OverlayEntry entry;
  var controller = TransformationController();
  Matrix4Tween snapTween;
  AnimationController snap;

  @override
  void initState() {
    super.initState();
    snap = AnimationController(vsync: this);
    snap.addListener(() {
      if (snapTween == null) return;
      controller.value = snapTween.evaluate(snap);
      if (snap.isCompleted) {
        entry.remove();
        entry = null;
        setState(() {
          placeholder = null;
        });
      }
    });
  }

  @override
  void dispose() {
    snap.dispose();
    super.dispose();
  }

  Widget buildViewer(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    bool isScaling =
        Provider.of<InteractiveViewerProvider>(widget.context).getIsScaling() ??
            false;

    return InteractiveViewer(
        key: viewerKey,
        transformationController: controller,
        panEnabled: false,
        maxScale: widget.maxScale ?? 2.5,
        child: Stack(
          children: [
            LayoutBuilder(builder: (context, constraints) {
              print('isScaling: ' + isScaling.toString());
              return isScaling
                  ? Container(
                color: Colors.black,
                width: _width,
                height: _height,
              )
                  : Container();
            }),
            Container(
//width: isScaling ? 600 : null,
//height: isScaling ? 900 : null,
//        width: 600,
//        height:700,
                child: Container(
                    width: _width,
                    height: _width,
                    child: Center(child: widget.child))),

          ],
        ),
        onInteractionStart: (details) {
          if (placeholder != null) return;

          setState(() {
            var renderObject =
                viewerKey.currentContext.findRenderObject() as RenderBox;
            placeholder = Rect.fromPoints(
              renderObject.localToGlobal(Offset.zero),
              renderObject
                  .localToGlobal(renderObject.size.bottomRight(Offset.zero)),
            );
          });
          Provider.of<InteractiveViewerProvider>(widget.context, listen: false)
              .setIsScaling(true);
          print('start context: ' + context.toString());

          entry = OverlayEntry(
            builder: (context) {
              return Positioned.fromRect(
                rect: placeholder,
                child: buildViewer(context),
              );
            },
          );

          Overlay.of(context).insert(entry);
        },
        onInteractionEnd: (details) {
          snapTween = Matrix4Tween(
            begin: controller.value,
            end: Matrix4.identity(),
          );
          snap.value = 0;
          snap.animateTo(
            1,
            duration: Duration(milliseconds: 250),
            curve: Curves.ease,
          );

          print(widget.context);
          Provider.of<InteractiveViewerProvider>(widget.context, listen: false)
              .setIsScaling(false);
        });
  }

  @override
  Widget build(BuildContext context) {
    var viewer = placeholder != null
        ? SizedBox.fromSize(size: placeholder.size)
        : buildViewer(context);

    return Container(
      child: viewer,
    );
  }
}
