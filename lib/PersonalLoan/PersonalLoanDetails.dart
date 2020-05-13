
import 'package:flutter/material.dart';
import 'PersonalLoan.dart';


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




class PersonalLoanDetails extends StatefulWidget {
  final int index;
  PersonalLoanDetails({Key key,this.index}) : super(key:key);
  @override
  _PersonalLoanDetailsState createState() => _PersonalLoanDetailsState();
}

class _PersonalLoanDetailsState extends State<PersonalLoanDetails> {
  MaterialColor freeColor = MaterialColor(0xff01b527, colors);
  MaterialColor buttonColor = MaterialColor(0xffffa812, colors);
  MaterialColor lightBlueColor = MaterialColor(0xff3862ff, colors);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Loan Offers"),
        centerTitle: true,
        backgroundColor: lightBlueColor,
        elevation: 0,
      ),
      body: getBody(),
    );
  }

  Stack getBody() {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset("assets/background.png",fit: BoxFit.fill,),
        ),
        getContents(),
      ],
    );
  }

  Column getContents() {
    var item=PersonalLoans[widget.index];
    return Column(

      children: [
        Row(
          children: [
            Image.asset(item['logo'],height: 125,width: 125,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item['name'],style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                Text(item['desc'],style: TextStyle(color: Colors.white),)
              ],
            )
          ],
        ),
        SizedBox(height: 20,),
        getTable(),
        SizedBox(height: 10,),
        getDetails(),
      ],
    );
  }

 Padding getTable() {
    var item=PersonalLoans[widget.index];
    return Padding(
      padding: EdgeInsets.all(10),
      child:  Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        ),
        child:  Padding(
          padding: EdgeInsets.all(10),
          child: Table(
            border: TableBorder(
                horizontalInside: BorderSide(width: 1,color: Colors.grey),
                verticalInside: BorderSide(width: 1,color: Colors.grey)
            ),
            children: [
              TableRow(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/Money Bag.png",height: 50,width: 50,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(item['amount'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Amount(\u20b9)",style: TextStyle(color: Colors.grey),),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/Tenure.png",height: 50,width: 50,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(item['tenure'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Tenure(Months)",style: TextStyle(color: Colors.grey),),
                        )
                      ],
                    ),
                  ]
              ),
              TableRow(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/Rate of intrest.png",height: 50,width: 50,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(item['interest'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Interest Rate(Per Year)",style: TextStyle(color: Colors.grey)),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/Tenure.png",height: 50,width: 50,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(item['processing fee'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Processing Fee",style: TextStyle(color: Colors.grey)),
                        )
                      ],
                    ),
                  ]
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding getDetails() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)

        ),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Loan Terms",style: TextStyle(color: lightBlueColor,fontWeight: FontWeight.bold),),
                ),
              ],
            ),
            SizedBox(height: 5,),

          ],
        ),
      ),
    );
  }
}
