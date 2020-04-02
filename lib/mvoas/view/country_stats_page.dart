import 'package:coronastats/mvoas/observable/stats_observable.dart';
import 'package:fcharts/fcharts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountryStatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SelectedCountryO>(builder: (context, o, _) {
      final dataCases =
          o.country.countryCasesList.map((e) => e.toDouble()).toList();
      final dataDeath =
          o.country.countryDeathList.map((e) => e.toDouble()).toList();
      final dataRecovery =
          o.country.countryRecoveryList.map((e) => e.toDouble()).toList();
      return Scaffold(
        appBar: AppBar(
          title: Text(o.country.name),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                chart(dataCases),
                Text('Total cases'),
                chart(dataDeath),
                Text('Total death'),
                chart(dataRecovery),
                Text('Total recovery'),
              ],
            ),
          ),
        ),
      );
    });
  }

  Column chart(List<double> data) {
    return Column(
      children: <Widget>[
        Container(
          child: AspectRatio(
            aspectRatio: 2,
            child: LineChart(
              lines: [
                Sparkline(
                  data: data,
                  stroke: new PaintOptions.stroke(
                    color: Colors.black,
                    strokeWidth: 4.0,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          child: Text(data.last.toInt().toString()),
        ),
      ],
    );
  }
}
