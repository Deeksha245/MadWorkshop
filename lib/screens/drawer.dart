import 'package:flutter/material.dart';
import 'form_controls.dart';
import 'hello_world.dart';
import 'snackbar.dart';
import 'textfield.dart';
class DrawerPage extends StatelessWidget {
const DrawerPage({super.key});
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: const Text('Drawer Program'),
),
drawer: const AppDrawer(),
body: const Center(
child: Text(
'Open the Drawer using the menu icon',
style: TextStyle(
fontSize: 20,
),
textAlign: TextAlign.center,
),
),
);
}
}
class AppDrawer extends StatelessWidget {
const AppDrawer({super.key});
@override
Widget build(BuildContext context) {
return Drawer(
child: ListView(
padding: EdgeInsets.zero,
children: [
DrawerHeader(
decoration: const BoxDecoration(
color: Colors.blue,
),
child: const Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Icon(
Icons.account_circle,
size: 60,
color: Colors.white,
),
SizedBox(height: 10),
Text(
'Flutter Workshop',
style: TextStyle(
color: Colors.white,
fontSize: 22,
fontWeight: FontWeight.bold,
),
),
],
),
),
ListTile(
leading: const Icon(Icons.home),
title: const Text('Home'),
onTap: () {
Navigator.pop(context);
Navigator.popUntil(context, (route) => route.isFirst);
},
),
const Divider(),
const Padding(
padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
child: Text(
'Screens',
style: TextStyle(
fontWeight: FontWeight.bold,
color: Colors.grey,
),
),
),
ListTile(
leading: const Icon(Icons.waving_hand),
title: const Text('Hello World'),
onTap: () {
Navigator.pop(context);
Navigator.push(
context,
MaterialPageRoute(
builder: (context) => const HelloWorldScreen(),
),
);
},
),
ListTile(
leading: const Icon(Icons.smart_button),
title: const Text('Button & SnackBar'),
onTap: () {
Navigator.pop(context);
Navigator.push(
context,
MaterialPageRoute(
builder: (context) => const SnackBarProgram(),
),
);
},
),
ListTile(
leading: const Icon(Icons.text_fields),
title: const Text('TextField Example'),
onTap: () {
Navigator.pop(context);
Navigator.push(
context,
MaterialPageRoute(
builder: (context) => const TextFieldProgram(),
),
);
},
),
ListTile(
leading: const Icon(Icons.assignment_outlined),
title: const Text('Form Controls'),
onTap: () {
Navigator.pop(context);
Navigator.push(
context,
MaterialPageRoute(
builder: (context) => const FormControlsPage(),
),
);
},
),
const Divider(),
ListTile(
leading: const Icon(Icons.person),
title: const Text('Profile'),
onTap: () {
Navigator.pop(context);
ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(
content: Text('Profile clicked'),
),
);
},
),
ListTile(
leading: const Icon(Icons.settings),
title: const Text('Settings'),
onTap: () {
Navigator.pop(context);
ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(
content: Text('Settings clicked'),
),
);
},
),
ListTile(
leading: const Icon(Icons.info),
title: const Text('About'),
onTap: () {
Navigator.pop(context);
ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(
content: Text('About clicked'),
),
);
},
),
],
),
);
}
}