part of 'home_bloc.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class ExpandMentionsState extends HomeState {}

class ExpandUnreadState extends HomeState {}

class ExpandChannelState extends HomeState {}

class ExpandMessageState extends HomeState {}

class CategoryChangeState extends HomeState {}
