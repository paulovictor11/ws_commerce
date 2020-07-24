import 'package:flutter/material.dart';
import 'package:wscommerce/themes/light_color.dart';
import 'package:wscommerce/widgets/BottomNavigationBar/bottom_curved_painter.dart';

class CustomBottomNavigatorBar extends StatefulWidget {

  final Function(int) onIconPressedCallback;
  CustomBottomNavigatorBar({Key key, this.onIconPressedCallback}) : super(key: key);

  @override
  _CustomBottomNavigatorBarState createState() => _CustomBottomNavigatorBarState();
}

class _CustomBottomNavigatorBarState extends State<CustomBottomNavigatorBar> with TickerProviderStateMixin {

  int _selectedIndex = 0;

  AnimationController _xController;
  AnimationController _yController;

  @override
  void initState() {
    _xController = new AnimationController(
      vsync: this, animationBehavior: AnimationBehavior.preserve
    );
    _yController = new AnimationController(
      vsync: this, animationBehavior: AnimationBehavior.preserve
    );

    Listenable.merge([_xController, _yController]).addListener(() {
      setState(() {

      });
    });

    super.initState();
  }

  @override
  void didChangeDependencies() {
    _xController.value = _indexToPosition(_selectedIndex) / MediaQuery.of(context).size.width;
    super.didChangeDependencies();
  }

  double _indexToPosition(int index) {
    const buttoncount = 4;
    final appWidth = MediaQuery.of(context).size.width;
    final buttonsWidth = _getButtonContainerWidth();
    final startX = (appWidth - buttoncount) / 2;
    return startX + index.toDouble() * buttonsWidth / buttoncount + buttonsWidth / (buttoncount * 2);
  }

  @override
  void dispose() {
    _xController.dispose();
    _yController.dispose();
    super.dispose();
  }

  Widget _icon(IconData icon, bool isEnable, int index) {
    return new Expanded(
      child: new InkWell(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        onTap: () {
          _handlePressed(index);
        },
        child: new AnimatedContainer(
          duration: new Duration(milliseconds: 500),
          alignment: isEnable ? Alignment.topCenter : Alignment.center,
          child: new AnimatedContainer(
            height: isEnable ? 40 : 20,
            duration: new Duration(milliseconds: 300),
            alignment: Alignment.center,
            decoration: new BoxDecoration(
              color: isEnable  ? LightColor.orange : Colors.white,
              boxShadow: <BoxShadow>[
                new BoxShadow(
                  color: isEnable ? Color(0xFFFEECE2) : Colors.white,
                  blurRadius: 10,
                  spreadRadius: 5,
                  offset: new Offset(5, 5)
                )
              ],
              shape: BoxShape.circle
            ),
            child: new Opacity(
              opacity: isEnable ? _yController.value : 1,
              child: new Icon(icon, color: isEnable ? LightColor.background : Theme.of(context).iconTheme.color),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackground() {
    final inCurve = ElasticInOutCurve(0.38);
    return new CustomPaint(
      painter: new BackgroundCurvePainter(
        _xController.value * MediaQuery.of(context).size.width,
        new Tween<double>(
          begin: Curves.easeInExpo.transform(_yController.value),
          end: inCurve.transform(_yController.value)
        ).transform(_yController.velocity.sign * 0.5 + 0.5),
        Theme.of(context).backgroundColor
      ),
    );
  }

  double _getButtonContainerWidth() {
    double width = MediaQuery.of(context).size.width;
    if (width > 400) {
      width = 400;
    }
    return width;
  }

  void _handlePressed(int index) {
    if (_selectedIndex == index || _xController.isAnimating) return;
    widget.onIconPressedCallback(index);
    setState(() {
      _selectedIndex = index;
    });

    _yController.value = 1;
    _xController.animateTo(
      _indexToPosition(index) / MediaQuery.of(context).size.width,
      duration: new Duration(milliseconds: 620)
    );
    Future.delayed(
      new Duration(milliseconds: 500),
      () {
        _yController.animateTo(1, duration: new Duration(milliseconds: 1200));
      }
    );
    _yController.animateTo(0, duration: new Duration(milliseconds: 300));
  }

  @override
  Widget build(BuildContext context) {

    final appSize = MediaQuery.of(context).size;
    final height = 60.0;

    return new Container(
      width: appSize.width,
      height: 60,
      child: new Stack(
        children: <Widget>[
          new Positioned(
            left: 0, bottom: 0,
            width: appSize.width, height: height - 10,
            child: _buildBackground(),
          ),
          new Positioned(
            left: (appSize.width - _getButtonContainerWidth()) / 2,
            top: 0, width: _getButtonContainerWidth(),
            height: height,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _icon(Icons.home, _selectedIndex == 0, 0),
                _icon(Icons.search, _selectedIndex == 1, 1),
                _icon(Icons.card_travel, _selectedIndex == 2, 2),
                _icon(Icons.favorite_border, _selectedIndex == 3, 3),
              ],
            ),
          )
        ],
      ),
    );
  }
}
