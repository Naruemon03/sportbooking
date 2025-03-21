import 'package:flutter/material.dart';
import 'home_screen.dart';  // ✅ เพิ่ม import ไฟล์ HomeScreen

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              
              const Text(
                "Sign up",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                width: screenWidth > 600 ? 400 : screenWidth * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Email", style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email),
                        hintText: "Enter Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    
                    const Text("Password", style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        hintText: "Enter Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    
                    const Text("Confirm Password", style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        hintText: "Enter Confirm Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    
                    SizedBox(
  width: double.infinity,
  height: 50,
  child: ElevatedButton(
    onPressed: () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.red,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
    child: const Text("Sign up", style: TextStyle(fontSize: 18, color: Colors.white)),
  ),
),

                    
                    const SizedBox(height: 20),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context); // กลับไปหน้า Login
                        },
                        child: const Text.rich(
                          TextSpan(
                            text: "Already have an account? ",
                            children: [
                              TextSpan(
                                text: "Login",
                                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

