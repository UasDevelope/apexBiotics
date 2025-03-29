part of 'home_bloc.dart';

class HomeState extends Equatable {
  final String userName;
  final List<Map<String, dynamic>> medications;
  final String status;

  const HomeState({
    this.userName = 'Max',
    this.medications = const [],
    this.status = 'initial',
  });

  HomeState copyWith({
    String? userName,
    List<Map<String, dynamic>>? medications,
    String? status,
  }) {
    return HomeState(
      userName: userName ?? this.userName,
      medications: medications ?? this.medications,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [userName, medications, status];
}