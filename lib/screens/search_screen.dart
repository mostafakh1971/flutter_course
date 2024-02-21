import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course/components/components.dart';
import 'package:flutter_course/cubit/app_cubit.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var news = AppCubit().get(context).searchModel;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (value) {
                      AppCubit().get(context).search(search: value);
                    },
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: "Search",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BuildCondition(
                    condition: news != null,
                    builder: (context) => Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 1.38,
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: news!.articles.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              height: 10,
                            );
                          },
                          itemBuilder: (BuildContext context, int index) {
                            return buildNews(news.articles[index]);
                          },
                        ),
                      ),
                    ),
                    fallback: (context) => state is SearchNewsLoadingState
                        ? const LinearProgressIndicator()
                        : const SizedBox(),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
