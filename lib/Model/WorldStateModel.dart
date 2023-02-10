class WorldStateModel {
  int? updated;
  int? cases;
  int? todayCases;
  int? deaths;
  int? todayDeaths;
  int? recovered;
  int? todayRecovered;
  int? active;
  int? critical;
  int? casesPerOneMillion;
  double? deathsPerOneMillion;
  int? tests;
  double? testsPerOneMillion;
  int? population;
  int? oneCasePerPeople;
  int? oneDeathPerPeople;
  int? oneTestPerPeople;
  double? activePerOneMillion;
  double? recoveredPerOneMillion;
  double? criticalPerOneMillion;
  int? affectedCountries;

  WorldStateModel(
      {this.updated,
        this.cases,
        this.todayCases,
        this.deaths,
        this.todayDeaths,
        this.recovered,
        this.todayRecovered,
        this.active,
        this.critical,
        this.casesPerOneMillion,
        this.deathsPerOneMillion,
        this.tests,
        this.testsPerOneMillion,
        this.population,
        this.oneCasePerPeople,
        this.oneDeathPerPeople,
        this.oneTestPerPeople,
        this.activePerOneMillion,
        this.recoveredPerOneMillion,
        this.criticalPerOneMillion,
        this.affectedCountries});

  WorldStateModel.fromJson(Map<String, dynamic> json) {
    if (json["updated"] is int) {
      updated = json["updated"];
    }
    if (json["cases"] is int) {
      cases = json["cases"];
    }
    if (json["todayCases"] is int) {
      todayCases = json["todayCases"];
    }
    if (json["deaths"] is int) {
      deaths = json["deaths"];
    }
    if (json["todayDeaths"] is int) {
      todayDeaths = json["todayDeaths"];
    }
    if (json["recovered"] is int) {
      recovered = json["recovered"];
    }
    if (json["todayRecovered"] is int) {
      todayRecovered = json["todayRecovered"];
    }
    if (json["active"] is int) {
      active = json["active"];
    }
    if (json["critical"] is int) {
      critical = json["critical"];
    }
    if (json["casesPerOneMillion"] is int) {
      casesPerOneMillion = json["casesPerOneMillion"];
    }
    if (json["deathsPerOneMillion"] is double) {
      deathsPerOneMillion = json["deathsPerOneMillion"];
    }
    if (json["tests"] is int) {
      tests = json["tests"];
    }
    if (json["testsPerOneMillion"] is double) {
      testsPerOneMillion = json["testsPerOneMillion"];
    }
    if (json["population"] is int) {
      population = json["population"];
    }
    if (json["oneCasePerPeople"] is int) {
      oneCasePerPeople = json["oneCasePerPeople"];
    }
    if (json["oneDeathPerPeople"] is int) {
      oneDeathPerPeople = json["oneDeathPerPeople"];
    }
    if (json["oneTestPerPeople"] is int) {
      oneTestPerPeople = json["oneTestPerPeople"];
    }
    if (json["activePerOneMillion"] is double) {
      activePerOneMillion = json["activePerOneMillion"];
    }
    if (json["recoveredPerOneMillion"] is double) {
      recoveredPerOneMillion = json["recoveredPerOneMillion"];
    }
    if (json["criticalPerOneMillion"] is double) {
      criticalPerOneMillion = json["criticalPerOneMillion"];
    }
    if (json["affectedCountries"] is int) {
      affectedCountries = json["affectedCountries"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["updated"] = updated;
    data["cases"] = cases;
    data["todayCases"] = todayCases;
    data["deaths"] = deaths;
    data["todayDeaths"] = todayDeaths;
    data["recovered"] = recovered;
    data["todayRecovered"] = todayRecovered;
    data["active"] = active;
    data["critical"] = critical;
    data["casesPerOneMillion"] = casesPerOneMillion;
    data["deathsPerOneMillion"] = deathsPerOneMillion;
    data["tests"] = tests;
    data["testsPerOneMillion"] = testsPerOneMillion;
    data["population"] = population;
    data["oneCasePerPeople"] = oneCasePerPeople;
    data["oneDeathPerPeople"] = oneDeathPerPeople;
    data["oneTestPerPeople"] = oneTestPerPeople;
    data["activePerOneMillion"] = activePerOneMillion;
    data["recoveredPerOneMillion"] = recoveredPerOneMillion;
    data["criticalPerOneMillion"] = criticalPerOneMillion;
    data["affectedCountries"] = affectedCountries;
    return data;
  }
}