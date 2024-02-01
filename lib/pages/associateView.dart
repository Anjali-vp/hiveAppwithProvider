import 'package:flutter/material.dart';
import 'package:hiveappwithprovider/associateData.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:hiveappwithprovider/pages/associateEdit.dart';

import '../model/associate.dart';
import '../utils.dart';

class AssociateView extends StatelessWidget {
  const AssociateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _deleteConfirmation(currentAssociate) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.white,
              title: Text(
                'Are you Sure You Want To Delete This ?',
                style: TextStyle(color: Colors.black),
              ),
              content: SingleChildScrollView(
                child: ListBody(
                  children: [
                    Text('You Are About Delete ${currentAssociate.name}'),
                    SizedBox(
                      height: 10,
                    ),
                    Text("This Action Cannot Be Undone!!")
                  ],
                ),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Log.d("Deleting ${currentAssociate.name}");
                    Provider.of<AssociateData>(context, listen: false)
                        .deleteAssociate(currentAssociate.key);
                    Navigator.popUntil(
                      context,
                      ModalRoute.withName(Navigator.defaultRouteName),
                    );
                  },
                  child: Text(
                    "DELETE",
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Log.d("Cancelling.");
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );
          });
    }

    return Consumer<AssociateData>(
      builder: (context, associateData, child) {
        Associate currentAssociate = associateData.getActiveAssociate();
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.greenAccent,
            elevation: 16,
            title: Text(
              currentAssociate.name, //?
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.create),
                iconSize: 24.0,
                color: Colors.blue,
                tooltip: "Edit",
                onPressed: () {
                  Log.d("Selected to edit");
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return AssociateEditPage(
                          currentAssociate: currentAssociate);
                    },
                  ));
                },
              ),
              IconButton(
                icon: Icon(Icons.delete),
                iconSize: 24.0,
                color: Colors.red,
                tooltip: "Delete",
                onPressed: () {
                  Log.d("Selected for deletion");
                  _deleteConfirmation(currentAssociate);
                },
              )
            ],
          ),
          body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 36.0,
                    color: Colors.grey[300],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          "Phone",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ),
                        Text(
                          currentAssociate.phone.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 36.0,
                    color: Colors.white54,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          "Age",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ),
                        Text(
                          currentAssociate.age.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 36.0,
                    color: Colors.grey[300],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          "Join Date",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ),
                        Text(
                          DateFormat("yyyy-MM-dd")
                              .format(currentAssociate!.joinDate),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 36.0,
                    color: Colors.grey[300],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          "Senior",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ),
                        Switch(
                          activeTrackColor: Colors.black,
                          value: currentAssociate.isSenior,
                          onChanged: (bool v) {},
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
