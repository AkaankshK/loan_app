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
  @override
  _CreditCardListState createState() => _CreditCardListState();
}

class _CreditCardListState extends State<CreditCardList> {
  MaterialColor freeColor = MaterialColor(0xff01b527, colors);
  MaterialColor buttonColor = MaterialColor(0xffffa812, colors);
  MaterialColor lightBlueColor = MaterialColor(0xff3862ff, colors);
  List<String> _dropDownHeaderItemStrings = ['Sort By','Filter'];
  List<SortCondition> _amountConditions = [];
  List<SortCondition> _tenureConditions = [];
  SortCondition _selectAmountSortCondition;
  SortCondition _selectTenureSortCondition;
  GZXDropdownMenuController _dropdownMenuController = GZXDropdownMenuController();
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  GlobalKey _stackKey = GlobalKey();

  @override
  void initState() {
    _amountConditions.add(SortCondition(name: 'Total', isSelected: true));
    _amountConditions.add(SortCondition(name: "Fee from Low to High", isSelected: false));
    _amountConditions.add(SortCondition(name: "Fee from High to Low", isSelected: false));

    _selectAmountSortCondition = _amountConditions[0];

    _tenureConditions.add(SortCondition(name: 'Total', isSelected: true));
    _tenureConditions.add(SortCondition(name: 'Less than 3 Months', isSelected: false));
    _tenureConditions.add(SortCondition(name: '3-6 Months', isSelected: false));
    _tenureConditions.add(SortCondition(name: '6-12 Months', isSelected: false));
    _tenureConditions.add(SortCondition(name: 'Greater than 12 Months', isSelected: false));

    _selectTenureSortCondition = _tenureConditions[0];
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
        child: Image.asset("assets/back1.png",fit: BoxFit.fill,),
      )  ,
        getContents(),
        GZXDropDownMenu(

          // controller用于控制menu的显示或隐藏
          controller: _dropdownMenuController,
          // 下拉菜单显示或隐藏动画时长
          animationMilliseconds: 300,
          // 下拉后遮罩颜色
//          maskColor: Theme.of(context).primaryColor.withOpacity(0.5),
//          maskColor: Colors.red.withOpacity(0.5),
          // 下拉菜单，高度自定义，你想显示什么就显示什么，完全由你决定，你只需要在选择后调用_dropdownMenuController.hide();即可
          menus: [
            GZXDropdownMenuBuilder(
                dropDownHeight: 40.0 * _amountConditions.length,
                dropDownWidget: _buildConditionListWidget(_amountConditions, (value) {
                  _selectAmountSortCondition = value;
                  _dropDownHeaderItemStrings[0] =
                      _selectAmountSortCondition.name = _selectAmountSortCondition.name;
                  _dropdownMenuController.hide();
                  setState(() {});
                })),
            GZXDropdownMenuBuilder(
                dropDownHeight: 450.0,
                dropDownWidget:  _buildAddressWidget((selectValue) {
                  //_dropDownHeaderItemStrings[0] = selectValue;
                  _dropdownMenuController.hide();
                  setState(() {});
                })),
          ],
        ),
      ],
    );
  }

  getContents() {
    var amountSelection;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GZXDropDownHeader(
          // 下拉的头部项，目前每一项，只能自定义显示的文字、图标、图标大小修改
          items: [
            GZXDropDownHeaderItem(_dropDownHeaderItemStrings[0]),
            GZXDropDownHeaderItem(_dropDownHeaderItemStrings[1],iconData: Icons.filter_list,),
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
          height: MediaQuery.of(context).size.height/1.4,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              itemCount: creditcards.length,
              itemBuilder: (_,int index){
                var item=creditcards[index];
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
                                  Text(item['title'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                  Text("Bank: ${item['name']}"),
                                  Text("Annual Fee: ${item['firstyear']}"),
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
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CreditCardDetails(index: index,)));
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

  _buildConditionListWidget(items, void itemOnTap(SortCondition sortCondition)) {
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: items.length,
      // item 的个数
      separatorBuilder: (BuildContext context, int index) => Divider(height: 1.0),
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
                      color: goodsSortCondition.isSelected ? Theme.of(context).primaryColor : Colors.black,
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

  _buildAddressWidget(void itemOnTap(String selectValue)) {
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
                          border: Border.all(
                              width: 1,color: Colors.grey
                          )
                      ),
                      child: Center(child: Text("RBL Bank"))),
                  Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,color: Colors.grey
                          )
                      ),
                      child: Center(child: Text("SBI Bank"))),
                  Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,color: Colors.grey
                          )
                      ),
                      child: Center(child: Text("Citi Bank"))),

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
                          border: Border.all(
                              width: 1,color: Colors.grey
                          )
                      ),
                      child: Center(child: Text("AMEX Bank"))),
                  Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,color: Colors.grey
                          )
                      ),
                      child: Center(child: Text("HDFC Bank"))),
                  Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,color: Colors.grey
                          )
                      ),
                      child: Center(child: Text("AXIS Bank"))),

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
                          border: Border.all(
                              width: 1,color: Colors.grey
                          )
                      ),
                      child: Center(child: Text("Movies"))),
                  Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,color: Colors.grey
                          )
                      ),
                      child: Center(child: Text("Shopping"))),
                  Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,color: Colors.grey
                          )
                      ),
                      child: Center(child: Text("Travel"))),

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
                          border: Border.all(
                              width: 1,color: Colors.grey
                          )
                      ),
                      child: Center(child: Text("Fuel"))),
                  Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,color: Colors.grey
                          )
                      ),
                      child: Center(child: Text("Air Miles"))),
                  Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,color: Colors.grey
                          )
                      ),
                      child: Center(child: Text("Hotel"))),

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
                onPressed: (){},
                child: Text("Reset"),
              ),
            ),
            Expanded(
              flex: 50,
              child: MaterialButton(
                color: buttonColor,
                onPressed: (){},
                child: Text("Confirm",style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
