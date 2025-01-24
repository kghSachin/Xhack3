import 'package:flutter/material.dart';
import 'package:frontend/features/auth/pages/sign_up.dart';
import 'package:frontend/widgets/custom_textfield.dart';
import 'package:frontend/widgets/global_variables.dart';

class SignIn extends StatelessWidget {
  static const String routeName = '/sign-in';
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sign In',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Row(
                spacing: 5,
                children: [
                  Text('Don\'t have an account?'),
                  GestureDetector(
                    child: Text(
                      'Sign Up!',
                      style: TextStyle(color: GlobalVariables.primaryColor),
                    ),
                    onTap: () => Navigator.pushNamed(context, SignUp.routeName),
                  ),
                ],
              ),
              SizedBox(height: 10),
              CustomTextfield(labelText: 'Phone Number'),
              SizedBox(width: 10),
              CustomTextfield(labelText: 'Password'),
              SizedBox(width: 10),
              Text(
                'Forgot your Password?',
                style: TextStyle(color: GlobalVariables.primaryColor),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: GlobalVariables.primaryColor,
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text('Sign In'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
