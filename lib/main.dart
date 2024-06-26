import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/common/widgets/bottom_bar.dart';
import 'package:shop/constants/global_variables.dart';
import 'package:shop/features/admin/screens/admin_screen.dart';
import 'package:shop/features/auth/screens/auth_screen.dart';
import 'package:shop/features/auth/services/auth_service.dart';
import 'package:shop/features/splash_screen.dart';
import 'package:shop/providers/user_provider.dart';
import 'package:shop/routers/router.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce App',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.secondaryColor,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        useMaterial3: true, // can remove this line
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);

    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  Provider.of<UserProvider>(context).user.token.isNotEmpty
                      ? (Provider.of<UserProvider>(context).user.type == 'user'
                          ? const BottomBar()
                          : const AdminScreen())
                      : const AuthScreen(),
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}
