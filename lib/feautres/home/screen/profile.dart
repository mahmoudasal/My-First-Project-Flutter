import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Profile',
          style: TextStyle(
            color: Color.fromARGB(255, 171, 153, 205),
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 243, 243, 243),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            color: Color.fromARGB(255, 243, 243, 243),
            child: Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  'https://i.pravatar.cc/150?img=8',
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Mahmoud Asal',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Mahmoudasal656@gmail.com',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 20),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('+201018766374'),
          ),
        ],
      ),
    );
  }
}
