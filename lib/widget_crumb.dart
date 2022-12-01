import 'package:flutter/material.dart';

class WidgetCrumb extends StatefulWidget {
  WidgetCrumb({
    Key? key,
    required this.selected,
    required this.markText,
    required this.labelText,
    required this.globalKey,
    this.crumbWidth,
    this.mainAxisAlignment,
    this.bgColor,
    this.markColor,
    this.textColor,
    this.sizeMarkText,
    this.sizeLabelText,
  }) : super(key: key);

  final bool selected;
  final String markText;
  final String labelText;
  final GlobalKey globalKey;
  final double? crumbWidth;
  final MainAxisAlignment? mainAxisAlignment;
  final Color? bgColor;
  final Color? markColor;
  final Color? textColor;
  final double? sizeMarkText;
  final double? sizeLabelText;

  @override
  State<WidgetCrumb> createState() => _WidgetCrumbState();
}

class _WidgetCrumbState extends State<WidgetCrumb> {
  final double widthContainer = 80;

  @override
  Widget build(BuildContext context) {
    //debugPrint(widget.globalKey.currentState.toString());
    return Container(
      key: widget.globalKey,
      width: widget.crumbWidth ?? widthContainer,
      child: Column(
        mainAxisAlignment: widget.mainAxisAlignment ?? MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Container(
                  color: Colors.black,
                  width: widget.crumbWidth ?? widthContainer,
                  height: 3,
                ),
              ),
              CircleAvatar(
                radius: 20,
                backgroundColor: widget.bgColor ?? Colors.cyan,
                child: Text(
                  widget.markText,
                  style: TextStyle(
                    fontSize: widget.sizeMarkText ?? 12,
                    fontWeight: FontWeight.w600,
                    color: widget.markColor ?? Colors.black,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            widget.labelText,
            softWrap: false,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: widget.sizeLabelText ?? 11,
              fontWeight: FontWeight.w600,
              color: widget.textColor ?? Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// Widget buildItem(
//   //BuildContext context,
//   bool selected,
//   String markText,
//   String labelText,
//   Key? key, {
//   double? crumbWidth,
//   MainAxisAlignment? mainAxisAlignment,
//   Color? bgColor,
//   Color? markColor,
//   Color? textColor,
//   double? sizeMarkText,
//   double? sizeLabelText,
// }) {
//   double widthContainer = 80;
//   return Container(
//     key: key,
//     width: crumbWidth ?? widthContainer,
//     child: Column(
//       mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
//       children: [
//         Stack(
//           alignment: Alignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 5.0),
//               child: Container(
//                 color: Colors.black,
//                 width: crumbWidth ?? widthContainer,
//                 height: 3,
//               ),
//             ),
//             CircleAvatar(
//               radius: 20,
//               backgroundColor: bgColor ?? Colors.cyan,
//               child: Text(
//                 markText,
//                 style: TextStyle(
//                   fontSize: sizeMarkText ?? 12,
//                   fontWeight: FontWeight.w600,
//                   color: markColor ?? Colors.black,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 8),
//         Text(
//           labelText,
//           softWrap: false,
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             fontSize: sizeLabelText ?? 11,
//             fontWeight: FontWeight.w600,
//             color: textColor ?? Colors.black,
//           ),
//         ),
//       ],
//     ),
//   );
// }
