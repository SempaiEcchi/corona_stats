import 'package:coronastats/mvoas/observable/stats_observable.dart';
import 'package:coronastats/mvoas/service/stats_service.dart';
import 'package:coronastats/shared/interfaces.dart';
import 'package:rxdart/rxdart.dart';

import 'entity/stats_entity.dart';

class StatsModel implements Disposable {
  StatsService statsService;

  BehaviorSubject<AllStatsO> allStatsO$ = BehaviorSubject<AllStatsO>();
  BehaviorSubject<SelectedCountryO> selectedCountryO$ =
      BehaviorSubject<SelectedCountryO>();

  StatsModel(this.statsService) {
    _init();
  }

  _init() {
    statsService.statsE$.listen((StatsE data) {
      if (data.data != null) {
        allStatsO$.add(AllStatsO(
            globalCases: data.globalCases,
            globalRecovered: data.globalRecovered,
            globalDeath: data.globalDeath,
            countriesStats: data.data));
      }
    });
  }

  void selectCountry(Country country) {
    selectedCountryO$.add(SelectedCountryO(country: country));
  }

  Future<void> fetchJSON() async {
    return statsService.fetchJSON();
  }

  @override
  Future<void> dispose() {
    allStatsO$.close();
    selectedCountryO$.close();
  }
}
