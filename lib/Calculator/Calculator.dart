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
    return Column(
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
                child: Text("Loan Amount",style: TextStyle(fontSize: 15),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width/1.3,
                                child: TextField(
                    decoration: InputDecoration(hintText: "Enter Amount from Rs.50,000-10 Crore"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15,top: 10),
                child: Text("Tenure",style: TextStyle(fontSize: 15),),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DropdownButton(
                    hint: Text("Years",style: TextStyle(color: Colors.black),),
                    onChanged: (dynamic){},
                    items: [

                    ],

                  ),
                  DropdownButton(
                    hint: Text("Months",style: TextStyle(color: Colors.black)),
                    onChanged: (dynamic){},
                    items: [
                      
                    ],

                  ),
                  

                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15,top: 10),
                child: Text("Interest",style: TextStyle(fontSize: 15),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15,top: 10),
                child: Slider(onChanged: (dynamic){},
                min: 0,
                max: 100,
                value: 25.0,
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(height: 40, minWidth: 200,
                
                child: Text("Calculate EMI",style: TextStyle(fontSize: 15,color: Colors.white),),
                color: darkBlueColor,
                onPressed: (){},)
              ],)

            ],
          ),
        )
      ],
    );
  }

  getEmi() {
    return Padding(
      padding: EdgeInsets.only(left: 28, right: 28, top: 60),
      child: Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        color: darkBlueColor,
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
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Total Payable\nAmount",
                    style: TextStyle(color: Colors.white, fontSize: 15),
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
                    "\u20b9 0",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "\u20b9 0",
                    style: TextStyle(color: Colors.white, fontSize: 20),
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
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Total Payable\nInterest",
                    style: TextStyle(color: Colors.white, fontSize: 15),
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
                    "\u20b9 0",
                    style: TextStyle(color: greenColor, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "\u20b9 0",
                    style: TextStyle(color: yellowColor, fontSize: 20),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 10,
                  width: MediaQuery.of(context).size.width / 1.3,
                  color: greenColor,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 10.8,
                  height: 10,
                  color: yellowColor,
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
}
