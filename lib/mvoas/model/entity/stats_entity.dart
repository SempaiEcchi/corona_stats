import 'package:coronastats/extensions/string_extensions.dart';
import 'package:flutter/cupertino.dart';

class StatsE {
  final List<Country> data;

  StatsE({
    @required this.data,
  }) {
    calculateGlobalStats(data);
  }

  int _globalDeath = 0;
  int _globalCases = 0;
  int _globalRecovered = 0;

  int get globalDeath => _globalDeath;

  int get globalCases => _globalCases;

  int get globalRecovered => _globalRecovered;

  calculateGlobalStats(List<Country> data) {
    data.forEach((Country countryEntry) {
      _globalDeath += countryEntry.countryTotalDeath;
      _globalCases += countryEntry.countryTotalCases;
      _globalRecovered += countryEntry.countryTotalRecovered;
    });
    print(globalCases);
    print(globalDeath);
    print(globalRecovered);
  }

  factory StatsE.fromMap(Map map) {
    List<Country> countriesData = List<Country>();
    List<String> countries = List.from(map.keys);
    countries.forEach((String countryName) {
      List<CountryEntry> entries = List<CountryEntry>();

      map[countryName].forEach((e) => entries.add(CountryEntry(
          date: e['date'].toString().convertStringToDateTime(),
          confirmed: int.parse(e['confirmed'].toString()),
          deaths: int.parse(e['deaths'].toString()),
          recovered: int.parse(e['recovered'].toString()))));

      countriesData.add(Country(name: countryName, entries: entries));
    });
    return StatsE(data: countriesData);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatsE && runtimeType == other.runtimeType && data == other.data;

  @override
  int get hashCode => data.hashCode;
}

class Country {
  final String name;
  final List<CountryEntry> entries;

  List<int> _countryDeathList = [];
  List<int> _countryRecoveryList = [];
  List<int> _countryCasesList = [];

  Country({
    @required this.name,
    @required this.entries,
  }) {
    getData(entries);
  }

  List<int> get countryDeathList => _countryDeathList;

  List<int> get countryRecoveryList => _countryRecoveryList;

  List<int> get countryCasesList => _countryCasesList;

  int get countryTotalRecovered => _countryRecoveryList.last.toInt();

  int get countryTotalDeath => _countryDeathList.last.toInt();

  int get countryTotalCases => _countryCasesList.last.toInt();

  getData(List<CountryEntry> entries) {
    entries.forEach((CountryEntry entry) {
      _countryDeathList.add(entry.deaths);
      _countryRecoveryList.add(entry.recovered);
      _countryCasesList.add(entry.confirmed);
    });
  }
}

class CountryEntry {
  final DateTime date;
  final int confirmed;
  final int deaths;
  final int recovered;

  const CountryEntry({
    @required this.date,
    @required this.confirmed,
    @required this.deaths,
    @required this.recovered,
  });

  @override
  String toString() {
    return 'CountryEntry{date: $date, confirmed: $confirmed, deaths: $deaths, recovered: $recovered}';
  }
}
