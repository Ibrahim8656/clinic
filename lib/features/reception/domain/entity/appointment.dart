class Appointment {
  final int id;
  final String veisit_type;
  final String name;
    final int age;
  final String gender;
  final String address;
  final String phone;
  final String job;

  Appointment(  {
    required this.id,
   required this.name,
   required this.age,
   required this.gender, 
   required this.address, 
   required this.phone, 
   required this.job,
   required this.veisit_type,

   });

  Map<String, dynamic> toMap() {
    return {
      'id':id,
      'name':name,
      'visit_type': veisit_type,
      'age': age,
      'gender': gender,
      'address': address,
      'phone': phone,
      'job': job,
      
    };
  }
    factory Appointment.fromMap(Map<String, dynamic> map) {
  return Appointment(
    id: map['id'],
    name: map['name']?.toString() ?? '',  // Convert to String if it's not null
    age: map['age'] is int ? map['age'] as int : (map['age'] as double).toInt(),
    gender: map['gender']?.toString() ?? '',  // Convert to String if it's not null
    address: map['address']?.toString() ?? '', // Handle null and ensure it's a String
    phone: map['phone']?.toString() ?? '',  // Handle phone field, ensure it's a String
    job: map['job']?.toString() ?? '',
     veisit_type:map['visit_type']?.toString()??"",  // Handle job field, ensure it's a String
  );
}
}
