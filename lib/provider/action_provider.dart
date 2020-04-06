import 'package:coronastats/mvoas/action/actions.dart';
import 'package:coronastats/mvoas/model/stats_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> actionProviders = [
  Provider<FetchJSONA>(
    create: (context) =>
        Provider.of<StatsModel>(context, listen: false).fetchJSON,
    lazy: false,
  ),
  Provider<SelectCountryA>(
    create: (context) =>
        Provider.of<StatsModel>(context, listen: false).selectCountry,
    lazy: false,
  ),
];
