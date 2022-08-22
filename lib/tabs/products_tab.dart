import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/tiles/category_tile.dart';

class ProductsTab extends StatefulWidget {
  @override
  _ProductsTabState createState() => _ProductsTabState();
}

class _ProductsTabState extends State<ProductsTab> {
  var listaDocs = [];

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
              listaDocs = snapshot.data!.docs.toList();
              var dividedTiles = ListTile.divideTiles(
                  tiles: snapshot.data!.docs
                      .map((e) => CategoryTile(snapshot: e))
                      .toList(),
                  color: Colors.grey[500]);
              return ListView(
                children: dividedTiles.toList(),
              );
            }
          },
        ),
      ],
    );
  }
}
