import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wscommerce/model/data.dart';
import 'package:wscommerce/themes/light_color.dart';
import 'package:wscommerce/themes/theme.dart';
import 'package:wscommerce/widgets/title_text.dart';

class ProductDetailPage extends StatefulWidget {

  ProductDetailPage({Key key}) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> with TickerProviderStateMixin {

  AnimationController controller;
  Animation<double> animation;

  bool isLiked = true;

  @override
  void initState() {
    controller = new AnimationController(vsync: this, duration: new Duration(milliseconds: 500));
    animation = new Tween<double>(begin: 0, end: 1).animate(
      new CurvedAnimation(parent: controller, curve: Curves.easeInToLinear)
    );

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget _appBar() {
    return new Container(
      padding: AppTheme.padding,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: _icon(Icons.arrow_back_ios, color: Colors.black54, size: 15, padding: 12, isOutLine: true),
          ),
          new InkWell(
            onTap: () {
              setState(() {
                isLiked = !isLiked;
              });
            },
            child: _icon(
              isLiked ? Icons.favorite : Icons.favorite_border,
              color: isLiked ? LightColor.red : LightColor.lightGrey,
              size: 15, padding: 12, isOutLine: false
            ),
          )
        ],
      ),
    );
  }
  
  Widget _icon(IconData icon, {Color color = LightColor.iconColor, double size = 20, double padding = 10, bool isOutLine = false}) {
    return new Container(
      height: 40, width: 40,
      padding: EdgeInsets.all(padding),
      decoration: new BoxDecoration(
        border: Border.all(
          color: LightColor.iconColor,
          style: isOutLine ? BorderStyle.solid : BorderStyle.none
        ),
        borderRadius: BorderRadius.all(Radius.circular(13)),
        color: isOutLine ? Colors.transparent : Theme.of(context).backgroundColor,
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Color(0xFFF8F8F8),
            blurRadius: 5,
            spreadRadius: 10,
            offset: new Offset(5, 5)
          )
        ]
      ),
      child: new Icon(icon, color: color, size: size),
    );
  }

  Widget _productImage() {
    return new AnimatedBuilder(
      builder: (context, child) {
        return new AnimatedOpacity(
          duration: new Duration(milliseconds: 500),
          opacity: animation.value,
          child: child,
        );
      },
      animation: animation,
      child: new Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          new TitleText(
            text: "AIP",
            fontSize: 160,
            color: LightColor.lightGrey,
          ),
          Image.asset('assets/images/show_1.png')
        ],
      ),
    );
  }

  Widget _categoryWidget() {
    return new Container(
      margin: EdgeInsets.symmetric(vertical: 0),
      width: AppTheme.fullWidth(context),
      height: 80,
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: AppData.thumbnails.map((f) => _thumbnail(f)).toList(),
      ),
    );
  }

  Widget _thumbnail(String image) {
    return new AnimatedBuilder(
      animation: animation,
      builder: (context, child) => new AnimatedOpacity(
        opacity: animation.value,
        duration: new Duration(milliseconds: 500),
        child: child,
      ),
      child: new Container(
        height: 40, width: 50,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: new BoxDecoration(
          border: Border.all(
            color: LightColor.grey
          ),
          borderRadius: BorderRadius.all(Radius.circular(13))
        ),
        child: Image.asset(image),
      ),
    );
  }

  Widget _detailWidget() {
    return new DraggableScrollableSheet(
      maxChildSize: .8,
      initialChildSize: .53,
      minChildSize: .53,
      builder: (context, scrollController) {
        return new Container(
          padding: AppTheme.padding.copyWith(bottom: 0),
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40)
            ),
            color: Colors.white
          ),
          child: new SingleChildScrollView(
            controller: scrollController,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new SizedBox(height: 5),
                new Container(
                  alignment: Alignment.center,
                  child: new Container(
                    width: 50, height: 5,
                    decoration: new BoxDecoration(
                      color: LightColor.iconColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                  ),
                ),
                new SizedBox(height: 10),
                new Container(
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new TitleText(text: "NIKE AIR Max 200", fontSize: 25),
                      new Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          new Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              new TitleText(text: '\$ ', fontSize: 18, color: LightColor.red),
                              new TitleText(text: '240', fontSize: 25,),
                            ],
                          ),
                          new Row(
                            children: <Widget>[
                              new Icon(Icons.star, color: LightColor.yellowColor, size: 17),
                              new Icon(Icons.star, color: LightColor.yellowColor, size: 17),
                              new Icon(Icons.star, color: LightColor.yellowColor, size: 17),
                              new Icon(Icons.star, color: LightColor.yellowColor, size: 17),
                              new Icon(Icons.star, color: LightColor.yellowColor, size: 17),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                new SizedBox(height: 20),
                _availableSize(),
                new SizedBox(height: 20),
                _availableColor(),
                new SizedBox(height: 20),
                _description(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _availableSize() {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new TitleText(text: 'Available Size', fontSize: 14),
        new SizedBox(height: 14),
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _sizeWidget("US 6"),
            _sizeWidget("US 7", isSelected: true),
            _sizeWidget("US 8"),
            _sizeWidget("US 9"),
          ],
        )
      ],
    );
  }

  Widget _sizeWidget(String text, {Color color = LightColor.iconColor, bool isSelected = false}) {
    return new Container(
      padding: EdgeInsets.all(10),
      decoration: new BoxDecoration(
        border: Border.all(
          color: LightColor.iconColor,
          style: !isSelected ? BorderStyle.solid : BorderStyle.none
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: isSelected ? LightColor.orange : Theme.of(context).backgroundColor
      ),
      child: new TitleText(
        text: text, fontSize: 16, color: isSelected ? LightColor.background : LightColor.titleTextColor,
      ),
    );
  }

  Widget _availableColor() {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new TitleText(text: 'Available Size', fontSize: 14),
        new SizedBox(height: 20),
        new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _colorWidget(LightColor.yellowColor, isSelected: true),
            new SizedBox(width: 30),
            _colorWidget(LightColor.lightGrey),
            new SizedBox(width: 30),
            _colorWidget(LightColor.black),
            new SizedBox(width: 30),
            _colorWidget(LightColor.red),
            new SizedBox(width: 30),
            _colorWidget(LightColor.skyBlue),
          ],
        )
      ],
    );
  }

  Widget _colorWidget(Color color, {bool isSelected = false}) {
    return new CircleAvatar(
      radius: 12,
      backgroundColor: color.withAlpha(150),
      child: isSelected
        ? new Icon(Icons.check_circle, color: color, size: 18,)
        : new CircleAvatar(radius: 7, backgroundColor: color,)
    );
  }

  Widget _description() {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new TitleText(text: 'Available Size', fontSize: 14),
        new SizedBox(height: 20),
        new Text(AppData.description)
      ],
    );
  }

  FloatingActionButton _floatingActionButton() {
    return new FloatingActionButton(
      onPressed: () {},
      backgroundColor: LightColor.orange,
      child: new Icon(
        Icons.shopping_basket, color: Theme.of(context).floatingActionButtonTheme.backgroundColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButton: _floatingActionButton(),
      body: new SafeArea(
        child: new Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              colors: [
                Color(0xFFFBFBFB),
                Color(0xFFF7F7F7)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
            )
          ),
          child: new Stack(
            children: <Widget>[
              new Column(
                children: <Widget>[
                  _appBar(),
                  _productImage(),
                  _categoryWidget()
                ],
              ),
              _detailWidget()
            ],
          ),
        ),
      ),
    );
  }
}
