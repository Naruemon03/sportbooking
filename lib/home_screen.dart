import 'package:flutter/material.dart';
import 'booking.dart'; // นำเข้าไฟล์ BookingScreen
import 'reserve.dart';  // ✅ นำเข้าไฟล์ ReserveScreen
import 'main.dart';  // ✅ นำเข้าไฟล์ MainScreen

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            // ✅ ไปหน้า ReserveScreen ถ้ากดปุ่ม Reserve
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ReserveScreen()),
            );
          } else if (index == 2) {
            // ✅ ไปหน้า MainScreen ถ้ากดปุ่ม Log out
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MainScreen()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Reserve"),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: "Log out"),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 40),
                Image.asset(
                  'assets/images/logo.png',
                  height: 80,
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Center(
            child: Text(
              "Sports Equipment",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(indent: 50, endIndent: 50, thickness: 1),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              children: [
                buildCategoryItem(context, "Football", "assets/images/football_1099672.png"),
                buildCategoryItem(context, "Basketball", "assets/images/basketball_7398946.png"),
                buildCategoryItem(context, "Shuttlecock", "assets/images/shuttlecock_3445599.png"),
                buildCategoryItem(context, "Volleyball", "assets/images/volleyball_1826550.png"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategoryItem(BuildContext context, String title, String imagePath) {
    return GestureDetector(
      onTap: () {
        if (title == "Basketball") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BookingScreen()),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, height: 60),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}


