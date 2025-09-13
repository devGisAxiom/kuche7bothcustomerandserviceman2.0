import 'package:flutter/material.dart';
import 'package:flutter_application_1/customer/povider/loginprovider.dart';
import 'package:flutter_application_1/customer/screen/homepage.dart';
import 'package:flutter_application_1/core/utils/appcolor.dart';

import 'package:flutter_application_1/serviceman/view/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_1/customer/widget/customemlogintextbutton.dart';
import 'package:flutter_application_1/customer/widget/loginbutton.dart';
import 'package:provider/provider.dart';

enum UserType { serviceMan, customer }

extension UserTypeExtension on UserType {
  int get value {
    switch (this) {
      case UserType.serviceMan:
        return 1;
      case UserType.customer:
        return 2;
    }
  }
}

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showRole = false;
  UserType selectedRole = UserType.customer;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    // Always dispose controllers
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final kuchi7Provider = Provider.of<Kuchi7>(context);
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          SizedBox.expand(
            child: Image.asset('assets/img1.png', fit: BoxFit.cover),
          ),

          // Login Form
          if (!showRole)
            Positioned(
              top: 160,
              left: 43,
              right: 43,
              child: Container(
                width: 290,
                height: 388,
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Column(
                  children: [
                    Image.asset('assets/kuche.png', height: 50),
                    const SizedBox(height: 20),
                    CustomTextField(
                      controller: emailController,
                      label: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      hintText: "Enter your email",
                    ),
                    const SizedBox(height: 28),
                    CustomTextField(
                      controller: passwordController,
                      label: 'Password',
                      obscureText: true,
                      hintText: "Enter your Password",
                    ),
                    const SizedBox(height: 35),
                    PrimaryButton(
                      label: 'Login',
                      onPressed: () {
                        setState(() {
                          showRole = true;
                        });
                      },
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ),

          // Role Selection
          if (showRole)
            Positioned(
              top: 160,
              left: 43,
              right: 43,
              child: Container(
                width: 290,
                height: 291,
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(1, 5),
                      blurRadius: 8,
                      color: AppColors.black1A,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      'Select User Type',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        height: 1,
                        letterSpacing: -0.3,
                        color: AppColors.grey545562,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Radio Buttons - Compact & Styled
                    Theme(
                      data: Theme.of(context).copyWith(
                        radioTheme: RadioThemeData(
                          fillColor: WidgetStateProperty.resolveWith(
                            (states) =>
                                states.contains(WidgetState.selected)
                                    ? AppColors.redE53935
                                    : AppColors
                                        .greyB6, //const Color(0xFFB6B6B6),
                          ),
                        ),
                      ),
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customRadio(UserType.serviceMan, selectedRole, (
                                value,
                              ) {
                                setState(() {
                                  selectedRole = value!;
                                });
                              }, 'Service Man'),
                              customRadio(UserType.customer, selectedRole, (
                                value,
                              ) {
                                setState(() {
                                  selectedRole = value!;
                                });
                              }, 'Customer'),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),
                    PrimaryButton(
                      label: "Cancel",
                      onPressed: () {
                        setState(() {
                          showRole = false;
                        });
                        // print("Cancel Pressed $selectedRole");
                      },
                      backgroundColor: AppColors.grey7F,
                    ),
                    const SizedBox(height: 10),
                    PrimaryButton(
                      label: "Ok",
                      onPressed: () async {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (_) => HomeScreen()),
                        // );
                        print(
                          "Selected Role Value: ${selectedRole.value}/n email : ${emailController.text}/n password : ${passwordController.text}",
                        );
                        await kuchi7Provider.login(
                          emailController.text,
                          passwordController.text,
                          selectedRole.value,
                        );

                        // if (kuchi7Provider.loginData!.userType == 1) {
                        //   // ServiceMan
                        //   Navigator.of(context).pushAndRemoveUntil(
                        //     MaterialPageRoute(
                        //       builder: (context) => HomePage(),
                        //     ), // ServiceMan Home
                        //     (Route<dynamic> route) => false,
                        //   );
                        // } else if (kuchi7Provider.loginData!.userType == 2) {
                        //   // Customer
                        //   Navigator.of(context).pushAndRemoveUntil(
                        //     MaterialPageRoute(
                        //       builder: (context) => HomeScreen(),
                        //     ), // Customer Home
                        //     (Route<dynamic> route) => false,
                        //   );
                        // } else {
                        //   Navigator.pop(context); // Unknown user type
                        // }
                        final loginData = kuchi7Provider.loginData;

                        if (loginData == null) {
                          // maybe show loading or error
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Login data not available"),
                            ),
                          );
                          return;
                        }

                        if (loginData.userType == 1) {
                          // ServiceMan
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => HomePage()),
                            (Route<dynamic> route) => false,
                          );
                        } else if (loginData.userType == 2) {
                          // Customer
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                            (Route<dynamic> route) => false,
                          );
                        } else {
                          Navigator.pop(context); // Unknown user type
                        }
                      },
                      backgroundColor: AppColors.redE53935,
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// Enum for user types
//enum UserType { serviceMan, customer }

UserType? selectedRole = UserType.serviceMan; // initial selection

Widget customRadio(
  UserType value,
  UserType? groupValue,
  void Function(UserType?) onChanged,
  String label,
) {
  final isSelected = value == groupValue;

  return InkWell(
    onTap: () => onChanged(value),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color:
                    AppColors
                        .greyD1, //const Color(0xFFD1D1E0), // outer ring color
                width: 2,
              ),
            ),
            child: Center(
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color:
                      isSelected
                          ? AppColors.redE53935
                          : AppColors.transparent, //Colors.transparent,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              letterSpacing: -0.3,
              color: AppColors.grey545562,
            ),
          ),
        ],
      ),
    ),
  );
}
