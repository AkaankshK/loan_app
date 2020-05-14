
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loanapp/HomeLoans/HomeLoanData.dart';





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




class HomeLoanDetails extends StatefulWidget {
  final int index;
  HomeLoanDetails({Key key,this.index}) : super(key:key);
  @override
  _HomeLoanDetailsState createState() => _HomeLoanDetailsState();
}

class _HomeLoanDetailsState extends State<HomeLoanDetails> {
  MaterialColor freeColor = MaterialColor(0xff01b527, colors);
  MaterialColor buttonColor = MaterialColor(0xffffa812, colors);
  MaterialColor lightBlueColor = MaterialColor(0xff3862ff, colors);
  bool terms=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Loan Againt Property Offers"),
        centerTitle: true,
        backgroundColor: lightBlueColor,
        elevation: 0,
      ),
      body: getBody(),
      bottomNavigationBar: getBottom(),
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
    var item=homeloans[widget.index];

    return Column(

      children: [
        Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(item['logo2'],height: 125,width: 125,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(item['name'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
              Wrap(
                direction: Axis.vertical,
                children: [
                  Text(item['desc'],style: TextStyle(color: Colors.white,fontSize: 10),),
                ],
              )
            ],
          )
        ],
          ),
        SizedBox(height: 20,),
      getTable(),
        SizedBox(height: 10,),
        getDetails(),
        getIcons(),
      ],
    );
  }

  getTable() {
    var item=homeloans[widget.index];
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
                          child: Image.asset("assets/pfee.png",height: 50,width: 50,),
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
    var item=homeloans[widget.index];
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
                  padding: const EdgeInsets.all(15.0),
                  child: Text("Loan Terms",style: TextStyle(color: lightBlueColor,fontWeight: FontWeight.bold,fontSize: 15),),
                ),
              ],
            ),
            Divider(),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.all(15.0),
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
            ),

          ],
        ),
      ),
    );
  }

  getIcons() {
    return Column(

      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15,left: 30,bottom: 10),
          child: Row(
            children: [
              Text("How to apply",style: TextStyle(color: lightBlueColor,fontWeight: FontWeight.bold,fontSize: 15),)
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset("assets/LoanAgainst/i.png",height: 40,width: 40,),
                Text("Apply Now",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10),)
              ],
            ),
            Image.asset("assets/LOAN22.png",height: 20,width: 20,),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset("assets/LoanAgainst/ic.png",height: 40,width: 40,),
                Text("Submit Information",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10),)
              ],
            ),
            Image.asset("assets/LOAN22.png",height: 20,width: 20,),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset("assets/LoanAgainst/ico.png",height: 40,width: 40,),
                Text("Wait for approval",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10),)
              ],
            ),
            Image.asset("assets/LOAN22.png",height: 20,width: 20,),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset("assets/LoanAgainst/icon.png",height: 40,width: 40,),
                Text("Get money",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10),)
              ],
            ),
          ],
        ),

        Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width*0.8,
              child: StatefulBuilder(
                builder: (context,setState){
                  return CheckboxListTile(
                    onChanged: (val){
                      setState(() {
                        terms=val;
                      });
                    },
                    value: terms,
                    title: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("I agree to "),
                        Text("PRIVACY POLICY",style: TextStyle(color: lightBlueColor),)
                      ],
                    ),
                  );
                },
              )
          ),
        ),
        SizedBox(
          height: 30,
        )
      ],
    );
  }

  getBottom() {
    return BottomAppBar(
      child: Container(
        height: 60,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
            ),
            color: buttonColor,

            child: Text("Apply Now",style: TextStyle(color: Colors.white),),
            onPressed: (){},
          ),
        ),
      ),
    );
  }
}