import 'package:bongokrishi/View/Location%20Set/locationPickerPage.dart';
import 'package:bongokrishi/View/Register/signUpPage.dart';
import 'package:flutter/material.dart';



class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool rememberMe = false;

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
                  'Login',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 40),
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
                  children: <Widget>[
                    Checkbox(
                      value: rememberMe,
                      onChanged: (bool? value) {
                        setState(() {
                          rememberMe = value!;
                        });
                      },
                    ),
                    Text('Remember me'),
                  ],
                ),
                SizedBox(height: 20),
                _buildNeumorphicButton(
                  text: 'Login',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LocationPickerPage()));
                  },
                ),
                SizedBox(height: 20),
                _buildNeumorphicButton(
                  text: 'Login with Google',
                  icon: Icons.login,
                  color: Colors.red,
                  onPressed: () {

                  },
                ),
                SizedBox(height: 20),
                Text('Don\'t have an account?'),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage()));
                  },
                  child: Text('Register'),
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
    IconData? icon,
    Color color = Colors.blue,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon, color: color),
              SizedBox(width: 10),
            ],
            Text(
              text,
              style: TextStyle(color: color, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
