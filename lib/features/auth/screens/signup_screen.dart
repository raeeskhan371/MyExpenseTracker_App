import 'package:expense_tracker_app/widgets/custome_ElevetedButton.dart';
import 'package:expense_tracker_app/widgets/custome_Textfield.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatelessWidget {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController ConfirmPasscontroller = TextEditingController();
  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey.shade200,
                  ),
                  child: Center(
                    child: Icon(Icons.wallet, size: 40, color: Colors.green),
                  ),
                ),
                Text(
                  "Create Account",
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),

                Text(
                  "Sign up to get started",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      AppTextformField(
                        controller: emailcontroller,
                        hintText: "Enter your email",
                        prefixIcon: Icons.mail,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Password",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      AppTextformField(
                        controller: passwordcontroller,
                        hintText: "Create a password",
                        prefixIcon: Icons.lock,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Confirm Password",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),

                      AppTextformField(
                        controller: ConfirmPasscontroller,
                        hintText: "Confirm your password",
                        prefixIcon: Icons.lock,
                      ),
                      const SizedBox(height: 16),
                      AppElevatedButton(
                        onPressed: () {},
                        ButtonText: "SIGN UP",
                        width: 350,
                        height: 60,
                        ContainerColor: Colors.blueAccent,
                        borderRadius: 10,
                        TextColor: Colors.white,
                        fontSize: 25,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(height: 1, width: 100, color: Colors.grey),
                    Text(
                      "or continue with",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                    Container(height: 1, width: 100, color: Colors.grey),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  height: 50,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 12,
                            ),
                            child: Image(
                              image: AssetImage("assets/google.png"),
                            ),
                          ),
                        ),
                        Text(
                          "Continue with Google",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 2),
                    Text(
                      "Login",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
