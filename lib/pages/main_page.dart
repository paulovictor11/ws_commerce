import 'package:flutter/material.dart';
import 'package:wscommerce/pages/home_page.dart';
import 'package:wscommerce/pages/shopping_cart_page.dart';
import 'package:wscommerce/themes/light_color.dart';
import 'package:wscommerce/themes/theme.dart';
import 'package:wscommerce/widgets/BottomNavigationBar/bottom_navigation_bar.dart';
import 'package:wscommerce/widgets/title_text.dart';

class MainPage extends StatefulWidget {

  final String title;

  MainPage({Key key, this.title}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  bool isHomePageSelected = true;

  Widget _appBar() {
    return new Container(
      padding: AppTheme.padding,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new RotatedBox(
            quarterTurns: 4,
            child: _icon(Icons.sort, color: Colors.black54),
          ),
          new ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(13)),
            child: new Container(
              decoration: new BoxDecoration(
                color: Theme.of(context).backgroundColor,
                boxShadow: <BoxShadow>[
                  new BoxShadow(
                    color: Color(0xFFF8F8F8),
                    blurRadius: 10,
                    spreadRadius: 10
                  )
                ]
              ),
              child: Image.asset('assets/images/user.png'),
            ),
          )
        ],
      ),
    );
  }

  Widget _icon(IconData icon, {Color color = LightColor.iconColor}) {
    return new Container(
      padding: EdgeInsets.all(10),
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(13)),
        color: Theme.of(context).backgroundColor,
        boxShadow: AppTheme.shadow
      ),
      child: new Icon(icon, color: color,),
    );
  }

  Widget _title() {
    return new Container(
      margin: AppTheme.padding,
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new TitleText(
                text: isHomePageSelected ? 'Our' : 'Shopping',
                fontSize: 27,
                fontWeight: FontWeight.w700,
              )
            ],
          ),
          new Spacer(),
          !isHomePageSelected ? new Icon(Icons.delete_outline, color: LightColor.orange) : new SizedBox()
        ],
      ),
    );
  }

  void onBottomIconPressed(int index) {
    if (index == 0 || index == 1) {
      setState(() {
        isHomePageSelected = true;
      });
    } else {
      setState(() {
        isHomePageSelected = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new SafeArea(
        child: new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new SingleChildScrollView(
              child: new Container(
                height: AppTheme.fullHeight(context) - 50,
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
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _appBar(),
                    _title(),
                    new Expanded(
                      child: new AnimatedSwitcher(
                        duration: new Duration(milliseconds: 300),
                        switchInCurve: Curves.easeInToLinear,
                        switchOutCurve: Curves.easeOutBack,
                        child: isHomePageSelected
                          ? new MyHomePage()
                          : new Align(
                              alignment: Alignment.topCenter,
                              child: new ShoppingCartPage(),
                            ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            new Positioned(
              bottom: 0, right: 0,
              child: new CustomBottomNavigatorBar(
                onIconPressedCallback: onBottomIconPressed,
              ),
            )
          ],
        ),
      ),
    );
  }
}
