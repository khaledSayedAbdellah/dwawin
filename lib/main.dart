import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'Control/app_languages.dart';
import 'Utilities/Routing.dart';
import 'Utilities/shared_preferances_helper.dart';
import 'locale/locales.dart';
// import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  await SharedPref().init();
  if(DateTime.now().isBefore(DateTime(2023,1,25))){
    runApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<AppLanguage>(create: (_) => AppLanguage()),
          ],
          child: ModularApp(
            module: AppModule(),
            child: const EntryPoint(),
          ),
        )
    );
  }
}

class EntryPoint extends StatelessWidget {
  const EntryPoint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLan = Provider.of<AppLanguage>(context);
    appLan.fetchLocale();
    return ScreenUtilInit(
      designSize: const Size(1125, 2436),
      builder:(_,__)=> MaterialApp.router(
        // theme: ThemeData(fontFamily: 'poppins'),
        debugShowCheckedModeBanner: false,
        title: 'dawawin',
        locale: appLan.appLocal,
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('ar', ''),
        ],
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate
        ],
        routeInformationParser: Modular.routeInformationParser,
        routerDelegate: Modular.routerDelegate,
      ),
    );
  }
}


// diwan
Map diwan = {
  "id": 1,
  "name":"",
  "description":"",
  "nOfPoems": 0
};

Map poem ={
  "id": 1,
  "diwanId": 1,
  "name":"",
  "rhyme": "",
  "nOfVerses": 0,
  "content":""
};