import 'package:covid19_tracker/screen/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../Models/countires_api.dart';
import '../services/serivce_api.dart';

class CountrieslistScreen extends StatefulWidget {
  CountrieslistScreen({super.key});
  @override
  State<CountrieslistScreen> createState() => _CountrieslistScreenState();
}

class _CountrieslistScreenState extends State<CountrieslistScreen> {
  final SerivceApi services = SerivceApi();
  late final Future<List<CountryData>> countrydata;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    countrydata = services.getCounties();
  }

  TextEditingController searchcontroller = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: TextFormField(
                controller: searchcontroller,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  hintText: 'Search with Country Name',
                  suffix: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),

            Expanded(
              child: FutureBuilder<List<CountryData>>(
                future: countrydata,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {

                    return ListView.builder(
                      itemCount:4,
                      itemBuilder: (context, index) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey.shade700,
                          highlightColor: Colors.grey.shade100,
                          child: Column(
                            children: [ListTile(
                              leading: Container(height: 35,width: 89,color: Colors.white,),
                              title:Container(height: 10,width: 89,color: Colors.white,),
                              subtitle: Container(height: 10,width: 89,color: Colors.white,),
                            )],
                          ),
                        );
                      },
                    );
                  }
                  else if (snapshot.hasError) {
                    return Center(child: Text('${snapshot.error}'));
                  } else {
                    final countries = snapshot.data!;
                    return ListView.builder(
                      itemCount: countries.length,
                      itemBuilder: (context, index) {
                        final country = countries[index];
                        String name=country.country!;
                        if(searchcontroller.text.isEmpty)
                          {
                            return Card(
                              child: InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailScreen(
                                    name: country.country!,
                                    image: country.countryInfo!.flag!,
                                    totalCases: country.cases!,
                                    totalDeaths: country.deaths!,
                                    totalRecovered: country.recovered!,
                                    active: country.active!,
                                    critical: country.critical!,
                                    todayRecovered: country.todayRecovered!,
                                    test: country.tests!,

                                  )));
                                },
                                child: ListTile(
                                  leading: Image(
                                    height: 30,
                                    width: 50,
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      '${country.countryInfo!.flag}',
                                    ),
                                  ),
                                  title: Text(
                                    '${country.country}',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text('Cases: ${country.cases}'),
                                ),
                              ),
                            );
                          }
                        else if(name.toLowerCase().contains(searchcontroller.text.toLowerCase()))
                          {
                            return InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailScreen(
                                  name: country.country!,
                                  image: country.countryInfo!.flag!,
                                  totalCases: country.cases!,
                                  totalDeaths: country.deaths!,
                                  totalRecovered: country.recovered!,
                                  active: country.active!,
                                  critical: country.critical!,
                                  todayRecovered: country.todayRecovered!,
                                  test: country.tests!,

                                )));
                              },
                              child: Card(
                                child: ListTile(
                                  leading: Image(
                                    height: 30,
                                    width: 50,
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      '${country.countryInfo!.flag}',
                                    ),
                                  ),
                                  title: Text(
                                    '${country.country}',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text('Cases: ${country.cases}'),
                                ),
                              ),
                            );
                          }
                        else
                          {
                               return Container();
                          }
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
