

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../associateData.dart';
import 'associateTile.dart';

class AssociateList extends StatelessWidget {
  const AssociateList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index){
      return AssociateTile(
        tileIndex: index,
      );
      },
    itemCount: Provider.of<AssociateData>(context).
    associateCount,padding: const EdgeInsets.fromLTRB(8, 6, 8, 4),
    );
  }
}
