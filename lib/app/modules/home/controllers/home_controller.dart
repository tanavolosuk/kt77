import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:kt77/app/data/models/car/car.dart';
import 'package:kt77/app/data/models/carsData/cars_data.dart';

enum StatusData {
  init,
  loading,
  success,
  error,
}
class HomeController extends GetxController {
  
  Dio client = Dio();
  String url = 'https://myfakeapi.com/api/cars';

  var carList = <Car>[].obs;
  var status = StatusData.init.obs;


  @override
  void onInit() {
    getNetworkData();
    super.onInit();
  }

  void getNetworkData() async { 
    status.value = StatusData.loading;
    var response = await client.get(url);
    if(response.statusCode != 200) {
      status.value = StatusData.error;
      return;
    }
    status.value = StatusData.success;
    var responseData = CarsData.fromJson(response.data);
    carList.value = responseData.cars;
  }

}