import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MultipleScrollViewPage extends StatelessWidget {

   Widget build(BuildContext context) {
     double _width = MediaQuery.of(context).size.width;
     return Scaffold(
       body: NestedScrollView(
         // Setting floatHeaderSlivers to true is required in order to float
         // the outer slivers over the inner scrollable.
         floatHeaderSlivers: true,
         headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
           return <Widget>[
             SliverAppBar(
               title: Container(
                 width: _width,
                   height: _width,
                   color: Colors.black,
                   child: Text('Floating Nested SliverAppBar')),
               floating: true,
               pinned: true,

               expandedHeight: 200.0,
               forceElevated: innerBoxIsScrolled,
             ),
           ];
         },
         body: ListView.builder(
           padding: const EdgeInsets.all(8),
           itemCount: 30,
           itemBuilder: (BuildContext context, int index) {
             return Container(
               height: 50,
               child: Center(child: Text('Item $index')),
             );
           }
         )
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