import 'dart:convert';

import 'package:coronastats/mvoas/model/entity/stats_entity.dart';
import 'package:coronastats/shared/interfaces.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

class StatsService implements Disposable {
  BehaviorSubject<StatsE> statsE$ = BehaviorSubject<StatsE>();

  static const String queryURL =
      'https://pomber.github.io/covid19/timeseries.json';

  StatsService() {
    fetchJSON();
  }

  Future<void> fetchJSON() async {
    final response = await http.get(queryURL);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      StatsE stats = StatsE.fromMap(data);
      statsE$.add(stats);
    }
  }

  @override
  Future<void> dispose() {
    statsE$.close();
  }
}
