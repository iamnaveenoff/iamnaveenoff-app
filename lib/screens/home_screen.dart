import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iamnaveenoff/models/Transaction_model.dart';
import 'package:iamnaveenoff/services/auth_service.dart';
import 'package:iamnaveenoff/services/firebase_crud.dart';
import 'package:iamnaveenoff/utils/colors.dart';
import 'package:iamnaveenoff/widget/widgets.dart';
import 'package:nb_utils/nb_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Stream<QuerySnapshot> collectionReference =
      FirebaseCrud.readTransactions();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: context.width() - 32,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(
                left: 16.0, right: 16, bottom: 16, top: 16),
            decoration: boxDecoration(
                radius: 20,
                backGroundColor: opPrimaryColor,
                spreadRadius: 4.0,
                blurRadius: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Image.asset('assets/opchip.png', height: 40, width: 40),
                        Text('Visa',
                            style:
                                boldTextStyle(size: 20, color: Colors.white)),
                      ],
                    ),
                    8.height,
                    FittedBox(
                      child: Text(
                        "**** **** **** " + "1096",
                        style: boldTextStyle(
                            size: 20,
                            color: Colors.white,
                            letterSpacing: 3,
                            wordSpacing: 2),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    16.height,
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FittedBox(
                          child: Text(
                            'CARDHOLDER',
                            style: secondaryTextStyle(color: Colors.white60),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        8.height,
                        FittedBox(
                          child: Text(
                            "${FirebaseAuthService().user.displayName}",
                            style: primaryTextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FittedBox(
                          child: Text(
                            'BALANCE',
                            style: secondaryTextStyle(color: Colors.white60),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        FittedBox(
                          child: Text(
                            "₹ 5000",
                            style: primaryTextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(
              12.0,
            ),
            child: Text(
              "Recent Transactions",
              style: secondaryTextStyle(size: 18, fontFamily: fontMedium),
            ),
          ),
        ],
      ),
    );
  }
}
