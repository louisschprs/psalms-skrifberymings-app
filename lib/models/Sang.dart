import 'package:psalms_skrifberymings/src/enums/Beryming.dart';
import 'package:psalms_skrifberymings/src/enums/SangTipe.dart';
import 'package:psalms_skrifberymings/models/Vers.dart';

class Sang {
  SangTipe _tipe = SangTipe.GEEN;
  String _naam = "Geen Naam";
  Beryming _beryming = Beryming.GEEN;
  List<Vers> _verse = [];

  Sang(SangTipe tipe, String naam, Beryming beryming, List<Vers> verse) {
    this._tipe = tipe;
    this._naam = naam;
    this._beryming = beryming;
    this._verse = verse;
  }

  String get naam => _naam;
  Beryming get beryming => _beryming;
  List<Vers> get verse => _verse;
  SangTipe get tipe => _tipe;

  factory Sang.fromJson() {
    throw UnimplementedError();
  }

  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}
