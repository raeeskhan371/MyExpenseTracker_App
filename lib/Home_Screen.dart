import 'package:expense_tracker_app/features/auth/provider/auth_provider.dart';
import 'package:expense_tracker_app/features/auth/screens/login_screen.dart';
import 'package:expense_tracker_app/features/widgets/custome_ElevetedButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.green,
              ),
              width: double.infinity,
              height: 500,

              child: Center(
                child: Text(
                  "Welcome to MyexpenseTracker",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Consumer<AuthProvider>(
              builder: (context, provider, child) {
                return provider.isLoading
                    ? CircularProgressIndicator()
                    : AppElevatedButton(
                        ButtonText: "Logout",
                        width: double.infinity,
                        height: 60,
                        ContainerColor: Colors.blueAccent,
                        borderRadius: 20,
                        TextColor: Colors.white,
                        fontSize: 20,
                        onPressed: () async {
                          try {
                            await provider.logout();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Account is Logout Sucessfully!",
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => LoginScreen()),
                            );
                          } catch (e) {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  e.toString(),
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
