import 'package:api_dio/Widgets/BlocObserver.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'Screens/business/controller.dart';
import 'Screens/business/view.dart';

void main() {
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 0.0,
          color: Colors.white,
          centerTitle: true,
        )
      ),
      home: BusinessScreen(),
    );
  }
}
