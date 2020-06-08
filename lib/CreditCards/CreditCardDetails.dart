
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loanapp/CreditCards/CreditCardData.dart';
import 'package:loanapp/web_view_container.dart';



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




class CreditCardDetails extends StatefulWidget {
  final int index;
  CreditCardDetails({Key key,this.index}) : super(key:key);
  @override
  _CreditCardDetailsState createState() => _CreditCardDetailsState();
}

class _CreditCardDetailsState extends State<CreditCardDetails> {
  MaterialColor freeColor = MaterialColor(0xff01b527, colors);
  MaterialColor buttonColor = MaterialColor(0xffffa812, colors);
  MaterialColor lightBlueColor = MaterialColor(0xff3862ff, colors);

  bool terms=false;
  final _key = GlobalKey<ScaffoldState>();
@override
  void dispose() {

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text("Credit Card Offers"),
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
          child: Image.asset("assets/back1.png",fit: BoxFit.fill,),
        ),
          getContents(),
        ],
      ),
    );
  }

  getContents() {
    var item=creditcards[widget.index];

    return Column(

      children: [
        SizedBox(height: 20,),
      getTable(),
        SizedBox(height: 10,),
        getDetails(),
        getFees(),
        getIcons(),
      ],
    );
  }

  getTable() {
    var item=creditcards[widget.index];
    return Padding(
      padding: EdgeInsets.all(10),
      child:  Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40)
        ),
        child:  Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Image.asset(item['logo'],height: 200,width: MediaQuery.of(context).size.width/1.5,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(item['title'],style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(item['name'],style: TextStyle(color: Colors.grey),),
                  ),
                ],
              )
            ],
          )
        ),
      ),
    );
  }

  getDetails() {
    var item=creditcards[widget.index];
    var ben=item.values.toList();
    var ben1=ben[6];
    print(ben1);
    List<TableRow> row=<TableRow>[];
    for(String i in ben1) {
      row.add(
          new TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "assets/CreditCard/icon.png", height: 20, width: 20,),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(i),
                ),
              ]
          )
      );
    }

    return Padding(
      padding: EdgeInsets.all(8),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)

        ),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text("Key Benefits",style: TextStyle(color: lightBlueColor,fontWeight: FontWeight.bold,fontSize: 15),),
                ),
              ],
            ),
            Divider(),
            SizedBox(height: 5,),
            Table(
              columnWidths: {0:FractionColumnWidth(.1)},
              children: row,


            )
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
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset("assets/CreditCard/ic.png",height: 40,width: 40,),
                  Text("Online Application",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10),)
                ],
              ),
            ),
            Expanded(child: Image.asset("assets/LOAN22.png",height: 20,width: 20,)),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset("assets/CreditCard/ico.png",height: 40,width: 40,),
                  Text("Call from Phone",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10),)
                ],
              ),
            ),
            Expanded(child: Image.asset("assets/LOAN22.png",height: 20,width: 20,)),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset("assets/CreditCard/icc.png",height: 40,width: 40,),
                  Text("Documents Pickup",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10),)
                ],
              ),
            ),
            Expanded(child: Image.asset("assets/LOAN22.png",height: 20,width: 20,)),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset("assets/CreditCard/i1.png",height: 40,width: 40,),
                  Text("Card Dispatch",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10),)
                ],
              ),
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
                  return Wrap(
                    direction: Axis.horizontal,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Checkbox(
                        onChanged: (val){
                          setState(() {
                            terms=val;
                          });
                        },
                        value: terms,
                      ),
                      Text("I agree to "),
                      Text("PRIVACY POLICY",style: TextStyle(color: lightBlueColor),)
                    ],
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
            onPressed: (){

              if(terms) Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewContainer(creditcards[widget.index]['url'])));
              else
                _key.currentState.showSnackBar(SnackBar(content: new Text('Please agree to PRIVACY POLICY'),));


            },
          ),
        ),
      ),
    );
  }

  getFees() {
    var item=creditcards[widget.index];
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
                  child: Text("About Fee",style: TextStyle(color: lightBlueColor,fontWeight: FontWeight.bold,fontSize: 15),),
                ),
              ],
            ),
            Divider(),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Table(
                children: [
                  (item['firstyear']!=null)?
                  TableRow(
                      children: [
                        Text("First Year",style: TextStyle(color: Colors.grey)),
                        Padding(
                          padding: EdgeInsets.only(bottom: 15),
                          child: Text(item['firstyear']),
                        )
                      ]
                  ):TableRow(
                      children: [
                        Text(""),
                        Text(""),
                      ]
                  ),
                  (item['secondyear']!=null)?
                  TableRow(
                      children: [
                        Text("Second Year",style: TextStyle(color: Colors.grey)),
                        Padding(
                          padding: EdgeInsets.only(bottom: 15),
                          child: Text(item['secondyear']),
                        )
                      ]
                  ):TableRow(
                      children: [
                        Text(""),
                        Text(""),
                      ]
                  ),
                  (item['feewaiver']!=null)?
                  TableRow(
                      children: [
                        Text("Fee Waiver",style: TextStyle(color: Colors.grey)),
                        Padding(
                          padding: EdgeInsets.only(bottom: 15),
                          child: Text(item['feewaiver']),
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




}
