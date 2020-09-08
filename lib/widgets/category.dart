import 'package:flutter/material.dart';

class CategoryWidget extends StatefulWidget {
  final List listKategori;
  CategoryWidget({this.listKategori});
  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    List _listKategori = widget.listKategori;

    return Container(
      color: Colors.grey,
      height: 200,
      padding: EdgeInsets.all(10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _listKategori.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              child: Column(
                children: [
                  Image(
                    height: 130,
                    width: 130,
                    fit: BoxFit.fill,
                    image: AssetImage(
                        "images/category/${_listKategori[index]['image']}"),
                  ),
                  Expanded(
                      child: Text(
                    "${_listKategori[index]['name']}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
