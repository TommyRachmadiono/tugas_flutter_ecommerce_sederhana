import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_ecommerce/model/model_category.dart';
import 'package:tugas_ecommerce/pages/login_screen.dart';
import 'package:tugas_ecommerce/widgets/carousel_slider.dart';
import 'package:tugas_ecommerce/widgets/category.dart';
import 'package:tugas_ecommerce/widgets/product.dart';
import 'package:tugas_ecommerce/widgets/title_text.dart';

class HomepageScreen extends StatefulWidget {
  @override
  _HomepageScreenState createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  String name = '';
  List _listKategori = [];
  List _listProduk = [];
  List listT = [];

  _getDataKategori() async {
    try {
      final responseData =
          await http.get("http://10.0.2.2:8000/api/categories");
      final data = jsonDecode(responseData.body);
      // for (Map i in data) {
      //   listT.add(CategoryModel.fromJson(i));
      // }
      // listT = data['categories'];
      _listKategori = data['categories'];
      // for (Map i in data['categories']) {
      //   _listKategori.add(i);
      // }
      print(_listKategori.length);
    } catch (e) {
      print(e.toString());
    }
  }

  _getDataProduct() async {
    try {
      final responseData = await http.get("http://10.0.2.2:8000/api/products");
      final dataProduk = jsonDecode(responseData.body);

      _listProduk = dataProduk['products'];
      // for (Map i in dataProduk['products']) {
      //   _listProduk.add(i);
      // }
      // print(_listProduk);
    } catch (e) {
      print(e.toString());
    }
  }

  _getDataPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String _name = pref.getString('name');
    name = _name;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _getDataPref();
    _getDataKategori();
    _getDataProduct();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simple Ecommerce'), centerTitle: true),
      drawer: Drawer(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: ListView(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.lightBlue,
                  ),
                  SizedBox(width: 15),
                  Text(
                    "$name",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Divider(),
              FlatButton(
                  onPressed: () async {
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    pref.clear();

                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                        (route) => false);
                  },
                  child: Text('Sign Out'))
            ],
          ),
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            Container(height: 200, child: CarouselSlider()),
            TitleText(text: 'Kategori'),
            FutureBuilder(
              future: _getDataKategori(),
              builder: (context, snapshot) {
                return CategoryWidget(listKategori: _listKategori);
              },
            ),
            // CategoryWidget(listKategori: _listKategori),
            Divider(thickness: 2),
            TitleText(text: 'Product'),
            FutureBuilder(
              future: _getDataProduct(),
              builder: (context, snapshot) {
                return Product(listProduct: _listProduk);
              },
            ),
            // Product(listProduct: _listProduk),
          ],
        ),
      ),
    );
  }
}
