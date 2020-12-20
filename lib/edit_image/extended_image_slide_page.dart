import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InteractiveViewerTest extends StatefulWidget{

  @override
  State createState() {
    return _InteractiveViewerTestState();
  }
}

class _InteractiveViewerTestState extends State<InteractiveViewerTest> with TickerProviderStateMixin{

  Animation<Matrix4> _animationReset;
  AnimationController _controllerReset;

//  void _onAnimateReset() {
//    _transformationController.value = _animationReset.value;
//    if (!_controllerReset.isAnimating) {
//      _animationReset?.removeListener(_onAnimateReset);
//      _animationReset = null;
//      _controllerReset.reset();
//    }
//  }
//
//  void _animateResetInitialize() {
//    _controllerReset.reset();
//    _animationReset = Matrix4Tween(
//      begin: _transformationController.value,
//      end: Matrix4.identity(),
//    ).animate(_controllerReset);
//    _animationReset.addListener(_onAnimateReset);
//    _controllerReset.forward();
//  }
//
////  Stop a running reset to home transform animation.
//  void _animateResetStop() {
//    _controllerReset.stop();
//    _animationReset?.removeListener(_onAnimateReset);
//    _animationReset = null;
//    _controllerReset.reset();
//  }
//
//  void _onInteractionStart(ScaleStartDetails details) {
////    If the user tries to cause a transformation while the reset animation is
////    running, cancel the reset animation.
//    if (_controllerReset.status == AnimationStatus.forward) {
//      _animateResetStop();
//    }
//  }

  @override
  void initState() {
    super.initState();
    _controllerReset = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  void dispose() {
    _controllerReset.dispose();
    super.dispose();
  }

  TransformationController transformationController = TransformationController();
  @override
  Widget build(BuildContext context) {
print('rebuild');
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Controller demo'),
      ),
      body: Center(
        child: Column(
          children: [
//            InteractiveViewer(
////              panEnabled: false,
////              boundaryMargin: EdgeInsets.all(double.infinity),
////              transformationController: _transformationController,
////              minScale: 1.0,
////              maxScale: 3.0,
////              onInteractionStart: _onInteractionStart,
//              onInteractionEnd: (details) {
//                print('ended');
//                //방법1
////                _animateResetInitialize();
//
//              //방법2
//                setState(() {
//                  _transformationController.toScene(Offset.zero);
//                });
//              },
//              child: Container(
//                 child: Image.network('http://placerabbit.com/200/333')
////            decoration: BoxDecoration(
////              gradient: LinearGradient(
////                begin: Alignment.topCenter,
////                end: Alignment.bottomCenter,
////                colors: <Color>[Colors.orange, Colors.red],
////                stops: <double>[0.0, 1.0],
////              ),
////            ),
//              ),
//            ),
            FooterCard(),
            InteractiveViewer(
//              panEnabled: t,
              transformationController: transformationController,
              onInteractionEnd: (details) {
                setState(() {
                  transformationController.toScene(Offset.zero);
                });
              },
              boundaryMargin: EdgeInsets.all(double.infinity),
              minScale: 0.1,
              maxScale: 1.6,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18.0),
                child: Image.network('http://placerabbit.com/200/333'),
              ),
            ),
//            Container(
//              width: 100,
//                height: 100,
//                color: Colors.red,
//            )
          ],
        ),
      ),
//      persistentFooterButtons: [
//        IconButton(
//          onPressed: _animateResetInitialize,
//          tooltip: 'Reset',
//          color: Theme.of(context).colorScheme.surface,
//          icon: const Icon(Icons.replay),
//        ),
//      ],
    );
  }

}


class FooterCard extends StatelessWidget {
  const FooterCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18.0,
        vertical: 10,
      ),
      child: Row(
        children: [
//          FaIcon(FontAwesomeIcons.heart),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('15,128'),
          ),
          SizedBox(width: 20),
//          FaIcon(FontAwesomeIcons.commentAlt),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('350'),
          ),
          Spacer(),
//          FaIcon(FontAwesomeIcons.bookmark),
        ],
      ),
    );
  }
}