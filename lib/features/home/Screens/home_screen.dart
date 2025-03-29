import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:apexbiotics/features/home/bloc/home_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../ core/constants/color_constant.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(LoadHomeData()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'APEX BIOTICS',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              color: ColorConstant.primaryColor,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello, ${state.userName}!',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Today',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildMedicationList(state),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildMedicationList(HomeState state) {
    return Expanded(
      child: ListView.separated(
        itemCount: state.medications.length,
        separatorBuilder: (context, index) => const Divider(height: 20),
        itemBuilder: (context, index) {
          final medication = state.medications[index];
          return ListTile(
            title: Text(
              medication['day'],
              style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              medication['time'],
              style: GoogleFonts.poppins(
                color:
                    medication['completed']
                        ? Colors.grey
                        : ColorConstant.primaryColor,
              ),
            ),
            trailing:
                medication['time'] == 'Add medication'
                    ? IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        // Show time picker dialog
                        _showTimePicker(context, medication['day']);
                      },
                    )
                    : null,
          );
        },
      ),
    );
  }

  void _showTimePicker(BuildContext context, String day) {
    showTimePicker(context: context, initialTime: TimeOfDay.now()).then((time) {
      if (time != null) {
        context.read<HomeBloc>().add(
          AddMedication(day, '${time.format(context)}'),
        );
      }
    });
  }
}
