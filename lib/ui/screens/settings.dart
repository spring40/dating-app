import 'package:basic_app/utilities/constants.dart';
import 'package:flutter/material.dart';

// In diesem Screen (Bildschirm) können Einstellungen in der App vorgenommen werden
class SettingsScreen extends StatefulWidget {
  // Der Routenname wird zur navigation zwischen den Screens (Bildschirmansichten) verwendet.
  static const String routeName = "/settings";

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> globalFromKey = GlobalKey<ScaffoldState>();

  String _teamMembers = '';

  @override
  void initState() {
    super.initState();
    _loadTeamMembers();
  }

  _loadTeamMembers() {
    setState(() {
      _teamMembers = Constants.teamMembersNames.join(', ');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text("Einstellungen"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(SettingsScreen.routeName);
            },
            icon: const Icon(
              Icons.settings,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          const Divider(),
          Center(
            child: Text('Eine App von $_teamMembers'),
          )
        ],
      ),
    );
  }
}
