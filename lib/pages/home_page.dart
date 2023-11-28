// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:lawas_sumbawa/component/footer_bar.dart';
import 'package:lawas_sumbawa/model/book_model.dart';
import 'package:lawas_sumbawa/pages/upload_screen.dart';
import 'package:lawas_sumbawa/pages/vidio_page.dart';

import '../common.dart';
import 'new_tab_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  int _selectedIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Video()),
      );
    } else if (_selectedIndex == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Upload()),
      );
    } else if (_selectedIndex == 3) {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => const About()),
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Lawas Sumbawa",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            // Search Box
            SizedBox(
              height: 20,
            ),
            TabBar(
              controller: _tabController,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(color: Color(0xFF9CCC65), width: 2.5),
                insets: EdgeInsets.fromLTRB(0.0, 00.0, 30.0, 0.0),
              ),
              unselectedLabelStyle: TextStyle(color: Colors.grey[500]),
              unselectedLabelColor: Colors.grey[500],
              labelColor: Color(0xFF9CCC65),
              labelStyle: TextStyle(
                  fontWeight: FontWeight.bold, color: Color(0xFF9CCC65)),
              isScrollable: true,
              labelPadding: EdgeInsets.only(left: 0, right: 20),
              tabs: [
                _tabWidget("Tau Ode"),
                _tabWidget("Taruna Dadara"),
                _tabWidget("Tau Loka"),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Flexible(
                child: Container(
              child: TabBarView(controller: _tabController, children: [
                NewTabWidget(),
                Container(),
                Container(),
              ]),
            ))
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTabTapped: _onTabTapped,
      ),
    );
  }

  Widget _tabWidget(String title) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: Text(title),
    );
  }
}
