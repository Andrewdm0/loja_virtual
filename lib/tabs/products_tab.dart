import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/tiles/category_tile.dart';
import 'package:loja_virtual/widgets/body_back.dart';

class ProductsTab extends StatelessWidget {
  var lista_docs = [];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FutureBuilder<QuerySnapshot>(
          future: FirebaseFirestore.instance.collection('produtos').get(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              lista_docs = snapshot.data.docs.toList();
              var dividedTiles = ListTile.divideTiles(
                  tiles: snapshot.data.docs
                      .map((e) => CategoryTile(snapshot: e))
                      .toList(),
                  color: Colors.grey[500]);
              return ListView(
                children: dividedTiles,
              );
            }
          },
        ),
      ],
    );
  }
}
