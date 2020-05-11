
import 'package:flutter/material.dart';
import 'BusinessData.dart';


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




class BusinessLoanDetails extends StatefulWidget {
  final int index;
  BusinessLoanDetails({Key key,this.index}) : super(key:key);
  @override
  _BusinessLoanDetailsState createState() => _BusinessLoanDetailsState();
}

class _BusinessLoanDetailsState extends State<BusinessLoanDetails> {
  MaterialColor freeColor = MaterialColor(0xff01b527, colors);
  MaterialColor buttonColor = MaterialColor(0xffffa812, colors);
  MaterialColor lightBlueColor = MaterialColor(0xff3862ff, colors);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Business Loan Offers"),
        centerTitle: true,
        backgroundColor: lightBlueColor,
        elevation: 0,
      ),
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
          child: Image.asset("assets/background.png",fit: BoxFit.fill,),
        ),
          getContents(),
        ],
      ),
    );
  }

  getContents() {
    var item=businessLoans[widget.index];
    return Column(

      children: [
        Row(
          children: [
            Image.asset(item['logo2'],height: 125,width: 125,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item['name'],style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                Text("Indifi is blah blah\nblah\blah",style: TextStyle(color: Colors.white),)
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

  getTable() {
    var item=businessLoans[widget.index];
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

  getDetails() {
    var item=businessLoans[widget.index];
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                children: [
                  (item['eligibility']!=null)?
                      TableRow(
                        children: [
                          Text("Eligibility Criteria",style: TextStyle(color: Colors.grey)),
                          Padding(
                            padding: EdgeInsets.only(bottom: 15),
                            child: Text(item['eligibility']),
                          )
                        ]
                      ):TableRow(
                    children: [
                      Text(""),
                      Text(""),
                    ]
                  ),
                  (item['loandisbursal']!=null)?
                  TableRow(
                      children: [
                        Text("Loan Disbursal",style: TextStyle(color: Colors.grey)),
                        Padding(
                          padding: EdgeInsets.only(bottom: 15),
                          child: Text(item['loandisbursal']),
                        )
                      ]
                  ):TableRow(
                      children: [
                        Text(""),
                        Text(""),
                      ]
                  ),
                  (item['documents']!=null)?
                  TableRow(
                      children: [
                        Text("Documents Required",style: TextStyle(color: Colors.grey)),
                        Padding(
                          padding: EdgeInsets.only(bottom: 15),
                          child: Text(item['documents']),
                        )
                      ]
                  ):TableRow(
                      children: [
                        Text(""),
                        Text(""),
                      ]
                  ),
                  (item['repayment']!=null)?
                  TableRow(
                      children: [
                        Text("Repayment",style: TextStyle(color: Colors.grey)),
                        Padding(
                          padding: EdgeInsets.only(bottom: 15),
                          child: Text(item['repayment']),
                        )
                      ]
                  ):TableRow(
                      children: [
                        Text(""),
                        Text(""),
                      ]
                  ),
                  (item['earlyrepayment']!=null)?
                  TableRow(
                      children: [
                        Text("Early Repayment",style: TextStyle(color: Colors.grey)),
                        Padding(
                          padding: EdgeInsets.only(bottom: 15),
                          child: Text(item['earlyrepayment']),
                        )
                      ]
                  ):TableRow(
                      children: [
                        Text(""),
                        Text(""),
                      ]
                  ),
                  (item['overdue']!=null)?
                  TableRow(
                      children: [
                        Text("Over Due Rule",style: TextStyle(color: Colors.grey)),
                        Padding(
                          padding: EdgeInsets.only(bottom: 15),
                          child: Text(item['overdue']),
                        )
                      ]
                  ):TableRow(
                      children: [
                        Text(""),
                        Text(""),
                      ]
                  ),


                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
