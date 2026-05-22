import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class SettingsPage extends StatefulWidget {
  final String userId; // 🔥 نمرر اليوزر الحالي

  SettingsPage({required this.userId});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool hasChanges() {
    return nameController.text.isNotEmpty ||
        phoneController.text.isNotEmpty ||
        emailController.text.isNotEmpty ||
        passwordController.text.isNotEmpty;
  }

  void handleSave() async {
    if (!hasChanges()) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          backgroundColor: Colors.black,
          title: Text("No Changes", style: TextStyle(color: Colors.white)),
          content: Text(
            "You didn’t modify anything",
            style: TextStyle(color: Colors.white70),
          ),
          actions: [
            TextButton(
              child: Text("OK", style: TextStyle(color: Colors.redAccent)),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
      );
    } else {
      final db = FirebaseDatabase.instance.ref();

      Map<String, dynamic> updatedData = {};

      if (nameController.text.isNotEmpty) {
        updatedData["Name"] = nameController.text;
      }

      if (phoneController.text.isNotEmpty) {
        updatedData["Phone"] = phoneController.text;
      }

      if (emailController.text.isNotEmpty) {
        updatedData["Email"] = emailController.text;
      }

      if (passwordController.text.isNotEmpty) {
        updatedData["Password"] = passwordController.text;
      }

      // ✅ التعديل على اليوزر الصحيح
      await db.child("users").child(widget.userId).update(updatedData);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("✅ Updated successfully"),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF000000),
              Color(0xFF140000),
              Color(0xFF2a0000),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: 40),

                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Text(
                      "RoadGuard",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),

                SizedBox(height: 10),

                Text(
                  "Profile Settings",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  "Manage your account information",
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 13,
                  ),
                ),

                SizedBox(height: 30),

                Center(
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.redAccent,
                    child: Icon(Icons.person, color: Colors.white, size: 40),
                  ),
                ),

                SizedBox(height: 30),

                buildField("Full Name", nameController, Icons.person),
                buildField("Phone Number", phoneController, Icons.phone),
                buildField("Email Address", emailController, Icons.email),
                buildField("Password", passwordController, Icons.lock),

                SizedBox(height: 25),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFE53935),
                    minimumSize: Size(double.infinity, 55),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: handleSave,
                  child: Text("Save Changes"),
                ),

                SizedBox(height: 10),

                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.white24),
                    minimumSize: Size(double.infinity, 55),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancel",
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildField(
      String title, TextEditingController controller, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            title,
            style: TextStyle(color: Colors.white70, fontSize: 13),
          ),

          SizedBox(height: 6),

          TextField(
            controller: controller,
            obscureText: title == "Password",
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: title,
              hintStyle: TextStyle(color: Colors.white38),
              prefixIcon: Icon(icon, color: Colors.white70),
              filled: true,
              fillColor: Colors.black.withOpacity(0.4),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}