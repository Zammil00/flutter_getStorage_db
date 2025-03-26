import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final box = GetStorage();

  RxInt data = 0.obs;

  void tambah() {
    data++;
    simpanData();
  }

  void kurang() {
    data--;
    simpanData();
  }

  void simpanData() async {
    if (box.read('angka') != null) {
      await box.remove('angka');
    }
    await box.write('angka', data.value);
  }

  void bacaData() async {
    if (box.read('angka') != null) {
      data.value = box.read('angka')! as int;
    }
  }

  void resetData() async {
    if (box.read('angka') != null) {
      await box.remove('angka');
      data.value = 0;
    }
  }

  @override
  void onInit() {
    bacaData();
    super.onInit();
  }
}
