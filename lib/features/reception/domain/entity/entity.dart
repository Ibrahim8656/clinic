class Patient {
  final String name;
  final int age;
  final String gender;
  final String address;
  final String phone;
  final String job;

  Patient( {
    required this.name,
    required this.age,
    required this.gender,
    required this.address,
    required this.phone,
    required this.job, 
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'gender': gender,
      'address': address,
      'phone':phone,
      'job':job
    };
  }
  factory Patient.fromMap(Map<String, dynamic> map) {
  return Patient(
    name: map['name']?.toString() ?? '',  // Convert to String if it's not null
    age: map['age'] is int ? map['age'] as int : (map['age'] as double).toInt(),
    gender: map['gender']?.toString() ?? '',  // Convert to String if it's not null
    address: map['address']?.toString() ?? '', // Handle null and ensure it's a String
    phone: map['phone']?.toString() ?? '',  // Handle phone field, ensure it's a String
    job: map['job']?.toString() ?? '',  // Handle job field, ensure it's a String
  );
}

}
