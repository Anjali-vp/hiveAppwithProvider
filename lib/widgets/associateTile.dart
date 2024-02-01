import 'package:flutter/material.dart';
import 'package:hiveappwithprovider/associateData.dart';
import 'package:provider/provider.dart';
import 'package:hiveappwithprovider/pages/associateView.dart';
import '../model/associate.dart';

class AssociateTile extends StatelessWidget {
  final int tileIndex;
  const AssociateTile({Key? key, required this.tileIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AssociateData>(
      builder: (context, associateData, child) {
        Associate currentAssociate =
        associateData.getAssociate(tileIndex);

        return(
        Container(
          decoration: BoxDecoration(
          color: tileIndex % 2 == 0 ? Colors.grey:Colors.white,
          ),
          child: ListTile(
            leading: CircleAvatar(
            backgroundColor: Colors.lightGreenAccent,
              child: Text(currentAssociate.name.substring(0,1),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ),
            title: Text(
              currentAssociate.name?? "",    //? in line 38 &45
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text( currentAssociate.phone.toString()??"",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),

            ),
            onTap: () {
              Provider.of<AssociateData>(context, listen: false).
              setActiveAssociate(currentAssociate.key);
              Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) {
                    return AssociateView();
                  }
                  ),
              );
            },
          ),
        )
        );
      },
    );
  }
}
