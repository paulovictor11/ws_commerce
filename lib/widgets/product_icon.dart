import 'package:flutter/material.dart';
import 'package:wscommerce/model/category.dart';
import 'package:wscommerce/themes/light_color.dart';
import 'package:wscommerce/themes/theme.dart';
import 'title_text.dart';

class ProductIcon extends StatelessWidget {

  final Category model;

  ProductIcon({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return model.id == null ? new Container(width: 5)
    : new Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      padding: AppTheme.hPadding,
      alignment: Alignment.center,
      height: 40,
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: model.isSelected ? LightColor.background : Colors.transparent,
        border: Border.all(
          color: model.isSelected ? LightColor.orange : LightColor.grey,
          width: model.isSelected ? 2 : 1
        ),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: model.isSelected ? Color(0xFFFBF2EF) : Colors.white,
            blurRadius: 10, spreadRadius: 5, offset: new Offset(5, 5)
          )
        ]
      ),
      child: new Row(
        children: <Widget>[
          model.image != null ? Image.asset(model.image) : new SizedBox(),
          model.name == null ? new Container()
          : new Container(
            child: new TitleText(
              text: model.name,
              fontWeight: FontWeight.w700,
              fontSize: 15,
            ),
          )
        ],
      ),
    );
  }
}
