import 'package:flutter/material.dart';

class WidgetCrumb extends StatefulWidget {
  const WidgetCrumb({
    Key? key,
    required this.selected,
    required this.markText,
    required this.labelText,
    this.crumbWidth,
    this.mainAxisAlignment,
    this.bgColor,
    this.markColor,
    this.textColor,
    this.lineColor,
    this.selectLineColor,
    this.selectBgCircleColor,
    this.sizeMarkText,
    this.sizeLabelText,
    this.spaceBetween,
    this.radius,
    this.fontWeight,
  }) : super(key: key);

  final bool selected;
  final String markText;
  final String labelText;
  final double? crumbWidth;
  final MainAxisAlignment? mainAxisAlignment;
  final Color? bgColor;
  final Color? markColor;
  final Color? textColor;
  final Color? lineColor;
  final Color? selectLineColor;
  final Color? selectBgCircleColor;
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
                  color: widget.selected
                      ? widget.selectLineColor
                      : widget.lineColor,
                  width: widget.crumbWidth,
                  height: 3,
                ),
              ),
              CircleAvatar(
                radius: widget.radius,
                backgroundColor: widget.selected
                    ? widget.selectBgCircleColor
                    : widget.bgColor,
                child: Text(
                  widget.markText,
                  style: TextStyle(
                    fontSize: widget.sizeMarkText,
                    fontWeight: widget.fontWeight,
                    color: widget.markColor,
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
