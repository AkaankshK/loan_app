import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Map<int, Color> colors = {
  50: Color.fromRGBO(136, 14, 79, .1),
  100: Color.fromRGBO(136, 14, 79, .2),
  200: Color.fromRGBO(136, 14, 79, .3),
  300: Color.fromRGBO(136, 14, 79, .4),
  400: Color.fromRGBO(136, 14, 79, .5),
  500: Color.fromRGBO(136, 14, 79, .6),
  600: Color.fromRGBO(136, 14, 79, .7),
  700: Color.fromRGBO(136, 14, 79, .8),
  800: Color.fromRGBO(136, 14, 79, .9),
  900: Color.fromRGBO(136, 14, 79, 1),
};

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  MaterialColor greenColor = MaterialColor(0xff01b527, colors);
  MaterialColor yellowColor = MaterialColor(0xffffa812, colors);
  MaterialColor lightBlueColor = MaterialColor(0xff3862ff, colors);
  MaterialColor darkBlueColor = MaterialColor(0xff0f3f81, colors);
  var autosizegroup=AutoSizeGroup();
  final _formKey = GlobalKey<FormState>();
  double interest=0.0;
  final amountController=TextEditingController();
  var emi=0.0;
  var tpa=0.0;
  var pa=0.0;
  var tpi=0.0;
  var years=[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25];
  var months=[0,1,2,3,4,5,6,7,8,9,10,11,12];
  var year;
  var month;
  String emiString="0";
  String tpaString="0";
  String tpiString="0";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  getBody() {
    return SingleChildScrollView(
          child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              "assets/LOAN5.png",
              fit: BoxFit.fill,
            ),
          ),
          getContents(),
        ],
      ),
    );
  }

  getContents() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 40, left: 20),
            child: Text(
              "Loan Calculator",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          getEmi(),
          SizedBox(
            height: 10,
          ),
          getAd(),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 28, right: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text("Loan Amount",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width/1.3,
                                  child: TextFormField(
                                    validator: (value)=> value.isEmpty ? 'Enter Loan Amount' : RegExp(r'^[0-9]+$').hasMatch(value) ? null : 'Enter Valid Loan Amount',


                                    controller: amountController,
                      decoration: InputDecoration(hintText: "Enter Amount from Rs.50,000-10 Crore"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15,top: 10),
                  child: Text("Tenure",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,),),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DropdownButton(
                      value: year,
                      hint: Text("Years",style: TextStyle(color: Colors.black,),),
                      onChanged: (val){
                        setState(() {
                          year=val;
                        });
                      },
                      items: years.map((val){
                        return DropdownMenuItem(
                          child: Text("$val"),
                          value: val,
                        );
                      }).toList(),

                    ),
                    DropdownButton(
                      value: month,
                      hint: Text("Months",style: TextStyle(color: Colors.black),),
                      onChanged: (val){
                        setState(() {
                          month=val;
                        });
                      },
                      items: months.map((val){
                        return DropdownMenuItem(
                          child: Text("$val"),
                          value: val,
                        );
                      }).toList(),

                    ),



                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15,top: 10),
                      child: Text("Interest",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15,top: 10),
                      child: Text("$interest",style: TextStyle(fontSize: 15,color: lightBlueColor,fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15,top: 10),
                  child: Slider(
                    divisions: 100,
                    onChanged: (val){
                    setState(() {
                      interest=val;
                    });
                  },
                  min: 0,
                  max: 50,
                  value: interest,
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(height: 40, minWidth: 200,

                  child: Text("Calculate EMI",style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold,),),
                  color: darkBlueColor,
                  onPressed: (){
                    if(_formKey.currentState.validate()){
                      calculate();
                    }

                  },)
                ],),
                SizedBox(height: 40,),

              ],
            ),
          )
        ],
      ),
    );
  }

  getEmi() {
    return Padding(
      padding: EdgeInsets.only(left: 28, right: 28, top: 40),
      child: Container(
        decoration: BoxDecoration(
          color: darkBlueColor,
          borderRadius: BorderRadius.circular(5),
        ),
        height: 200,
        width: MediaQuery.of(context).size.width,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Monthly EMI",
                    style: TextStyle(color: Colors.white, fontSize: 15,fontWeight: FontWeight.bold,),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Total Payable\nAmount",
                    style: TextStyle(color: Colors.white, fontSize: 15,fontWeight: FontWeight.bold,),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex:50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: AutoSizeText(
                        "\u20b9 $emiString",
                        group: autosizegroup,
                        maxLines: 1,
                        minFontSize: 5,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex:50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: AutoSizeText(
                        "\u20b9 $tpaString",
                        group: autosizegroup,
                        maxLines: 1,
                        minFontSize: 5,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Principle Amount",
                    style: TextStyle(color: Colors.white, fontSize: 15,fontWeight: FontWeight.bold,),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Total Payable\nInterest",
                    style: TextStyle(color: Colors.white, fontSize: 15,fontWeight: FontWeight.bold,),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex:50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: AutoSizeText(
                        "\u20b9 $pa",
                        group: autosizegroup,
                        maxLines: 1,
                        minFontSize: 5,
                        style: TextStyle(color: greenColor, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex:50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: AutoSizeText(
                        "\u20b9 $tpiString",
                        group: autosizegroup,
                        maxLines: 1,
                        minFontSize: 5,
                        style: TextStyle(color: yellowColor, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 15,
                    width: MediaQuery.of(context).size.width / 1.3,
                    color: greenColor,
                  ),
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 10.8,
                    height: 15,
                    color: yellowColor,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  getAd() {
    return Container(
      color: darkBlueColor,
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Text(
          "Display Ad Mob Banner Ad",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  void calculate() {
      int n=year*12+month;

      double r=interest/(12*100);

      print(pa);


    setState(() {
        pa=double.parse(amountController.text);
       //emi=pa*r*((pow(1+r,n))/(pow(1+r,n))-1);
        emi = (pa * r * pow((1+r), n) / ( pow((1+r),n) -1));
        emiString=emi.toStringAsFixed(2);
        tpa=((r*pa*n)/(1-(pow(1+r,-n))));
        tpaString=tpa.toStringAsFixed(2);
        tpi=tpa-pa;
        tpiString=tpi.toStringAsFixed(2);
      });
  }
}
