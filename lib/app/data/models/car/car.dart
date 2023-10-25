import 'package:freezed_annotation/freezed_annotation.dart';

part 'car.freezed.dart';
part 'car.g.dart';

class PriceConverter implements JsonConverter<double, String> {
  const PriceConverter();

  @override
  String toJson(var str) {
    return str.toString();
  }

  @override
  double fromJson(var str) {
    return double.parse(str.substring(1));
  }
}

@freezed
class Car with _$Car {

  factory Car(
    int id,
    @JsonKey(name: 'car') String brand,
    @JsonKey(name: 'car_model') String model,
    @JsonKey(name: 'car_color') String color,
    @JsonKey(name: 'car_model_year') int year,
    @PriceConverter() double price,
    bool availability,
  ) = _Car;

  factory Car.fromJson(Map<String, dynamic> json) => _$CarFromJson(json);
}