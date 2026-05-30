import 'package:expense_tracker_app/Home_Screen.dart';
import 'package:expense_tracker_app/features/auth/provider/auth_provider.dart';
import 'package:expense_tracker_app/features/auth/screens/forgot_screen.dart';
import 'package:expense_tracker_app/features/auth/screens/signup_screen.dart';
import 'package:expense_tracker_app/features/widgets/custome_ElevetedButton.dart';
import 'package:expense_tracker_app/features/widgets/custome_Textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
          child: SingleChildScrollView(
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
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green.withOpacity(0.2),
                          offset: Offset(1, 1),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(Icons.wallet, size: 40, color: Colors.green),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Welcome Back",
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),

                  Text(
                    "Login to your account",
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
                        const SizedBox(height: 8),
                        //Forgot Password
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ForgotScreen(),
                                ),
                              );
                            },
                            child: Text(
                              "Forgot Password?",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Login BUTTON
                        Consumer<AuthProvider>(
                          builder: (context, provider, child) {
                            return provider.isLoading
                                ? Center(
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.green,
                                      ),
                                    ),
                                  )
                                : AppElevatedButton(
                                    onPressed: () async {
                                      try {
                                        await provider.login(
                                          email: emailcontroller.text.trim(),
                                          password: passwordcontroller.text
                                              .trim(),
                                        );
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            duration: Duration(seconds: 2),
                                            content: Text(
                                              "Login Sucuessfully",
                                              style: GoogleFonts.poppins(
                                                color: Colors.white,
                                              ),
                                            ),
                                            backgroundColor: Colors.green,
                                          ),
                                        );
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => HomeScreen(),
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
                                    ButtonText: "Login",
                                    width: 370,
                                    height: 55,
                                    ContainerColor: Colors.green,
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
                        "Don't have an account?",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 2),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignupScreen(),
                            ),
                          );
                        },
                        child: Text(
                          " Sing Up",
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
    ;
  }
}
