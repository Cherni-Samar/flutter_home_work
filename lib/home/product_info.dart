import 'package:flutter/material.dart';

class ProductInfo extends StatelessWidget {
  final String _image;
  final String _title;
  final int _price;

  const ProductInfo(this._image, this._title, this._price, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: Image.asset(_image, width: 170, height: 90,),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(_title),
              Text("$_price TND", textScaleFactor: 2,)
            ],
          )
        ],
      ),
    );
  }
}
