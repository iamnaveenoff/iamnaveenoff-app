import 'package:flutter/material.dart';
import 'package:iamnaveenoff/main.dart';
import 'package:iamnaveenoff/services/auth_service.dart';
import 'package:iamnaveenoff/utils/colors.dart';
import 'package:nb_utils/nb_utils.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(FirebaseAuthService().user.photoURL!),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.all(8),
            child: Row(
              children: [
                Icon(Icons.person,
                    size: 20, color: opSecondaryColor.withOpacity(0.6)),
                16.width,
                Text(FirebaseAuthService().user.displayName!,
                    style: primaryTextStyle()),
              ],
            ),
          ),
          Divider(),
          Container(
            margin: EdgeInsets.all(8),
            child: Row(
              children: [
                Icon(Icons.email,
                    size: 20, color: opSecondaryColor.withOpacity(0.6)),
                16.width,
                Text(FirebaseAuthService().user.email!,
                    style: primaryTextStyle()),
              ],
            ),
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.nightlife,
                      size: 20, color: opSecondaryColor.withOpacity(0.6)),
                  16.width,
                  Text('Dark Mode', style: primaryTextStyle()),
                ],
              ),
              Switch(
                value: appStore.isDarkModeOn,
                activeColor: appColorPrimary,
                onChanged: (s) {
                  setState(() {});
                  appStore.toggleDarkMode(value: s);
                },
              )
            ],
          ).paddingSymmetric(horizontal: 8)
        ],
      ),
    );
  }
}
