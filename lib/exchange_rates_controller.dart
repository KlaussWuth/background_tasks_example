import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'exchange_rates.dart';

/// Controls the operations related to the [ExchangeRates].
class ExchangeRatesController {
  /// Fetches the exchange rates.
  Future<ExchangeRates> getData() async {
    try {
      // Retrieve from local storage
      final localData = await fetchLocalData();
      if (localData != null) return localData;

      final remoteData = await fetchRemoteData();

      await saveData(remoteData);

      return remoteData;
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }

  /// Saves the provided [ExchangeRates] locally on the device.
  Future<void> saveData(ExchangeRates rates) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('rates', jsonEncode(rates.toJson()));
  }

  /// Fetches the [ExchangeRates] stored on the local storage.
  ///
  /// Return null if no data is found on the device.
  Future<ExchangeRates?> fetchLocalData() async {
    final prefs = await SharedPreferences.getInstance();
    final storedData = prefs.getString('rates');
    if (storedData == null) return null;

    return ExchangeRates.fromJson(jsonDecode(storedData));
  }

  /// Fetches the latest [ExchangeRates] from the remote API.
  Future<ExchangeRates> fetchRemoteData() async {
    final response =
        await http.get(Uri.parse('https://api.frankfurter.app/latest'));

    return ExchangeRates.fromJson(jsonDecode(response.body));
  }

  /// Returns whether the periodic task to fetch the rates is set.
  bool isPeriodicTaskSet() {
    // TODO: Add implementation logic.
    throw UnimplementedError();
  }

  /// Sets a new periodic background task to refresh the stored exchange rates.
  void setPeriodicTask() {
    // TODO: Add implementation logic.
    throw UnimplementedError();
  }
}
