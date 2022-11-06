import 'package:flutter/material.dart';
import 'package:iamnaveenoff/utils/colors.dart';
import 'package:nb_utils/nb_utils.dart';

BoxDecoration boxDecoration(
    {double radius = 80.0,
    Color? backGroundColor = opPrimaryColor,
    double blurRadius = 8.0,
    double spreadRadius = 8.0,
    shadowColor = Colors.black12}) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    boxShadow: [
      BoxShadow(
          color: shadowColor,
          blurRadius: blurRadius,
          spreadRadius: spreadRadius)
    ],
    color: backGroundColor,
  );
}

getAppBar1(title, {actions, leading}) {
  return AppBar(
    leading: leading,
    title: Text(title, style: boldTextStyle(size: 22)),
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    centerTitle: false,
    automaticallyImplyLeading: false,
    actions: actions,
  );
}

getAppBar(title, {showBack = true, GestureTapCallback? pressed}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(60.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
//        showBack
//            ? InkWell(
//          onTap: pressed,
//          child: Container(
//            margin: EdgeInsets.only(left: 16),
//            height: 45,
//            width: 45,
//            decoration: BoxDecoration(
//              color: Color(0xFFE7E6F3),
//              borderRadius: BorderRadius.all(
//                Radius.circular(16),
//              ),
//            ),
//            child: Icon(
//              Icons.keyboard_backspace,
//              color: opPrimaryColor,
//            ),
//          ),
//        )
//            : SizedBox(),
        16.width,
        Text(title, style: boldTextStyle(size: 22)).center(),
      ],
    ),
  );
}

Widget cardIncome(String value) {
  return Row(
    children: [
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            20.0,
          ),
        ),
        padding: EdgeInsets.all(6.0),
        child: Icon(
          Icons.arrow_upward,
          size: 28.0,
          color: Colors.green[700],
        ),
        margin: EdgeInsets.only(right: 8.0),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Income",
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.white70,
            ),
          ),
          Text(
            "$value ₹ ",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ],
      ),
    ],
  );
}

///////////////

Widget cardExpense(String value) {
  return Row(
    children: [
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            20.0,
          ),
        ),
        padding: EdgeInsets.all(6.0),
        child: Icon(
          Icons.arrow_downward,
          size: 28.0,
          color: Colors.red[700],
        ),
        margin: EdgeInsets.only(right: 8.0),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Expense",
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.white70,
            ),
          ),
          Text(
            "$value ₹",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ],
      ),
    ],
  );
}
