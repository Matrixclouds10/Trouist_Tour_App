
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_tour_app/core/resources/data_state.dart';


@immutable
abstract class BaseEvents {
  Stream<DataState> applyAsync(
      {required DataState currentState,
      required Bloc<BaseEvents, DataState> bloc});
}
