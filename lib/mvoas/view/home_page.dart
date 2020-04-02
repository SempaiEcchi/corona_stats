import 'package:coronastats/mvoas/observable/stats_observable.dart';
import 'package:coronastats/mvoas/view/country_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AllStatsO>(builder: (context, stats, _) {
      final sortedCountries = stats.countriesStats
        ..sort((a, b) => b.countryTotalDeath.compareTo(a.countryTotalDeath));
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                flex: 15,
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverAppBar(
                      backgroundColor: Colors.white,
                      expandedHeight: 300,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Container(
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Coronavirus Cases",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.black),
                              ),
                              Text(
                                stats.globalCases.toString(),
                                style: TextStyle(
                                    fontSize: 30, color: Colors.black),
                              ),
                              Text(
                                "Deaths",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.black),
                              ),
                              Text(
                                stats.globalDeath.toString(),
                                style:
                                    TextStyle(fontSize: 30, color: Colors.red),
                              ),
                              Text(
                                "Recovered",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.black),
                              ),
                              Text(
                                stats.globalRecovered.toString(),
                                style: TextStyle(
                                    fontSize: 30, color: Colors.green),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        var country = sortedCountries[index];
                        return Row(
                          children: <Widget>[
                            Spacer(),
                            Flexible(
                              flex: 20,
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.lightBlue, width: 1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CountryTile(country),
                                  )),
                            ),
                            Spacer(),
                          ],
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
