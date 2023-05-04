import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isNotificationEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(
            color: Color.fromARGB(255, 171, 153, 205),
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 243, 243, 243),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Notifications',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SwitchListTile(
              title: Text('Enable Notifications'),
              activeColor: Color.fromARGB(255, 171, 153, 205),
              value: _isNotificationEnabled,
              onChanged: (bool value) {
                setState(() {
                  _isNotificationEnabled = value;
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              'Privacy',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            ListTile(
              title: Text('Change Password'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                // Navigate to change password page
              },
            ),
            ListTile(
              title: Text('Delete Account'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                // Show confirmation dialog to delete account
              },
            ),
          ],
        ),
      ),
    );
  }
}
