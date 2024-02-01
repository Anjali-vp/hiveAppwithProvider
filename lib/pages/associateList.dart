
import 'package:flutter/material.dart';
import 'package:hiveappwithprovider/widgets/associateList.dart';
import 'package:provider/provider.dart';

import '../associateData.dart';

class AssociateListPage extends StatelessWidget {
  const AssociateListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<AssociateData>(context, listen:false).
    getAssociates();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        elevation: 16,
        title: Text('Associates',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ),
      ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Expanded(
                    child: Container(
                      child: AssociateList(),
                    ),
                ),
              ],
            ),
          ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightGreenAccent,
        tooltip: "Add",
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.pushNamed(context, '/AddAssociatePage');
        },
      ),
    );
  }
}
