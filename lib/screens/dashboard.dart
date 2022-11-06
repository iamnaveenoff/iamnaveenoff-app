import 'package:flutter/material.dart';
import 'package:iamnaveenoff/screens/add_transaction.dart';
import 'package:iamnaveenoff/screens/hearder.dart';
import 'package:iamnaveenoff/screens/home_screen.dart';
import 'package:iamnaveenoff/screens/settings.dart';
import 'package:iamnaveenoff/services/auth_service.dart';
import 'package:iamnaveenoff/utils/colors.dart';
import 'package:iamnaveenoff/widget/widgets.dart';
import 'package:nb_utils/nb_utils.dart';

class Dashboard extends StatefulWidget {
  static String route() => '/home';
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final tab = [HomeScreen(), SettingsPage()];
    const padding = EdgeInsets.fromLTRB(24, 24, 24, 0);
    var title = '';

    if (_currentIndex == 0) {
      title = 'Dashboarad';
    } else if (_currentIndex == 1) {
      title = 'Profile';
    }
    return Scaffold(
      appBar: _currentIndex == 0
          ? getAppBar1(
              title,
            )
          : getAppBar(
              title,
              pressed: () {
                setState(
                  () {
                    _currentIndex = 0;
                  },
                );
              },
            ),
      body: tab[_currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
            MaterialPageRoute(
              builder: (context) => AddTransactions(),
            ),
          )
              .whenComplete(() {
            setState(() {});
          });
        },
        backgroundColor: opPrimaryColor,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        child: Icon(
          Icons.add,
          size: 32.0,
        ),
      ),
      bottomNavigationBar: Stack(
        alignment: Alignment.center,
        children: [
          BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: false,
            selectedItemColor: opPrimaryColor,
            unselectedItemColor: opSecondaryColor.withOpacity(0.6),
            currentIndex: _currentIndex,
            elevation: 8.0,
            items: [
              const BottomNavigationBarItem(
                  icon: Icon(Icons.home, size: 24), label: ''),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.settings, size: 24), label: ''),
            ],
            onTap: (index) {
              setState(
                () {
                  _currentIndex = index;
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
