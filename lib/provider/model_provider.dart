import 'package:coronastats/mvoas/model/stats_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> modelProviders = [
  Provider<StatsModel>(
    create: (context) => StatsModel(
      Provider.of(context, listen: false),
    ),
    dispose: (context, model) => model.dispose(),
    lazy: false,
  )
];
