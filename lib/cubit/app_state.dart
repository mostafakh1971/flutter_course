part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class ChangeIndexState extends AppState {}

class GetSportNewsLoadingState extends AppState {}

class GetSportNewsSuccessState extends AppState {}

class GetSportNewsFailureState extends AppState {}

class GetBusinessNewsLoadingState extends AppState {}

class GetBusinessNewsSuccessState extends AppState {}

class GetBusinessNewsFailureState extends AppState {}

class GetOtherNewsLoadingState extends AppState {}

class GetOtherNewsSuccessState extends AppState {}

class GetOtherNewsFailureState extends AppState {}

class SearchNewsLoadingState extends AppState {}

class SearchNewsSuccessState extends AppState {}

class SearchNewsFailureState extends AppState {}

class GetWebviewState extends AppState {}

class ChangeThemeModeState extends AppState {}
