part of 'home_bloc.dart';

abstract class HomeEvent {}

class OffsetChangeEvent extends HomeEvent {
  double newOffset;
  OffsetChangeEvent(this.newOffset);
}
