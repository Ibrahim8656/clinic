import 'package:clinic/features/doctor/presentation/cubit/doctor_cubit.dart';
import 'package:flutter/material.dart';

class prescription_table extends StatelessWidget {
  const prescription_table({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: DataTable(
            columns: const [
              DataColumn(label: Text('Treatments')),
              DataColumn(label: Text('Dosage')),
              DataColumn(label: Text('Notes')),
              DataColumn(label: Text('Actions')),
            ],
            rows:
                DoctorCubit.get(context).treatments
                    .asMap()
                    .map((index, treatment) {
                      return MapEntry(
                        index,
                        DataRow(
                          cells: [
                            DataCell(Text(treatment['dosage']!)),
                            DataCell(Text(treatment['treatment']!)),
                            DataCell(
                              SizedBox(
                                width: 300,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    treatment['notes']!,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ),
                            DataCell(
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      DoctorCubit.get(
                                        context,
                                      ).deleteRow(index);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    })
                    .values
                    .toList(),
          ),
        ),
      ),
    );
  }
}

