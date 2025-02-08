import 'package:bloc/bloc.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const MainState(0)) {
    on<MainEvent>((event, emit) {
      emit(MainState(event.newIndex));
    });
  }
}
