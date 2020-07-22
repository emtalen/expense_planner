import 'package:flutter/material.dart';
import './transation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: '1',
      title: 'New Shoes',
      amount: 500,
      date: DateTime.now(),
    ),
    Transaction(
      id: '2',
      title: 'Train ticket',
      amount: 3000,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Planner'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Container(width: 100, child: Text('CHART!')),
            ),
          ),
          Column(
            children: transactions.map(
              (trans) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        child: Text(
                          trans.amount.toString(),
                        ),
                      ),
                      Column(
                        children: [
                          Text(trans.title),
                          Text(trans.date.toString())
                        ],
                      ),
                    ],
                  ),
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}
