import 'dart:convert';

import 'package:covid_track/Model/WorldStateModel.dart';
import 'package:covid_track/Services/Utilities/app_url.dart';
import 'package:http/http.dart' as http;

class StateServices{

  Future<WorldStateModel> fetchWorldStatesRecords() async{
   final response = await http.get(Uri.parse(AppUrl.worldCountriesApi));

   if(response.statusCode == 200){
     var data = jsonDecode(response.body);
     return WorldStateModel.fromJson(data);
   }
   else{
     throw Exception("Error");
   }
}

}