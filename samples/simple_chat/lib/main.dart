import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:simple_chat/mobx/messages.dart';
import 'package:simple_chat/screen/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:simple_chat/screen/chat.dart';
import 'firebase_options.dart';
import 'package:simple_chat/mobx/authentication.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(App());
}

class App extends StatelessWidget {
  final AuthenticationStore _authenticationStore = AuthenticationStore();

  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'FlutterChat',
        theme: ThemeData().copyWith(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: Color.fromARGB(235, 231, 240, 240)),
        ),
        home: Observer(
          //Observador del estado de la autenticacion del usuario
          builder: (_) {
            if (_authenticationStore.currentUser != null) {
              return ChatScreen();
            } else {
              return const AuthScreen();
            }
          },
        ));
  }
}
