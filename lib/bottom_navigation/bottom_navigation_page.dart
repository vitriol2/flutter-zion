import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'main_first_page.dart';
import 'main_fourth_page.dart';
import 'main_second_page.dart';
import 'main_third_page.dart';

class BottomNavigationMainPage extends StatefulWidget {
  @override
  State createState() {
    return _BottomNavigationMainPageState();
  }
}

class _BottomNavigationMainPageState extends State<BottomNavigationMainPage> {
  var pageController = PageController();

  var _currentPageIndex;

  List<GlobalKey<NavigatorState>> _navigatorKeyList;

  var mainPageList;
  void onTap(int index) {
    pageController.jumpToPage(index);
  }


  GlobalKey<NavigatorState> firstTabNavKey;
  GlobalKey<NavigatorState> secondTabNavKey;
  GlobalKey<NavigatorState> thirdTabNavKey;
  GlobalKey<NavigatorState> fourthTabNavKey;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    firstTabNavKey = GlobalKey<NavigatorState>();
    secondTabNavKey = GlobalKey<NavigatorState>();
    thirdTabNavKey = GlobalKey<NavigatorState>();
    fourthTabNavKey = GlobalKey<NavigatorState>();

    _currentPageIndex = 0;

    _navigatorKeyList = [
      firstTabNavKey,
      secondTabNavKey,
      thirdTabNavKey,
      fourthTabNavKey
    ];

    mainPageList = [
      MainFirstPage(),
      MainSecondPage(),
      MainThirdPage(),
      MainFourthPage()
    ];

  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Container(
      width: _width,
      height: _height,
      color: Colors.white,
      child: SafeArea(
          top: false,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            body: PageView(
              controller: pageController,
                onPageChanged: onPageChanged,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _buildOffStageNavigator(0),
                  _buildOffStageNavigator(1),
                  _buildOffStageNavigator(2),
                  _buildOffStageNavigator(3)
                ],
            ),
            bottomNavigationBar: SizedBox(
              height: _width * 0.134,
              child: CupertinoTabBar(
                backgroundColor: Colors.white,
                onTap: (index) {
                  if(_currentPageIndex == index) {
                    switch(index) {
                      case 0:
                        firstTabNavKey.currentState.popUntil((r) => r.isFirst);
                        break;
                      case 1:
                        secondTabNavKey.currentState.popUntil((r) => r.isFirst);
                        break;
                      case 2:
                        thirdTabNavKey.currentState.popUntil((r) => r.isFirst);
                        break;
                      case 3:
                        fourthTabNavKey.currentState.popUntil((r) => r.isFirst);
                        break;
                    }
                  }
                  setState(() {
                    _currentPageIndex = index;
                    onTap(index);
                  });
                },
                items: [
                  BottomNavigationBarItem(
                    icon: bottomTab(
                        context: context,
                        emptyImageUrl: 'assets/icons/tabBarHomeIc.png',
                        imageUrl: 'assets/icons/tabBarSelectedHomeIc.png',
                        name: 'Home',
                        tabNum: 0,
                        currentPageNum: _currentPageIndex),
                  ),
                  BottomNavigationBarItem(
                    icon: bottomTab(
                        context: context,
                        emptyImageUrl: 'assets/icons/tabBarCompass2.png',
                        imageUrl: 'assets/icons/tabBarSelectedCompass2.png',
                        name: 'For U',
                        tabNum: 1,
                        currentPageNum: _currentPageIndex),
                  ),
                  BottomNavigationBarItem(
                    icon: bottomTab(
                        context: context,
                        emptyImageUrl: 'assets/icons/tabBarLocationIc.png',
                        imageUrl: 'assets/icons/tabBarSelectedLocationIc.png',
                        name: 'PLUS',
                        tabNum: 2,
                        currentPageNum: _currentPageIndex),
                  ),
                  BottomNavigationBarItem(
                    icon: bottomTab(
                        context: context,
                        emptyImageUrl: 'assets/icons/tabBarMyIc.png',
                        imageUrl: 'assets/icons/tabBarSelectedMyIc.png',
                        name: 'MY',
                        tabNum: 3,
                        currentPageNum: _currentPageIndex),
                  ),
                ]
              ),
            )
          )
      ),
    );
  }

  Widget _buildOffStageNavigator(int tabIndex) {
    return Offstage(
      offstage: tabIndex != _currentPageIndex,
      child: TabNavigator(
        navigatorKey: _navigatorKeyList[tabIndex],
        tabItem: mainPageList[tabIndex],
      ),
    );
  }

  void onPageChanged(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }
}

class TabNavigator extends StatefulWidget {

  TabNavigator({this.navigatorKey, this.tabItem});

  final GlobalKey<NavigatorState> navigatorKey;
  final Widget tabItem;
  @override
  State createState(){
    return _TabNavigatorState();
  }
}

class _TabNavigatorState extends State<TabNavigator>{

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: widget.navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => widget.tabItem
        );
      }
    );
  }
}


Widget bottomTab({@required BuildContext context,
  @required String imageUrl,
  @required String emptyImageUrl,
  @required String name,
  @required int tabNum,
  @required int currentPageNum}) {
  double _width = MediaQuery
      .of(context)
      .size
      .width;
  return Container(
    width: _width * 0.134,
    height: _width * 0.134,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          child: Image.asset(
            tabNum == currentPageNum ? imageUrl : emptyImageUrl,
            height: _width * 0.06,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(height: _width * 0.01,),
        Text(
          name,
          style: Theme
              .of(context)
              .textTheme
              .bodyText1
              .copyWith(
              fontSize: _width * 0.024,
              color: tabNum == currentPageNum
                  ? Color.fromRGBO(255, 0, 124, 1.0)
                  : Color.fromRGBO(133, 133, 133, 1.0)),
        ),
      ],
    ),
  );
}