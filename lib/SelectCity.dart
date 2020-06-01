import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:loanapp/BusinessLoans/BusinessLoanList.dart';
import 'package:loanapp/CreditCards/CreditCardList.dart';
import 'package:loanapp/HomeLoans/HomeLoanList.dart';
import 'package:loanapp/LoansAgentProperty/LoanAgentList.dart';

import 'HomeScreen/HomeScreen.dart';
import 'PersonalLoan/PersonalLoanList.dart';

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
class CityCondition {
  String name;
  bool isSelected;

  CityCondition({this.name, this.isSelected});
}

class SelectCity extends StatefulWidget {
  final int index;
  SelectCity({Key key, this.index}) : super(key: key);
  @override
  _SelectCityState createState() => _SelectCityState();
}

class _SelectCityState extends State<SelectCity> {
  bool selected=false;

  GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();
  MaterialColor freeColor = MaterialColor(0xff01b527, colors);
  MaterialColor buttonColor = MaterialColor(0xffffa812, colors);
  MaterialColor lightBlueColor = MaterialColor(0xff3862ff, colors);
  List<CityCondition> citynames=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(String i in cities){
      citynames.add(CityCondition(name: i,isSelected: false));

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: getBottom(),
      appBar: AppBar(
        elevation: 0,
        title: Text("City"),
        centerTitle: true,
        backgroundColor: lightBlueColor,
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
            child: Image.asset(
              "assets/back1.png",
              fit: BoxFit.fill,
            ),
          ),
          getContents(),



        ],
      ),
    );
  }

  getContents() {

    return Stack(
      children: <Widget>[

        Padding(
          // Right drawer padding
          padding: const EdgeInsets.fromLTRB(8.0, 8.0, 45.0, 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: SimpleAutoCompleteTextField(
                          key: key,
                          suggestions: cities,
                          submitOnSuggestionTap: true,

                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              hintStyle: TextStyle(color: Colors.black,),
                              hintText: "Search City",
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.black,
                              )),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                child: SizedBox(height: 15,
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: new Text('Hot City', textAlign: TextAlign.start,)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height / 1.5,
                      width: MediaQuery.of(context).size.width,
                      child: StatefulBuilder(
                        builder: (BuildContext bc,StateSetter setState){
                          return ((citynames.length == 0)) ? Center(child: new Text('Nothing to show'),) : GridView.builder(
                              itemCount: citynames.length,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 4),
                              itemBuilder: (_, int index) {
                                CityCondition item = citynames[index];
                                return GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      for(var i in citynames){
                                        i.isSelected=false;
                                      }
                                      item.isSelected=true;

                                    });
                                  },
                                  child: Container(
                                    child: Expanded(
                                      child: Card(
                                          color: item.isSelected ? lightBlueColor : Colors.white,
                                          elevation: 2,
                                          shadowColor: lightBlueColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Center(child: Text(item.name,style: TextStyle(color: item.isSelected?Colors.white:Colors.black),))),
                                    ),
                                  ),
                                );
                              });
                        },
                      )

                  ),
                ),
              ),
            ],
          ),
        ),

        Positioned(
            right: 10.0,
            top: MediaQuery.of(context).size.height / 7,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  GestureDetector(
//                    onTap: () {
//                      print('tapped');
//                      setState(() {
//                        for(String i in cities){
//                          citynames.add(CityCondition(name: i,isSelected: false));
//                        }
//                      });
//                    },
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            for(String i in cities) citynames.add(CityCondition(name: i,isSelected: false));
                          });
                        },
                          child: new Text('Hot', style: TextStyle(color: Colors.grey),))),
                  Padding(padding: EdgeInsets.only(top: 24.0),),

                  for(var i in _cityListIndex) _index(i),


                ],
              ),
            )),

      ],
    );
  }

  Widget navigate(int index) {
    List<Widget> loantype=<Widget>[
      PersonalLoanList(),
    ];
    return loantype.elementAt(index);

  }

  getBottom() {
    return BottomAppBar(
      child: Container(
        height: 50,
        child: MaterialButton(
            color: lightBlueColor,
            onPressed: (){
              goToNext();

            },
            child: Text("NEXT",style: TextStyle(color: Colors.white),)),
      ),
    );
  }







  void goToNext() {
    setState(() {
      isCitySet=true;
    });
    print(isCitySet);
    if(widget.index==0){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>PersonalLoanList()));
    }
    if(widget.index==1){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>BusinessLoanList()));
    }
    if(widget.index==2){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeLoanList()));
    }
    if(widget.index==3){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoanAgentList()));
    }
    if(widget.index==4){
      Navigator.push(context, MaterialPageRoute(builder: (context) => CreditCardList()));
    }
  }

  Widget _index(var ch) {

    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: GestureDetector(
        onTap: (){
          print(ch);
          List temp = [];
          for(var i in cities) {
            if(i[0] == ch) temp.add(i);
          }
//          temp.add(cities.where((element) => ch == element[0]));

          setState(() {
//            for(String i in temp) print(i + " - ");
            citynames.removeRange(0, citynames.length);

            for(String i in temp){
              citynames.add(CityCondition(name: i,isSelected: false));
            }
          });

        },
          child: new Text('$ch', style: TextStyle(color: Colors.grey),)),
    );
  }

}



final cities = [
  "Mumbai",
  "Delhi",
  "Bangalore",
  "Chennai",
  "Hyderabad",
  "Ahmedabad",
  "Kolkata",
  " Surat",
  "Pune",
  "Jaipur",
  "Lucknow",
  "Kanpur",
  "Nagpur",
  "Visakhapatnam",
  "Indore",
  "Thane",
  "Bhopal",
  "Pimpri-Chinchwad",
  "Patna",
  "Vadodara",
  "Ghaziabad",
  "Ludhiana",
  "Coimbatore",
  "Agra",
  "Madurai",
  "Nashik",
  "Vijayawada",
  "Faridabad",
  "Meerut",
  "Rajkot",
  "Kalyan-Dombivali",
  "Vasai-Virar",
  "Varanasi",
  "Srinagar",
  "Aurangabad",
  "Dhanbad",
  "Amritsar",
  "Navi Mumbai",
  "Allahabad",
  "Ranchi",
  "Howrah",
  "Jabalpur",
  "Gwalior",
  "Jodhpur",
  "Raipur",
  "Kota",
];

final _cityListIndex = [ 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];

