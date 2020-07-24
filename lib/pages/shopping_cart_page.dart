import 'package:flutter/material.dart';
import 'package:wscommerce/model/data.dart';
import 'package:wscommerce/model/product.dart';
import 'package:wscommerce/themes/light_color.dart';
import 'package:wscommerce/themes/theme.dart';
import 'package:wscommerce/widgets/title_text.dart';

class ShoppingCartPage extends StatelessWidget {

  const ShoppingCartPage({Key key}) : super(key: key);

  Widget _cartItems() {
    return new Column(children: AppData.cart.map((f) => _item(f)).toList());
  }

  Widget _item(Product model) {
    return new Container(
      height: 80,
      child: new Row(
        children: <Widget>[
          new AspectRatio(
            aspectRatio: 1.2,
            child: new Stack(
              children: <Widget>[
                new Align(
                  alignment: Alignment.bottomLeft,
                  child: new Container(
                    height: 70, width: 70,
                    child: new Stack(
                      children: <Widget>[
                        new Align(
                          alignment: Alignment.bottomLeft,
                          child: new Container(
                            decoration: new BoxDecoration(
                              color: LightColor.lightGrey,
                              borderRadius: BorderRadius.circular(10)
                            )
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                new Positioned(
                  left: -20, bottom: -20,
                  child: Image.asset(model.image),
                )
              ],
            ),
          ),
          new Expanded(
            child: new ListTile(
              title: new TitleText(text: model.name, fontSize: 15, fontWeight: FontWeight.w700,),
              subtitle: new Row(
                children: <Widget>[
                  new TitleText(text: '\$', color: LightColor.red, fontSize: 12,),
                  new TitleText(text: model.price.toString(), fontSize: 14,)
                ],
              ),
              trailing: new Container(
                width: 35, height: 35,
                alignment: Alignment.center,
                decoration: new BoxDecoration(
                  color: LightColor.lightGrey.withAlpha(150),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: new TitleText(
                  text: 'x${model.id}', fontSize: 12,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  
  Widget _price() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new TitleText(
          text: '${AppData.cart.length} Items',
          color: LightColor.grey,
          fontSize: 14, fontWeight: FontWeight.w500,
        ),
        new TitleText(
          text: '\$${getPrice()}',
          fontSize: 18,
        )
      ],
    );
  }
  
  Widget _submitButton(BuildContext context) {
    return new FlatButton(
      onPressed: () {},
      shape: new RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: LightColor.orange,
      child: new Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 12),
        width: AppTheme.fullWidth(context) * .7,
        child: new TitleText(
          text: 'Next', color: LightColor.background, fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
  
  double getPrice() {
    double price = 0;
    AppData.cart.forEach((f) {
      price += f.price * f.id;
    });
    return price;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: AppTheme.padding,
      child: new SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            _cartItems(),
            new Divider(thickness: 1, height: 70,),
            _price(),
            new SizedBox(height: 30,),
            _submitButton(context)
          ],
        ),
      ),
    );
  }
}
