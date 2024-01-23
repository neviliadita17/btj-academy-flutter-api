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
          backgroundColor: Colors.deepPurple,
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
                          child: Text("Add Mahasiswa", style: TextStyle(fontSize: 14),),
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          expands: false,
                          controller: controller.nameController,
                          style: TextStyle(fontSize: 10),
                          decoration: InputDecoration(
                              labelText: 'Name',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)
                              )
                          ),
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          expands: false,
                          controller: controller.nimController,
                          style: TextStyle(fontSize: 10),
                          decoration: InputDecoration(
                              labelText: 'Nim',
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
                          style: TextStyle(fontSize: 10),
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
                                Get.back();
                              },
                              child: Text('Cancel'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                controller.addData();
                                Get.back(); // Tutup dialog
                              },
                              child: Text('Add'),
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
            return GestureDetector(
              onTap: () {
                // Navigate to DetailView when a list item is clicked
                Get.toNamed('/detail/${controller.data[index].nama}');
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 8),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent.withOpacity(.1),
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

