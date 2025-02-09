import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:slack_ui_homepage/future/home/models/category.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  List<Category> allCategories = [
    const Category(
      icon: Icons.style,
      title: "Catch Up",
      subtitle: "new",
      count: 4,
      id: 0,
    ),
    const Category(
      icon: Icons.chat_outlined,
      title: "Threads",
      subtitle: "new",
      count: 0,
      id: 1,
    ),
    const Category(
      icon: Icons.speaker_group_outlined,
      title: "Huddles",
      subtitle: "live",
      count: 0,
      id: 2,
    ),
    const Category(
      icon: Icons.bookmark_border_outlined,
      title: "Later",
      subtitle: "items",
      count: 4,
      id: 3,
    ),
    const Category(
      icon: Icons.send_outlined,
      title: "Drafts & Sent",
      subtitle: "item",
      count: 1,
      id: 4,
    ),
  ];

  HomeBloc() : super(HomeInitial()) {
    on<ExpandMentionsEvent>(_expandMentions);
    on<ExpandUnreadEvent>(_expandUnread);
    on<ExpandChannelEvent>(_expandChannel);
    on<ExpandMessageEvent>(_expandMessage);
    on<CategoryChangeEvent>(_categoryChange);
  }

  bool expandMentions = false;
  Future _expandMentions(ExpandMentionsEvent event, emit) async {
    expandMentions = event.expandMentions;
    emit(ExpandMentionsState());
  }

  bool expandUnread = false;
  Future _expandUnread(ExpandUnreadEvent event, emit) async {
    expandUnread = event.expandUnread;
    emit(ExpandUnreadState());
  }

  bool expandChannel = false;
  Future _expandChannel(ExpandChannelEvent event, emit) async {
    expandChannel = event.expandChannel;
    emit(ExpandChannelState());
  }

  bool expandMessage = false;
  Future _expandMessage(ExpandMessageEvent event, emit) async {
    expandMessage = event.expandMessage;
    emit(ExpandMessageState());
  }

  Future _categoryChange(CategoryChangeEvent event, emit) async {
    final Category category = allCategories.removeAt(event.oldIndex);
    allCategories.remove(category);
    allCategories.insert(event.newIndex, category);
    emit(CategoryChangeState());
  }
}
