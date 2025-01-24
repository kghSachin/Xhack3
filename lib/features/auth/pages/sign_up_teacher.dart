import 'package:flutter/material.dart';
import 'package:frontend/features/auth/pages/sign_in.dart';
import 'package:frontend/widgets/custom_textfield.dart';
import 'package:frontend/widgets/global_variables.dart';

class SignUpTeacher extends StatelessWidget {
  static const String routeName = '/sign-up-teacher';
  const SignUpTeacher({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sign Up',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Text('Already have an account?'),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    child: Text(
                      'Sign In!',
                      style: TextStyle(color: GlobalVariables.primaryColor),
                    ),
                    onTap: () => Navigator.pushNamed(context, SignIn.routeName),
                  ),
                ],
              ),
              SizedBox(height: 10),
              CustomTextfield(labelText: 'Full Name'),
              CustomTextfield(labelText: 'Phone Number'),
              CustomTextfield(labelText: 'Password'),
              CustomTextfield(labelText: 'Gender'),
              CustomTextfield(labelText: 'Subject'),
              CustomTextfield(labelText: 'Address'),
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
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
