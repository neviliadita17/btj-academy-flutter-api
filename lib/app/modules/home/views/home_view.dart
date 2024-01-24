import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<HomeController>();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Data Mahasiswa'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.indigoAccent,
          foregroundColor: Colors.white,
          onPressed: (){

            Get.dialog(
              Dialog(
                backgroundColor: Colors.transparent,
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Text("Tambah Data Mahasiswa",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          expands: false,
                          controller: controller.nameController,
                          style: TextStyle(fontSize: 10),
                          decoration: InputDecoration(
                              labelText: 'Nama',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)
                              )
                          ),
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          expands: false,
                          controller: controller.nimController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              labelText: 'NIM',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)
                              )
                          ),
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          expands: false,
                          controller: controller.prodiController,
                          style: TextStyle(fontSize: 10),
                          decoration: InputDecoration(
                              labelText: 'Prodi',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)
                              )
                          ),
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          expands: false,
                          controller: controller.angkatanController,
                          style: TextStyle(fontSize: 10),
                          decoration: InputDecoration(
                              labelText: 'Angkatan',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)
                              )
                          ),
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          expands: false,
                          controller: controller.ipkController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              labelText: 'IPK',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)
                              )
                          ),
                        ),

                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                            ElevatedButton(
                              onPressed: () {
                                controller.resetData();
                                Get.back();
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade400),
                                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                              ),
                              child: Text('Cancel'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                controller.addData();
                                Get.back();
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.indigoAccent),
                                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                              ),
                              child: Text('Tambah'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          child: Icon(Icons.add),
        ),

        body: Obx(() => Container(
        margin: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: controller.data.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: (){
                Get.toNamed('/detail', arguments:{
                  'index': index,
                  'nama' : controller.data[index].nama??'-',
                  'prodi' : controller.data[index].prodi??'-',
                  'angkatan' : controller.data[index].angkatan??'-',
                  'nim' : controller.data[index].nim??'-',
                  'ipk' : controller.data[index].ipk??'-',
                });
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 8),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blueAccent.withOpacity(.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text(controller.data[index].nama ?? "-"),
                  subtitle: Row(
                    children: [
                      Text(controller.data[index].prodi ?? "-"),
                      Text(' - '),
                      Text(controller.data[index].angkatan ?? "-"),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      )),
    );
  }
}

