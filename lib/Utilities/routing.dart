
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../Modules/AboutApp/Screen/about_app.dart';
import '../Modules/DiwanShow/Screen/diwan_show.dart';
import '../Modules/Favorites/Screen/favorites.dart';
import '../Modules/Note/Screen/note.dart';
import '../Modules/PomesShow/Screen/poems_show.dart';
import '../Utilities/theme_helper.dart';
import '../Modules/MainPages/main_screens.dart';
import 'initial_local_data.dart';
class AppModule extends Module{
  @override
  List<Bind> get binds => [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => const SplashScreen()),
    defaultRoute(routeName: MainScreen.routeName, screen: const MainScreen()),
    defaultRoute(routeName: Note.routeName, screen: const Note()),
    defaultRoute(routeName: Favorites.routeName, screen: const Favorites()),
    defaultRoute(routeName: AboutApp.routeName, screen: const AboutApp()),
    defaultRoute(routeName: DiwanShow.routeName, screen: const DiwanShow()),
    defaultRoute(routeName: PoemsShow.routeName, screen: const PoemsShow()),
  ];

  static ChildRoute defaultRoute({required String routeName,required Widget screen}){
    return ChildRoute(
      routeName,
      child: (_, args) => screen,
      transition: TransitionType.defaultTransition,
      duration: const Duration(milliseconds: 300),
    );
  }
}
class SplashScreen extends StatefulWidget {
  static const routeName="/SplashScreen";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigator();
    super.initState();
  }
  navigator()async{
    await Future.delayed(const Duration(seconds: 2));
    await InitialLocalData.init();
    Navigator.of(context).pushNamed(MainScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
          alignment: Alignment.center,
            height: double.infinity,
            width:double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    ThemeClass.primaryColor,
                    ThemeClass.secondaryColor,
                  ],
                )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 380.h,),
            SvgPicture.asset(

              "assets/images/orn-splash.svg",
              height: 1063.h,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SvgPicture.asset(
                  "assets/images/books-splash.svg",
                  height: 725.h,
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
