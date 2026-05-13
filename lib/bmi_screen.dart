import 'package:bmi_calculator/result_screen.dart';
import 'package:flutter/material.dart';

class BmiScreen extends StatelessWidget {
  var wController = TextEditingController();
  var fController = TextEditingController();
  var iController = TextEditingController();
  var result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        elevation: 8,
        centerTitle: true,
        title: Text(
          "BMI Calculator",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.orange.shade200, Colors.deepOrange.shade400],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Card(
            elevation: 15,
            color: Colors.white.withOpacity(0.9),
            margin: EdgeInsets.symmetric(horizontal: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),

            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.monitor_weight,
                    size: 70,
                    color: Colors.deepOrange,
                  ),

                  SizedBox(height: 15),

                  Text(
                    "BMI Calculator",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                    ),
                  ),

                  SizedBox(height: 30),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: wController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.orange.shade50,
                      label: Text("Enter your Weight in KGs"),
                      prefixIcon: Icon(Icons.line_weight),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 11),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: fController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.orange.shade50,
                      prefixIcon: Icon(Icons.height),
                      label: Text("Enter your Height (Feet) "),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 11),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: iController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.orange.shade50,
                      prefixIcon: Icon(Icons.height),
                      label: Text("Enter your Height (Inch) "),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 11),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,

                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                      onPressed: () {
                        if (wController.text.isNotEmpty &&
                            fController.text.isNotEmpty &&
                            iController.text.isNotEmpty) {
                          var weight = int.parse(wController.text);
                          var fHeight = int.parse(fController.text);
                          var iHeight = int.parse(iController.text);
                    
                          var m = (fHeight * 0.3048) + (iHeight * 0.0254);
                    
                          result = weight / (m * m);
                    
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultScreen(result),
                            ),
                          );
                        }
                      },
                      child: Text("Calculate",style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
