import 'package:flutter/material.dart';

@immutable
abstract class NewsEvent {}

class NewsFetchDataEvent extends NewsEvent {
  final String category;

  NewsFetchDataEvent({required this.category});
}
