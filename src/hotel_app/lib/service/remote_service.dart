import 'package:hotel_app/model/hotel_list.dart';
import 'package:hotel_app/model/user_list.dart';
import 'package:http/http.dart' as http;

class RemotesService {
  Future<List<HotelList>?> getRoomList() async {
    var client = http.Client();
    var uri = Uri.parse('http://localhost:8000/hotels_info');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return hotelListFromJson(json);
    }
  }

  Future<List<UserProfile>?> getUserProfile() async {
    var client = http.Client();
    var uri = Uri.parse(
        'https://raw.githubusercontent.com/trunghieumickey/fitus-hotel-manage/main/.github/testcases/UsersList.json');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return userProfileFromJson(json);
    }
  }
// class RemotesService {
//   Future<List<RoomList>?> getRoomList() async {
//     var client = http.Client();
//     var uri = Uri.parse(
//         'https://raw.githubusercontent.com/trunghieumickey/fitus-hotel-manage/main/.github/testcases/RoomsList.json');
//     var response = await client.get(uri);
//     if (response.statusCode == 200) {
//       var json = response.body;
//       return roomListFromJson(json);
}
