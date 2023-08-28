import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/news/news_event.dart';
import 'package:news_app/bloc/news/news_state.dart';
import 'package:news_app/data/model/news_list/news_list.dart';
import 'package:news_app/repository/news/news_repo_imp.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final _newsRepo = NewsRepoImp();

  NewsBloc() : super(NewsInitial()) {
    on<NewsFetchDataEvent>(_fetchNewsList);
  }

  FutureOr<void> _fetchNewsList(
      NewsEvent event, Emitter<NewsState> emit) async {
    if (event is NewsFetchDataEvent) {
      emit(NewsPageLoading());
      await _newsRepo
          .getNewsData(event.category)
          .onError((error, stackTrace) => emit(NewsPageError(error.toString())))
          .then((value) {
        NewsListMain list = NewsListMain.fromJson(value);
        if (list.status == 'ok') {
          emit(NewsPageLoaded(list));
        } else {
          emit(NewsPageError(list.message));
        }
      });
    }
  }
}
