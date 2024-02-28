import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course/utils/cache.dart';
import 'package:flutter_course/utils/dio_helper.dart';
import 'package:flutter_course/models/news_model.dart';
import 'package:meta/meta.dart';
import 'package:url_launcher/url_launcher.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  AppCubit get(context) => BlocProvider.of(context);
  int index = 0;
  changeIndex(value) {
    index = value;
    emit(ChangeIndexState());
  }

  NewsModel? businessNews;
  getBusiness() {
    emit(GetBusinessNewsLoadingState());
    DioHelper.getData(path: "top-headlines", queryParameters: {
      "country": "us",
      "category": "business",
      "apiKey": "8f53df97d6b048aaa75e8d25b6cb608b"
    }).then((value) {
      businessNews = NewsModel.fromJson(value?.data);
      print(businessNews?.articles[9].image);
      emit(GetBusinessNewsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetBusinessNewsFailureState());
    });
  }

  NewsModel? sportNews;
  getSportNews() {
    emit(GetSportNewsLoadingState());
    DioHelper.getData(path: "top-headlines", queryParameters: {
      "country": "us",
      "category": "sport",
      "apiKey": "8f53df97d6b048aaa75e8d25b6cb608b"
    }).then((value) {
      sportNews = NewsModel.fromJson(value?.data);
      print(sportNews?.articles[12].image);
      emit(GetSportNewsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetSportNewsFailureState());
    });
  }

  NewsModel? otherNews;

  getOtherNews() {
    emit(GetOtherNewsLoadingState());
    DioHelper.getData(path: "everything", queryParameters: {
      "q": "tesla",
      "apiKey": "8f53df97d6b048aaa75e8d25b6cb608b"
    }).then((value) {
      otherNews = NewsModel.fromJson(value?.data);
      emit(GetOtherNewsSuccessState());
    }).catchError((error) {
      emit(GetOtherNewsFailureState());
    });
  }

  NewsModel? searchModel;
  search({required String search}) {
    emit(SearchNewsLoadingState());
    DioHelper.getData(path: "everything", queryParameters: {
      "q": search,
      "apiKey": "8f53df97d6b048aaa75e8d25b6cb608b"
    }).then((value) {
      searchModel = NewsModel.fromJson(value?.data);
      print(searchModel?.articles[22].title);
      emit(SearchNewsSuccessState());
    }).catchError((error) {
      emit(SearchNewsFailureState());
    });
  }

  getWebView({required String url}) async {
    await launchUrl(Uri.parse(url));
    emit(GetWebviewState());
  }

  bool isDark = CacheHelper.get(key: "isDark") ?? false;
  changeThemeMode() {
    isDark = !isDark;
    CacheHelper.setBool(key: "isDark", value: isDark);
    emit(ChangeThemeModeState());
  }
}
