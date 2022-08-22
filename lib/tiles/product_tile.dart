import 'package:flutter/material.dart';
import 'package:loja_virtual/data/product_data.dart';

class ProductTile extends StatelessWidget {
  final String type;
  final ProductData data;

  ProductTile(this.type, this.data);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: type == "grid" ? Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AspectRatio(aspectRatio: 0.8, child: Image.network(data.images),)
          ],
        ) : Row(),
      ),
    );
  }
}
