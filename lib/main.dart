import 'package:bloc_login/blocs/formprovider.dart';
import 'package:bloc_login/screen/forgotpassowrd.dart';
import 'package:bloc_login/screen/home.dart';
import 'package:bloc_login/screen/login.dart';
import 'package:bloc_login/screen/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return FormProvider(
      child: MaterialApp(
        title: 'BLOC LOGIN',
        onGenerateRoute: onGenerateRoute,
        initialRoute: '/login',
      ),
    );
  }

  Route onGenerateRoute(RouteSettings routeSettings) {
    if (routeSettings.name == '/login') {
      return MaterialPageRoute(builder: (_) => Login());
    }
    if (routeSettings.name == '/forgot_passowrd') {
      return MaterialPageRoute(builder: (_) => ForgotPassword());
    }
    if (routeSettings.name == '/signup') {
      return MaterialPageRoute(builder: (_) => SignUp());
    }
    return MaterialPageRoute(builder: (_) => Home());
  }
}
