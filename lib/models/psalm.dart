import 'dart:math';

import 'package:psalms_skrifberymings/src/enums/beryming.dart';
import 'package:psalms_skrifberymings/src/enums/sang_tipe.dart';
import 'package:psalms_skrifberymings/models/sang.dart';
import 'package:psalms_skrifberymings/models/vers.dart';

class Psalm extends Sang {
  Psalm(String naam, Beryming beryming, List<Vers> verse)
      : super(SangTipe.psalm, naam, beryming, verse);

  factory Psalm.mock({int nommer = 0}) {
    nommer = (nommer == 0) ? Random().nextInt(150) : nommer;

    return Psalm("Psalm $nommer", Beryming.totius, [
      Vers.mock(nommer: 1),
      Vers.mock(nommer: 2),
      Vers.mock(nommer: 3),
      Vers.mock(nommer: 4),
    ]);
  }
}
