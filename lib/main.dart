import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BMI Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }



  var wtcontroller= TextEditingController();
  var ftcontroller= TextEditingController();
  var incontroller= TextEditingController();

  var result = "";

  var bgcolor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),

      body: Container(
        color: bgcolor ,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                // Title
                Text("BMI", style: TextStyle(
                  fontSize: 34, fontWeight: FontWeight.w700
                )),

                SizedBox(height: 21,),

                //Textfield  for weight
                TextField(
                  controller: wtcontroller,
                  decoration: InputDecoration(
                    label: Text("Enter you weight(kg)"),
                    prefixIcon: Icon(Icons.line_weight)
                  ),
                  keyboardType: TextInputType.number,
                ),

                //Give some spase
                SizedBox(height: 11,),

                //Textfeld for hight (feet)
                TextField(
                  controller: ftcontroller,
                  decoration: InputDecoration(
                      label: Text("Enter you Hight(Feet)"),
                      prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 11,),

                //Textfeld for hight (inch)
                TextField(
                  controller: incontroller,
                  decoration: InputDecoration(
                      label: Text("Enter you Hight(Inch)"),
                      prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 16,),

                //Button
                ElevatedButton(onPressed: (){
                  var wt = wtcontroller.text.toString();
                  var ft = ftcontroller.text.toString();
                  var inch = incontroller.text.toString();

                  if(wt!="" && ft!="" && inch!=""){

                    //BMI calcutation

                    var iwt = int.parse(wt);
                    var ift = int.parse(ft);
                    var iinch = int.parse(inch);

                    var tinch = (ift*12) + iinch;

                    var tcm = (tinch*2.54);

                    var tm = (tcm/100);

                    var bmi = iwt/(tm*tm);

                    //Change bg color bassise of bmi
                    var msg = "";

                    if(bmi>25){
                      msg = "You are OverWeight!!";
                      bgcolor = Colors.orange.shade200;

                    }else if(bmi<18){
                      msg = "You are UnderWeight!!";
                      bgcolor = Colors.red.shade200;

                    }else{
                      msg = "You are Healthy!!";
                      bgcolor = Colors.green.shade200;

                    }

                    setState(() {
                      result = "$msg \n Your BMI is: ${bmi.toStringAsFixed(4)}";
                    });

                  }else{
                    setState(() {
                      result = "Please fill all the required fiEld!!";
                    });
                  }
                }, child: Text('Calculate')),

                SizedBox(height: 11,),

                //Show after calculate
                Text(result,  style: TextStyle(fontSize: 20),),

              ],
            ),
          ),
        ),
      )
    );
  }
}
