import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course/cubit/app_cubit.dart';

Widget buildNews(news) {
  return BlocBuilder<AppCubit, AppState>(
    builder: (context, state) {
      return GestureDetector(
        onTap: () {
          AppCubit().get(context).getWebView(url: news.url);
        },
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          child: Column(
            children: [
              Image.network(
                "${news.image}",
                errorBuilder: (context, error, stackTrace) => Image.network(
                    "https://blog.currentcatalog.com/wp-content/uploads/2015/03/newspaper.jpg"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${news.title}",
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
