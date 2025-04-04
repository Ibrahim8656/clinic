import 'package:flutter/material.dart';



class MyAppd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Table Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // List to hold the rows
  List<Map<String, String>> treatments = [
    {
      "treatment": "BRUFEN SYRP",
      "dosage": "بالقم 3 سم عند النوم",
      "notes": "Notes",
    },
    {
      "treatment": "Augmentin 312 mg suspension",
      "dosage": "بالجرعة 3.5 سم بالقم كل 8 ساعات",
      "notes": "Notes",
    },
   
  ];

  final _treatmentController = TextEditingController();
  final _dosageController = TextEditingController();
  final _notesController = TextEditingController();

  // Method to add a row
  void addRow() {
    setState(() {
      treatments.add({
        "treatment": _treatmentController.text,
        "dosage": _dosageController.text,
        "notes": _notesController.text,
      });
    });

    // Clear the input fields
    _treatmentController.clear();
    _dosageController.clear();
    _notesController.clear();
  }

  // Method to delete a row
  void deleteRow(int index) {
    setState(() {
      treatments.removeAt(index);
    });
  }

  // Method to edit a row
  void editRow(int index) {
    _treatmentController.text = treatments[index]['treatment']!;
    _dosageController.text = treatments[index]['dosage']!;
    _notesController.text = treatments[index]['notes']!;
    
    // Delete the selected row for editing
    deleteRow(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Treatment Table Example"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Table to display the treatments
          SizedBox(height: 20),
            
            // Text fields to add a new row
            TextField(
              controller: _treatmentController,
              decoration: InputDecoration(labelText: 'Treatment'),
            ),
            TextField(
              controller: _dosageController,
              decoration: InputDecoration(labelText: 'Dosage'),
            ),
            TextField(
              controller: _notesController,
              decoration: InputDecoration(labelText: 'Notes'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: addRow,
              child: Text('Add Row'),
            ),
          ],
        ),
      ),
    );
  }
}
