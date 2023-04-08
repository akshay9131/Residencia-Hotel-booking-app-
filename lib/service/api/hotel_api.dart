import 'package:dio/dio.dart';
import 'package:travelapp/src/model/hotel_model.dart';

class HotelService {
  final Dio _dio = Dio();

  Future<int?> totalLengthOfData() async {
    try {
      Response response = await _dio.get(
        "https://lokesh-hotels-api.onrender.com/api/v1/allPopularHotels",
      );

      if (response.statusCode == 200) {
        int data = response.data;
        return data;
      } else {
        print("in else of totalLengthOfData");
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future<List<HotelModel>?> getHotels(page) async {
    try {
      print("page is => $page");
      Response response = await _dio.get(
        "https://lokesh-hotels-api.onrender.com/api/v1/popularHotels?page=$page",
      );
      if (response.statusCode == 200) {
        List data = response.data;
        print("data ${data}");
        return data.map((e) => HotelModel.fromJson(e)).toList();
      } else if (response.statusCode == 401 || response.statusCode == 400) {
        print("${response.statusCode} ${response.statusMessage}");
      } else {
        print("${response.statusCode} ${response.statusMessage}");
      }
    } catch (error) {
      print(error);
    }
    return null;
  }

  Future<List<HotelModel>?> getCityHotels(String city) async {
    try {
      Response response = await _dio.get(
        "https://lokesh-hotels-api.onrender.com/api/v1/hotelByCity?city=$city",
      );
      if (response.statusCode == 200) {
        List data = response.data;
        print("data ${data}");
        return data.map((e) => HotelModel.fromJson(e)).toList();
      } else if (response.statusCode == 401 || response.statusCode == 400) {
        print("${response.statusCode} ${response.statusMessage}");
      } else {
        print("${response.statusCode} ${response.statusMessage}");
      }
    } catch (error) {
      print(error);
    }
  }

  Future<List<HotelModel>?> searchHotels(totalLength, keyword) async {
    try {
      Response response = await _dio.get(
        "https://lokesh-hotels-api.onrender.com/api/v1/popularHotels?page=1&limit=$totalLength",
      );
      if (response.statusCode == 200) {
        List data = response.data;
        List requiredData = data
            .where((e) => e['name']
                .toString()
                .toLowerCase()
                .contains(keyword.toString().toLowerCase()))
            .toList();
        print("requiredData ${requiredData}");
        return requiredData.map((e) => HotelModel.fromJson(e)).toList();
      } else if (response.statusCode == 401 || response.statusCode == 400) {
        print("${response.statusCode} ${response.statusMessage}");
      } else {
        print("${response.statusCode} ${response.statusMessage}");
      }
    } catch (error) {
      print(error);
    }
    return null;
  }
}
