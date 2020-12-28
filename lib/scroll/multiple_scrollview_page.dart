import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MultipleScrollViewPage extends StatelessWidget {

   Widget build(BuildContext context) {
     double _width = MediaQuery.of(context).size.width;
     return Scaffold(
       body: CustomScrollView(
         slivers: [
           SliverPersistentHeader(
              delegate: MyHeader(
                  maxHeight: 300,
                  minHeight: 300
              ),
           ),
         SliverList(
             delegate: SliverChildBuilderDelegate(
                 (context, index) {
                   return Container(
                     height: 50,
                     child: Center(child: Text('Item $index')),
                   );
                 },
               childCount: 30
             ),
         )
           ]
       )
     );
   }

//  @override
//  Widget build(BuildContext context) {
//    double _width = MediaQuery.of(context).size.width;
//    return Scaffold(
////      body: CustomScrollView(
////        slivers:[
////          SliverPersistentHeader(delegate: ),
////          SliverList(
////            delegate: SliverChildBuilderDelegate(
////                (context, index) {
////                  return Material(
////                    child: ListTile(
////
////                      title: Text('Item $index'),
////                    ),
////                  );
////                },
////              childCount: 30
////            ),
////          ),
////        ]
////
////
////      )
//    body: NestedScrollView(
//      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//        return <Widget>[
//          new SliverAppBar(
//            pinned: true,
//            expandedHeight: 256.0,
//            floating: true,
//            bottom: new PreferredSize(
//              preferredSize: new Size.fromHeight(30.0),
//              child: new Container(
//                height: 30.0,
//                child: new TabBar(
//                  tabs: [ new Tab(child: new Text("First"))],
//                ),
//              ),
//            ),
//          ),
//        ];
//      },
//      body: SingleChildScrollView(
//        child: Column(
//          children: [
//            Container(
//              width: _width,
//              height: _width,
//              color: Colors.black,
//            ),
//            ListView.builder(itemBuilder: (context, index) {
//              return Material(
//                child: ListTile(
//                  title: Text('Item $index'),
//                ),
//              );
//            },
//            itemCount: 30,)
//          ],
//        ),
//      ),
//    ),
//    );
//  }
}

class MyHeader extends SliverPersistentHeaderDelegate {
  double maxHeight;
  double minHeight;
  MyHeader({
    this.maxHeight,
    this.minHeight
});

  @override
  Widget build(BuildContext context, double shrinkOffset,
      bool overlapsContent) {
    double _width = MediaQuery.of(context).size.width;
    return Container(
      width: _width,
      height: maxHeight,
      color: Colors.blue,
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;
}