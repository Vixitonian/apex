import 'package:apex_sc/models/user.dart';
import 'package:apex_sc/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    User user = context.read<AuthProvider>().user!;
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage:
                    user.avatar != null ? NetworkImage(user.avatar!) : null,
                child: user.avatar == null
                    ? Text(
                        user.fullName.substring(0, 1).toUpperCase(),
                        style: TextStyle(fontSize: 40),
                      )
                    : null,
              ),
            ),
            SizedBox(height: 20),
            _buildInfoTile('Full Name', user.fullName),
            _buildInfoTile('Username', user.username ?? 'Not set'),
            _buildInfoTile('Email', user.email),
            _buildInfoTile('Phone', user.phone ?? 'Not set'),
            _buildInfoTile('Phone Country', user.phoneCountry ?? 'Not set'),
            _buildInfoTile('Country', user.country),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTile(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$title:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }
}
