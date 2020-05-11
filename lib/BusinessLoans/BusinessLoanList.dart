


import 'package:flutter/material.dart';
import 'package:loanapp/BusinessLoans/BusinessData.dart';
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

class BusinessLoanList extends StatefulWidget {
  @override
  _BusinessLoanListState createState() => _BusinessLoanListState();
}

class _BusinessLoanListState extends State<BusinessLoanList> {
  MaterialColor freeColor = MaterialColor(0xff01b527, colors);
  MaterialColor buttonColor = MaterialColor(0xffffa812, colors);
  MaterialColor lightBlueColor = MaterialColor(0xff3862ff, colors);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Business Loan"),
        centerTitle: true,
        backgroundColor: lightBlueColor,
      ),
      body: getBody(),
    );
  }

  getBody() {
    return Stack(
      children: [
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image.asset("assets/back1.png",fit: BoxFit.fill,),
      )  ,
        getContents(),
      ],
    );
  }

  getContents() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Ammount"),
              Text("Tennure"),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height/1.5,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              itemCount: businessLoans.length,
              itemBuilder: (_,int index){
                var item=businessLoans[index];
                return Card(
                  elevation: 10,

                  child: Table(

                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: [
                      TableRow(
                          children:[
                            Image.asset(item['logo'],fit: BoxFit.scaleDown,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(item['name'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                Text("\u20B9${item['maxamount']}",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                Text("Max Amount",style: TextStyle(color: Colors.grey),),
                                Text("Tenure:${item['tenure']} Months"),
                                Text("Interest:${item['interest']}/year",),
                                Text("Proc.Fee: ${item['processing fee']}"),
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



                    ],
                  ),
                );
              }
          ),
        )
      ],
    );
  }
}
