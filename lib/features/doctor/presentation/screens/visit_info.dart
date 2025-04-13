import 'package:clinic/features/doctor/presentation/widgets/add_prescription.dart';
import 'package:clinic/features/doctor/presentation/widgets/prepeard_prescriptions.dart';
import 'package:clinic/features/doctor/presentation/widgets/table.dart';
import 'package:clinic/features/reception/domain/entity/appointment.dart';
import 'package:flutter/material.dart';

class visit_info extends StatelessWidget {
  const visit_info({
    super.key,
    required this.medicines,
    required this.patient,
  });

  final List<String> medicines;
  final Appointment patient;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          prepeared_prescriptons(),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: add_prescription(
              context: context,
              medicines: medicines,
              patinet_id: patient.id,
            ),
          ),
          SizedBox(height: 20),
          prescription_table(),
        ],
      ),
    );
  }
}
