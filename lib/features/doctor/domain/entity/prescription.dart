class Prescription {
  final int patinet_id;
  final String treatment;
  final String doasage;
  final String note;
  Prescription({
    required this.patinet_id,
    required this.treatment,
    required this.doasage,
    required this.note,
  });

  Map<String, dynamic> toMap() {
    return {
      'patinet_id': patinet_id,
      'treatment': treatment,
      'doasage': doasage,
      'note': note,
    };
  }

  factory Prescription.fromMap(Map<String, dynamic> map) {
    return Prescription(
      patinet_id: map['patinet_id'],
      treatment: map['treatment'] ?? '', // Convert to String if it's not null
      doasage: map['doasage'],
      note: map['note'] ?? '', // Convert to String if it's not null
    );
  }
}
class PreparedPrescription {
  final String title;
  final String treatment;
  final String doasage;
  final String note;
  PreparedPrescription({
    required this.title,
    required this.treatment,
    required this.doasage,
    required this.note,
  });

  Map<String, dynamic> toMap() {
    return {
      'title':title,
      'treatment': treatment,
      'dosage': doasage,
      'note': note,
    };
  }

  factory PreparedPrescription.fromMap(Map<String, dynamic> map) {
    return PreparedPrescription(
      treatment: map['treatment'] ?? '', // Convert to String if it's not null
      doasage: map['dosage'],
      note: map['note'] ?? '', 
      title:map['title'] , // Convert to String if it's not null
    );
  }
}
