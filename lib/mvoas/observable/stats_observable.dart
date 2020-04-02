import 'package:coronastats/mvoas/model/entity/stats_entity.dart';
import 'package:flutter/foundation.dart';

class AllStatsO {
  final int globalDeath;
  final int globalCases;
  final int globalRecovered;
  final List<Country> countriesStats;

  const AllStatsO({
    @required this.globalDeath,
    @required this.globalCases,
    @required this.globalRecovered,
    @required this.countriesStats,
  });
}

class SelectedCountryO {
  final Country country;

  const SelectedCountryO({
    @required this.country,
  });
}
