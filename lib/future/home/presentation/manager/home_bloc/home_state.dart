part of 'home_bloc.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class OffsetChangedState extends HomeState {
  final double offset;
  OffsetChangedState(this.offset);
}

class FailureData extends HomeState {
  final String message;
  FailureData(this.message);
}

class LoadingData extends HomeState {}

class RequestUpdateApp extends HomeState {}
