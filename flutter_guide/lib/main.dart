import 'package:flutter/material.dart';
import './transactions/transaction_list.dart';
import './chart/chart.dart';
import 'transactions/transactions.dart';
import './transactions/new_transaction.dart';
import 'dart:math';

void main() {
  // To disable the rest of the landscape modes
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: "Quicksand",
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: const TextStyle(fontSize: 20),
            ),
        appBarTheme: AppBarTheme(
            titleTextStyle: ThemeData.light()
                .textTheme
                .copyWith(
                  titleLarge: const TextStyle(
                      fontFamily: "Quicksand",
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
                .titleLarge),
      ),
      home: const MyHomePage(headTitle: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.headTitle}) : super(key: key);
  final String headTitle;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  final List<Transaction> transactions = [];
  void addTransaction(String title, double amount, DateTime dateValue) {
    setState(() {
      transactions.add(Transaction(
        id: (Random().nextInt(10000) + amount).toStringAsFixed(0),
        title: title,
        amount: amount,
        date: dateValue,
      ));
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("=====> $state");
    // super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void _deleteTransaction(String id) {
    setState(() {
      transactions.removeWhere((item) => item.id == id);
    });
  }

  List<Transaction> get _recentTransactions {
    return transactions.where(
      (tx) {
        return tx.date.isAfter(
          DateTime.now().subtract(
            const Duration(days: 7),
          ),
        );
      },
    ).toList();
  }

  void startNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransaction(addTransaction: addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text('Expanses'),
      actions: [
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () => startNewTransaction(context),
        )
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.25,
              child: Chart(recentTransactions: _recentTransactions),
            ),
            Container(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.7,
              child: TransactionList(
                tx: transactions,
                deleteTransaction: _deleteTransaction,
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        // mouseCursor: MouseCursor(),
        // child: Container(
        //   width: 300,
        //   height: 300,
        //   color: Colors.red,
        //   child: const Icon(Icons.add),
        // ),
        child: const Icon(Icons.add),
        onPressed: () => startNewTransaction(context),
      ),
    );
  }
}
