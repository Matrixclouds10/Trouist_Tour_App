part of 'booking_cubit.dart';

@immutable
abstract class BookingState {}

class BookingInitial extends BookingState {}
class PutState extends BookingState {}
class GetBookingProgramsState extends BookingState {}
class GetCanceledProgramsSuccessState extends BookingState {}
class BookingProgramsSuccessState extends BookingState {}
class BookingProgramsErrorState extends BookingState {}
class GetCanceledProgramsErrorState extends BookingState {}
class GetBookingProgramsErrorState extends BookingState {}
class PaymentLoadingState extends BookingState {}
class PaymentSuccessState extends BookingState {}
class PaymentErrorState extends BookingState {}
