import 'package:psalms_skrifberymings/src/enums/Beryming.dart';
import 'package:psalms_skrifberymings/src/enums/SangTipe.dart';
import 'package:psalms_skrifberymings/models/Sang.dart';
import 'package:psalms_skrifberymings/models/Vers.dart';

class Psalm extends Sang {
  Psalm(String naam, Beryming beryming, List<Vers> verse)
      : super(SangTipe.PSALM, naam, beryming, verse);
}
