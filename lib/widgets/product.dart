import 'package:flutter/material.dart';
import 'package:tugas_ecommerce/pages/detail_product_screen.dart';

class Product extends StatefulWidget {
  final List listProduct;

  Product({this.listProduct});
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    List _listProduct = widget.listProduct;
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 2 / 2.3,
        ),
        physics: ScrollPhysics(), // to disable GridView's scrolling
        shrinkWrap: true,
        itemCount: _listProduct.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailProduct(
                      product: _listProduct[index],
                    ),
                  ));
            },
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              // color: Colors.blue,
              child: Column(
                children: [
                  Container(
                    child: Image(
                      height: 100,
                      width: 100,
                      image: AssetImage("images/product/${_listProduct[index]['image']}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    _listProduct[index]['name'],
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text("Quantity : ${_listProduct[index]['quantity'].toString()}"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
