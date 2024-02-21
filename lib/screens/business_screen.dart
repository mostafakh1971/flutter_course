import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course/components/components.dart';
import 'package:flutter_course/cubit/app_cubit.dart';
import 'package:flutter_course/models/news_model.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var news = AppCubit().get(context).businessNews;
        return BuildCondition(
          condition: news != null,
          builder: (context) => Padding(
            padding: const EdgeInsets.all(5.0),
            child: ListView.separated(
              itemCount: news!.articles.length,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 10,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return buildNews(news.articles[index]);
              },
            ),
          ),
          fallback: (context) => Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
