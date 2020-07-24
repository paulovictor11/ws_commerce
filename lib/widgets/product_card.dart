import 'package:flutter/material.dart';
import 'package:wscommerce/model/data.dart';
import 'package:wscommerce/model/product.dart';
import 'package:wscommerce/themes/light_color.dart';
import 'package:wscommerce/themes/theme.dart';
import 'title_text.dart';

class ProductCard extends StatefulWidget {

  final Product product;

  ProductCard({Key key, this.product}) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {

  Product model;

  @override
  void initState() {
    model = widget.product;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: () {},
      child: new Container(
        decoration: new BoxDecoration(
          color: LightColor.background,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: <BoxShadow>[
            new BoxShadow(
              color: Color(0xFFF8F8F8),
              blurRadius: 15,
              spreadRadius: 10
            )
          ]
        ),
        margin: EdgeInsets.symmetric(vertical: !model.isSelected ? 20 : 0),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: new Stack(
          alignment: Alignment.center,
          children: <Widget>[
            new Positioned(
              left: 0, top: 0,
              child: new IconButton(
                icon: new Icon(
                  model.isLiked ? Icons.favorite : Icons.favorite_border,
                  color: model.isLiked ? LightColor.red : LightColor.iconColor,
                ),
                onPressed: () {
                  setState(() {
                    model.isLiked = !model.isLiked;
                  });
                },
              ),
            ),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new SizedBox(height: model.isSelected ? 15 : 0),
                new Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    new CircleAvatar(
                      radius: 40, backgroundColor: LightColor.orange.withAlpha(40),
                    ),
                    Image.asset(model.image)
                  ],
                ),
                new TitleText(
                  text: model.name,
                  fontSize: model.isSelected ? 16 : 14,
                ),
                new TitleText(
                  text: model.category,
                  fontSize: model.isSelected ? 14 : 12,
                ),
                new TitleText(
                  text: model.price.toString(),
                  fontSize: model.isSelected ? 18 : 16,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
