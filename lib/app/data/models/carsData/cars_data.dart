import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt77/app/data/models/car/car.dart';

part 'cars_data.freezed.dart';
part 'cars_data.g.dart';

@freezed
class CarsData with _$CarsData {

  factory CarsData(
    List<Car> cars,
  ) = _CarsData;

  factory CarsData.fromJson(Map<String, dynamic> json) => _$CarsDataFromJson(json);
}