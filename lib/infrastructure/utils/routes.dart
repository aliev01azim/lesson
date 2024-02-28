import 'package:lesson1/presentation/screens/auth/sign_up/artists_screen.dart';
import 'package:lesson1/presentation/screens/auth/sign_up/gender_screen.dart';
import 'package:lesson1/presentation/screens/auth/sign_up/password_screen.dart';

import '../../presentation/screens/auth/auth_screen.dart';
import '../../presentation/screens/auth/sign_up/email_screen.dart';

final appRoutes = {
  AppRoutes.home: (context) => const AuthScreen(),
  AppRoutes.email: (context) => const EmailScreen(),
  AppRoutes.password: (context) => const PasswordScreen(),
  AppRoutes.gender: (context) => const GenderScreen(),
  AppRoutes.artists: (context) => const ArtistsScreen(),
};


class AppRoutes {
  static const home = '/';
  static const email = '/email';
  static const password = '/password';
  static const gender = '/gender';
  static const artists = '/aritist';
}
