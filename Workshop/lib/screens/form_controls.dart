import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: FormControlsPage(),
  ));
}

class FormControlsPage extends StatefulWidget {
  const FormControlsPage({super.key});

  @override
  State<FormControlsPage> createState() => _FormControlsPageState();
}

class _FormControlsPageState extends State<FormControlsPage> {
  final TextEditingController nameController = TextEditingController();
  
  String gender = "Male";
  bool isStudent = false;
  bool reading = false;
  bool sports = false;
  bool music = false; // Added missing music state variable
  String selectedCourse = "Flutter";

  void submitForm() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FormResultPage(
          name: nameController.text,
          gender: gender,
          isStudent: isStudent,
          reading: reading,
          sports: sports,
          music: music,
          course: selectedCourse, // Fixed parameter name to match FormResultPage
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Controls'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,//Align things inside the column to the left
          children: [
            const Text(
              'Name:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Enter your name',
                hintText: 'Type your name here',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'Gender:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            RadioListTile<String>(
              title: const Text('Male'),
              value: 'Male',
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value!;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Female'),
              value: 'Female',
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value!;
                });
              },
            ),
            const SizedBox(height: 20),//Gives some space between the gender selection and the next section
            CheckboxListTile(
              title: const Text('I am a student'),
              value: isStudent,
              onChanged: (value) {
                setState(() {
                  isStudent = value!;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Hobbies:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            CheckboxListTile(
              title: const Text('Sports'),
              value: sports,
              onChanged: (value) {
                setState(() {
                  sports = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Reading'),
              value: reading,
              onChanged: (value) {
                setState(() {
                  reading = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Music'),
              value: music,
              onChanged: (value) {
                setState(() {
                  music = value!;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Select Course:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DropdownButton<String>(
              value: selectedCourse,
              items: const [
                DropdownMenuItem(value: 'Flutter', child: Text('Flutter')),
                DropdownMenuItem(value: 'React', child: Text('React')),
                DropdownMenuItem(value: 'Angular', child: Text('Angular')),
              ],
              onChanged: (value) {
                setState(() {
                  selectedCourse = value!;
                });
              },
            ),
            const SizedBox(height: 30),
            Center(
              child: SizedBox(
                width: 200,
                height: 55,
                child: ElevatedButton(
                  onPressed: submitForm,
                  child: const Text(
                    'Submit',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class FormResultPage extends StatelessWidget {
  final String name;
  final String gender;
  final bool isStudent;
  final bool reading;
  final bool sports;
  final bool music;
  final String course;

  const FormResultPage({
    super.key,
    required this.name,
    required this.gender,
    required this.isStudent,
    required this.reading,
    required this.sports,
    required this.music,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    List<String> selectedHobbies = [];
    if (reading) selectedHobbies.add("Reading");
    if (sports) selectedHobbies.add("Sports");
    if (music) selectedHobbies.add("Music");

    return Scaffold(
      appBar: AppBar(
        title: const Text('Submitted details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: $name', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 15),
            Text('Gender: $gender', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 15),
            Text('Student: ${isStudent ? 'Yes' : 'No'}', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 15),
            Text(
              'Hobbies: ${selectedHobbies.isEmpty ? 'None' : selectedHobbies.join(", ")}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 15),
            Text('Selected Course: $course', style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
