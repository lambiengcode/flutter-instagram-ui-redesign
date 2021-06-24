import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'count_bloc_event.dart';
part 'count_bloc_state.dart';

class CountBlocBloc extends Bloc<CountBlocEvent, CountBlocState> {
  CountBlocBloc() : super(CountBlocInitial());

  @override
  Stream<CountBlocState> mapEventToState(
    CountBlocEvent event,
  ) async* {}
}
