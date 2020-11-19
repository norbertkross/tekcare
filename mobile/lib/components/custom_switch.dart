import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  CustomSwitch({Key key, this.value, this.onChanged}) : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  Animation _animation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 60));

    _animation = AlignmentTween(
            begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
            end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) => GestureDetector(
        onTap: () {
          if (_animationController.isCompleted) {
            _animationController.reverse();
          } else {
            _animationController.forward();
          }

          widget.value == false
              ? widget.onChanged(true)
              : widget.onChanged(false);
        },
        child: Container(
          width: 60,
          height: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: widget.value == false
                  ?Theme.of(context).primaryColor.withOpacity(0.4)
                  : Theme.of(context).primaryColor),
          child: Padding(
            padding: EdgeInsets.all(3.0),
            child: Container(
              alignment:
                  widget.value ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                width: 35.0,
                height: 24.0,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(7.0), color: Color(0xffffffff)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
