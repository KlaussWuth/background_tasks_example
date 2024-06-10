import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';

import 'exchange_rates.dart';

/// Controls the operations related to the [ExchangeRates].
class ExchangeRatesController {
  /// Fetches the exchange rates.
  Future<ExchangeRates> getData() async {
    // Retrieve from local storage
    final localData = await fetchLocalData();
    if (localData != null) return localData;

    setPeriodicTask();
    return refreshData();
  }

  /// Updates the exchange rates data on the local storage.
  ///
  /// Returns the updated [ExchangeRates].
  Future<ExchangeRates> refreshData() async {
    final remoteData = await fetchRemoteData();

    await saveData(remoteData);

    return remoteData;
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

  /// Returns the time (Duration) remaining to be 16:00 CET.
  Duration timeUntilSixteenHoursCET() {
    DateTime now = DateTime.now().toUtc();
    DateTime cetNow =
        now.add(const Duration(hours: 1)); // Considering CET as UTC+1
    DateTime cetSixteen =
        DateTime(cetNow.year, cetNow.month, cetNow.day, 16, 0, 0);

    // If the current time is already past 16:00 CET, calculate the time until 16:00 CET the next day.
    if (cetNow.isAfter(cetSixteen)) {
      cetSixteen = cetSixteen.add(const Duration(days: 1));
    }

    return cetSixteen.difference(cetNow);
  }

  /// Sets a new periodic background task to refresh the stored exchange rates.
  void setPeriodicTask() {
    Workmanager().registerPeriodicTask(
      'fetch_rates',
      'fetch_rates',
      frequency: const Duration(days: 1),
      // We are delaying the start to 16hrs CET to ensure the task get executed
      // every day at that time. That specific time is used because its the time
      // at which the API refreshes its data.
      initialDelay: timeUntilSixteenHoursCET(),
      existingWorkPolicy: ExistingWorkPolicy.update,
      constraints: Constraints(networkType: NetworkType.connected),
    );
  }
}
