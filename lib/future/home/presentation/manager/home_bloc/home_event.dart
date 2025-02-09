part of 'home_bloc.dart';

abstract class HomeEvent {}

class ExpandMentionsEvent extends HomeEvent {
  bool expandMentions;
  ExpandMentionsEvent(this.expandMentions);
}

class ExpandUnreadEvent extends HomeEvent {
  bool expandUnread;
  ExpandUnreadEvent(this.expandUnread);
}

class ExpandChannelEvent extends HomeEvent {
  bool expandChannel;
  ExpandChannelEvent(this.expandChannel);
}

class ExpandMessageEvent extends HomeEvent {
  bool expandMessage;
  ExpandMessageEvent(this.expandMessage);
}

class CategoryChangeEvent extends HomeEvent {
  int oldIndex;
  int newIndex;

  CategoryChangeEvent({
    required this.newIndex,
    required this.oldIndex,
  });
}
