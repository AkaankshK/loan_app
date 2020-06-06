import 'package:flutter/material.dart';
import 'package:gzx_dropdown_menu/gzx_dropdown_menu.dart';
import 'package:loanapp/BusinessLoans/BusinessData.dart';
import 'BusinessLoanDetails.dart';

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

class SortCondition {
  String name;
  bool isSelected;

  SortCondition({this.name, this.isSelected});
}

class BusinessLoanList extends StatefulWidget {
  @override
  _BusinessLoanListState createState() => _BusinessLoanListState();
}

class _BusinessLoanListState extends State<BusinessLoanList> {
  int min = 0;
  int max = 100000000;
  int mmin=0;
  int mmax=120;
  MaterialColor freeColor = MaterialColor(0xff01b527, colors);
  MaterialColor buttonColor = MaterialColor(0xffffa812, colors);
  MaterialColor lightBlueColor = MaterialColor(0xff3862ff, colors);
  List<String> _dropDownHeaderItemStrings = ['Amount', 'Tenure'];
  List<SortCondition> _amountConditions = [];
  List<SortCondition> _tenureConditions = [];
  SortCondition _selectAmountSortCondition;
  SortCondition _selectTenureSortCondition;
  GZXDropdownMenuController _dropdownMenuController =
      GZXDropdownMenuController();
  var AmountDropdown = [
    "Total",
    "Less than \u20b95000",
    "\u20b95,000 to \u20b91000",
    "\u20b910,000 to \u20b950,000",
    "\u20b950,000 to \u20b91,00,000",
    "Greater than 1 Lac"
  ];
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  GlobalKey _stackKey = GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _amountConditions.add(SortCondition(name: 'Total', isSelected: true));
    _amountConditions
        .add(SortCondition(name: "Less than \u20b95000", isSelected: false));
    _amountConditions.add(
        SortCondition(name: "\u20b95,000 to \u20b91000", isSelected: false));
    _amountConditions.add(
        SortCondition(name: "\u20b910,000 to \u20b950,000", isSelected: false));
    _amountConditions.add(SortCondition(
        name: "\u20b950,000 to \u20b91,00,000", isSelected: false));
    _amountConditions
        .add(SortCondition(name: "Greater than 1 Lac", isSelected: false));

    _selectAmountSortCondition = _amountConditions[0];

    _tenureConditions.add(SortCondition(name: 'Total', isSelected: true));
    _tenureConditions
        .add(SortCondition(name: 'Less than 3 Months', isSelected: false));
    _tenureConditions.add(SortCondition(name: '3-6 Months', isSelected: false));
    _tenureConditions
        .add(SortCondition(name: '6-12 Months', isSelected: false));
    _tenureConditions
        .add(SortCondition(name: 'Greater than 12 Months', isSelected: false));

    _selectTenureSortCondition = _tenureConditions[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
                  _dropDownHeaderItemStrings[0] =
                      _selectAmountSortCondition.name;
                  _dropdownMenuController.hide();
                  setState(() {
                    if (value.name == "Less than \u20b95000") {
                      min = 0;
                      max = 5000;
                    }
                    if (value.name == "Total") {
                      min = 0;
                      max = 100000000;
                    }
                    if (value.name == "\u20b95,000 to \u20b910,000") {
                      min = 5000;
                      max = 10000;
                    }
                    if (value.name == "\u20b910,000 to \u20b950,000") {
                      min = 10000;
                      max = 50000;
                    }
                    if (value.name == "\u20b950,000 to \u20b91,00,000") {
                      min = 50000;
                      max = 100000;
                    }
                    if (value.name == "Greater than 1 Lac") {
                      min = 100000;
                      max = 100000000;
                    }
                  });
                })),
            GZXDropdownMenuBuilder(
                dropDownHeight: 40.0 * _tenureConditions.length,
                dropDownWidget:
                    _buildConditionListWidget(_tenureConditions, (value) {
                  _selectTenureSortCondition = value;
                  _dropDownHeaderItemStrings[1] =
                      _selectTenureSortCondition.name;
                  _dropdownMenuController.hide();
                  setState(() {
                    if(value.name=='Total'){
                      mmin=0;
                      mmax=120;
                    }
                    if(value.name=="Less than 3 Months"){
                      mmin=0;
                      mmax=3;
                    }
                    if(value.name=="3-6 Months"){
                      mmin=3;
                      mmax=6;
                    }
                    if(value.name=="6-12 Months"){
                      mmin=6;
                      mmax=12;
                    }
                    if(value.name=="Greater than 12 Months"){
                      mmin=12;
                      mmax=120;
                    }
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
          // 下拉的头部项，目前每一项，只能自定义显示的文字、图标、图标大小修改
          items: [
            GZXDropDownHeaderItem(_dropDownHeaderItemStrings[0]),
            GZXDropDownHeaderItem(_dropDownHeaderItemStrings[1]),
          ],
          // GZXDropDownHeader对应第一父级Stack的key
          stackKey: _stackKey,
          // controller用于控制menu的显示或隐藏
          controller: _dropdownMenuController,
          // 当点击头部项的事件，在这里可以进行页面跳转或openEndDrawer
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
            child: (getLoans(businessLoans, min: min, max: max,mmin: mmin,mmax: mmax).isEmpty)
                ? Center(child: Text("Nothing to show"))
                : ListView.builder(
                    itemCount:
                    getLoans(businessLoans, min: min, max: max,mmin: mmin,mmax: mmax).length,
                    itemBuilder: (_, int index) {
                      var item =
                      getLoans(businessLoans, min: min, max: max,mmin: mmin,mmax: mmax)[index];
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      item['name'],
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      "\u20B9${item['maxamount']}",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Max Amount",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Text("Tenure:${item['tenure']} Months"),
                                    Text(
                                      "Interest:${item['interest']}/year",
                                    ),
                                    Text("Proc.Fee: ${item['processing fee']}"),
                                    SizedBox(
                                      height: 10,
                                    )
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      color: buttonColor,
                                      child: Text(
                                        "Apply",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: () {Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  BusinessLoanDetails(
                                                    index: index,
                                                  )));},
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
                                                      BusinessLoanDetails(
                                                        index: index,
                                                      )));
                                        },
                                        child: Text(
                                          "Details   >",
                                          style: TextStyle(
                                              color: lightBlueColor,
                                              fontSize: 15),
                                        ))
                                  ],
                                )
                              ]),
                            ],
                          ),
                        ),
                      );
                    }))
      ],
    );
  }

  _buildConditionListWidget(
      items, void itemOnTap(SortCondition sortCondition)) {
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: items.length,
      // item 的个数
      separatorBuilder: (BuildContext context, int index) =>
          Divider(height: 1.0),
      // 添加分割线
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

  List getLoans(var Personal, {int min=0, int max=100000000, int mmin=0 , int mmax=120}) {
    if(min==0 && max==100000000 && mmin==0 && mmax==120){
      return Personal;
    }
    else{
      List list3 = Personal.where((map) =>
      double.parse(map["maxamount1"].replaceAll('Lacs', '00000')) <= max &&
          double.parse(map["maxamount1"].replaceAll('Lacs', '00000')) > min && double.parse(map["tenure"].substring(map['tenure'].length-2)) > mmin && double.parse(map["tenure"].substring(map['tenure'].length-2)) <= mmax)
          .toList();

      return list3;
    }
  }
}
