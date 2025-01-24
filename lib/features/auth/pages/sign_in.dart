import 'package:flutter/material.dart';
import 'package:frontend/features/auth/pages/sign_up_student.dart';
import 'package:frontend/features/auth/pages/sign_up_teacher.dart';
import 'package:frontend/widgets/custom_textfield.dart';
import 'package:frontend/widgets/global_variables.dart';

class SignIn extends StatefulWidget {
  static const String routeName = '/sign-in';
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  List<bool> isSelected = [true, false];
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
              const SizedBox(height: 20),
              Text(
                'Sign In',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Center(
                child: ToggleButtons(
                  borderColor: Colors.white,
                  fillColor: GlobalVariables.primaryColor,
                  borderWidth: 2,
                  selectedBorderColor: Colors.white,
                  selectedColor: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  onPressed: (int index) {
                    setState(() {
                      for (int i = 0; i < isSelected.length; i++) {
                        isSelected[i] = i == index;
                      }
                    });
                  },
                  isSelected: isSelected,
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text("Student"),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text("Teacher"),
                    ),
                  ],
                ),
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
              SizedBox(height: 5),
              Row(
                spacing: 5,
                children: [
                  Text('Don\'t have an account?'),
                  GestureDetector(
                    child: Text(
                      'Sign Up!',
                      style: TextStyle(color: GlobalVariables.primaryColor),
                    ),
                    onTap: () {
                      if (isSelected[0]) {
                        Navigator.pushNamed(context, SignUpStudent.routeName);
                      } else {
                        Navigator.pushNamed(context, SignUpTeacher.routeName);
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
