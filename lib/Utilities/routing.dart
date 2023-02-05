import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../Modules/AboutApp/Screen/about_app.dart';
import '../Modules/DiwanShow/Screen/diwan_show.dart';
import '../Modules/Favorites/Screen/favorites.dart';
import '../Modules/MainPages/splach_screen.dart';
import '../Modules/Note/Screen/note.dart';
import '../Modules/PomesShow/Screen/poems_show.dart';
import '../Modules/Search/Screen/search_scree.dart';
import '../Modules/MainPages/main_screens.dart';
class AppModule extends Module{
  @override
  List<Bind> get binds => [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => const SplashScreen()),

    defaultRoute(routeName: Note.routeName, screen: const Note()),
    defaultRoute(routeName: Favorites.routeName, screen: const Favorites()),
    defaultRoute(routeName: AboutApp.routeName, screen: const AboutApp()),
    ChildRoute(MainScreen.routeName,
        child: (_, args) => MainScreen(index: args.data,),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)), ChildRoute(
        DiwanShow.routeName,
        child: (_, args) => DiwanShow(diwan: args.data),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),
    ChildRoute(PoemsShow.routeName,
        child: (_, args) => PoemsShow(poemModel: args.data),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),
    ChildRoute(SearchScreen.routeName,
        child: (_, args) => SearchScreen(searchText: args.data[0],id: args.data[1],isDiwan: args.data[2]),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 300)),

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


