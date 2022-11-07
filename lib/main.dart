import 'dart:developer';
import 'dart:io';

import 'package:chtt/Anim2.dart';
import 'package:chtt/StaggerAnimation.dart';
import 'package:chtt/common/theme.dart';
import 'package:chtt/models/cart.dart';
import 'package:chtt/models/catalog.dart';
import 'package:chtt/screens/cart.dart';
import 'package:chtt/screens/catalog.dart';
import 'package:chtt/screens/login.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './random_words.dart';
void main() {
  runApp(MyApp());
}


const double windowWidth = 400;
const double windowHeight = 800;
// void setupWindow() {
//   if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
//     WidgetsFlutterBinding.ensureInitialized();
//     setWindowTitle('Provider Demo');
//     setWindowMinSize(const Size(windowWidth, windowHeight));
//     setWindowMaxSize(const Size(windowWidth, windowHeight));
//     getCurrentScreen().then((screen) {
//       setWindowFrame(Rect.fromCenter(
//         center: screen!.frame.center,
//         width: windowWidth,
//         height: windowHeight,
//       ));
//     });
//   }
// }
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
 @override
 Widget build(BuildContext context){
  // Using MultiProvider is convenient when providing multiple objects.
  return MultiProvider(
    providers: [
      // In this sample app, CatalogModel never changes, so a simple Provider
        // is sufficient.
      Provider(create: (context) => CatalogModel(),),
              // CartModel is implemented as a ChangeNotifier, which calls for the use
        // of ChangeNotifierProvider. Moreover, CartModel depends
        // on CatalogModel, so a ProxyProvider is needed.

      ChangeNotifierProxyProvider<CatalogModel,CartModel>(
        create: (context) => CartModel(),
        update: (context,catalog,cart) {
            if(cart == null) throw ArgumentError.notNull('cart');
            cart.catalog = catalog;
            return cart;
        }
      )  
    ],
    child: MaterialApp(  
      title: 'Provider Demo',
      debugShowCheckedModeBanner: false,
      theme:appTheme,
      initialRoute: '/',
      routes: {
        '/':(context) => MyLogin(),
        '/catalog':(context) => MyCatalog(),
        '/cart':(context)=>MyCart()
      },
    ),
  );
 }
}
