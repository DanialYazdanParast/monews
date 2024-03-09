
class KhabarGozari {
  KhabarGozari({
    required this.image,
    required this.titel,
  });

  final String image, titel;
}

List<KhabarGozari> khabarGozaris = [
  KhabarGozari(image: 'images/zo.png', titel: 'زومیت'),
  KhabarGozari(image: 'images/dg.png', titel: 'دیجیاتو'),
  KhabarGozari(image: 'images/va.png', titel: 'ورزش سه'),
];