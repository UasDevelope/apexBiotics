part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class LoadHomeData extends HomeEvent {}
class AddMedication extends HomeEvent {
  final String day;
  final String time;

  const AddMedication(this.day, this.time);

  @override
  List<Object> get props => [day, time];
}