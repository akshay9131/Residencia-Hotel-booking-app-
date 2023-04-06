import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/model/hotel_model.dart';
import 'package:travelapp/service/hotel_api.dart';

class HotelController extends GetxController {
  RxList<HotelModel> AllHotelsData = <HotelModel>[].obs;
  RxList<HotelModel> CityHotelData = <HotelModel>[].obs;
  RxList<HotelModel> SingleHotelData = <HotelModel>[].obs;
  RxList<HotelModel> SearchResults = <HotelModel>[].obs;
  final SearchController = TextEditingController();

  final HotelService hotelService = HotelService();

  final isLoading = false.obs;

  RxInt maxLengthOfData = 0.obs;
  RxBool hasMoreData = true.obs;
  RxInt Page = 1.obs;

  Future<void> setTotalLength() async {
    int? length = await hotelService.totalLengthOfData();
    if (length != null) {
      maxLengthOfData.value = length;
    } else {
      maxLengthOfData.value = 0;
    }
  }

  Future<void> controlAllHotels() async {
    isLoading(true);
    List<HotelModel>? hotelList = await hotelService.getHotels(Page);
    if (hotelList != null) {
      AllHotelsData.addAll(hotelList);
    } else {
      AllHotelsData.value = [];
    }
  }

  Future<void> getCityHotel(String city) async {
    isLoading(true);
    List<HotelModel>? data = await hotelService.getCityHotels(city);
    if (data != null) {
      CityHotelData.value = data;
    isLoading(false);
    } else {
      CityHotelData.value = [];
    }
  }

  Future<void> getSingleHotel(String id) async {
    try {
      List<HotelModel> data =
          AllHotelsData.where((element) => element.id.toString() == id)
              .toList();
      if (data.isEmpty) {
        List<HotelModel> citydata =
            CityHotelData.where((element) => element.id.toString() == id)
                .toList();
        SingleHotelData.value = citydata;
        print("tabcity >>>>> $citydata");
      } else {
        print("citydata >>>>>>> $data");
        SingleHotelData.value = data;
      }
    } catch (e) {
      print("error >>> $e");
    }
  }

  Future<void> searchHotel() async {
    List<HotelModel>? result = await hotelService.searchHotels(
        maxLengthOfData, SearchController.text.trim());
    if (result != null) {
      SearchResults.value = result;
    }
  }
}
