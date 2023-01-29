import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'Control/app_languages.dart';
import 'Control/shared_data_provider.dart';
import 'Database/database_helper.dart';
import 'Utilities/Routing.dart';
import 'Utilities/shared_preferances_helper.dart';
import 'locale/locales.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref().init();
  await DataBaseHelper().init();

  if(DateTime.now().isBefore(DateTime(2023,1,30))){
    runApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<AppLanguage>(create: (_) => AppLanguage()),
            ChangeNotifierProvider<SharedDataProvider>(create: (_) => SharedDataProvider()),
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
        debugShowCheckedModeBanner: false,
        title: 'dawawin',
        locale: appLan.appLocal,
        supportedLocales: const [
          Locale('ar', ''),
          Locale('en', 'US'),
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
