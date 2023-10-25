import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/car_controller.dart';

class CarView extends GetView<CarController> {
  const CarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(230, 230, 250, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(221, 160, 221, 1),
        title: Text(controller.car.brand, style: const TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
            'цена: ${controller.car.price.toString()}\$',
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: Color.fromRGBO(221, 160, 221, 1)),
          ),
          const SizedBox(height: 16,),
          Text(
            'модель: ${controller.car.model}',
            style: const TextStyle(
                fontSize: 24),
          ),
          Text(
            'Год: ${controller.car.year}',
            style: const TextStyle(
                fontSize: 24),
          ),
          Text(
            'цвет: ${controller.car.color}',
            style: const TextStyle(
              fontSize: 24
            ),
          ),
          ],
        ),
      ),
    );
  }
}
