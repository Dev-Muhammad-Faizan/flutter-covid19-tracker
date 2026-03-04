import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

import '../Models/worldstates.dart';
import '../commponents/row_reuse.dart';
import '../services/states_services.dart';
import 'countrieslist_screen.dart';

class WorldStates extends StatefulWidget {
  const WorldStates({super.key});

  @override
  State<WorldStates> createState() => _WorldStatesState();
}

class _WorldStatesState extends State<WorldStates>
    with TickerProviderStateMixin {
  final StatesServices services = StatesServices();
  late Future<CovidStats> covidStats;
  late final AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    )..repeat();
    covidStats = services.fetchWorldStats();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  final colorlist = <Color>[
    Color(0xff4285F4),
    Color(0xff1aa260),
    Color(0xffde5246),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * .01),
              FutureBuilder(
                future: covidStats,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Expanded(
                      flex: 1,
                      child: SpinKitFadingCircle(
                        color: Colors.black,
                        size: 50,
                        controller: _controller,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text('${snapshot.error}'));
                  } else {
                    return Column(
                      children: [
                        PieChart(
                          dataMap: {
                            "Total": snapshot.data!.cases.toDouble(),
                            "Recovered": snapshot.data!.recovered.toDouble(),
                            "Deaths": snapshot.data!.deaths.toDouble(),
                          },
                          chartValuesOptions: ChartValuesOptions(
                            showChartValuesInPercentage: true,
                          ),
                          animationDuration: Duration(milliseconds: 1200),
                          // legendOptions: LegendOptions(
                          //   legendPosition: LegendPosition.left,
                          // ),
                          chartType: ChartType.ring,
                          //
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height * .06,
                          ),
                          child: Card(
                            elevation: 5,
                            child: Column(
                              children: [
                                RowReuse(
                                  title: 'Total Cases',
                                  value: snapshot.data!.cases.toString(),
                                ),
                                RowReuse(
                                  title: 'Deaths',
                                  value: snapshot.data!.deaths.toString(),
                                ),
                                RowReuse(
                                  title: 'Recovered',
                                  value: snapshot.data!.recovered.toString(),
                                ),
                                RowReuse(
                                  title: 'Active',
                                  value: snapshot.data!.active.toString(),
                                ),
                                RowReuse(
                                  title: 'Critical',
                                  value: snapshot.data!.critical.toString(),
                                ),
                                RowReuse(
                                  title: 'Today Deaths',
                                  value: snapshot.data!.deaths.toString(),
                                ),
                                RowReuse(
                                  title: 'Total Recovered',
                                  value: snapshot.data!.recovered.toString(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CountrieslistScreen(),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.greenAccent,
                            ),
                            child: Center(
                              child: Text(
                                'Track Countries',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
