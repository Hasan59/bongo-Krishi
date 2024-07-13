import 'package:flutter/material.dart';


class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String userType = 'user';
  String? selectedCategory;
  final categories = ['Harvester', 'Powertriller'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE0E0E0), // Light background color
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 40),
                _buildNeumorphicTextField(
                  icon: Icons.person,
                  labelText: 'Username',
                ),
                SizedBox(height: 20),
                _buildNeumorphicTextField(
                  icon: Icons.email,
                  labelText: 'Email',
                ),
                SizedBox(height: 20),
                _buildNeumorphicTextField(
                  icon: Icons.lock,
                  labelText: 'Password',
                  obscureText: true,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('I am a:'),
                    SizedBox(width: 20),
                    Row(
                      children: [
                        Radio<String>(
                          value: 'user',
                          groupValue: userType,
                          onChanged: (value) {
                            setState(() {
                              userType = value!;
                            });
                          },
                        ),
                        Text('User'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio<String>(
                          value: 'provider',
                          groupValue: userType,
                          onChanged: (value) {
                            setState(() {
                              userType = value!;
                            });
                          },
                        ),
                        Text('Provider'),
                      ],
                    ),
                  ],
                ),
                if (userType == 'provider') ...[
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFE0E0E0),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade500,
                          offset: Offset(4, 4),
                          blurRadius: 15,
                          spreadRadius: 1,
                        ),
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(-4, -4),
                          blurRadius: 15,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Color(0xFFE0E0E0),
                      ),
                      hint: Text('Select Category'),
                      value: selectedCategory,
                      onChanged: (newValue) {
                        setState(() {
                          selectedCategory = newValue;
                        });
                      },
                      items: categories.map((category) {
                        return DropdownMenuItem<String>(
                          value: category,
                          child: Text(category),
                        );
                      }).toList(),
                    ),
                  ),
                ],
                SizedBox(height: 20),
                _buildNeumorphicButton(
                  text: 'Register',
                  onPressed: () {
                    // Add register logic here
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNeumorphicTextField({
    required IconData icon,
    required String labelText,
    bool obscureText = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFE0E0E0),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            offset: Offset(4, 4),
            blurRadius: 15,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(-4, -4),
            blurRadius: 15,
            spreadRadius: 1,
          ),
        ],
      ),
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Color(0xFFE0E0E0),
        ),
      ),
    );
  }

  Widget _buildNeumorphicButton({
    required String text,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFE0E0E0),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade500,
              offset: Offset(4, 4),
              blurRadius: 15,
              spreadRadius: 1,
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(-4, -4),
              blurRadius: 15,
              spreadRadius: 1,
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.blue, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
