import 'package:flutter/material.dart';

class DetectedFacesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0a0a0a), Color(0xFF2b0000), Color(0xFF000000)],
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
                "Detected Faces",
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const Text("INC-2026-002", style: TextStyle(color: Colors.white70)),

              const SizedBox(height: 10),

              const Text(
                "Faces automatically detected from captured video evidence",
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),

              const SizedBox(height: 12),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text("2 Faces Detected", style: TextStyle(color: Colors.white)),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: Row(
                  children: [
                    Expanded(child: faceCard("FACE-001")),
                    const SizedBox(width: 15),
                    Expanded(child: faceCard("FACE-002")),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget faceCard(String id) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Container(
            height: 120,
            decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
          ),
          const SizedBox(height: 10),
          Text(id,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          const Text("Detected at 14:23:15",
              style: TextStyle(color: Colors.white70, fontSize: 11)),
        ],
      ),
    );
  }
}