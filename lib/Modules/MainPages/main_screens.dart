import 'package:flutter/material.dart';
import '../../Widgets/nav_bar_widget.dart';
import 'AboutUs/Screen/about_us.dart';
import 'Dawawin/Screen/dawawin_screen.dart';
import 'Drawer/Screen/drawer.dart';
import 'Home/Screens/home_screen.dart';
import 'Poems/Screen/poems.dart';
class MainScreen extends StatefulWidget {
  static const routeName="/MainScreen";
  final int? index;
  const MainScreen({Key? key, this.index = 0}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex=0;
  List<Widget>screen=const[
     HomeScreen(),
     DawawinScreen(),
     PoemsScreen(),
     AboutUs(),
    DrawerScreen(),
  ];

  @override
  void initState() {
    _selectedIndex = widget.index??0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:const DrawerScreen(),
      body: screen[_selectedIndex],
      bottomNavigationBar: Container(
        color: Colors.transparent.withOpacity(.1),
        child: NavBarWidget(selectedIndex: _selectedIndex,onChange: (int index){
          setState(() { _selectedIndex=index;});
        }),
      ),
    );
  }
}
