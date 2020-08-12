import 'package:expense_planner/widgets/new_transaction.dart';
import 'package:expense_planner/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import './models/transation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Planner',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.blueGrey
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<Transaction> _userTransactions = [
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

  void _addNewTransaction(String title, double amount) {
    final newTrans = Transaction(
        title: title,
        amount: amount,
        date: DateTime.now(),
        id: DateTime.now().toString());

    setState(() {
      _userTransactions.add(newTrans);
    });
  }
  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransaction(_addNewTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Planner'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => startAddNewTransaction(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                color: Theme.of(context).primaryColorLight,
                child: Container(width: 100, child: Text('CHART!')),
              ),
            ),
            TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => startAddNewTransaction(context),
      ),
    );
  }
}
