import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<LoadHomeData>(_onLoadHomeData);
    on<AddMedication>(_onAddMedication);
  }

  Future<void> _onLoadHomeData(
      LoadHomeData event,
      Emitter<HomeState> emit,
      ) async {
    emit(state.copyWith(status: 'loading'));

    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));

    emit(state.copyWith(
      status: 'loaded',
      medications: [
        {'day': 'Monday', 'time': '9:00 AM', 'completed': false},
        {'day': 'Tuesday', 'time': 'Add medication', 'completed': false},
        {'day': 'Wednesday', 'time': 'Add medication', 'completed': false},
        {'day': 'Thursday', 'time': 'Off', 'completed': true},
        {'day': 'Friday', 'time': 'Off', 'completed': true},
      ],
    ));
  }

  Future<void> _onAddMedication(
      AddMedication event,
      Emitter<HomeState> emit,
      ) async {
    final updatedMedications = List<Map<String, dynamic>>.from(state.medications)
      ..add({
        'day': event.day,
        'time': event.time,
        'completed': false,
      });

    emit(state.copyWith(medications: updatedMedications));
  }
}