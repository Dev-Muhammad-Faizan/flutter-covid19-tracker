import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../commponents/row_reuse.dart';

class DetailScreen extends StatefulWidget {
  String name, image;
  int totalCases,
      totalDeaths,
      totalRecovered,
      active,
      critical,
      todayRecovered,
      test;
  DetailScreen({
    super.key,
    required this.name,
    required this.image,
    required this.totalCases,
    required this.totalDeaths,
    required this.totalRecovered,
    required this.active,
    required this.critical,
    required this.todayRecovered,
    required this.test,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.name), centerTitle: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .067),
                child: Card(
                  elevation: 10,
                  child: Column(
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height * .06,),
                        RowReuse(title: 'Cases', value: widget.totalCases.toString()),
                        RowReuse(title: 'Deaths', value: widget.totalDeaths.toString()),
                        RowReuse(title: 'Recover', value: widget.totalRecovered.toString()),
                        RowReuse(title: 'Active', value: widget.active.toString()),
                        RowReuse(title: 'Critical', value: widget.critical.toString()),
                        RowReuse(title: 'Today Recovered', value: widget.todayRecovered.toString()),
                        RowReuse(title: 'Test', value: widget.test.toString())

                      ],
                  ),
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(widget.image),
              ),
            ],
          )
        ],
      ),
    );
  }
}
