import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course/screens/business_screen.dart';
import 'package:flutter_course/cubit/app_cubit.dart';
import 'package:flutter_course/screens/search_screen.dart';
import 'package:flutter_course/utils/dio_helper.dart';
import 'package:flutter_course/screens/other_screen.dart';
import 'package:flutter_course/screens/sport_screen.dart';

class NewsScreen extends StatelessWidget {
  List screens = [BusinessScreen(), SportScreen(), OtherScreen()];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit().get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text("NewsApp"),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SearchScreen(),
                    ));
                  },
                  icon: Icon(Icons.search)),
              IconButton(
                  onPressed: () {
                    AppCubit().get(context).changeThemeMode();
                  },
                  icon: Icon(CupertinoIcons.moon_stars_fill))
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.index,
              onTap: (value) {
                cubit.changeIndex(value);
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.business), label: "Business"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.sports), label: "Sports"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.science), label: "Other")
              ]),
          body: screens[cubit.index],
        );
      },
    );
  }
}
