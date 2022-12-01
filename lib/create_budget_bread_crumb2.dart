// import 'package:estudo_bread_crumb/widget_crumb.dart';
// import 'package:flutter/material.dart';

// class CreateBudgetBreadCrumb2 extends StatefulWidget {
//   const CreateBudgetBreadCrumb2({super.key});

//   @override
//   State<CreateBudgetBreadCrumb2> createState() =>
//       _CreateBudgetBreadCrumb2State();
// }

// class _CreateBudgetBreadCrumb2State extends State<CreateBudgetBreadCrumb2> {
//   @override
//   Widget build(BuildContext context) {
//     var index = 1;
//     var crumbs = [
//       buildItem(
//         context,
//         false,
//         "${index++}",
//         "Simulação de nome",
//         GlobalKey(),
//       ),
//       buildItem(
//         context,
//         false,
//         "${index++}",
//         "Simulado",
//         GlobalKey(),
//       ),
//       buildItem(
//         context,
//         false,
//         "${index++}",
//         "Simulado",
//         GlobalKey(),
//       ),
//       buildItem(
//         context,
//         false,
//         "${index++}",
//         "Simulado",
//         GlobalKey(),
//       ),
//       buildItem(
//         context,
//         false,
//         "${index++}",
//         "Simulado",
//         GlobalKey(),
//       ),
//       buildItem(
//         context,
//         false,
//         "${index++}",
//         "Simulado",
//         GlobalKey(),
//       ),
//       buildItem(
//         context,
//         false,
//         "${index++}",
//         "Simulado",
//         GlobalKey(),
//       ),
//       buildItem(
//         context,
//         false,
//         "${index++}",
//         "Simulado",
//         GlobalKey(),
//       ),
//       buildItem(
//         context,
//         false,
//         "${index++}",
//         "Simulado",
//         GlobalKey(),
//       ),
//     ];
//     return Material(
//       type: MaterialType.card,
//       child: Container(
//         height: 80,
//         decoration: BoxDecoration(
//           border: Border.all(),
//         ),
//         child: LayoutBuilder(
//           builder: (context, constraints) => ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: 1,
//             itemBuilder: (context, index) => Center(),
//           ),
//         ),
//       ),
//     );
//   }
// }
