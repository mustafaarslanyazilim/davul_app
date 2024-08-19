import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(DrumMachine());
}

class DrumMachine extends StatelessWidget {
  /// DEĞİŞKENLER BURADA TANIMLANIR.
  final player = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //ana gövde
        backgroundColor: Colors.black,
        body: DrumPage(),
      ),
    );
  }
}

class DrumPage extends StatelessWidget {
  final player = AudioPlayer();

//fonk tanımlamak bize şöyşe bir fayda sağlıyor.
//8 farklı yerde tek tek değiştirmek yerine tek yerde bir değişiklik yapıyoruz.
/*
  onPressed: () {
   önceki hali böyleydi. Fonk tanımladım.

    onPressed: () async {
    await player.play(AssetSource('clap2.wav'));
    sesiCal('clap2');
                },

*/
  void sesiCal(String ses) async {
    await player.play(AssetSource('$ses.wav'));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        //kenarlardan boşluk verme (8.0)
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    //ekrana yayması için kullanılır.bu olmadığı zaman
                    //gözükmedi
                    child: buildDrumPad(
                      'ridebel',
                      const Color.fromARGB(255, 255, 140, 8),
                    ),
                  ),
                  Expanded(
                    child: buildDrumPad('bongo', Colors.yellowAccent),
                  ),
                ],
              ),
            ),
            //expanded lar arasına sizedbox atarak kolonlar arasında boşluk verdim.
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    //ekrana yayması için kullanılır.bu olmadığı zaman
                    //gözükmedi
                    child: buildDrumPad(
                      'clap1',
                      Color.fromARGB(255, 255, 13, 0),
                    ),
                  ),
                  Expanded(
                    child: buildDrumPad('ridebel', Colors.redAccent),
                  ),
                ],
              ),
            ),
            //expanded lar arasına sizedbox atarak kolonlar arasında boşluk verdim.
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    //ekrana yayması için kullanılır.bu olmadığı zaman
                    //gözükmedi
                    child: buildDrumPad(
                      'clap3',
                      Color.fromARGB(255, 111, 0, 255),
                    ),
                  ),
                  Expanded(
                    child: buildDrumPad(
                      'crash',
                      Color.fromARGB(255, 255, 0, 179),
                    ),
                  ),
                ],
              ),
            ),
            //expanded lar arasına sizedbox atarak kolonlar arasında boşluk verdim.
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    //ekrana yayması için kullanılır.bu olmadığı zaman
                    //gözükmedi
                    child: buildDrumPad(
                      'clap2',
                      Color.fromARGB(255, 94, 255, 0),
                    ),
                  ),
                  Expanded(
                    child: buildDrumPad(
                      'ridebel',
                      Color.fromARGB(186, 5, 255, 234),
                    ),
                  ),
                ],
              ),
            ),
            //expanded lar arasına sizedbox atarak kolonlar arasında boşluk verdim.
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    //ekrana yayması için kullanılır.bu olmadığı zaman
                    //gözükmedi
                    child: buildDrumPad(
                      'clap3',
                      Color.fromARGB(255, 38, 57, 201),
                    ),
                  ),
                  Expanded(
                    child: buildDrumPad(
                      'crash',
                      Color.fromARGB(255, 200, 255, 1),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

//YUKARIDA BULUNAN TEXTBUTTON KISMINA METHOD ATAMASI YAPTIKTAN SONRA
//BURADA FONK OLUŞTURDU.
//bununla birlikte hem ses hem de renk kısmını tutacağız.
  TextButton buildDrumPad(String ses, Color renk) {
    return TextButton(
      onPressed: () {
        //önceki hali böyleydi. Fonk tanımladım.

        //onPressed: () async {
        //await player.play(AssetSource('clap2.wav'));
        sesiCal(ses);
      },
      //textButton da
      //padding leri sıfırlamak için
      //bu şekilde de olabilir. Altta ki gibi de olur.
      //  ---1.kullanım----
      //style: TextButton.styleFrom(
      //padding: EdgeInsets.zero,
      //----2. kullanım -----
      //padding: const EdgeInsets.all(8.0),
      style: TextButton.styleFrom(
        padding: EdgeInsets.all(8),
      ),
      child: Container(
        color: renk,
      ),
    );
  }
}
