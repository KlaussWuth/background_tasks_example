/// Definition of the exchange rates returned by ECB.
class ExchangeRates {
  /// Currency converted.
  final double amount;

  /// Currency use to measure the rates.
  final String base;

  /// When the data was fetch.
  final DateTime date;

  /// List of conversion rates by EU currencies.
  final Map<String, dynamic> rates;

  /// Creates an exchange rates instance.
  const ExchangeRates({
    required this.amount,
    required this.base,
    required this.date,
    required this.rates,
  });

  /// Creates an instance using a decoded JSON string.
  factory ExchangeRates.fromJson(Map<String, dynamic> json) => ExchangeRates(
        amount: json['amount'],
        base: json['base'],
        date: DateTime.parse(json['date']),
        rates: json['rates'],
      );

  /// Returns the instance as a decoded JSON string.
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['amount'] = amount;
    data['base'] = base;
    data['date'] = date.toString();
    data['rates'] = rates;
    return data;
  }
}
