import 'package:provider_textfield_tests/core/model/profile.dart';

var mockPiedPipers = {
  "cuid": "ck2g2765h0000q64g4y8tfk0a",
  "name": "Test user 123",
  "location": {"lat": 40.34, "long": 0.5},
  "contact": {"type": "email", "data": "test_user@gmail.com"},
  "instruments": ["bateria", "zambomba", "pandereta"],
  "friendlyLocation": "Vienna",
  "videos": [
    "https://www.youtube.com/watch?v=41DH065Lfeo&list=RD41DH065Lfeo&start_radio=1"
  ],
  "description": "Lorem ipsum dolor ...",
  "photo":
      "/Users/albertogarcia-munoz/Documents/Repositories/ProyectoFinal/PiedPipers/public/img/ck2g2765h0000q64g4y8tfk0a.png"
};

var profile = Profile.fromJson(mockPiedPipers);

class Api {

  Future<Profile> getProfile() async {
    //await Future.delayed(const Duration(seconds: 4), (){});
    return profile;
  }

}
