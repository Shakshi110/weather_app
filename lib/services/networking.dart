import 'package:http/http.dart' as http;
import 'dart:convert';


class NetworkHelper{
  NetworkHelper(this.url);
  final String url;

 Future getData()async{
    http.Response response= await http.get(Uri.parse(url));
    //print(response.statusCode); to check error status of the external link thar provided.
    //it should be in 200 range to be error free.
    if(response.statusCode== 200){
      return jsonDecode(response.body);

      // print(response.body); //print the all location conditions.
      //use Json to get a single data from weather/location condition.
      // var longitude= jsonDecode(response.body)['coord']['lon'];
      // print(longitude);
      // var weatherDescription= jsonDecode(response.body)['weather'][0]['description'];
      // print(weatherDescription);
      // var cityName= jsonDecode(response.body)['name'];
      // print('CITY NAME: $cityName');
      // var temperature= jsonDecode(response.body)['main']['temp'];
      // print('TEMPERATURE: $temperature');
      // var weatherId= jsonDecode(response.body)['weather'][0]['id'];
      // print('WEATHER ID:$weatherId');
    }else{
      print(response.statusCode);
    }
  }

}