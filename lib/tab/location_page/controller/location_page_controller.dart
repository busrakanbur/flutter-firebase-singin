import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/city_model.dart';
import '../model/district_model.dart';
import '../service/location_page_service.dart';

class LocationPageController extends GetxController {
  RxBool citiesLoading = true.obs;
  RxBool ignoreDistrict = true.obs;
  RxList<DistrictModel> districtList = <DistrictModel>[].obs;
  RxList<CityModel> cityList = <CityModel>[].obs;
  Rx<String?> selectedCity = Rx<String?>(null);
  Rx<String?> selectedDistrict = Rx<String?>(null);
  Rx<List<DistrictModel>> foundDistricts = Rx<List<DistrictModel>>([]);
  Rx<String?> text = Rx<String?>(null);
  final fieldText = TextEditingController();

  @override
  void onInit() {
    fetchCities();
    super.onInit();
  }

  void fetchDistricts(int cityId) async {
    try {
      ignoreDistrict(true);
      districtList.value = await DistrictService.fetchDistricts(cityId);
    } finally {
      ignoreDistrict(false);
    }
  }

  void fetchCities() async {
    try {
      citiesLoading(true);
      cityList.value = await CityService.fetchCities();
    } finally {
      citiesLoading(false);
    }
  }

  cityOnChange(String? val) {
    selectedCity.value = val;
    selectedDistrict.value = null;
    fetchDistricts(
      cityList
          .where((element) => element.id.toString() == selectedCity.value)
          .first
          .id,
    );

    searchDistrict("");
    fieldText.clear();
  }

  districtOnChange(String? val) {
    selectedDistrict.value = val;
  }

  searchDistrict(String districtName) {
    List<DistrictModel> results = [];
    if (districtName.isEmpty) {
      results = districtList;
    } else {
      results = districtList
          .where((element) => element.name
              .toString()
              .toLowerCase()
              .contains(districtName.toLowerCase()))
          .toList();
    }
    foundDistricts.value = results;
  }
}
