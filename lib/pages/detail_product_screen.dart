import 'package:flutter/material.dart';
import 'package:tugas_ecommerce/widgets/title_text.dart';

class DetailProduct extends StatefulWidget {
  final product;

  DetailProduct({this.product});
  @override
  _DetailProductState createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  @override
  Widget build(BuildContext context) {
    var _product = widget.product;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_product['name']),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              height: 300,
              width: double.infinity,
              fit: BoxFit.fill,
              image: AssetImage("images/product/${_product['image']}"),
            ),
            Divider(thickness: 2),
            _buildBuySection(),
            TitleText(
              text: 'Product Detail',
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(_product['description']),
            ),
            Divider(thickness: 2),
            ListTile(
              title: Text('Nama Produk'),
              subtitle: Text(_product['name']),
            ),
            ListTile(
              title: Text('Kategori Produk'),
              subtitle: Text(_product['category']['name']),
            ),
          ],
        ),
      ),
    );
  }

  _buildBuySection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: RaisedButton(
              onPressed: () {},
              child: Text('Buy Now'),
            ),
          ),
          SizedBox(width: 30),
          Icon(Icons.add_shopping_cart, size: 30),
          SizedBox(width: 30),
          Icon(Icons.share, size: 30),
        ],
      ),
    );
  }
}
