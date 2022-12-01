import 'package:flutter/material.dart';
import 'package:estudo_bread_crumb/widget_crumb.dart';

class CreateBudgetBreadCrumb extends StatefulWidget {
  final List<String> labelList;
  final double? crumbWidth;
  final String selectPosition;

  const CreateBudgetBreadCrumb({
    Key? key,
    required this.labelList,
    required this.selectPosition,
    this.crumbWidth,
  }) : super(key: key);

  @override
  State<CreateBudgetBreadCrumb> createState() => _CreateBudgetBreadCrumbState();
}

class _CreateBudgetBreadCrumbState extends State<CreateBudgetBreadCrumb> {
  List<WidgetCrumb> crumbs = [];
  //var index = 1;

  _createCrumbs() {
    crumbs = [];
    for (var i = 0; i < widget.labelList.length; i++) {
      var crumbItem = WidgetCrumb(
        selected: false,
        markText: "$i",
        labelText: widget.labelList[i],
        globalKey: GlobalKey(),
        crumbWidth: widget.crumbWidth,
      );
      crumbs.add(crumbItem);
    }
  }

  final ScrollController _controller = ScrollController();
  double _width = 80;
  var indexCrumb = 1;

  int findIndexCrumb(dynamic selectPosition, List<WidgetCrumb> crumbs) {
    indexCrumb = crumbs
        .indexWhere((element) => element.labelText == widget.selectPosition);
    return indexCrumb;
  }

  void _animateToIndex() {
    findIndexCrumb(widget.selectPosition, crumbs);
    if (widget.crumbWidth != null) {
      _width = widget.crumbWidth!;
    }
    _controller.animateTo(
      indexCrumb * _width,
      duration: const Duration(milliseconds: 600),
      curve: Curves.linear,
    );
  }

  @override
  void initState() {
    super.initState();
    _createCrumbs();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.card,
      child: Container(
        height: 200,
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




//Opção de um package
//ScrollablePositionedList.builder(),