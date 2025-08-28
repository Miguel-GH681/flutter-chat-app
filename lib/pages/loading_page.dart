import 'dart:developer';

import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/pages/users_page.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        builder: (context, snapshot){
          return Center(
            child: Text('Espere...'),
          );
        },
        future: checkLoginState(context),
      ),
    );
  }

  Future checkLoginState( BuildContext context ) async{
    final authService = Provider.of<AuthService>(context, listen: false);
    final autenticated = await authService.isLoggedIn();
    if(autenticated){
      // Navigator.pushReplacementNamed(context, 'users');
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_,__,___) => UsersPage(),
          transitionDuration: Duration(milliseconds: 0)
        )
      );
    } else{
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_,__,___) => LoginPage(),
          transitionDuration: Duration(milliseconds: 0)
        )
      );
    }
  }
}
