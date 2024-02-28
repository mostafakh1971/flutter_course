import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course/cubit/app_cubit.dart';
import 'package:flutter_course/utils/cache.dart';

import 'package:flutter_course/utils/dio_helper.dart';

import 'package:flutter_course/screens/news_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()
        ..getSportNews()
        ..getBusiness()
        ..getOtherNews(),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          var isDark = AppCubit().get(context).isDark;
          return MaterialApp(
            debugShowCheckedModeBanner: false,

            // select theme mode

            themeMode: isDark ? ThemeMode.dark : ThemeMode.light,

            // light theme

            theme: ThemeData(
                cardTheme: CardTheme(elevation: 8.0),
                primarySwatch: Colors.orange,
                useMaterial3: false,
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(),
                cardColor: Colors.grey.shade100,
                textTheme: const TextTheme(
                    bodyMedium:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                appBarTheme: const AppBarTheme(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black)),

            // dark theme

            darkTheme: ThemeData(
                scaffoldBackgroundColor: Colors.grey.shade300,
                primarySwatch: Colors.orange,
                useMaterial3: false,
                textTheme: const TextTheme(
                    bodyMedium: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white)),
                cardColor: Colors.black,
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    backgroundColor: Colors.black,
                    type: BottomNavigationBarType.fixed,
                    unselectedItemColor: Colors.grey),
                appBarTheme: const AppBarTheme(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white)),
            home: NewsScreen(),
          );
        },
      ),
    );
  }
}
