import 'package:flutter_application_1/customer/povider/loginprovider.dart';
import 'package:flutter_application_1/customer/screen/login.dart';

import 'package:flutter_application_1/serviceman/view/activeservice.dart';
import 'package:flutter_application_1/serviceman/view/calenderview.dart';
import 'package:flutter_application_1/serviceman/view/completedtask.dart';
import 'package:flutter_application_1/serviceman/provider/servicemanprofile.dart';

import 'package:flutter_application_1/serviceman/widget/servicemancard.dart';
import 'package:flutter_application_1/serviceman/view/toadystasklist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/storage/usepreference.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      // <-- Make the callback async
      final prefs = await SharedPreferences.getInstance();
      String? bearerToken = prefs.getString('token');
      if (bearerToken != null) {
        Provider.of<ServiceManProviderProfile>(
          context,
          listen: false,
        ).fetchProfile(bearerToken); // Use bearerToken instead of token
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Consumer<ServiceManProviderProfile>(
          builder: (context, provider, child) {
            if (provider.isLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (provider.errorMessage != null) {
              return Center(child: Text(provider.errorMessage!));
            }
            if (provider.serviceManProfile == null ||
                provider.serviceManProfile!.data == null) {
              return Center(child: Text("No Profile Data Available"));
            }

            final data = provider.serviceManProfile!.data!;

            return ListView(
              padding: EdgeInsets.zero,
              children: [
                // Profile Section with Circular Avatar
                DrawerHeader(
                  decoration: BoxDecoration(color: Colors.green),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Color.fromARGB(255, 64, 117, 72),
                        child: Text(
                          data.name![0]
                              .toUpperCase(), // First letter of the name
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        data.name ?? "Unknown", // Name
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        data.email ?? "Unknown",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                // ListTiles for navigation
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('Home'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.privacy_tip_rounded),
                  title: const Text('Privacy & Policy'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),

                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('LogOut'),
                  onTap: () {
                    Navigator.pop(context);
                    Provider.of<Kuchi7>(
                      context,
                      listen: false,
                    ).clearLoginData(); // clear
                    UserPreferences.clearPreferences();

                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                      (Route<dynamic> route) => false,
                    );
                  },
                ),
                const Padding(
                  padding: EdgeInsets.all(55.0),
                  child: Text(
                    'Version 1.0.0', // Add your version here
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: const Text(
          "Service Man Home",
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 22),
              const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 35,
                  ), // Adjust padding as needed
                  child: Column(
                    children: [
                      Text(
                        "DashBoard", // Dynamically show the user name
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(
                            255,
                            139,
                            138,
                            138,
                          ), // Change text color as desired
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 22),
              ServicemanCard(
                title: "Today's Task",
                subtitle: "View all active service requests assigned today !",
                icon: Icons.build_circle,
                gradientStartColor: const Color.fromARGB(255, 89, 56, 142),
                gradientEndColor: const Color.fromARGB(255, 102, 149, 187),
                shadowColor: Colors.grey,
                iconColor: Colors.white,
                titleColor: Colors.white,
                subtitleColor: Colors.white70,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Todayslists()),
                  );
                },
              ),
              const SizedBox(height: 11),
              ServicemanCard(
                title: "Active Service Request",
                subtitle: "View all active service request here !",
                icon: Icons.home_repair_service_rounded,
                gradientStartColor: Colors.orange,
                gradientEndColor: const Color.fromARGB(255, 207, 20, 123),
                shadowColor: Colors.black,
                iconColor: Colors.white,
                titleColor: Colors.white,
                subtitleColor: Colors.white70,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ActiveService()),
                  );
                },
              ),
              SizedBox(height: 11),
              ServicemanCard(
                title: "Completed Task",
                subtitle: "View the full list of completed tasks !",
                icon: Icons.task_alt_outlined,
                gradientStartColor: const Color.fromARGB(255, 1, 94, 21),
                gradientEndColor: const Color.fromARGB(255, 135, 164, 93),
                shadowColor: Colors.black,
                iconColor: Colors.white,
                titleColor: Colors.white,
                subtitleColor: Colors.white70,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CompletedTask()),
                  );
                },
              ),
              const SizedBox(height: 11),
              ServicemanCard(
                title: "Service Schedule",
                subtitle: "View 2 weeks schedule !",
                icon: Icons.today,
                gradientStartColor: const Color.fromARGB(255, 128, 31, 2),
                gradientEndColor: Colors.pinkAccent,
                shadowColor: Colors.grey,
                iconColor: Colors.white,
                titleColor: Colors.white,
                subtitleColor: Colors.white70,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CalenderView()),
                  );
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
