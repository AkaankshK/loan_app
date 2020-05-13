


import 'package:flutter/material.dart';
import 'package:loanapp/LoansAgainstProperty/LoanAgainstData.dart';

import 'LoanAgainstDetails.dart';


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

class LoanAgainstList extends StatefulWidget {
  @override
  _LoanAgainstListState createState() => _LoanAgainstListState();
}

class _LoanAgainstListState extends State<LoanAgainstList> {
  MaterialColor freeColor = MaterialColor(0xff01b527, colors);
  MaterialColor buttonColor = MaterialColor(0xffffa812, colors);
  MaterialColor lightBlueColor = MaterialColor(0xff3862ff, colors);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Loan Against Property"),
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
    var amountSelection;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DropdownButton(

                hint: Text("Amount"),
                onChanged: (val){},
                icon: Icon(Icons.arrow_drop_down),
                value: amountSelection,
                items: [
                  DropdownMenuItem(
                    child: Text("Amount"),
                  ),
                  DropdownMenuItem(
                    child: Text("Less than \u20b9 5,000"),
                  ),
                  DropdownMenuItem(
                    child: Text("\u20b9 5,000 to \u20b9 10,000"),
                  ),
                  DropdownMenuItem(
                    child: Text("\u20b9 10,000 to \u20b9 50,000"),
                  ),
                  DropdownMenuItem(
                    child: Text("\u20b9 50,000 to \u20b91Lac"),
                  ),
                  DropdownMenuItem(
                    child: Text("greater than \u20b91Lac"),
                  ),

                ],
              ),
              DropdownButton(
                onChanged: (val){},
                icon: Icon(Icons.arrow_drop_down),
                value: amountSelection,
                items: [
                  DropdownMenuItem(
                    child: Text("Tenure"),
                  ),
                  DropdownMenuItem(
                    child: Text("Less than 3 Months"),
                  ),
                  DropdownMenuItem(
                    child: Text("3-6 Months"),
                  ),
                  DropdownMenuItem(
                    child: Text("6-12 Months"),
                  ),

                  DropdownMenuItem(
                    child: Text("greater than 12 Months"),
                  ),

                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height/1.4,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              itemCount: loans.length,
              itemBuilder: (_,int index){
                var item=loans[index];
                return Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)

                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Table(

                      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                      children: [
                        TableRow(
                            children:[
                              Image.asset(item['logo'],fit: BoxFit.scaleDown,height: 125,width: 125,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(item['name'],style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
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

                                  GestureDetector(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoanAgainstDetails(index: index,)));
                },
                                      child: Text("Details   >",style: TextStyle(color: lightBlueColor,fontSize: 15),))
                                ],
                              )
                            ]
                        ),



                      ],
                    ),
                  ),
                );
              }
          ),
        )
      ],
    );
  }
}
