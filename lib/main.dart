//import 'package:design/serviceman/api/filetypeapi.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/customer/api/cancelapi.dart';
import 'package:flutter_application_1/customer/model/completedtaskmodel.dart';
import 'package:flutter_application_1/customer/model/freeservicemodel.dart';
import 'package:flutter_application_1/customer/model/servicelistmodel.dart';
//import 'package:flutter_application_1/customer/model/customerprofile.dart';
import 'package:flutter_application_1/customer/povider/brandprovider.dart';
import 'package:flutter_application_1/customer/povider/createservicerequestprovider.dart';
import 'package:flutter_application_1/customer/povider/customerprofileprovider.dart';
import 'package:flutter_application_1/customer/povider/loginprovider.dart';
import 'package:flutter_application_1/customer/povider/reviewacceptprovider.dart';
import 'package:flutter_application_1/customer/povider/servicerequestlistprovider.dart';
import 'package:flutter_application_1/customer/povider/themeprovider.dart';
import 'package:flutter_application_1/customer/screen/login.dart';
// import 'package:flutter_application_1/customer/screen/createserviceform.dart';
// import 'package:flutter_application_1/customer/screen/login.dart';
import 'package:flutter_application_1/customer/screen/requestdetaildailog.dart';
// import 'package:flutter_application_1/customer/screen/servicehome.dart';
import 'package:flutter_application_1/customer/widget/audioplayer.dart';
import 'package:flutter_application_1/customer/widget/audiorecordigwidget.dart';
import 'package:flutter_application_1/serviceman/model/filetype.dart';
import 'package:flutter_application_1/serviceman/provider/activeserviceprovider.dart';
import 'package:flutter_application_1/serviceman/provider/servicemancompletedlist.dart';
import 'package:flutter_application_1/serviceman/provider/servicemanprofile.dart';
import 'package:flutter_application_1/serviceman/provider/todystaskprovider.dart';
import 'package:flutter_application_1/serviceman/view/calenderview.dart';
import 'package:flutter_application_1/serviceman/view/test.dart';

// import 'package:flutter_application_1/test.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
        ChangeNotifierProvider(create: (_) => Kuchi7()),
        ChangeNotifierProvider(create: (_) => ServiceManProviderProfile()),
        ChangeNotifierProvider(create: (_) => ServiceManProvider()),
        ChangeNotifierProvider(create: (_) => ActiveServiceProvider()),
        ChangeNotifierProvider(create: (_) => ActiveServiceProviders()),
        ChangeNotifierProvider(
          create: (_) => FileTypesProvider(apiService: FileTypesApiService()),
        ),
        ChangeNotifierProvider(create: (_) => BrandProvider()),
        ChangeNotifierProvider(create: (_) => ServiceRequestProvider()),
        ChangeNotifierProvider(create: (_) => ServiceRequestListProvider()),
        ChangeNotifierProvider(create: (_) => AudioRecorderProvider()),
        ChangeNotifierProvider(create: (_) => AudioPlayerProvider()),
        ChangeNotifierProvider(create: (_) => VideoPlayerProvider()),
        ChangeNotifierProvider(create: (_) => CalendarProvider()),
        ChangeNotifierProvider(create: (_) => CompletedTaskProvider()),
        ChangeNotifierProvider(create: (_) => FreeServiceProvider()),
        ChangeNotifierProvider(create: (_) => CancelProvider()),
        ChangeNotifierProvider(create: (_) => TaskProvider()),
      ],

      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).theme;
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: LoginScreen(), // Home with Drawer
    );
  }
}
