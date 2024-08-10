import 'package:geolocator/geolocator.dart';

class Location {
 double? longitude;
 double? latitude;


 Future <void> getCurrentLocation() async {
    //we used try catch block to handle exception such as when the location is not accessible or the user denied it.
     try{
       Position position= await Geolocator.getCurrentPosition(
           desiredAccuracy: LocationAccuracy.high);
           longitude= position.longitude;
           latitude= position.latitude;
     }catch(e){
       print(e);
     }
  }
}