import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loanapp/BusinessLoans/BusinessLoanDetails.dart';
import 'package:loanapp/BusinessLoans/BusinessLoanList.dart';
import 'package:loanapp/CreditCards/CreditCardData.dart';
import 'package:loanapp/CreditCards/CreditCardDetails.dart';
import 'package:loanapp/CreditCards/CreditCardList.dart';
import 'package:loanapp/CreditScore/CreditScore.dart';
import 'package:loanapp/HomeLoans/HomeLoanDetails.dart';
import 'package:loanapp/HomeLoans/HomeLoanList.dart';
import 'package:loanapp/LoansAgentProperty/LoanAgentDetails.dart';
import 'package:loanapp/LoansAgentProperty/LoanAgentList.dart';
import 'package:loanapp/PersonalLoan/PersonalLoanDetails.dart';
import 'package:loanapp/PersonalLoan/PersonalLoanList.dart';

import '../SelectCity.dart';

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

String cityname = "";
bool isCitySet = false;

class OffersScreen extends StatefulWidget {
  @override
  _OffersScreenState createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  MaterialColor freeColor = MaterialColor(0xff01b527, colors);
  MaterialColor buttonColor = MaterialColor(0xffffa812, colors);
  MaterialColor lightBlueColor = MaterialColor(0xff3862ff, colors);

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
        
        SizedBox(height: 20.0,),
        getOffers(),
      ],
    );
  }

  getOffers() {
    return new Center(
      heightFactor: 10.0,
      child: Text('No Offers Currently', style: TextStyle(fontSize: 24.0),),
    );
  }

  getFreeReport() {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                "Get your Credit Report",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.white,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "for Rs.1500",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.white,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Text(
              "FREE",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.yellowAccent,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: RaisedButton(
                color: buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "Get it Now",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CreditPage()));
                },
              ),
            )
          ],
        )
      ],
    );
  }

  


  var creditcards = [
    citicb,
    Platinum_Delight_Credit_Card,
    ShopRite_Credit_Card,
    AMEX_Membership_Rewards_Credit_Card,
    SimplySAVE_SBI_Card,
    SimplyCLICK_SBI_Card,
    Times_Titanium_Credit,
    HDFC_Bank_MoneyBack_Credit_Card,
    AMEX_SmartEarn_Credit_Card,
    Citi_Rewards_Card
  ];
}
