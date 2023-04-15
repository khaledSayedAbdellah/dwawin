import 'package:flutter/material.dart';
import '../../Widgets/nav_bar_widget.dart';
import 'AboutUs/Screen/about_us.dart';
import 'Dawawin/Screen/dawawin_screen.dart';
import 'Drawer/Screen/drawer.dart';
import 'Home/Screens/home_screen.dart';
import 'Knash/Screen/knash.dart';

class MainScreen extends StatefulWidget {
  static const routeName = "/MainScreen";
  final int? index;

  const MainScreen({Key? key, this.index = 0}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  List<Widget> screen = const [
    HomeScreen(),
    DawawinScreen(),
    KnashScreen(),
    AboutUs(),
  ];

  @override
  void initState() {
    _selectedIndex = widget.index ?? 0;
    super.initState();
  }

  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      drawer: const DrawerScreen(),
      body: Stack(
        children: [
          screen[_selectedIndex],
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.transparent,
              child: NavBarWidget(
                selectedIndex: _selectedIndex,
                openDrawer: ()=> _scaffoldkey.currentState?.openDrawer(),
                onChange: (int index) => setState(() {_selectedIndex = index;}),
              ),
            ),
          )
        ],
      ),
    );
  }
}
