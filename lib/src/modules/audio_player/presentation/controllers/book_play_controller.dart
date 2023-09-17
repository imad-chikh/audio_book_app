import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

import '../../../details/domain/entities/book_detail.dart';

class BookPlayerController extends GetxController {




  late BookDetail bookDetails;
  final player = AudioPlayer();
  final bookAudio =
      "https://firebasestorage.googleapis.com/v0/b/masamie-663c4.appspot.com/o/invisible_man_01-02_wells_64kb.mp3?alt=media&token=2f2d1c9b-0001-4dc2-b0e3-31298eb40303";
  playBook() async {
    await player.play(UrlSource(bookAudio));
    final durasion = await player.getDuration();
    print(" ======== $durasion");
  }

  pauseBook() async {
    await player.pause();
    // await player.dispose();
  }

//get audio info

  late Duration? duration;
  @override
  void onInit() async {
    await player.play(UrlSource(bookAudio));
    duration = await player.getDuration();
    print("duration $duration");
    bookDetails = Get.arguments;
    super.onInit();
  }
}
