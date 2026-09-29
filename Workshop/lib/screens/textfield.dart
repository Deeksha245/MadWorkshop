import 'package:flutter/material.dart';

class TextFieldProgram extends StatefulWidget {
  const TextFieldProgram({super.key});

  @override
  State<TextFieldProgram> createState() => _TextFieldProgramState();
}

class _TextFieldProgramState extends State<TextFieldProgram> {
  final TextEditingController textController = TextEditingController();
  String displayText = '';

  // Renamed from displayText to updateText to avoid naming conflict
  void updateText() {
    setState(() {
      displayText = textController.text;
    });
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextField & Button'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: textController,
              decoration: const InputDecoration(
                labelText: 'Enter text',
                hintText: 'Type something here',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              height: 55,
              child: ElevatedButton(
                onPressed: updateText, // Updated to use the renamed method
                child: const Text(
                  'Submit',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 20), // Added spacing for cleaner UI
            Text(
              displayText,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
