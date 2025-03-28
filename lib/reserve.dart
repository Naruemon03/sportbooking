import 'package:flutter/material.dart';
import 'Chack.dart';
import 'home_screen.dart';
import 'main.dart';

class ReserveScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          _buildHeader(),
          Expanded(child: _buildReservationList(context)),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        currentIndex: 1,
        iconSize: 30,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          } else if (index == 2) {
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
    );
  }
 
  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [],
          ),
          SizedBox(height: 10),
          Image.asset('assets/images/logo.png', height: 100),
          Text(
            'PLAY RENT',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
 
  Widget _buildReservationList(BuildContext context) {
    List<Map<String, String>> reservations = [
      {
        'sport': 'Basketball',
        'time': '9.10 AM - 12.00 PM',
        'date': '10 May 2568',
        'icon': 'assets/images/sport_3343061.png'
      },
      {
        'sport': 'Football',
        'time': '11.00 AM - 14.00 PM',
        'date': '11 May 2568',
        'icon': 'assets/images/sport_3343061.png'
      },
      {
        'sport': 'Volleyball',
        'time': '9.10 AM - 12.00 PM',
        'date': '12 June 2568',
        'icon': 'assets/images/sport_3343061.png'
      },
    ];
 
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: reservations.length,
      itemBuilder: (context, index) {
        return _buildReservationCard(context, reservations[index]);
      },
    );
  }
 
  Widget _buildReservationCard(BuildContext context, Map<String, String> reservation) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChackPage()),
        );
      },
      child: Card(
        margin: EdgeInsets.only(bottom: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(reservation['icon']!, width: 40, height: 40),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        reservation['sport']!,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        reservation['time']!,
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        reservation['date']!,
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              Icon(Icons.arrow_forward_ios, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}
