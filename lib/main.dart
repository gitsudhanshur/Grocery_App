import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/auth_provider.dart';
import './providers/product_provider.dart';
import './screens/login_screen.dart';
import './screens/product_grid_screen.dart';
import './screens/product_detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
      ],
      child: MaterialApp(
        title: 'Grocery App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Consumer<AuthProvider>(
          builder: (ctx, auth, _) => auth.isAuthenticated
              ? ProductGridScreen()
              : LoginScreen(),
        ),
        routes: {
          LoginScreen.routeName: (ctx) => LoginScreen(),
          ProductGridScreen.routeName: (ctx) => ProductGridScreen(),
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
        },
      ),
    );
  }
}
