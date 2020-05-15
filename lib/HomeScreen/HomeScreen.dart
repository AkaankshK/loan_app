

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loanapp/BusinessLoans/BusinessLoanList.dart';
import 'package:loanapp/CreditCards/CreditCardList.dart';
import 'package:loanapp/HomeLoans/HomeLoanList.dart';
import 'file:///D:/flutterProjects/loan_app/lib/SelectCity.dart';
import 'package:loanapp/CreditScore/CreditScore.dart';
import 'package:loanapp/LoansAgainstProperty/LoanAgainstList.dart';
import 'package:loanapp/PersonalLoan/PersonalLoanList.dart';

Map<int, Color> colors =
{
  50:Color.fromRGBO(136,14,79, .1),
  100:Color.fromRGBO(136,14,79, .2),
  200:Color.fromRGBO(136,14,79, .3),
  300:Color.fromRGBO(136,14,79, .4),
  400:Color.fromRGBO(136,14,79, .5),
  500:Color.fromRGBO(136,14,79, .6),
  600:Color.fromRGBO(136,14,79, .7),
  700:Color.fromRGBO(136,14,79, .8),
  800:Color.fromRGBO(136,14,79, .9),
  900:Color.fromRGBO(136,14,79, 1),
};

String cityname="";
bool isCitySet=false;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MaterialColor freeColor = MaterialColor(0xff01b527,colors);
  MaterialColor buttonColor = MaterialColor(0xffffa812,colors);
  MaterialColor lightBlueColor = MaterialColor(0xff3862ff,colors);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LoanKwik"),
        centerTitle: true,
        elevation: 0,
      ),
      body: getBody(),
    );
  }

  getBody() {
    return SingleChildScrollView(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [

          Image.asset("assets/HomeScreen/landing.png"),
          getContent(),
        ],
      ),
    );
  }

  getContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getFreeReport(),
        getCard(),
        getLoans(),
      ],
    );
  }

  getFreeReport() {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Text("Get your Credit Report",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color: Colors.white,),textAlign: TextAlign.start,),
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text("for Rs.1500",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color: Colors.white,),textAlign: TextAlign.start,),
            ),
            Text("FREE",style: TextStyle(fontSize: 20,color:freeColor,fontWeight: FontWeight.w500 ),)
          ],
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: RaisedButton(
                color: buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text("Get it Now",style: TextStyle(color: Colors.white,fontSize: 20),),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CreditPage()));
                },
              ),
            )
          ],
        )

      ],
    );
  }

  getCard() {
    var tableStyle=TextStyle(fontWeight: FontWeight.bold,fontSize: 12);
    return Padding(
      padding: EdgeInsets.all(10),
      child:SizedBox(

        height: 225,
        width: MediaQuery.of(context).size.width,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60)
          ),
          elevation: 10,
          child: Center(
            child: Table(

              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(
                  children: [
                    Padding(padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),child: Image.asset("assets/HomeScreen/Personal Loan.png",height: 50,width: 50,),),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),child: Image.asset("assets/HomeScreen/home loan.png",height: 50,width: 50),),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),child: Image.asset("assets/HomeScreen/Loan againt property.png",height: 50,width: 50),),

                  ]
                ),
                TableRow(
                    children: [
                      Padding(padding: EdgeInsets.symmetric(horizontal: 15),child: Text("Personal Loan",style: tableStyle,),),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 15),child:Text("Home Loan",style: tableStyle,),),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 15),child: Text("Loan against\n Property",style: tableStyle,),),

                    ]
                ),
                TableRow(
                    children: [
                      Padding(padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),child: Image.asset("assets/HomeScreen/business Loan.png",height: 50,width: 50),),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),child: Image.asset("assets/HomeScreen/credit card.png",height: 50,width: 50),),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),child: Image.asset("assets/HomeScreen/Crdeit Report.png",height: 50,width: 50),),

                    ]
                ),
                TableRow(
                    children: [
                      Padding(padding: EdgeInsets.symmetric(horizontal: 15),child: Text("Business Loan",style: tableStyle,),),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 15),child:Text("Credit Card",style: tableStyle,),),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 15),child: Text("Credit Report",style: tableStyle,),),

                    ]
                ),

              ],
            ),
          ),
        ),
      ) ,
    );
  }

  getLoans() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 450,
            child:
            Card(
              elevation: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10,top: 10),
                        child: Image.asset("assets/a.png",height: 30,width: 30,),
                      ),
                      Text("Personal Loan",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  Row(
                    children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text("Unsecured Loan For personal Purpose",style: TextStyle(fontSize: 15),),
                    )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Table(
                    border: TableBorder(
                     horizontalInside: BorderSide(width: 1,color: Colors.grey)
                    ),
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: [
                      TableRow(
                        children:[
                          Image.asset("assets/personalLoan/icici.png",fit: BoxFit.scaleDown,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("ICICI",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                              Text("\u20B920 Lacs",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              Text("Max Amount",style: TextStyle(color: Colors.grey),),
                              Text("Tenure: 12-60 Months"),
                              Text("Interest: 11.20%/year",),
                              Text("Proc.Fee: \u20b9 0"),
                              SizedBox(height: 10,)

                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                            children: [
                             RaisedButton(
                               shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(10)
                               ),
                               color: buttonColor,
                               child: Text("Apply",style: TextStyle(color: Colors.white),),
                               onPressed: (){},
                             ),
                              SizedBox(height: 30,),

                              Text("Details   >",style: TextStyle(color: lightBlueColor,fontSize: 15),)
                            ],
                          )
                        ]
                      ),

                      TableRow(
                          children:[
                            Image.asset("assets/personalLoan/cashe.png",),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(height: 10,),
                                Text("CASHe",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                Text("\u20B93 Lacs",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                Text("Max Amount",style: TextStyle(color: Colors.grey),),
                                Text("Tenure: 2-12 Months"),
                                Text("Interest: 30%/year"),
                                Text("Proc.Fee: \u20b9 0")

                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                              children: [
                                RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  color: buttonColor,
                                  child: Text("Apply",style: TextStyle(color: Colors.white),),
                                  onPressed: (){},
                                ),
                                SizedBox(height: 30,),

                                Text("Details   >",style: TextStyle(color: lightBlueColor,fontSize: 15),)
                              ],
                            )
                          ]
                      ),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1,color: lightBlueColor),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.remove_red_eye,color: lightBlueColor,),
                              Text("  View more Personal Loan",style: TextStyle(color: lightBlueColor),)
                            ],
                          ),
                          onPressed: (){
                            if(!isCitySet){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectCity(index: 0,)));
                            }
                            else{
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>PersonalLoanList()));
                            }
                          },
                        ),
                      ),
                    ],
                  )

                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 450,
            child:
            Card(
              elevation: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10,top: 10),
                        child: Image.asset("assets/p.png",height: 30,width: 30,),
                      ),
                      Text("Business Loan",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text("Unsecured Loan For Business Purpose",style: TextStyle(fontSize: 15),),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Table(
                    border: TableBorder(
                        horizontalInside: BorderSide(width: 1,color: Colors.grey)
                    ),
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: [
                      TableRow(
                          children:[
                            Image.asset("assets/BusinessLoan/1.png",fit: BoxFit.scaleDown,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Indifi",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                Text("\u20B950 Lacs",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                Text("Max Amount",style: TextStyle(color: Colors.grey),),
                                Text("Tenure: 12-36 Months"),
                                Text("Interest: 18%/year",),
                                Text("Proc.Fee: 2%"),
                                SizedBox(height: 10,)

                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                              children: [
                                RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  color: buttonColor,
                                  child: Text("Apply",style: TextStyle(color: Colors.white),),
                                  onPressed: (){},
                                ),
                                SizedBox(height: 30,),

                                Text("Details   >",style: TextStyle(color: lightBlueColor,fontSize: 15),)
                              ],
                            )
                          ]
                      ),

                      TableRow(
                          children:[
                            Image.asset("assets/BusinessLoan/2.png",),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(height: 10,),
                                Text("Lendingkart",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                Text("\u20B950 Lacs",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                Text("Max Amount",style: TextStyle(color: Colors.grey),),
                                Text("Tenure: 6-36 Months"),
                                Text("Interest: 18%/year"),
                                Text("Proc.Fee: 2%")

                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                              children: [
                                RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  color: buttonColor,
                                  child: Text("Apply",style: TextStyle(color: Colors.white),),
                                  onPressed: (){},
                                ),
                                SizedBox(height: 30,),

                                Text("Details   >",style: TextStyle(color: lightBlueColor,fontSize: 15),)
                              ],
                            )
                          ]
                      ),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1,color: lightBlueColor),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.remove_red_eye,color: lightBlueColor,),
                              Text("  View more Business Loan",style: TextStyle(color: lightBlueColor),)
                            ],
                          ),
                          onPressed: (){
                            if(!isCitySet){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectCity(index: 1,)));
                            }
                            else{
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>BusinessLoanList()));
                            }
                          },
                        ),
                      ),
                    ],
                  )

                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 450,
            child:
            Card(
              elevation: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10,top: 10),
                        child: Image.asset("assets/e.png",height: 30,width: 30,),
                      ),
                      Text("Home Loan",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text("Loan for purchasing house or construction",style: TextStyle(fontSize: 15),),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Table(
                    border: TableBorder(
                        horizontalInside: BorderSide(width: 1,color: Colors.grey)
                    ),
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: [
                      TableRow(
                          children:[
                            Image.asset("assets/HomeOffer/2.png",fit: BoxFit.scaleDown,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Shubham Housing",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                Text("\u20B95 Crs",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                Text("Max Amount",style: TextStyle(color: Colors.grey),),
                                Text("Tenure: 10-20 Years"),
                                Text("Interest: 13.5%/year",),
                                Text("Proc.Fee: 3%"),
                                SizedBox(height: 10,)

                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                              children: [
                                RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  color: buttonColor,
                                  child: Text("Apply",style: TextStyle(color: Colors.white),),
                                  onPressed: (){},
                                ),
                                SizedBox(height: 30,),

                                Text("Details   >",style: TextStyle(color: lightBlueColor,fontSize: 15),)
                              ],
                            )
                          ]
                      ),

                      TableRow(
                          children:[
                            Image.asset("assets/HomeOffer/1a.png",),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(height: 10,),
                                Text("HeroHFL",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                Text("\u20B95 Crs",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                Text("Max Amount",style: TextStyle(color: Colors.grey),),
                                Text("Tenure: 15-20Years"),
                                Text("Interest: 11%/year"),
                                Text("Proc.Fee: \u20b9 0"),

                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                              children: [
                                RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  color: buttonColor,
                                  child: Text("Apply",style: TextStyle(color: Colors.white),),
                                  onPressed: (){},
                                ),
                                SizedBox(height: 30,),

                                Text("Details   >",style: TextStyle(color: lightBlueColor,fontSize: 15),)
                              ],
                            )
                          ]
                      ),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1,color: lightBlueColor),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.remove_red_eye,color: lightBlueColor,),
                              Text("  View more Home Loan",style: TextStyle(color: lightBlueColor),)
                            ],
                          ),
                          onPressed: (){
                            if(!isCitySet){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectCity(index: 2,)));
                            }
                            else{
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeLoanList()));
                            }
                          },
                        ),
                      ),
                    ],
                  )

                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 475,
            child:
            Card(
              elevation: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10,top: 5,right: 10),
                        child: Image.asset("assets/v.png",height: 30,width: 30,),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10),child: Text("Loan Against Property",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text("Loan for residential and commercial purposes",style: TextStyle(fontSize: 15),),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Table(
                    border: TableBorder(
                        horizontalInside: BorderSide(width: 1,color: Colors.grey)
                    ),
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: [
                      TableRow(
                          children:[
                            Image.asset("assets/LoanAgainst/3a.png",fit: BoxFit.scaleDown,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("AU Small Finance Bank",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                Text("\u20B91 Cr",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                Text("Max Amount",style: TextStyle(color: Colors.grey),),
                                Text("Tenure: 1-15 Years"),
                                Text("Interest: 13%/year",),
                                Text("Proc.Fee: \u20B9 0"),
                                SizedBox(height: 10,)

                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                              children: [
                                RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  color: buttonColor,
                                  child: Text("Apply",style: TextStyle(color: Colors.white),),
                                  onPressed: (){},
                                ),
                                SizedBox(height: 30,),

                                Text("Details   >",style: TextStyle(color: lightBlueColor,fontSize: 15),)
                              ],
                            )
                          ]
                      ),

                      TableRow(
                          children:[
                            Image.asset("assets/LoanAgainst/2a.png",),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(height: 10,),
                                Text("ASCEND CAPITAL",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                Text("\u20B915 Lacs",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                Text("Max Amount",style: TextStyle(color: Colors.grey),),
                                Text("Tenure: 15-84 Months"),
                                Text("Interest: 12.96%/year"),
                                Text("Proc.Fee: 3%"),

                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                              children: [
                                RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  color: buttonColor,
                                  child: Text("Apply",style: TextStyle(color: Colors.white),),
                                  onPressed: (){},
                                ),
                                SizedBox(height: 30,),

                                Text("Details   >",style: TextStyle(color: lightBlueColor,fontSize: 15),)
                              ],
                            )
                          ]
                      ),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1,color: lightBlueColor),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.remove_red_eye,color: lightBlueColor,),
                              Text("  View more Loan Against Property",style: TextStyle(color: lightBlueColor),)
                            ],
                          ),
                          onPressed: (){
                            if(!isCitySet){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectCity(index: 3,)));
                            }
                            else{
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>LoanAgainstList()));
                            }
                          },
                        ),
                      ),
                    ],
                  )

                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 400,
            child:
            Card(
              elevation: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10,top: 10),
                        child: Image.asset("assets/o.png",height: 30,width: 30,),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10),child: Text("Credit Card",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20,top: 5),
                        child: Text("Best Offers for various bank Credit cards",style: TextStyle(fontSize: 15),),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Table(
                    border: TableBorder(
                        horizontalInside: BorderSide(width: 1,color: Colors.grey)
                    ),
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: [
                      TableRow(
                          children:[
                            Image.asset("assets/CreditCard/3.png",fit: BoxFit.scaleDown,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Titanium Delight Credit Card",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                Text("Bank: RBL Bank"),
                                Text("Annual Fee: \u20B9 750"),
                                SizedBox(height: 10,)

                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                              children: [
                                RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  color: buttonColor,
                                  child: Text("Apply",style: TextStyle(color: Colors.white),),
                                  onPressed: (){},
                                ),
                                SizedBox(height: 30,),

                                Text("Details   >",style: TextStyle(color: lightBlueColor,fontSize: 15),)
                              ],
                            )
                          ]
                      ),

                      TableRow(
                          children:[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                               Image.asset("assets/CreditCard/5.png",),

                              ],
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(height: 10,),
                                Text("Platinum Maxima Credit Card",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                Text("Bank: RBL Bank"),
                                Text("Annual Fee: \u20B9 2000"),


                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                              children: [
                                RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  color: buttonColor,
                                  child: Text("Apply",style: TextStyle(color: Colors.white),),
                                  onPressed: (){},
                                ),
                                SizedBox(height: 30,),

                                Text("Details   >",style: TextStyle(color: lightBlueColor,fontSize: 15),)
                              ],
                            )
                          ]
                      ),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1,color: lightBlueColor),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.remove_red_eye,color: lightBlueColor,),
                              Text("  View more Credit Card",style: TextStyle(color: lightBlueColor),)
                            ],
                          ),
                          onPressed: (){
                            if(!isCitySet){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectCity(index: 4,)));
                            }
                            else{
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>CreditCardList()));
                            }
                          },
                        ),
                      ),
                    ],
                  )

                ],
              ),
            ),
          ),

        ],
      ),
    );
  }


}
