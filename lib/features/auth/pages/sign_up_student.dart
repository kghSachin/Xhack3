import 'package:flutter/material.dart';
import 'package:frontend/features/auth/pages/sign_in.dart';
import 'package:frontend/features/auth/services/auth_service.dart';
import 'package:frontend/widgets/custom_textfield.dart';
import 'package:frontend/widgets/global_variables.dart';

class SignUpStudent extends StatefulWidget {
  static const String routeName = '/sign-up-student';
  const SignUpStudent({super.key});

  @override
  State<SignUpStudent> createState() => _SignUpStudentState();
}

class _SignUpStudentState extends State<SignUpStudent> {
  final AuthService authService = AuthService();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  final List<String> genderItems = ["Male", "Female"];
  late String selectedGender = genderItems[0];

  final GlobalKey<FormState> _formKey = GlobalKey();

  void signUp({
    required String fullName,
    required String phoneNumber,
    required String password,
    required String gender,
    required String address,
    required String role,
  }) {
    authService.signUp(
      context: context,
      fullName: fullName,
      phoneNumber: phoneNumber,
      password: password,
      gender: gender,
      address: address,
      role: role,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
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
                        onTap: () =>
                            Navigator.pushNamed(context, SignIn.routeName),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  CustomTextfield(
                    labelText: 'Full Name',
                    controller: fullNameController,
                  ),
                  CustomTextfield(
                    labelText: 'Phone Number',
                    maxLength: 10,
                    textInputType: TextInputType.number,
                    controller: phoneNumberController,
                  ),
                  CustomTextfield(
                    labelText: 'Password',
                    obscureText: true,
                    controller: passwordController,
                  ),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                      labelText: 'Gender',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              BorderSide(color: GlobalVariables.primaryColor)),
                    ),
                    validator: (value) => value == null ? 'This field is required.' : null,
                    items: genderItems.map((String gender) {
                      return DropdownMenuItem(
                        value: gender,
                        child: Text(gender),
                      );
                    }).toList(),
                    onChanged: (String? newVal) {
                      setState(() {
                        selectedGender = newVal!;
                      });
                    },
                  ),
                  CustomTextfield(
                    labelText: 'Address',
                    controller: addressController,
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        signUp(
                          fullName: fullNameController.text,
                          phoneNumber: phoneNumberController.text,
                          password: passwordController.text,
                          gender: selectedGender,
                          address: addressController.text,
                          role: 'Student',
                        );
                      }
                    },
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
        ),
      ),
    );
  }
}
