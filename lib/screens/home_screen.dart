import 'package:flutter/material.dart';
import 'package:flutter_bmi_calc_learning/constants/app_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();

  double bmiResult = 0;
  String bmiResultText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator',
        style: TextStyle(
          color: accentHexColor,
          fontWeight: FontWeight.w300
        ),),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 190,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                    controller: _heightController,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor,
                    ),

                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Height',
                      hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(0.9),

                      ),
                    ),

                      ),
                    ),

                Container(
                  width: 130,
                  child: TextField(
                    controller: _weightController,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor,
                    ),

                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Weight',
                      hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(0.9),

                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30,),

            GestureDetector(
              onTap: () {
                double _h = double.parse(_heightController.text);
                double _w = double.parse(_weightController.text);
                setState(() {
                  bmiResult = _w / (_h * _h);

                  if (bmiResult > 25) {
                    bmiResultText = "Overweight";
                  } else if (bmiResult >= 18.5 && bmiResult <= 25) {
                    bmiResultText = "Normal";
                  } else {
                    bmiResultText = "Underweight";
                  }

                });
              },
              child: Container(
                child: Text("Calculate BMI",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: accentHexColor,
                ),),
              ),
            ),

            const SizedBox(height: 50,),

            Visibility(
              visible: bmiResultText.isNotEmpty,
              child: Container(
                child: Text(bmiResult.toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 90,
                  fontWeight: FontWeight.w300,
                  color: accentHexColor,
                ),),
              ),
            ),

            const SizedBox(height: 30,),

            Visibility(
              visible: bmiResultText.isNotEmpty,
              child: Container(
                child: Text(bmiResultText,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                    color: accentHexColor,
                  ),),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
