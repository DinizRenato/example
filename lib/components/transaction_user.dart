import 'dart:math';

import 'package:flutter/material.dart';
import 'transaction_form.dart';
import 'transaction_list.dart';
import '../models/transaction.dart';

class TransactionUser extends StatefulWidget {
  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {

  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Novo Tênis de Corrida',
      value: 310.76,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de Luz',
      value: 211.30,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'Conta de Agua',
      value: 100.30,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'Conta do Bar',
      value: 888.30,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't5',
      title: 'Conta do Almoço',
      value: 222.82,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't6',
      title: 'Cinema',
      value: 145.02,
      date: DateTime.now(),
    ),
  ];


  _addTransaction(String title, double value){
    final newTransaction = Transaction (
      id : Random().nextDouble().toString(),
      title : title,
      value : value,
      date : DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context){
    return Column(
      children: <Widget>[
        TransactionList(_transactions),
        TransactionForm(_addTransaction),
      ],
    );
  }
}
