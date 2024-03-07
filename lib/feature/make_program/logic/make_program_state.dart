part of 'make_program_cubit.dart';

@immutable
abstract class MakeProgramState {}

class MakeProgramInitial extends MakeProgramState {}
class GetPlacesStateError extends MakeProgramState {}
class GetPlacesStateSuccess extends MakeProgramState {}
