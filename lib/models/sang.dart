import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:psalms_skrifberymings/src/enums/beryming.dart';
import 'package:psalms_skrifberymings/src/enums/sang_tipe.dart';
import 'package:psalms_skrifberymings/models/vers.dart';

class Sang {
  SangTipe _tipe = SangTipe.psalm;
  int _nommer = 0;
  Beryming _beryming = Beryming.geen;
  List<Vers> _verse = [];

  Sang(SangTipe tipe, int nommer, Beryming beryming, List<Vers> verse) {
    _tipe = tipe;
    _nommer = nommer;
    _beryming = beryming;
    _verse = verse;
  }

  int get nommer => _nommer;
  Beryming get beryming => _beryming;
  List<Vers> get verse => sortVerseAscending();
  SangTipe get tipe => _tipe;

  factory Sang.fromJson() {
    throw UnimplementedError();
  }

  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }

  List<MultiSelectCard<Vers>> getChoices() {
    List<MultiSelectCard<Vers>> choices = [];
    for (var vers in verse) {
      choices.add(
          MultiSelectCard<Vers>(value: vers, label: vers.nommer.toString()));
    }

    return choices;
  }

  sortVerseAscending() {
    _verse.sort(((a, b) => a.nommer.compareTo(b.nommer)));
    return _verse;
  }
}
