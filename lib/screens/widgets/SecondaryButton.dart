import 'package:flutter/material.dart';

class SecondaryButton extends StatefulWidget {
  SecondaryButton(
      {Key key,
      this.title = "",
      this.borderColor,
      this.icon,
      this.iconOnly = false,
      this.color,
      this.textColor,
      this.onTap,
      this.loading: false,
      this.small = false,
      this.disabled = false,
      this.noBorderRadius = false,
      this.borderRadius = 48.0})
      : super(key: key);

  final String title;
  final Widget icon;
  final VoidCallback onTap;
  final bool loading;
  final Color color;
  final Color textColor;
  final Color borderColor;
  final double borderRadius;
  final bool small;
  final bool iconOnly;
  final bool disabled;
  final bool noBorderRadius;

  @override
  _SecondaryButtonState createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends State<SecondaryButton> with TickerProviderStateMixin {
  double _buttonSize = 1.0;
  AnimationController _animationController;
  Animation _animation;

  double _rippleSize = 0.0;
  AnimationController _rippleController;
  Animation _rippleAnimation;

  @override
  void initState() {
    if (widget.disabled != null && !widget.disabled) {
      setState(() {
        _rippleSize = 1.0;
      });
    }
    _animationController = AnimationController(
        vsync: this,
        lowerBound: 0.7,
        upperBound: 1.0,
        duration: Duration(milliseconds: 120)
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutQuad,
      reverseCurve: Curves.easeOutQuad
    );
    _animation.addListener(() {
      setState(() {
        _buttonSize = _animation.value;
      });
    });

    _rippleController = AnimationController(
        vsync: this,
        lowerBound: 0.0,
        upperBound: 1.0,
        duration: Duration(seconds: 1)
    );
    _rippleAnimation = CurvedAnimation(
      parent: _rippleController,
      curve: Curves.easeInOutQuint
    );
    _rippleAnimation.addListener(() {
      setState(() {
        _rippleSize = _rippleAnimation.value;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _rippleController.dispose();
    super.dispose();
  }

  Widget _buildIcon() {
    if (widget.icon != null && (widget.title!=null && widget.title!="")) {
      return Container(
        height: 25.0,
        child: widget.icon);
    } else if (widget.icon != null && (widget.title==null || widget.title=="")) {
      return Container(
        height: 25.0,
        width: 25,
        child: widget.icon);
    }else {
      return Container();
    }
  }

  @override
  void didUpdateWidget(SecondaryButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.disabled != widget.disabled) {
      bool d = widget.disabled ?? false;
      if (!d) {
        _rippleController.forward();
      } else {
        if (_rippleSize == 1.0)
          _rippleController.reverse(from: 1.0);
        else
          _rippleController.reverse();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: widget.loading,
      child: GestureDetector(
        onTapDown: (TapDownDetails tap) {
          _animationController.reverse(from: 1.0);
        },
        onTapUp: (TapUpDetails tap) {
          _animationController.forward();
        },
        onTapCancel: () {
          _animationController.forward();
        },
        onTap: Feedback.wrapForTap(widget.onTap, context),
        behavior: HitTestBehavior.opaque,
        child: Transform.scale(
          scale: _buttonSize,
          child: Container(
            decoration: BoxDecoration(
              border: widget.borderColor!=null ? Border.all(color: widget.borderColor.withOpacity(0.1), width: 2.0) : null,
              borderRadius: BorderRadius.all(Radius.circular(100.0)),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.04),
                  spreadRadius: -0.0,
                  offset: Offset(0, 4.0),
                  blurRadius: 18.0)
              ]
            ),
            child: ClipRRect(
              borderRadius: widget.noBorderRadius ? BorderRadius.all(Radius.circular(0.0)) : BorderRadius.all(Radius.circular(widget.borderRadius)),
              child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 0,
                      bottom: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Theme.of(context).disabledColor,
                        ),
                      ),
                    ),
                    Positioned(
                      left: -MediaQuery.of(context).size.width*2.2/1.8,
                      bottom: -MediaQuery.of(context).size.width*2.2/1.8,
                      child: Transform.scale(
                        scale: widget.disabled!=null ? _rippleSize : 1.0,
                        child: Container(
                          width: MediaQuery.of(context).size.width*2.2,
                          height: MediaQuery.of(context).size.width*2.2,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: widget.color,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: widget.iconOnly ?
                      EdgeInsets.symmetric(vertical: 4.0, horizontal: 5.0)
                      : EdgeInsets.only( top: widget.small ? 8.0 : 14.0, bottom: widget.small ? 6.0 : 14.0, left: 18.0, right: 18.0),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            child: _buildIcon(),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              widget.loading ?
                                Padding(
                                  padding: EdgeInsets.all(2.6),
                                  child: SizedBox(
                                    height: 19.0,
                                    width: 19.0,
                                    child: CircularProgressIndicator(backgroundColor: Color.fromRGBO(140, 130, 255, 1.0), valueColor: AlwaysStoppedAnimation<Color>(Color.fromRGBO(255, 255, 255, 1.0))),
                                  ),
                                )
                              :
                                Padding(
                                  padding: EdgeInsets.only(bottom: widget.small ? 4.0 : 3.0),
                                  child: Text(
                                    widget.title,
                                    style:
                                    TextStyle(
                                      color: widget.textColor,
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w800,
                                      fontFamily: "HKGrotesk"
                                    )
                                  ),
                                )
                            ],
                          )
                        ]
                      ),
                    ),
                  ],
                ),
            ),
          ),
        ),
      ),
    );
  }
}
