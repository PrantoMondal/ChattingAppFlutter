import 'package:firebase_chatting_app/pages/chat_room_page.dart';
import 'package:firebase_chatting_app/pages/launcher_page.dart';
import 'package:firebase_chatting_app/pages/login_page.dart';
import 'package:firebase_chatting_app/pages/user_profile_page.dart';
import 'package:firebase_chatting_app/providers/user_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/chat_room_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => UserProvider()),
    ChangeNotifierProvider(create: (_) => ChatRoomProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: LoginPage.routeName,
      routes: {
        LauncherPage.routeName: (_) => LauncherPage(),
        LoginPage.routeName: (_) => LoginPage(),
        UserProfilePage.routeName: (_) => UserProfilePage(),
        ChatRoomPage.routeName: (_) => ChatRoomPage(),
      },
    );
  }
}
