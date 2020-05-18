import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:loanapp/BusinessLoans/BusinessLoanList.dart';
import 'package:loanapp/CreditCards/CreditCardList.dart';
import 'package:loanapp/HomeLoans/HomeLoanList.dart';
import 'package:loanapp/LoansAgainstProperty/LoanAgainstList.dart';
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

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width / 1.5,
                child: Center(
                  child: SimpleAutoCompleteTextField(
                    key: key,
                    suggestions: cities,
                    submitOnSuggestionTap: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)
                        ),
                        hintStyle: TextStyle(color: Colors.black),
                        hintText: "Search City",
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        )),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15,),
          SizedBox(
              height: MediaQuery.of(context).size.height / 1.5,
              width: MediaQuery.of(context).size.width,
              child: StatefulBuilder(
                builder: (BuildContext bc,StateSetter setState){
                  return GridView.builder(
                      itemCount: citynames.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 4),
                      itemBuilder: (_, int index) {
                        CityCondition item=citynames[index];
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
                            child: Card(
                                color: item.isSelected ? lightBlueColor : Colors.white,
                                elevation: 2,
                                shadowColor: lightBlueColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(child: Text(item.name,style: TextStyle(color: item.isSelected?Colors.white:Colors.black),))),
                          ),
                        );
                      });
                },
              )

          ),
        ],
      ),
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
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoanAgainstList()));
    }
    if(widget.index==4){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>CreditCardList()));
    }
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
