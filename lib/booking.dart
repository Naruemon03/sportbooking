import 'package:flutter/material.dart';
import 'chack.dart'; // ✅ Import หน้า Check

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime? borrowDate;
  DateTime? returnDate;

  Future<void> _selectDate(BuildContext context, bool isBorrowDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        if (isBorrowDate) {
          borrowDate = picked;
        } else {
          returnDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Basketball",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              _buildTextField("Name", "Input Name"),
              _buildTextField("Student ID Number", "Input Student ID", color: Colors.red),
              _buildTextField("Phone Number", "0xx-xxx-xxxx"),
              _buildTextField("Quantity", "1"),

              Row(
                children: [
                  Expanded(
                    child: _buildDatePicker("Borrow Date", borrowDate, () {
                      _selectDate(context, true);
                    }),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: _buildDatePicker("Return Date", returnDate, () {
                      _selectDate(context, false);
                    }),
                  ),
                ],
              ),

              _buildTextField("Description", "", maxLines: 3),

              const SizedBox(height: 40),
              Center(
                child: SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // ✅ กดปุ่มแล้วเปลี่ยนไปหน้า ChackPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChackPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text("Confirm", style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint, {int maxLines = 1, Color color = Colors.black}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.bold, color: color)),
          TextField(
            maxLines: maxLines,
            decoration: InputDecoration(
              hintText: hint,
              border: const UnderlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDatePicker(String label, DateTime? date, VoidCallback onTap) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        InkWell(
          onTap: onTap,
          child: Row(
            children: [
              const Icon(Icons.calendar_today, color: Colors.black54),
              const SizedBox(width: 10),
              Text(
                date != null
                    ? "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}"
                    : "Select Date",
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
        const Divider(color: Colors.black54),
      ],
    );
  }
}
