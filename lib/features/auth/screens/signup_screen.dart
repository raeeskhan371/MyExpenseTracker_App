import 'package:expense_tracker_app/Home_Screen.dart';
import 'package:expense_tracker_app/features/auth/provider/auth_provider.dart';
import 'package:expense_tracker_app/features/auth/screens/login_screen.dart';
import 'package:expense_tracker_app/widgets/custome_ElevetedButton.dart';
import 'package:expense_tracker_app/widgets/custome_Textfield.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatelessWidget {
  TextEditingController nameCoutroller = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController ConfirmPassController = TextEditingController();
  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,

              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.2),
                          offset: Offset(1, 1),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(Icons.wallet, size: 40, color: Colors.blue),
                    ),
                  ),
                  const SizedBox(height: 10),
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
                          "Full Name",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),

                        AppTextformField(
                          controller: nameCoutroller,
                          hintText: "Enter full name",
                          prefixIcon: Icons.person_2_outlined,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "Email",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        AppTextformField(
                          controller: emailController,
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
                          controller: passwordController,
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
                          controller: ConfirmPassController,
                          hintText: "Confirm your password",
                          prefixIcon: Icons.lock,
                        ),
                        const SizedBox(height: 16),

                        // SIGNUP BUTTON
                        Consumer<AuthProvider>(
                          builder: (context, provider, child) {
                            return provider.isLoading
                                ? Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.blue,
                                    ),
                                  )
                                : AppElevatedButton(
                                    onPressed: () async {
                                      try {
                                        await provider.singup(
                                          name: nameCoutroller.text,
                                          email: emailController.text,
                                          password: passwordController.text,
                                        );
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Text("Signup Successful"),
                                            backgroundColor: Colors.blue,
                                          ),
                                        );
                                      } catch (e) {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).hideCurrentSnackBar();
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Text(e.toString()),
                                            backgroundColor: Colors.red,
                                          ),
                                        );
                                      }
                                    },
                                    ButtonText: "SIGN UP",
                                    width: 370,
                                    height: 55,
                                    ContainerColor: Colors.blueAccent,
                                    borderRadius: 10,
                                    TextColor: Colors.white,
                                    fontSize: 25,
                                  );
                          },
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
                  // SINGIN WITH GOOGLE
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
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 2),
                      // LoginButton
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                        child: Text(
                          " Login",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                    ],
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
