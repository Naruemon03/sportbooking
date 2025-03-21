import 'package:flutter/material.dart';
import 'home_screen.dart'; // ✅ เพิ่ม import ไฟล์ HomeScreen

class ChackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Reservation Details', style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(  // ✅ ใช้ ScrollView ป้องกัน Overflow
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name', style: TextStyle(color: Colors.grey)),
              Text('Kookkai Eakeak', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text('Student ID Number', style: TextStyle(color: Colors.redAccent)),
              Text('11651xxxxxxxx-x', style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              Text('Phone Number', style: TextStyle(color: Colors.redAccent)),
              Text('0xx-xxx-xxxx', style: TextStyle(fontSize: 18)),
              SizedBox(height: 20),
              Row(
                children: [
                  Text('Basketball', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(width: 5),
                  Text('\ud83c\udfc0', style: TextStyle(fontSize: 24)),
                ],
              ),
              SizedBox(height: 10),
              Text('Quantity', style: TextStyle(color: Colors.grey)),
              Text('1', style: TextStyle(fontSize: 18)),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTimeBox('Borrow', '9.10 AM\n10 May 2568'),
                  Icon(Icons.arrow_right_alt, size: 32),
                  _buildTimeBox('Return the item', '12.00 PM\n10 May 2568'),
                ],
              ),
              SizedBox(height: 20),
              Text('Description', style: TextStyle(color: Colors.grey)),
              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              SizedBox(height: 20), // ✅ เพิ่มระยะห่างก่อนปุ่ม
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.all(16),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()), // ✅ กลับไปหน้า HomeScreen
                    );
                  },
                  child: Text('Cancel reservation', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimeBox(String label, String time) {
    return Column(
      children: [
        Text(label, style: TextStyle(color: Colors.redAccent)),
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(time, textAlign: TextAlign.center),
        ),
      ],
    );
  }
}
