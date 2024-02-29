import 'package:hive/hive.dart';
import 'package:lesson1/infrastructure/utils/consts.dart';
import 'package:lesson1/presentation/screens/auth/login/login_screen.dart';
import 'package:lesson1/presentation/screens/auth/sign_up/gender_screen.dart';
import 'package:lesson1/presentation/screens/auth/sign_up/password_screen.dart';
import 'package:lesson1/presentation/screens/auth/sign_up/success_screen.dart';
import 'package:lesson1/presentation/screens/home/home_screen.dart';

import '../../presentation/screens/auth/auth_screen.dart';
import '../../presentation/screens/auth/sign_up/artists_screen.dart';
import '../../presentation/screens/auth/sign_up/email_screen.dart';

final appRoutes = {
  AppRoutes.main: (context) {
    return Hive.box(Boxes.userBox).isEmpty?const AuthScreen():const HomeScreen();
  },
  AppRoutes.email: (context) => const EmailScreen(),
  AppRoutes.password: (context) => const PasswordScreen(),
  AppRoutes.gender: (context) => const GenderScreen(),
  AppRoutes.artists: (context) => const ArtistsScreen(),
  AppRoutes.success: (context) => const SuccessScreen(),
  AppRoutes.login: (context) => const LoginScreen(),

};

class AppRoutes {
  static const main = '/';
  static const email = '/email';
  static const password = '/password';
  static const gender = '/gender';
  static const artists = '/aritist';
  static const success = '/success';
  static const login = '/login';

}
