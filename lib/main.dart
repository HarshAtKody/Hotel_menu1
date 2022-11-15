import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hotel_menu1/ui/splash/splash_screen.dart';
import 'package:hotel_menu1/utils/const.dart';
import 'package:hotel_menu1/utils/darkmode/dark_provider.dart';
import 'package:hotel_menu1/utils/theme_const.dart';
import 'package:path_provider/path_provider.dart';



Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();

  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  await Hive.openBox('userBox');

  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          /// Color for Android
          statusBarBrightness: Brightness.light,

          /// Dark == white status bar -- for IOS.
          statusBarIconBrightness: Brightness.dark
      ));

  /// TO Hide Status Bar
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
  //   SystemUiOverlay.bottom,
  // ]);

  /// View Mode of Application
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);


  /// Error Widget Display
  ErrorWidget.builder = (FlutterErrorDetails details) => Material(
    color: Constant().clrBlack,
    child: Center(
        child: Text(details.exception.toString(),
          style: TextStyle(color: Colors.yellow,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp),)
    ),);

  runApp(
      ProviderScope(
          child: EasyLocalization(
              supportedLocales: const <Locale>[
                Locale('en'),
                Locale('ar'),
              ],
              useOnlyLangCode: true,
              path: 'lang',
              child:const MyApp()
          )
      )
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> with Constant{

  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

  Future<void> initDynamicLinks() async {
    dynamicLinks.onLink.listen((dynamicLinkData) {
      Navigator.pushNamed(context, dynamicLinkData.link.path);
    }).onError((error) {
      showLog('onLink error');
      showLog(error.message);
    });
  }



  // @override
  // noSuchMethod(Invocation invocation) {
  //   initDynamicLinks();
  //   return super.noSuchMethod(invocation);
  // }

  /// init method
  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
      final darkModeWatch = ref.watch(darkProvider);
      initDynamicLinks();
      /// Dark Mode Object
      var brightness = SchedulerBinding.instance?.window.platformBrightness;
      bool isDarkMode = getIsAppThemeDark() ?? brightness == Brightness.dark;
      darkModeWatch.updateIsDarkMode(false, false);
    });

  }


  /// dispose method
  @override
  void dispose() async{
    Hive.box('userBox').compact();
    Hive.close();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final darkModeWatch = ref.watch(darkProvider);

    /// Orientation Portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    /// Theme For Status Bar & Navigation Bar
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
            statusBarColor:  Colors.transparent, /// Color for Android
            systemNavigationBarColor: isDarkMode? clrBlack : clrWhite,
            systemNavigationBarIconBrightness: isDarkMode ? Brightness.light : Brightness.dark,
            statusBarBrightness: isDarkMode ? Brightness.dark : Brightness.light, /// Color for iOS
            statusBarIconBrightness: isDarkMode ? Brightness.light : Brightness.dark /// Color for Android
        ));

    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context,child) =>
            MaterialApp(
              debugShowCheckedModeBanner: false,
              title: appName,
              theme: ThemeData(
                splashColor: clrTransparent,
                highlightColor: clrTransparent
              ),
              supportedLocales: EasyLocalization.of(context)!.supportedLocales,
              localizationsDelegates: context.localizationDelegates,
              locale: EasyLocalization.of(context)!.locale,
              // locale: appState.appLocal,
              home: const SplashScreen(),
            ));
  }
}

