import 'package:flutter/material.dart';
import 'package:gsg_project_1/ui/home_page/home_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        elevation: 0,
        fixedColor: Colors.blue,
        onTap: (newIndex) {
          _currentIndex = newIndex;
          _tabController.animateTo(newIndex);
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            title: Text(''),
            icon: Image.asset(
              'assets/icons/icon_home.png',
              width: 25,
              height: 25,
              color:
                  (_currentIndex == 0) ? Color(0xFF47292A) : Color(0xFFCAC7CE),
            ),
          ),
          BottomNavigationBarItem(
            title: Text(''),
            icon: Image.asset(
              'assets/icons/icon_search.png',
              width: 25,
              height: 25,
              color:
                  (_currentIndex == 1) ? Color(0xFF47292A) : Color(0xFFCAC7CE),
            ),
          ),
          BottomNavigationBarItem(
            title: Text(''),
            icon: Image.asset(
              'assets/icons/icon_shop.png',
              width: 25,
              height: 25,
              color:
                  (_currentIndex == 2) ? Color(0xFF47292A) : Color(0xFFCAC7CE),
            ),
          ),
          BottomNavigationBarItem(
            title: Text(''),
            icon: Image.asset(
              'assets/icons/icon_profile.png',
              width: 25,
              height: 25,
              color:
                  (_currentIndex == 3) ? Color(0xFF47292A) : Color(0xFFCAC7CE),
            ),
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          HomePage(),
          Text('2'),
          Text('3'),
          Text('4'),
        ],
      ),
    );
  }
}
