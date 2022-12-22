import 'package:psalms_skrifberymings/src/enums/beryming.dart';
import 'package:psalms_skrifberymings/src/enums/sang_tipe.dart';
import 'package:psalms_skrifberymings/models/sang.dart';
import 'package:psalms_skrifberymings/models/vers.dart';

class SkrifBeryming extends Sang {
  SkrifBeryming(int nommer, Beryming beryming, List<Vers> verse)
      : super(SangTipe.skrifBeryming, nommer, beryming, verse);
}
