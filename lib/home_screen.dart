import 'package:background_tasks_example/exchange_rates.dart';
import 'package:background_tasks_example/exchange_rates_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'currency.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ratesController = ExchangeRatesController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('European Central Bank Rates'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Text(
            getDateLabel(),
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 10),
          Text(
            'All currencies quoted against the euro (base currency)',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 10),
          FutureBuilder<ExchangeRates>(
            future: ratesController.getData(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text('An error has occurred.'),
                );
              }

              if (!snapshot.hasData) {
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                );
              }

              final latestRates = snapshot.data;

              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: latestRates.rates.entries.length,
                    itemBuilder: (BuildContext context, int index) {
                      final rateItem =
                          latestRates.rates.entries.elementAt(index);
                      final currency = Currency.fromCurrencyCode(rateItem.key);
                      final topRadius = index == 0 ? 15.0 : 0.0;
                      final bottomRadius =
                          index == latestRates.rates.entries.length - 1
                              ? 15.0
                              : 0.0;

                      return Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Theme.of(context).canvasColor,
                            ),
                          ),
                        ),
                        child: ListTile(
                          tileColor:
                              Theme.of(context).primaryColor.withOpacity(0.05),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(topRadius),
                              topRight: Radius.circular(topRadius),
                              bottomLeft: Radius.circular(bottomRadius),
                              bottomRight: Radius.circular(bottomRadius),
                            ),
                          ),
                          leading: Text(
                            currency.countryFlag,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          title: Text(currency.name),
                          trailing: Text(rateItem.value.toString()),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  /// Returns today's date with the format dd MMMM yyyy.
  String getDateLabel() {
    return DateFormat('dd MMMM yyyy').format(DateTime.now());
  }
}
