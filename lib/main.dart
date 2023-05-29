import 'package:emart_app/views/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'consts/consts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //we are using getX so change MaterialApp to getMaterialApp
    return GetMaterialApp(
      title: 'E-Mart',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.transparent,
          appBarTheme: const AppBarTheme(
              //to set appbar icon color
              iconTheme: IconThemeData(color: darkFontGrey),
              backgroundColor: Colors.transparent),
          fontFamily: regular),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
