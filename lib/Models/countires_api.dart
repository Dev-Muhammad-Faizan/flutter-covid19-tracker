import 'dart:convert';

List<CountryData> countryDataFromJson(String str) {
    final data = json.decode(str) as List<dynamic>;
    return data.map((e) => CountryData.fromJson(e)).toList();
}

String countryDataToJson(List<CountryData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountryData {
    final String? continent;
    final String? country;
    final int? cases;
    final int? todayCases;
    final int? deaths;
    final int? todayDeaths;
    final int? recovered;
    final int? todayRecovered;
    final int? active;
    final int? critical;
    final int? population;
    final int? tests;
    final double? casesPerOneMillion;
    final double? deathsPerOneMillion;
    final double? testsPerOneMillion;
    final double? activePerOneMillion;
    final double? recoveredPerOneMillion;
    final double? criticalPerOneMillion;
    final int? oneCasePerPeople;
    final int? oneDeathPerPeople;
    final int? oneTestPerPeople;
    final int? updated;
    final CountryInfo? countryInfo;

    CountryData({
        this.continent,
        this.country,
        this.cases,
        this.todayCases,
        this.deaths,
        this.todayDeaths,
        this.recovered,
        this.todayRecovered,
        this.active,
        this.critical,
        this.population,
        this.tests,
        this.casesPerOneMillion,
        this.deathsPerOneMillion,
        this.testsPerOneMillion,
        this.activePerOneMillion,
        this.recoveredPerOneMillion,
        this.criticalPerOneMillion,
        this.oneCasePerPeople,
        this.oneDeathPerPeople,
        this.oneTestPerPeople,
        this.updated,
        this.countryInfo,
    });

    factory CountryData.fromJson(Map<String, dynamic> json) => CountryData(
        continent: json["continent"],
        country: json["country"],
        cases: json["cases"],
        todayCases: json["todayCases"],
        deaths: json["deaths"],
        todayDeaths: json["todayDeaths"],
        recovered: json["recovered"],
        todayRecovered: json["todayRecovered"],
        active: json["active"],
        critical: json["critical"],
        population: json["population"],
        tests: json["tests"],
        casesPerOneMillion: (json["casesPerOneMillion"] as num?)?.toDouble(),
        deathsPerOneMillion: (json["deathsPerOneMillion"] as num?)?.toDouble(),
        testsPerOneMillion: (json["testsPerOneMillion"] as num?)?.toDouble(),
        activePerOneMillion: (json["activePerOneMillion"] as num?)?.toDouble(),
        recoveredPerOneMillion: (json["recoveredPerOneMillion"] as num?)?.toDouble(),
        criticalPerOneMillion: (json["criticalPerOneMillion"] as num?)?.toDouble(),
        oneCasePerPeople: json["oneCasePerPeople"],
        oneDeathPerPeople: json["oneDeathPerPeople"],
        oneTestPerPeople: json["oneTestPerPeople"],
        updated: json["updated"],
        countryInfo: json["countryInfo"] != null
            ? CountryInfo.fromJson(json["countryInfo"])
            : null,
    );

    Map<String, dynamic> toJson() => {
        "continent": continent,
        "country": country,
        "cases": cases,
        "todayCases": todayCases,
        "deaths": deaths,
        "todayDeaths": todayDeaths,
        "recovered": recovered,
        "todayRecovered": todayRecovered,
        "active": active,
        "critical": critical,
        "population": population,
        "tests": tests,
        "casesPerOneMillion": casesPerOneMillion,
        "deathsPerOneMillion": deathsPerOneMillion,
        "testsPerOneMillion": testsPerOneMillion,
        "activePerOneMillion": activePerOneMillion,
        "recoveredPerOneMillion": recoveredPerOneMillion,
        "criticalPerOneMillion": criticalPerOneMillion,
        "oneCasePerPeople": oneCasePerPeople,
        "oneDeathPerPeople": oneDeathPerPeople,
        "oneTestPerPeople": oneTestPerPeople,
        "updated": updated,
        "countryInfo": countryInfo?.toJson(),
    };
}

class CountryInfo {
    final int? id;
    final String? iso2;
    final String? iso3;
    final double? lat;
    final double? long;
    final String? flag;

    CountryInfo({
        this.id,
        this.iso2,
        this.iso3,
        this.lat,
        this.long,
        this.flag,
    });

    factory CountryInfo.fromJson(Map<String, dynamic> json) => CountryInfo(
        id: json["_id"],
        iso2: json["iso2"],
        iso3: json["iso3"],
        lat: (json["lat"] as num?)?.toDouble(),
        long: (json["long"] as num?)?.toDouble(),
        flag: json["flag"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "iso2": iso2,
        "iso3": iso3,
        "lat": lat,
        "long": long,
        "flag": flag,
    };
}