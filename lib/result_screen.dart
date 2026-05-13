import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  var result;

  ResultScreen(this.result);

  String getStatus() {
    if (result < 18.5) return "Underweight";
    if (result < 25) return "Normal";
    if (result < 30) return "Overweight";
    return "Obese";
  }

  String getMessage() {
    if (result < 18.5) return "You should eat a bit more.";
    if (result < 25) return "You have a healthy body weight.";
    if (result < 30) return "Try to exercise more.";
    return "Health risk is high. Take care!";
  }

  Color getColor() {
    if (result < 18.5) return Colors.orange;
    if (result < 25) return Colors.green;
    if (result < 30) return Colors.deepOrange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.orange.shade200, Colors.deepOrange.shade400],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Your Result",
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                width: 300,
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: [
                    Text(
                      getStatus(),
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: getColor(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      result.toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      getMessage(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text("Recalculate"),
            )
          ],
        ),
      ),
    );
  }
}