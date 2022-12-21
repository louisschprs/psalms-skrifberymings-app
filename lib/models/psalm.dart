import 'dart:math';

import 'package:psalms_skrifberymings/src/enums/beryming.dart';
import 'package:psalms_skrifberymings/src/enums/sang_tipe.dart';
import 'package:psalms_skrifberymings/models/sang.dart';
import 'package:psalms_skrifberymings/models/vers.dart';

class Psalm extends Sang {
  Psalm(String naam, Beryming beryming, List<Vers> verse)
      : super(SangTipe.psalm, naam, beryming, verse);

  factory Psalm.mock({int nommer = 0, int totalVerse = 0}) {
    nommer = (nommer == 0) ? Random().nextInt(150) : nommer;
    List<Vers> versLys = [];
    totalVerse = (totalVerse == 0) ? Random().nextInt(10) + 2 : totalVerse;

    for (int i = 1; i <= totalVerse; i++) {
      versLys.add(
        Vers.mock(nommer: i),
      );
    }
    return Psalm("$nommer", Beryming.totius, versLys);
  }
}
