import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/location_page_controller.dart';

class LocationView extends StatelessWidget {
  LocationView({
    super.key,
  });
  final LocationPageController locationPageController =
      Get.find<LocationPageController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => FocusScope.of(context).unfocus()),
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
            child: Column(
              children: [
                Obx(
                  () => locationPageController.citiesLoading.value
                      ? const CircularProgressIndicator(
                          color: Colors.amber,
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            DropdownButtonHideUnderline(
                              child: ButtonTheme(
                                alignedDropdown: true,
                                child: DropdownButton<String>(
                                  value:
                                      locationPageController.selectedCity.value,
                                  iconSize: 30,
                                  icon: (null),
                                  style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                  ),
                                  hint: const Text('Select City'),
                                  onChanged:
                                      locationPageController.cityOnChange,
                                  items: locationPageController.cityList
                                      .map((item) {
                                    return DropdownMenuItem(
                                      value: item.id.toString(),
                                      child: Text(item.name),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: locationPageController.fieldText,
                  onTap: (() => locationPageController.fieldText.clear()),
                  onChanged: (value) =>
                      locationPageController.searchDistrict(value),
                  decoration: const InputDecoration(
                    labelText: 'Select District',
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Flexible(
                  child: Obx(
                    () => ListView.builder(
                        shrinkWrap: true,
                        itemCount:
                            locationPageController.foundDistricts.value.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: (() {
                              locationPageController.fieldText.text =
                                  locationPageController
                                      .foundDistricts.value[index].name;
                            }),
                            child: ListTile(
                              title: Text(
                                locationPageController
                                    .foundDistricts.value[index].name,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




            // const SizedBox(
            //   height: 30,
            // ),
            // Container(
            //   color: Colors.amber,
            //   alignment: Alignment.center,
            //   width: Get.width,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     children: <Widget>[
            //       Obx(() => IgnorePointer(
            //             ignoring: homePageController.ignoreDistrict.value,
            //             child: DropdownButtonHideUnderline(
            //               child: ButtonTheme(
            //                 alignedDropdown: true,
            //                 child: DropdownButton<String>(
            //                     value:
            //                         homePageController.selectedDistrict.value,
            //                     iconSize: 30,
            //                     icon: (null),
            //                     style: const TextStyle(
            //                       color: Colors.black54,
            //                       fontSize: 16,
            //                     ),
            //                     hint: const Text('Select District'),
            //                     onChanged: homePageController.districtOnChange,
            //                     items:
            //                         homePageController.districtList.map((item) {
            //                       return DropdownMenuItem(
            //                         value: item.id.toString(),
            //                         child: Text(item.name),
            //                       );
            //                     }).toList()),
            //               ),
            //             ),
            //           )),
            //     ],
            //   ),
            // ),