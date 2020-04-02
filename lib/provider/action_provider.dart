import 'package:coronastats/mvoas/model/entity/stats_entity.dart';
import 'package:coronastats/mvoas/model/stats_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

typedef Future<void> FetchJSONA();
typedef void SelectCountryA(Country country);

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
