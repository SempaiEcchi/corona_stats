import 'package:coronastats/mvoas/model/stats_model.dart';
import 'package:coronastats/mvoas/observable/stats_observable.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> observableProviders = [
  StreamProvider<AllStatsO>(
    initialData: AllStatsO(
        globalDeath: 0,
        globalCases: 0,
        globalRecovered: 0,
        countriesStats: null),
    create: (context) =>
        Provider.of<StatsModel>(context, listen: false).allStatsO$,
  ),
];
