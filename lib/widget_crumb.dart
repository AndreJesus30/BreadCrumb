import 'package:flutter/material.dart';

class WidgetCrumb extends StatefulWidget {
  WidgetCrumb({
    Key? key,
    required this.selected,
    required this.markText,
    required this.labelText,
    this.crumbWidth,
    this.mainAxisAlignment,
    this.bgColor,
    this.markColor,
    this.textColor,
    this.sizeMarkText,
    this.sizeLabelText,
    this.spaceBetween,
    this.radius,
    this.fontWeight,
  }) : super(key: key);

  bool selected;
  final String markText;
  final String labelText;
  final double? crumbWidth;
  final MainAxisAlignment? mainAxisAlignment;
  final Color? bgColor;
  final Color? markColor;
  final Color? textColor;
  final double? sizeMarkText;
  final double? sizeLabelText;
  final double? spaceBetween;
  final double? radius;
  final FontWeight? fontWeight;

  @override
  State<WidgetCrumb> createState() => _WidgetCrumbState();
}

class _WidgetCrumbState extends State<WidgetCrumb> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.crumbWidth,
      child: Column(
        mainAxisAlignment: widget.mainAxisAlignment!,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Container(
                  color: widget.selected ? Colors.deepOrange : Colors.black,
                  width: widget.crumbWidth,
                  height: 3,
                ),
              ),
              CircleAvatar(
                radius: widget.radius,
                backgroundColor:
                    widget.selected ? Colors.yellow : widget.bgColor,
                child: Text(
                  widget.markText,
                  style: TextStyle(
                    fontSize: widget.sizeMarkText,
                    fontWeight: widget.fontWeight,
                    color: widget.markColor ?? Colors.black,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: widget.spaceBetween),
          Text(
            widget.labelText,
            softWrap: false,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: widget.sizeLabelText,
              fontWeight: widget.fontWeight,
              color: widget.textColor ?? Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
