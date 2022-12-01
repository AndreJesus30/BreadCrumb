import 'package:flutter/material.dart';
import 'package:estudo_bread_crumb/widget_crumb.dart';

class CreateBudgetBreadCrumb extends StatefulWidget {
  const CreateBudgetBreadCrumb({
    Key? key,
    required this.labelList,
    required this.selectPosition,
    this.heightContainer,
    this.crumbWidth,
    this.markText,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.bgColor = Colors.cyan,
    this.markColor = Colors.black,
    this.textColor = Colors.black,
    this.sizeMark = 12,
    this.sizeLabel = 11,
    this.spaceBetween = 8,
    this.radius = 20,
    this.fontWeight = FontWeight.w600,
  }) : super(key: key);

  final double? heightContainer;
  final List<String> labelList;
  final String selectPosition;
  final double? crumbWidth;
  final String? markText;
  final MainAxisAlignment? mainAxisAlignment;
  final Color? bgColor;
  final Color? markColor;
  final Color? textColor;
  final double? sizeMark;
  final double? sizeLabel;
  final double? spaceBetween;
  final double? radius;
  final FontWeight? fontWeight;

  @override
  State<CreateBudgetBreadCrumb> createState() => _CreateBudgetBreadCrumbState();
}

class _CreateBudgetBreadCrumbState extends State<CreateBudgetBreadCrumb> {
  List<WidgetCrumb> crumbs = [];

  _createCrumbs(double widthScreen) {
    crumbs = [];
    for (var i = 0; i < widget.labelList.length; i++) {
      var crumbItem = WidgetCrumb(
        selected: widget.selectPosition == widget.labelList[i],
        markText: "${i + 1}",
        labelText: widget.labelList[i],
        crumbWidth: widget.crumbWidth ?? (crumbs.length <= 5 ? 100 : 80),
        bgColor: widget.bgColor,
        key: widget.key ?? GlobalKey(),
        mainAxisAlignment: widget.mainAxisAlignment,
        markColor: widget.markColor,
        sizeLabelText: widget.sizeLabel,
        sizeMarkText: widget.sizeMark,
        textColor: widget.textColor,
        spaceBetween: widget.spaceBetween,
        radius: widget.radius,
        fontWeight: widget.fontWeight,
      );
      crumbs.add(crumbItem);
    }
  }

  final ScrollController _controller = ScrollController();
  //double _width = 80;
  var indexCrumb = 0;

  int findIndexCrumb(dynamic selectPosition, List<WidgetCrumb> crumbs) {
    indexCrumb = crumbs
        .indexWhere((element) => element.labelText == widget.selectPosition);
    return indexCrumb;
  }

  void _animateToIndex() async {
    findIndexCrumb(widget.selectPosition, crumbs);
    //_width = widget.crumbWidth ?? _width;
    await _controller.animateTo(
      indexCrumb * (widget.crumbWidth ?? 80),
      duration: const Duration(milliseconds: 800),
      curve: Curves.linear,
    );
  }

  @override
  void initState() {
    super.initState();
    _createCrumbs(500);
  }

  @override
  Widget build(BuildContext context) {
    //var widthScreen = MediaQuery.of(context).size.width;
    return Material(
      type: MaterialType.card,
      child: Container(
        height: widget.heightContainer ??
            widget.radius! * 2 + widget.sizeLabel! + widget.spaceBetween! + 40,
        decoration: BoxDecoration(
          color: Colors.indigoAccent,
          border: Border.all(),
        ),
        child: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: constraints.maxWidth,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                controller: _controller,
                itemCount: crumbs.length,
                itemBuilder: (context, i) {
                  _createCrumbs(500);
                  _animateToIndex();
                  return crumbs[i];
                },
              ),
            ),
          );
        }),
      ),
    );
  }
}
