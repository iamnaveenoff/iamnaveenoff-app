import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:iamnaveenoff/screens/dashboard.dart';

import 'package:iamnaveenoff/screens/login_screen.dart';
import 'package:iamnaveenoff/services/auth_service.dart';
import 'package:iamnaveenoff/store/AppStore.dart';
import 'package:iamnaveenoff/utils/AppTheme.dart';
import 'package:iamnaveenoff/utils/colors.dart';
import 'package:iamnaveenoff/utils/routes.dart';
import 'package:iamnaveenoff/utils/theme.dart';
import 'package:nb_utils/nb_utils.dart';

import 'firebase_options.dart';

AppStore appStore = AppStore();
GoogleSignIn _googleSignIn = GoogleSignIn(
  // Optional clientId
  // clientId: '739788165293-uv1prq5gibhjraem51r50j1rojpvunpp.apps.googleusercontent.com',
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // appStore.toggleDarkMode(value: getBoolAsync(isDarkModeOnPref));
  defaultToastGravityGlobal = ToastGravity.BOTTOM;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'iamnaveenoff ${!isMobile ? ' ${platformName()}' : ''}',
        theme: !appStore.isDarkModeOn
            ? AppThemeData.lightTheme
            : AppThemeData.darkTheme,
        routes: routes,
        home: StreamBuilder<User?>(
          stream: FirebaseAuthService().authState,
          builder: (context, snapshot) {
            print('state: ${snapshot.connectionState}');
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.connectionState == ConnectionState.done ||
                snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return const Dashboard();
              } else {
                return const LoginScreen();
              }
            } else {
              return Center(
                child: Text('State: ${snapshot.connectionState}'),
              );
            }
          },
        ),
      ),
    );
  }
}
