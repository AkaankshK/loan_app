import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:gzx_dropdown_menu/gzx_dropdown_menu.dart';
import 'package:loanapp/CreditCards/CreditCardData.dart';

import 'package:loanapp/CreditCards/CreditCardDetails.dart';

class SortCondition {
  String name;
  bool isSelected;

  SortCondition({this.name, this.isSelected});
}

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

class CreditCardList extends StatefulWidget {
  var list;
  CreditCardList(var list){
    this.list = list;
  }
  @override
  _CreditCardListState createState() => _CreditCardListState(list);
}

class _CreditCardListState extends State<CreditCardList> {

  Map<String, bool> colorMaps = new Map<String, bool>();

  var creditcards;
  _CreditCardListState(var list){
    this.creditcards = list;
  }
  MaterialColor freeColor = MaterialColor(0xff01b527, colors);
  MaterialColor buttonColor = MaterialColor(0xffffa812, colors);
  MaterialColor lightBlueColor = MaterialColor(0xff3862ff, colors);
  List<String> _dropDownHeaderItemStrings = ['Sort By', 'Filter'];
  List<SortCondition> _amountConditions = [];
  List<SortCondition> _filterConditions = [];
  SortCondition _selectAmountSortCondition;
  SortCondition _selectFilterSortCondition;
  GZXDropdownMenuController _dropdownMenuController = GZXDropdownMenuController();
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  GlobalKey _stackKey = GlobalKey();

  bool isAsc = false;
  bool isDsc = false;

  List _selectedBanksList = [];


  @override
  void initState() {
    _amountConditions.add(SortCondition(name: 'Total', isSelected: true));
    _amountConditions.add(SortCondition(name: "Fee from Low to High", isSelected: false));
    _amountConditions.add(SortCondition(name: "Fee from High to Low", isSelected: false));

    _selectAmountSortCondition = _amountConditions[0];

    _filterConditions.add(SortCondition(name: 'Total', isSelected: true));
    _filterConditions.add(SortCondition(name: 'RBL Bank', isSelected: false));
    _filterConditions.add(SortCondition(name: 'SBI Bank', isSelected: false));
    _filterConditions.add(SortCondition(name: 'Citi Bank', isSelected: false));
    _filterConditions.add(SortCondition(name: 'AMEX Bank', isSelected: false));
    _filterConditions.add(SortCondition(name: 'HDFC Bank', isSelected: false));
    _filterConditions.add(SortCondition(name: 'AXIS Bank', isSelected: false));
//    _filterConditions.add(SortCondition(name: 'Card Type', isSelected: false));

    _selectFilterSortCondition = _filterConditions[0];
    for(var i in creditcardsOrignal){
      colorMaps[i['name'].toString()] = false;
//      print(i['name'].toString());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        title: Text("Credit Card"),
        centerTitle: true,
        backgroundColor: lightBlueColor,
      ),
      body: getBody(),
    );
  }

  getBody() {
    return Stack(
      key: _stackKey,
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
        GZXDropDownMenu(

          controller: _dropdownMenuController,

          animationMilliseconds: 300,

          menus: [
            GZXDropdownMenuBuilder(
                dropDownHeight: 40.0 * _amountConditions.length,
                dropDownWidget:
                    _buildConditionListWidget(_amountConditions, (value) {
                  _selectAmountSortCondition = value;
                  _dropDownHeaderItemStrings[0] = _selectAmountSortCondition.name = _selectAmountSortCondition.name;
                  _dropdownMenuController.hide();
                  setState(() {

                    if(value.name == 'Fee from Low to High'){
                      isAsc = true;
                      isDsc = false;
                    }
                    else if(value.name == 'Fee from High to Low'){
                      isDsc = true;
                      isAsc = false;
                    }else{
                      isDsc = false;
                      isAsc = false;
                    }
                  });
                })),
            GZXDropdownMenuBuilder(
                dropDownHeight: 450.0,
                dropDownWidget: _buildAddressWidget(_filterConditions, (value) {
//                  _selectFilterSortCondition = selectValue;
                  _selectFilterSortCondition = value;
                _dropDownHeaderItemStrings[1] = _selectFilterSortCondition.name = _selectFilterSortCondition.name;
                  _dropdownMenuController.hide();
                  setState(() {
                    print('${value.name}');
                    print('flag');
                  });
                })),
          ],
        ),
      ],
    );
  }

  getContents() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GZXDropDownHeader(

          items: [
            GZXDropDownHeaderItem(_dropDownHeaderItemStrings[0]),
            GZXDropDownHeaderItem(_dropDownHeaderItemStrings[1], iconData: Icons.filter_list,),
          ],

          stackKey: _stackKey,

          controller: _dropdownMenuController,

          onItemTap: (index) {
            if (index == 3) {
              _dropdownMenuController.hide();
              _scaffoldKey.currentState.openEndDrawer();
            }
          },
//
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 1.4,
          width: MediaQuery.of(context).size.width,
//   !SortedCredit(creditcards, isAsc, isDsc)
          child: (SortedCredit(creditcards, isAsc, isDsc) && (creditcards.length == 0)) ?
          Center(child: new Text('Nothing to show'),) :
          ListView.builder(

              itemCount: creditcards.length,
              itemBuilder: (_, int index) {
                var item = creditcards[index];
                return Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Table(
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      children: [
                        TableRow(children: [
                          Image.asset(
                            item['logo'],
                            fit: BoxFit.scaleDown,
                            height: 125,
                            width: 125,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                item['title'],
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text("Bank: ${item['name']}"),
                              Text("Annual Fee: ${item['firstyear']}"),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                color: buttonColor,
                                child: Text(
                                  "Apply",
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {},
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CreditCardDetails(
                                                  index: index,
                                                )));
                                  },
                                  child: Text(
                                    "Details   >",
                                    style: TextStyle(
                                        color: lightBlueColor, fontSize: 15),
                                  ))
                            ],
                          )
                        ]),
                      ],
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }

  _buildConditionListWidget( items, void itemOnTap(SortCondition sortCondition)) {
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: items.length,

      separatorBuilder: (BuildContext context, int index) =>
          Divider(height: 1.0),

      itemBuilder: (BuildContext context, int index) {
        SortCondition goodsSortCondition = items[index];
        return GestureDetector(
          onTap: () {
            for (var value in items) {
              value.isSelected = false;
            }
            goodsSortCondition.isSelected = true;

            itemOnTap(goodsSortCondition);
          },
          child: Container(
//            color: Colors.blue,
            height: 40,
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Text(
                    goodsSortCondition.name,
                    style: TextStyle(
                      color: goodsSortCondition.isSelected
                          ? Theme.of(context).primaryColor
                          : Colors.black,
                    ),
                  ),
                ),
                goodsSortCondition.isSelected
                    ? Icon(
                        Icons.check,
                        color: Theme.of(context).primaryColor,
                        size: 16,
                      )
                    : SizedBox(),
                SizedBox(
                  width: 16,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _buildAddressWidget(items, void itemOnTap(SortCondition selectValue)) {
    List _selectedBanks = [];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Bank"),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey)),
                      child: Center(
                          child: FlatButton(
                              onPressed: () {
                                _selectedBanks.add('RBL Bank');
                              },

                              child: Text(
                                "RBL Bank",
                                style: TextStyle(color: Colors.black),
                              )))),
                  Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey)),
                      child: Center(
                          child: Expanded(
                              child: FlatButton(
                                  onPressed: () {
                                    _selectedBanks.add('SBI');
                                  },
                                  child: Text(
                                    "SBI Bank",
                                    style: TextStyle(color: Colors.black),
                                  ))))),
                  Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey)),
                      child: Center(
                          child: Expanded(
                              child: FlatButton(
                                  onPressed: () {
                                    _selectedBanks.add('Citi Bank');
                                    _selectedBanks.add('Citi');
                                  },
                                  child: Text(
                                    "Citi Bank",
                                    style: TextStyle(color: Colors.black),
                                  )))))
//                      child: Center(child: Text("Citi Bank"))),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                        color: (colorMaps['AMEX'] ) ? Colors.lightBlueAccent :  Colors.white,

                      ),
                      child: Center(
                          child: Expanded(
                              child: FlatButton(
                                  onPressed: () {

                                      _selectedBanks.add("AMEX");
                                        colorMaps["AMEX"] = true;

                                  },



                                  child: Text(
                                    "AMEX Bank",
                                    style: TextStyle(color: Colors.black),
                                  ))))),
//                      child: Center(child: Text("AMEX Bank"))),
                  Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey)),
//                      child: Center(child: Text("HDFC Bank"))
                      child: Center(
                          child: Expanded(
                              child: FlatButton(
                                  onPressed: () {
                                    _selectedBanks.add('HDFC');
                                  },
                                  child: Text(
                                    "HDFC Bank",
                                    style: TextStyle(color: Colors.black),
                                  ))))),
                  Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey)),
//                      child: Center(child: Text("AXIS Bank"))
                      child: Center(
                          child: Expanded(
                              child: FlatButton(
                                  onPressed: () {
                                    _selectedBanks.add('AXIS');
                                  },
                                  child: Text(
                                    "AXIS Bank",
                                    style: TextStyle(color: Colors.black),
                                  ))))),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Card Type"),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey)),
//                      child: Center(child: Text("Movies"))),
                      child: Center(
                          child: Expanded(
                              child: FlatButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Movies",
                                    style: TextStyle(color: Colors.black),
                                  ))))),
                  Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey)),
//                      child: Center(child: Text("Shopping"))),
                      child: Center(
                          child: Expanded(
                              child: FlatButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Shopping",
                                    style: TextStyle(color: Colors.black),
                                  ))))),
                  Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey)),
//                      child: Center(child: Text("Travel"))),
                      child: Center(
                          child: Expanded(
                              child: FlatButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Travel",
                                    style: TextStyle(color: Colors.black),
                                  ))))),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey)),
                      child: Center(
                          child: Expanded(
                              child: FlatButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Fuel",
                                    style: TextStyle(color: Colors.black),
                                  ))))),
//                      child: Center(child: Text("Fuel"))),
                  Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey)),
                      child: Center(
                          child: Expanded(
                              child: FlatButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Air Miles",
                                    style: TextStyle(color: Colors.black),
                                  ))))),
//                      child: Center(child: Text("Air Miles"))),
                  Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey)),
                      child: Center(
                          child: Expanded(
                              child: FlatButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Hotel",
                                    style: TextStyle(color: Colors.black),
                                  ))))),
//                      child: Center(child: Text("Hotel"))),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Expanded(
              flex: 50,
              child: MaterialButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CreditCardList(creditcardsOrignal)));
                },
                child: Text("Reset"),
              ),
            ),
            Expanded(
              flex: 50,
              child: MaterialButton(
                color: buttonColor,
                onPressed: () {

                  _selectedBanksList = List.of(HashSet.from(_selectedBanks));
//                  for(var t in _selectedBanksList) print(t.toString() + " ***\n");
//                  Navigator.pushReplacement(context, newRoute)
                  var newList = [];
                  for(var item in creditcardsOrignal) {
                    if(_selectedBanks.contains(item['name'])) {
                      newList.add(item);
                      print(item['name'].toString());
                    }
                  }
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CreditCardList(newList)));
                },
                child: Text(
                  "Confirm",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool SortedCredit(var CreditCard, bool asc, bool dsc) {

    if(asc){
      creditcards.sort((a, b) => double.parse(a['firstyear'].toString().replaceAll(RegExp("[a-zA-Z.+]"), '').trim())
          .compareTo(double.parse(b['firstyear'].toString().replaceAll(RegExp("[a-zA-Z.+]"), '').trim())));
      return true;
    }else if(dsc){
      creditcards.sort((a, b) => double.parse(b['firstyear'].toString().replaceAll(RegExp("[a-zA-Z.+]"), '').trim())
          .compareTo(double.parse(a['firstyear'].toString().replaceAll(RegExp("[a-zA-Z.+]"), '').trim())));
      return true;
    }
    else if(!isAsc && !isDsc){
      return true;
    }
  return true;
  }

  final creditcardsOrignal = [citicb,Platinum_Delight_Credit_Card,ShopRite_Credit_Card,AMEX_Membership_Rewards_Credit_Card,
    SimplySAVE_SBI_Card,SimplyCLICK_SBI_Card,Times_Titanium_Credit,HDFC_Bank_MoneyBack_Credit_Card,AMEX_SmartEarn_Credit_Card,
    Citi_Rewards_Card
  ];


}
