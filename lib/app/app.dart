import 'package:cv_pdf_maker/features/home/blocs/input/input_bloc.dart';
import 'package:cv_pdf_maker/features/home/pages/splash/page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InputBloc(),
      child: MaterialApp(
        title: 'CV Pdf Maker',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: 'Roboto',
            scaffoldBackgroundColor: Colors.white.withOpacity(.95),
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.blue,
              titleTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black),
            )),
        home: const SplashPage(),
      ),
    );
  }
}
