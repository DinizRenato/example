import 'package:example/components/chart.dart';
import 'package:example/components/transaction_form.dart';
import 'package:flutter/material.dart';

import 'dart:math';
import './components/transaction_form.dart';
import './components/transaction_list.dart';
import 'models/transaction.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MyHomePage(),
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.amber,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              button : TextStyle(
                color : Colors.white,
                fontWeight: FontWeight.bold,
              )
              ),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    // Transaction(
    //   id: 't0',
    //   title: 'Conta antiga',
    //   value: 400.00,
    //   date: DateTime.now().subtract(Duration(days: 33)),
    // ),
    // Transaction(
    //   id: 't1',
    //   title: 'Novo Tênis de Corrida',
    //   value: 310.76,
    //   date: DateTime.now().subtract(Duration(days: 3)),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'Conta de Luz',
    //   value: 211.30,
    //   date: DateTime.now(),
    // ),
  ];

  List<Transaction> get _recentTransactions {
    return _transactions.where((t) {
      return t.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: date,
    );

    setState(() {
      _transactions.add(newTransaction);
    });
    Navigator.of(context).pop();
  }

  _opentransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(_addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais',
            style: TextStyle(
              fontFamily: 'Opensans',
            )),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _opentransactionFormModal(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(_recentTransactions),
            TransactionList(_transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _opentransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
