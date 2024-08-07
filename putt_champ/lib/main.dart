import 'package:flutter/material.dart';

void main() {
  runApp(const PuttChampApp());
}

class PuttChampApp extends StatelessWidget {
  const PuttChampApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PuttChamp App',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _players = <String>['Alice', 'Bob', 'Charlie', 'David'];
  final int numberOfHoles = 9;
  final Map<String, List<int>> _scores = <String, List<int>>{
    'Alice': List<int>.filled(9, 0),
    'Bob': List<int>.filled(9, 0),
    'Charlie': List<int>.filled(9, 0),
    'David': List<int>.filled(9, 0),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('PuttChamp'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                    columns: [
                      const DataColumn(label: Text('Lane')),
                      ..._players
                          .map((player) => DataColumn(label: Text(player))),
                    ],
                    rows: List<DataRow>.generate(
                      numberOfHoles,
                      (index) => DataRow(
                        cells: [
                          DataCell(Text('Lane ${index + 1}')),
                          ..._players.map(
                            (player) => DataCell(
                              TextField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: _scores[player]![index].toString(),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    _scores[player]![index] = int.parse(value);
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    )))));
  }
}
