import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:najot_shop/ui/auth/auth_screen.dart';
import 'package:najot_shop/ui/tab_admin/tab_box.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: context.read<AuthProvider>().listenAuthState(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.data == null) {
            return AuthScreen();
          } else {
            return TabBoxAdmin();
          }
        },
      ),
    );
  }
}