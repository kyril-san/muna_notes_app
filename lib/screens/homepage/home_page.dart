// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muna_notes_app/const/general_colors.dart';
import 'package:muna_notes_app/const/text_style.dart';
import 'package:muna_notes_app/service/auth/bloc/auth_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: CircleBorder(),
        backgroundColor: AppColors.blackcolor,
        child: Icon(Icons.add, size: 36, color: Colors.white),
      ),
      appBar: AppBar(
        title: Text('Notes', style: AppTextstyle.nunitoSemiBoldwhite),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              context.read<AuthBloc>().add(AuthEventLoggedOut());
            },
            icon: Icon(Icons.logout_rounded),
          ),
        ],
      ),
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/empty_background.png',
              fit: BoxFit.contain,
            ),
            Text(
              'Create your First Note!',
              style: AppTextstyle.nunitoLightwhite,
            )
          ],
        ),
      ),
    );
  }
}
