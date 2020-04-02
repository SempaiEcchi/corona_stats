import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';
import 'package:coronastats/mvoas/model/entity/stats_entity.dart';
import 'package:flutter/material.dart';

class CountryTile extends StatefulWidget {
  final Country country;

  CountryTile(this.country);

  @override
  _CountryTileState createState() => _CountryTileState();
}

class _CountryTileState extends State<CountryTile> {
  @override
  Widget build(BuildContext context) {
//    return Row(
//      mainAxisAlignment: MainAxisAlignment.center,
//      children: <Widget>[Text(name, style: TextStyle(fontSize: 30),)],
//    );
    return ConfigurableExpansionTile(
      header: Text(
        widget.country.name,
        style: TextStyle(fontSize: 30, color: Colors.black),
      ),
      headerExpanded: Text(
        widget.country.name,
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
                    Text('Total cases: '),
                    Text(widget.country.countryTotalCases.toString()),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Total deaths: '),
                    Text(widget.country.countryTotalDeath.toString()),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Total recoveries: '),
                    Text(widget.country.countryTotalRecovered.toString()),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.insert_chart,
                      size: 40,
                    )),
              ),
            ],
          ),
        )
      ],
    );
  }
}
