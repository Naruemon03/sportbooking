import 'package:flutter/material.dart';
import 'signup.dart'; 
import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Play Rent',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const LoginScreen(),
    );
  }
}

// ✅ เพิ่ม MainScreen เพื่อให้ Log out กลับมาที่หน้าแรก
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginScreen(); // เมื่อ Log out กลับมาที่ Login
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // ✅ สร้าง Controller เพื่อเก็บค่าที่ผู้ใช้ป้อน
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              Image.asset(
                'assets/images/logo.png',
                height: 200,
              ),
              const SizedBox(height: 10),
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
                    const Center(
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // ✅ ช่องกรอก Email
                    const Text("Email", style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email),
                        hintText: "Enter Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),

                    // ✅ ช่องกรอก Password
                    const Text("Password", style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        hintText: "Enter Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // ✅ ปุ่ม Login
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          String email = emailController.text;
                          String password = passwordController.text;

                          if (email.isEmpty || password.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Please fill all fields!')),
                            );
                            return;
                          }

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
                        child: const Text("Login", style: TextStyle(fontSize: 18, color: Colors.white)),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // ✅ ลิงก์ไปหน้า Sign Up
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SignUpScreen()),
                          );
                        },
                        child: const Text.rich(
                          TextSpan(
                            text: "Don't have an account? ",
                            children: [
                              TextSpan(
                                text: "Sign up",
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
