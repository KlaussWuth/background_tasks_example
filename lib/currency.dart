/// Definition of a currency.
class Currency {
  const Currency({
    required this.name,
    required this.code,
    required this.countryName,
    required this.countryFlag,
    required this.countryCode,
  });

  /// Currency name.
  final String name;

  /// Currency code (ISO 4217).
  final String code;

  /// Country of origin name.
  final String countryName;

  /// Country of origin flag.
  final String countryFlag;

  /// Country of origin alphabetic code (ISO 3166).
  final String countryCode;

  /// Creates a [Currency] instance based on the code provided.
  ///
  /// See [_currencies] to review the list available.
  factory Currency.fromCurrencyCode(String code) =>
      _currencies.firstWhere((e) => e.code == code);
}

/// List of supported currencies.
List<Currency> _currencies = [
  const Currency(
    countryName: "Australia",
    countryCode: "AUS",
    code: "AUD",
    name: "Australian dollar",
    countryFlag: '🇦🇺',
  ),
  const Currency(
    countryName: "Bulgaria",
    countryCode: "BGR",
    code: "BGN",
    name: "Bulgarian lev",
    countryFlag: '🇧🇬',
  ),
  const Currency(
    countryName: "Brazil",
    countryCode: "BRA",
    code: "BRL",
    name: "Brazilian real",
    countryFlag: '🇧🇷',
  ),
  const Currency(
    countryName: "Canada",
    countryCode: "CAN",
    code: "CAD",
    name: "Canadian dollar",
    countryFlag: '🇨🇦',
  ),
  const Currency(
    countryName: "Switzerland",
    countryCode: "CHE",
    code: "CHF",
    name: "Swiss franc",
    countryFlag: '🇨🇭',
  ),
  const Currency(
    countryName: "China",
    countryCode: "CHN",
    code: "CNY",
    name: "Chinese yuan",
    countryFlag: '🇨🇳',
  ),
  const Currency(
    countryName: "Czech Republic",
    countryCode: "CZE",
    code: "CZK",
    name: "Czech koruna",
    countryFlag: '🇨🇿',
  ),
  const Currency(
    countryName: "Denmark",
    countryCode: "DNK",
    code: "DKK",
    name: "Danish krone",
    countryFlag: '🇩🇰',
  ),
  const Currency(
    countryName: "United Kingdom",
    countryCode: "GBR",
    code: "GBP",
    name: "British pound",
    countryFlag: '🇬🇧',
  ),
  const Currency(
    countryName: "Hong Kong",
    countryCode: "HKG",
    code: "HKD",
    name: "Hong Kong dollar",
    countryFlag: '🇭🇰',
  ),
  const Currency(
    countryName: "Hungary",
    countryCode: "HUN",
    code: "HUF",
    name: "Hungarian forint",
    countryFlag: '🇭🇺',
  ),
  const Currency(
    countryName: "Indonesia",
    countryCode: "IDN",
    code: "IDR",
    name: "Indonesian rupiah",
    countryFlag: '🇮🇩',
  ),
  const Currency(
    countryName: "Israel",
    countryCode: "ISR",
    code: "ILS",
    name: "Israeli new shekel",
    countryFlag: '🇮🇱',
  ),
  const Currency(
    countryName: "India",
    countryCode: "IND",
    code: "INR",
    name: "Indian rupee",
    countryFlag: '🇮🇳',
  ),
  const Currency(
    countryName: "Iceland",
    countryCode: "ISL",
    code: "ISK",
    name: "Icelandic króna",
    countryFlag: '🇮🇸',
  ),
  const Currency(
    countryName: "Japan",
    countryCode: "JPN",
    code: "JPY",
    name: "Japanese yen",
    countryFlag: '🇯🇵',
  ),
  const Currency(
    countryName: "Korea, Republic of",
    countryCode: "KOR",
    code: "KRW",
    name: "South Korean won",
    countryFlag: '🇰🇷',
  ),
  const Currency(
    countryName: "Mexico",
    countryCode: "MEX",
    code: "MXN",
    name: "Mexican peso",
    countryFlag: '🇲🇽',
  ),
  const Currency(
    countryName: "Malaysia",
    countryCode: "MYS",
    code: "MYR",
    name: "Malaysian ringgit",
    countryFlag: '🇲🇾',
  ),
  const Currency(
    countryName: "Norway",
    countryCode: "NOR",
    code: "NOK",
    name: "Norwegian krone",
    countryFlag: '🇳🇴',
  ),
  const Currency(
    countryName: "New Zealand",
    countryCode: "NZL",
    code: "NZD",
    name: "New Zealand dollar",
    countryFlag: '🇳🇿',
  ),
  const Currency(
    countryName: "Philippines",
    countryCode: "PHL",
    code: "PHP",
    name: "Philippine peso",
    countryFlag: '🇵🇭',
  ),
  const Currency(
    countryName: "Poland",
    countryCode: "POL",
    code: "PLN",
    name: "Polish złoty",
    countryFlag: '🇵🇱',
  ),
  const Currency(
    countryName: "Romania",
    countryCode: "ROU",
    code: "RON",
    name: "Romanian leu",
    countryFlag: '🇷🇴',
  ),
  const Currency(
    countryName: "Sweden",
    countryCode: "SWE",
    code: "SEK",
    name: "Swedish krona",
    countryFlag: '🇸🇪',
  ),
  const Currency(
    countryName: "Singapore",
    countryCode: "SGP",
    code: "SGD",
    name: "Singapore dollar",
    countryFlag: '🇸🇬',
  ),
  const Currency(
    countryName: "Thailand",
    countryCode: "THA",
    code: "THB",
    name: "Thai baht",
    countryFlag: '🇹🇭',
  ),
  const Currency(
    countryName: "Turkey",
    countryCode: "TUR",
    code: "TRY",
    name: "Turkish lira",
    countryFlag: '🇹🇷',
  ),
  const Currency(
    countryName: "United States",
    countryCode: "USA",
    code: "USD",
    name: "United States dollar",
    countryFlag: '🇺🇸',
  ),
  const Currency(
    countryName: "South Africa",
    countryCode: "ZAF",
    code: "ZAR",
    name: "South African rand",
    countryFlag: '🇿🇦',
  ),
];
