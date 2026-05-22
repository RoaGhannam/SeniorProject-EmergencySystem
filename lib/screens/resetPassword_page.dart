import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class ResetPasswordPage extends StatelessWidget {

  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final roleController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> resetPassword(BuildContext context) async {
    String email = emailController.text;
    String phone = phoneController.text;
    String role = roleController.text;
    String newPassword = passwordController.text;

    final db = FirebaseDatabase.instance.ref();
    final snapshot = await db.child("users").get();

    String userKey = "";
    bool isValid = false;

    if (snapshot.exists) {
      final data = snapshot.value as Map;

      data.forEach((key, value) {
        if (value["Email"] == email &&
            value["Phone"] == phone &&
            value["Role"] == role) {

          userKey = key;
          isValid = true;
        }
      });
    }

    if (isValid) {
      await db.child("users").child(userKey).update({
        "Password": newPassword,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Password updated successfully")),
      );

      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Information not correct")),
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
              Color(0xFF1a0000),
              Color(0xFF3b0000),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: SingleChildScrollView(
              child: Column(
                children: [

                  SizedBox(height: 40),

                  // 🔥 Title
                  Text(
                    "Reset Password",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "Verify your identity to continue",
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 13,
                    ),
                  ),

                  SizedBox(height: 40),

                  buildField("Email", emailController, Icons.email),
                  SizedBox(height: 15),

                  buildField("Phone Number", phoneController, Icons.phone),
                  SizedBox(height: 15),

                  buildField("Role", roleController, Icons.security),
                  SizedBox(height: 15),

                  buildField("New Password", passwordController, Icons.lock, isPassword: true),

                  SizedBox(height: 35),

                  // 🔴 زر أقوى
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFE53935),
                      minimumSize: Size(double.infinity, 55),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 10,
                      shadowColor: Colors.redAccent.withOpacity(0.6),
                    ),
                    onPressed: () {
                      resetPassword(context);
                    },
                    child: Text(
                      "RESET PASSWORD",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),

                  SizedBox(height: 15),

                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      "Back to Login",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),

                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // 🔥 Field محسن
  Widget buildField(String hint, TextEditingController controller, IconData icon, {bool isPassword = false}) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey),
        prefixIcon: Icon(icon, color: Colors.white70),
        filled: true,
        fillColor: Colors.black.withOpacity(0.4),
        contentPadding: EdgeInsets.symmetric(vertical: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}