import 'package:bitcoin_ticker/coin_api.dart';
import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  CoinNetworkingData coinClass = CoinNetworkingData();

  String currency = "USD";

  List currencyCoins = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currencyChangeHandler(currency);
  }

  void currencyChangeHandler(String newValue) async {
    dynamic coinValues;
    currencyCoins = [];
    await Future.forEach(cryptoList, (item) async {
      coinValues = await coinClass.coinApi(item.toString(), newValue);
      currencyCoins.add(coinValues);
    });

    print('===>>>> $currencyCoins');
    setState(() {
      currency = newValue;
    });
  }

  Widget cryptoValues() {
    return Column(
      children: currencyCoins
          .map<Widget>(
            (options) => Padding(
              padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
              child: Card(
                color: Colors.lightBlueAccent,
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 28.0),
                  child: Text(
                    "1 ${options['asset_id_base']} = ${options['rate']} $currency",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: cryptoValues(),
            ),
            Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(bottom: 30.0),
              color: Colors.lightBlue,
              child: DropdownButton<String>(
                elevation: 16,
                style: const TextStyle(color: Colors.black),
                underline: Container(
                  height: 2,
                  color: Colors.red,
                ),
                onChanged: (String? newValue) {
                  currencyChangeHandler(newValue!);
                },
                value: currency,
                items: currenciesList
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
