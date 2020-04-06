import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';
import 'package:coronastats/helpers/loading_dialog.dart';
import 'package:coronastats/mvoas/action/actions.dart';
import 'package:coronastats/mvoas/observable/stats_observable.dart';
import 'package:coronastats/mvoas/view/country_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer2<AllStatsO, FetchJSONA>(
        builder: (context, stats, fetchJSONA, _) {
      final sortedCountries = stats.countriesStats
        ..sort((a, b) => b.countryTotalDeath.compareTo(a.countryTotalDeath));
      return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[Colors.purple, Colors.blue])),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.insert_chart,
                    size: 40,
                  )),
              InkWell(
                  onTap: () {
                    showLoadingDialog(context);
                    Future.delayed(Duration(milliseconds: 500)).then((onValue) {
                      Navigator.of(context).pop();
                      return fetchJSONA().catchError((e) {
                        print(e);
                      });
                    });
                  },
                  child: Icon(
                    Icons.refresh,
                    size: 40,
                  )),
              InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.dehaze,
                    size: 40,
                  )),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.blue, Colors.red])),
            child: Column(
              children: <Widget>[
                globalStatsCard(stats),
                Flexible(
                    child: ListView.builder(
                  itemCount: sortedCountries.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    var country = sortedCountries[index];
                    return Row(
                      children: <Widget>[
                        Spacer(),
                        Flexible(
                          flex: 20,
                          child: Card(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.black, width: 1),
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
                  },
                )),
              ],
            ),
          ),
        ),
      );
    });
  }

  Card globalStatsCard(AllStatsO stats) {
    return Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.lightBlue, width: 1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ConfigurableExpansionTile(
            initiallyExpanded: true,
            header: Text(
              "Global stats",
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
            headerExpanded: Text(
              "Global stats",
              style: TextStyle(fontSize: 35, color: Colors.blue),
            ),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Total cases: ${stats.globalCases}'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Total deaths: ${stats.globalDeath}'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Total recoveries: ${stats.globalRecovered}'),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
