import 'package:bloc/bloc.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<OffsetChangeEvent>(_changeOffset);
  }

  Future _changeOffset(OffsetChangeEvent event, emit) async {
    emit(OffsetChangedState(event.newOffset));
  }
}
