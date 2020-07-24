import 'package:flutter/material.dart';
import 'package:wscommerce/model/data.dart';
import 'package:wscommerce/themes/light_color.dart';
import 'package:wscommerce/themes/theme.dart';
import 'package:wscommerce/widgets/product_icon.dart';
import 'package:wscommerce/widgets/product_card.dart';

class MyHomePage extends StatefulWidget {

  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Widget _icon(IconData icon, {Color color = LightColor.iconColor}) {
    return new Container(
      padding: EdgeInsets.all(10),
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(13)),
        color: Theme.of(context).backgroundColor,
        boxShadow: AppTheme.shadow
      ),
      child: new Icon(icon, color: color),
    );
  }

  Widget _categoryWidget() {
    return new Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: AppTheme.fullWidth(context),
      height: 80,
      child: new ListView(
        scrollDirection: Axis.horizontal,
        children: AppData.categories.map((category) => new ProductIcon(model: category)).toList(),
      ),
    );
  }

  Widget _productWidget() {
    return new Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: AppTheme.fullWidth(context),
      height: AppTheme.fullWidth(context) * 7,
      child: new GridView(
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 4 / 3,
          mainAxisSpacing: 30,
          crossAxisSpacing: 20
        ),
        padding: EdgeInsets.only(left: 20),
        scrollDirection: Axis.horizontal,
        children: AppData.products.map((product) => new ProductCard(product: product)).toList(),
      ),
    );
  }

  Widget _search() {
    return new Container(
      margin: AppTheme.padding,
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Container(
              height: 40, alignment: Alignment.center,
              decoration: new BoxDecoration(
                color: LightColor.lightGrey.withAlpha(100),
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: new TextField(
                decoration: new InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search Products',
                  hintStyle: new TextStyle(fontSize: 12),
                  contentPadding: EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 5),
                  prefixIcon: new Icon(Icons.search, color: Colors.black54)
                ),
              ),
            ),
          ),
          new SizedBox(width: 20),
          _icon(Icons.filter_list, color: Colors.black54)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _search(), _categoryWidget(), _productWidget()
      ],
    );
  }
}
