import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(230, 230, 250, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(221, 160, 221, 1),
        title: const Text(
          'Каталог автомобилей',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 16,
              ),
              Obx(() => Text("Status: ${controller.status.value.name}")),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                        Color.fromRGBO(221, 160, 221, 1)),
                    shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                  ),
                  onPressed: () => controller.getNetworkData(),
                  child: const Text(
                    'Обновить данные',
                    style: TextStyle(color: Colors.black),
                  )),
              const SizedBox(
                height: 8,
              ),
              Obx(() => ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.carList.length,
                    itemBuilder: (context, index) {
                      var necCar = controller.carList[index];
                      return GestureDetector(
                        onTap: () => Get.toNamed('car', arguments: necCar),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          elevation: 1,
                          child: ListTile(
                            leading: Text(
                              necCar.id.toString(),
                              style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w600),
                            ),
                            title: Text(
                              "${necCar.brand}, ${necCar.model}",
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            subtitle:
                                Text("цена: ${necCar.price.toString()}\$"),
                            trailing: Column(
                              children: [
                                if (necCar.availability)
                                  const Icon(Icons.check_circle_outline,
                                      size: 32, color: Colors.green)
                                else
                                  const Icon(Icons.do_not_disturb_alt,
                                      size: 32, color: Colors.red)
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  )),
              // Obx(() => Text(
              //       controller.carList.length.toString(),
              //       style: const TextStyle(fontSize: 20),
              //     )),
            ],
          ),
        ),
      ),
    );
  }
}
