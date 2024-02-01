import 'package:hiveappwithprovider/model/associate.dart';
import 'package:hiveappwithprovider/pages/addAssociate.dart';
import 'package:hiveappwithprovider/pages/associateList.dart';
import 'package:flutter/material.dart';
import "package:hive/hive.dart";
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'associateData.dart';

// void main() {
//   Hive.registerAdapter(AssociateAdapter());
//
//   runApp(hiveappwithprovider());
// }

void main() async {
  await _initHive();
  Hive.registerAdapter(AssociateAdapter());

  runApp(hiveappwithprovider());
}


Future<void> _initHive() async {
  try {
    var dir = await getApplicationDocumentsDirectory();
     Hive.init(dir.path);
  } catch (e) {
    print("Error initializing Hive: $e");
  }
}


// Future _initHive() async {
//   var dir = await getApplicationDocumentsDirectory();
//
//   Hive.init(dir.path);
// }

class hiveappwithprovider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AssociateData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Associates',
        theme: ThemeData(primaryColor: Colors.lightGreenAccent),
        initialRoute: "/",
        routes: {
          "/": (context) => FutureBuilder(
              future: _initHive(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.error != null) {
                    print(snapshot.error);
                    return Scaffold(
                      body: Center(
                        child: Text("Error establishing connection to hive"),
                      ),
                    );
                  } else {
                    return const AssociateListPage();
                  }
                } else
                  return Scaffold();
              }),
          "/AddAssociatePage": (context) => AddAssociatePage()
        },
      ),
    );
  }
}