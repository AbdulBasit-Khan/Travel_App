import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app_template/screens/profile/setting/settings_list.dart';
import 'package:travel_app_template/utils/colors_const.dart';
import 'package:travel_app_template/utils/common_functions.dart';
import 'package:travel_app_template/utils/strings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool lockInBackground = true;
  bool isUseFingerPrint = true;
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0,
          title:   Text(Strings.setting1,style: themeTitleStyle,),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: Column(
        children: [
          Divider(color: Colors.grey.shade300,),
          Expanded(child: buildSettingsList()),
        ],
      )

    );
  }

  Widget buildSettingsList() {
    return SettingsList(
      lightBackgroundColor: Theme.of(context).backgroundColor,
      darkBackgroundColor:  Theme.of(context).backgroundColor,
      contentPadding: const EdgeInsets.only(top: 20,left: 10,bottom: 10),
      sections: [
        SettingsSection(
          title: 'Common',
          titleTextStyle: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
          tiles: const [
            SettingsTile(
              title: 'Language',
              subtitle: 'English',
              leading: Icon(Icons.language),

            ),
            SettingsTile(
              title: 'Environment',
              subtitle: 'Production',
              leading: Icon(Icons.cloud_queue),
            ),
          ],
        ),
        SettingsSection(
          titleTextStyle: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
          title: 'Account',
          tiles: const [
            SettingsTile(title: 'Phone number', leading: Icon(Icons.phone)),
            SettingsTile(title: 'Email', leading: Icon(Icons.email)),
            SettingsTile(title: 'Sign out', leading: Icon(Icons.exit_to_app)),
          ],
        ),
        SettingsSection(
          titleTextStyle: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
          title: 'Security',
          tiles: [
            SettingsTile.switchTile(
              title: 'Lock app in background',
              switchActiveColor: ColorsConstants.appColor,
              leading: const Icon(Icons.phonelink_lock),
              switchValue: lockInBackground,
              onToggle: (bool value) {
                setState(() {
                  lockInBackground = value;
                  notificationsEnabled = value;
                });
              },
            ),
            SettingsTile.switchTile(
              title: 'Use fingerprint',
              switchActiveColor: ColorsConstants.appColor,
              subtitle: 'Allow application to access stored fingerprint IDs.',
              leading: const Icon(Icons.fingerprint),
              onToggle: (bool value) {
                setState(() {
                  isUseFingerPrint = value;

                });
              },
              switchValue: isUseFingerPrint,
            ),
            SettingsTile.switchTile(
              title: 'Enable Notifications',
              switchActiveColor: ColorsConstants.appColor,
              enabled: notificationsEnabled,
              leading: const Icon(Icons.notifications_active),
              switchValue: true,
              onToggle: (value) {
                setState(() {
                  notificationsEnabled=value;
                });
              },
            ),
          ],
        ),
        SettingsSection(
          titleTextStyle: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
          title: 'Misc',
          tiles: const [
            SettingsTile(
                title: 'Terms of Service', leading: Icon(Icons.description)),
            SettingsTile(
                title: 'Open source licenses',
                leading: Icon(Icons.collections_bookmark)),
          ],
        ),
      ],
    );
  }
}
