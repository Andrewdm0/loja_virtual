import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/data/product_data.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key, required this.product}) : super(key: key);
  final ProductData product;

  @override
  State<ProductScreen> createState() => _ProductScreenState(product);
}

class _ProductScreenState extends State<ProductScreen> {
  final ProductData product;
  String size = '';
  _ProductScreenState(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title!),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Image.network(
                  product.images![index],
                  fit: BoxFit.contain,
                );
              },
              itemCount: 2,
              pagination: SwiperPagination(
                margin: EdgeInsets.all(10),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  product.title!,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  maxLines: 3,
                ),
                Text(
                  'R\$ ${product.price!.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  'Tamanho',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 34.0,
                  child: GridView(
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 0.5,
                    ),
                    children: product.sizes!
                        .map(
                          (e) => GestureDetector(
                            onTap: () {
                              setState(() {
                                size = e;
                              });
                            },
                            child: Container(
                              width: 50.0,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4.0)),
                                border: Border.all(
                                    color: e == size
                                        ? Theme.of(context).primaryColor
                                        : Colors.grey[500]!,
                                    width: 3.0),
                              ),
                              child: Text(e),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 44.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                    ),
                    onPressed: size.isEmpty ? null : () {},
                    child: Text(
                      'Adicionar ao carrinho',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Descrição',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  product.description!,
                  style: TextStyle(fontSize: 16.0),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
