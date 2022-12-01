import 'package:estudo_bread_crumb/create_budget_bread_crumb.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ExamplePage(),
    );
  }
}

class ExamplePage extends StatefulWidget {
  const ExamplePage({super.key});

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  var index = 0;

  var reference = "informações";

  var listaRerefencias = [
    "informações",
    "oficina",
    "seguradora",
    "cliente",
    "outros 1",
    "outros 2 fdfafdsafafdas",
    "confirmar",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text("Teste do BreadCrumb"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CreateBudgetBreadCrumb(
              crumbWidth: 80,
              selectPosition: reference,
              labelList: listaRerefencias,
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                const Expanded(
                  child: AnimatedSwitcher(
                      duration: Duration(milliseconds: 400), child: Center()),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        index--;
                        setState(() {
                          reference = listaRerefencias[index];
                        });
                        print(index);
                      },
                      icon: const Icon(
                        Icons.arrow_circle_left,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        index++;
                        setState(() {
                          reference = listaRerefencias[index];
                        });
                        print(index);
                      },
                      icon: const Icon(
                        Icons.arrow_circle_right,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/*
CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: CreateBudgetBreadCrumb(),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: const [
                Expanded(
                  child: AnimatedSwitcher(
                      duration: Duration(milliseconds: 400), child: Center()),
                ),
              ],
            ),
          ),
        ],
      ),
*/


/*
const CreateBudgetBreadCrumb(
        crumbWidth: 60,
        labelList: [
          "informações",
          "oficina",
          "seguradora",
          "cliente",
          "outros 1",
          "outros 2 fdfafdsafafdas",
          "confirmar",
        ],
      ),
*/