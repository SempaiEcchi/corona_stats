import 'package:coronastats/provider/action_provider.dart';
import 'package:coronastats/provider/model_provider.dart';
import 'package:coronastats/provider/observable_provider.dart';
import 'package:coronastats/provider/service_provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ...serviceProviders,
  ...modelProviders,
  ...observableProviders,
  ...actionProviders
];
