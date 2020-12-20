import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterbasicc/app/dialog_page.dart';
import 'package:flutterbasicc/app/switch_page.dart';

enum TabItem {
  switches,
  dialogs
}

String tabItemName(TabItem tabItem) {
  switch(tabItem) {
    case TabItem.switches:
      return 'switches';
    case TabItem.dialogs:
      return 'dialogs';
  }
  return null;
}

class BottomNavigation extends StatefulWidget {

  @override
  State createState() {
    return BottomNavigationState();
  }
}

class BottomNavigationState extends State<BottomNavigation>{
  TabItem currentItem = TabItem.switches;

  _onSelectTab(int index) {
    switch(index) {
      case 0:
        _updateCurrentItem(TabItem.switches);
        break;
      case 1:
        _updateCurrentItem(TabItem.dialogs);
        break;
    }
  }

  _updateCurrentItem(TabItem item) {
    setState(() {
      currentItem = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBody() {
    switch(currentItem) {
      case TabItem.switches:
        return SwitchesPage();
      case TabItem.dialogs:
        return DialogPage();
    }
    return Container();
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(icon: Icons.radio_button_checked, tabItem: TabItem.switches),
        _buildItem(icon: Icons.call_to_action, tabItem: TabItem.dialogs)
      ],
      onTap: _onSelectTab
    );
  }

  BottomNavigationBarItem _buildItem({IconData icon, TabItem tabItem}) {
    String text = tabItemName(tabItem);
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: _colorTabMatching(item: tabItem),
      ),
      title: Text(
        text,
        style: TextStyle(
          color: _colorTabMatching(item: tabItem)
        )
      )
    );
  }

  Color _colorTabMatching({TabItem item}) {
    return currentItem == item ? Theme.of(context).primaryColor : Colors.grey;
  }


}

