import 'package:coronastats/mvoas/service/stats_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> serviceProviders = [
  Provider<StatsService>(
    create: (context) => StatsService(),
    lazy: false,
  )
];
