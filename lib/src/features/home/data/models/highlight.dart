
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'highlight.freezed.dart';
part 'highlight.g.dart';

@freezed
class Highlight with _$Highlight {

  const factory Highlight({required String label, required String imageUrl}) = _Highlight;

  factory Highlight.fromJson(Map<String, dynamic> json) => _$HighlightFromJson(json);
}

extension HighlightColRefExt on CollectionReference<Map<String, dynamic>> {
  CollectionReference<Highlight> withHighlightConverter() {
    return withConverter(
      fromFirestore: (snapshot, options) {
        final data = snapshot.data()!;
        data['id'] = snapshot.id;
        return Highlight.fromJson(data);
      },
      toFirestore: (value, options) => value.toJson(),
    );
  }
}
