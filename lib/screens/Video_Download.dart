import 'package:flutter/material.dart';

class VideoDownloadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0a0a0a), Color(0xFF2b0000), Color(0xFF000000)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 40),

              Row(
                children: const [
                  Icon(Icons.arrow_back, color: Colors.white),
                  SizedBox(width: 8),
                  Text("Back", style: TextStyle(color: Colors.white)),
                ],
              ),

              const SizedBox(height: 20),

              const Text(
                "Video Download",
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const Text("VID-2026-002", style: TextStyle(color: Colors.white70)),

              const SizedBox(height: 20),

              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 190,
                      color: Colors.grey[900], // بدل الصورة
                    ),
                    const Icon(Icons.play_circle_fill, color: Colors.redAccent, size: 70),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              const Text(
                "Captured on January 14, 2026",
                style: TextStyle(color: Colors.white70),
              ),

              const SizedBox(height: 20),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFc62828), Color(0xFFff1744)],
                  ),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Center(
                  child: Text("Download Video",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),

              const SizedBox(height: 25),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  children: const [
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Text("Resolution", style: TextStyle(color: Colors.white70)),
                      Text("1280x720", style: TextStyle(color: Colors.white)),
                    ]),
                    SizedBox(height: 8),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Text("Duration", style: TextStyle(color: Colors.white70)),
                      Text("0:10", style: TextStyle(color: Colors.white)),
                    ]),
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