import 'package:evently/core/config/routes/app_routes_name.dart';
import 'package:evently/modules/authentication/layout/layout_view.dart';
import 'package:evently/modules/authentication/pages/forget_password_view.dart';
import 'package:evently/modules/authentication/pages/login_view.dart';
import 'package:evently/modules/authentication/pages/register_view.dart';
import 'package:evently/modules/create_new_event/create_new_event_view.dart';
import 'package:evently/modules/on_boarding/letsStartView.dart';
import 'package:evently/modules/on_boarding/onboarding_home.dart';
import 'package:evently/modules/splash_screen/splash_view.dart';
import 'package:flutter/material.dart';

abstract class RouteConfig {



 static Route<dynamic>? onGenerateRoute(RouteSettings settings) {

    switch (settings.name) {

      case AppRoutesName.initialRoute:
        return MaterialPageRoute(builder: (context) => SplashView());
      case AppRoutesName.letsStartRoute:
        return MaterialPageRoute(builder: (context) => LetsStartView());
        case AppRoutesName.onBoardingRoute:
          return MaterialPageRoute(builder: (context) => OnboardingHome());
        case AppRoutesName.loginRoute:
          return MaterialPageRoute(builder: (context) => LoginView());
          case AppRoutesName.registerRoute:
          return MaterialPageRoute(builder: (context) => RegisterView());
          case AppRoutesName.forgetPasswordRoute:
          return MaterialPageRoute(builder: (context) => ForgetPasswordView());
      case AppRoutesName.layoutView:
        return MaterialPageRoute(builder: (context) => LayoutView());

        case AppRoutesName.createEventRoute:
          return MaterialPageRoute(builder: (context) => CreateNewEventView());
      default:
        return null;
    }


  }
}