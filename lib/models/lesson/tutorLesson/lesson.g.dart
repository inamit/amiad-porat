// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

class _Sentinel {
  const _Sentinel();
}

const _sentinel = _Sentinel();

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class LessonCollectionReference
    implements LessonQuery, FirestoreCollectionReference<LessonQuerySnapshot> {
  factory LessonCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$LessonCollectionReference;

  static Lesson fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$LessonFromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Lesson value,
    SetOptions? options,
  ) {
    return _$LessonToJson(value);
  }

  @override
  LessonDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<LessonDocumentReference> add(Lesson value);
}

class _$LessonCollectionReference extends _$LessonQuery
    implements LessonCollectionReference {
  factory _$LessonCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$LessonCollectionReference._(
      firestore.collection('lessons').withConverter(
            fromFirestore: LessonCollectionReference.fromFirestore,
            toFirestore: LessonCollectionReference.toFirestore,
          ),
    );
  }

  _$LessonCollectionReference._(
    CollectionReference<Lesson> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<Lesson> get reference =>
      super.reference as CollectionReference<Lesson>;

  @override
  LessonDocumentReference doc([String? id]) {
    return LessonDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<LessonDocumentReference> add(Lesson value) {
    return reference.add(value).then((ref) => LessonDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$LessonCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class LessonDocumentReference
    extends FirestoreDocumentReference<LessonDocumentSnapshot> {
  factory LessonDocumentReference(DocumentReference<Lesson> reference) =
      _$LessonDocumentReference;

  DocumentReference<Lesson> get reference;

  /// A reference to the [LessonCollectionReference] containing this document.
  LessonCollectionReference get parent {
    return _$LessonCollectionReference(reference.firestore);
  }

  @override
  Stream<LessonDocumentSnapshot> snapshots();

  @override
  Future<LessonDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    bool isOpen,
    String subject,
    List<Map<String, String>> students,
    int maxStudents,
  });

  Future<void> set(Lesson value);
}

class _$LessonDocumentReference
    extends FirestoreDocumentReference<LessonDocumentSnapshot>
    implements LessonDocumentReference {
  _$LessonDocumentReference(this.reference);

  @override
  final DocumentReference<Lesson> reference;

  /// A reference to the [LessonCollectionReference] containing this document.
  LessonCollectionReference get parent {
    return _$LessonCollectionReference(reference.firestore);
  }

  @override
  Stream<LessonDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return LessonDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<LessonDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return LessonDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<void> delete() {
    return reference.delete();
  }

  Future<void> update({
    Object? isOpen = _sentinel,
    Object? subject = _sentinel,
    Object? students = _sentinel,
    Object? maxStudents = _sentinel,
  }) async {
    final json = {
      if (isOpen != _sentinel) "isOpen": isOpen as bool,
      if (subject != _sentinel) "subject": subject as String,
      if (students != _sentinel)
        "students": students as List<Map<String, String>>,
      if (maxStudents != _sentinel) "maxStudents": maxStudents as int,
    };

    return reference.update(json);
  }

  Future<void> set(Lesson value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is LessonDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class LessonDocumentSnapshot extends FirestoreDocumentSnapshot {
  LessonDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<Lesson> snapshot;

  @override
  LessonDocumentReference get reference {
    return LessonDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Lesson? data;
}

abstract class LessonQuery implements QueryReference<LessonQuerySnapshot> {
  @override
  LessonQuery limit(int limit);

  @override
  LessonQuery limitToLast(int limit);

  LessonQuery whereIsOpen({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
  });
  LessonQuery whereSubject({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  LessonQuery whereStudents({
    List<Map<String, String>>? isEqualTo,
    List<Map<String, String>>? isNotEqualTo,
    List<Map<String, String>>? isLessThan,
    List<Map<String, String>>? isLessThanOrEqualTo,
    List<Map<String, String>>? isGreaterThan,
    List<Map<String, String>>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<Map<String, String>>? arrayContainsAny,
  });
  LessonQuery whereMaxStudents({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  });

  LessonQuery orderByIsOpen({
    bool descending = false,
    bool startAt,
    bool startAfter,
    bool endAt,
    bool endBefore,
    LessonDocumentSnapshot? startAtDocument,
    LessonDocumentSnapshot? endAtDocument,
    LessonDocumentSnapshot? endBeforeDocument,
    LessonDocumentSnapshot? startAfterDocument,
  });

  LessonQuery orderBySubject({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    LessonDocumentSnapshot? startAtDocument,
    LessonDocumentSnapshot? endAtDocument,
    LessonDocumentSnapshot? endBeforeDocument,
    LessonDocumentSnapshot? startAfterDocument,
  });

  LessonQuery orderByStudents({
    bool descending = false,
    List<Map<String, String>> startAt,
    List<Map<String, String>> startAfter,
    List<Map<String, String>> endAt,
    List<Map<String, String>> endBefore,
    LessonDocumentSnapshot? startAtDocument,
    LessonDocumentSnapshot? endAtDocument,
    LessonDocumentSnapshot? endBeforeDocument,
    LessonDocumentSnapshot? startAfterDocument,
  });

  LessonQuery orderByMaxStudents({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    LessonDocumentSnapshot? startAtDocument,
    LessonDocumentSnapshot? endAtDocument,
    LessonDocumentSnapshot? endBeforeDocument,
    LessonDocumentSnapshot? startAfterDocument,
  });
}

class _$LessonQuery extends QueryReference<LessonQuerySnapshot>
    implements LessonQuery {
  _$LessonQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<Lesson> reference;

  LessonQuerySnapshot _decodeSnapshot(
    QuerySnapshot<Lesson> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return LessonQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<LessonDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: LessonDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return LessonQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<LessonQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<LessonQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  LessonQuery limit(int limit) {
    return _$LessonQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  LessonQuery limitToLast(int limit) {
    return _$LessonQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  LessonQuery whereIsOpen({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
  }) {
    return _$LessonQuery(
      reference.where(
        'isOpen',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  LessonQuery whereSubject({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$LessonQuery(
      reference.where(
        'subject',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  LessonQuery whereStudents({
    List<Map<String, String>>? isEqualTo,
    List<Map<String, String>>? isNotEqualTo,
    List<Map<String, String>>? isLessThan,
    List<Map<String, String>>? isLessThanOrEqualTo,
    List<Map<String, String>>? isGreaterThan,
    List<Map<String, String>>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<Map<String, String>>? arrayContainsAny,
  }) {
    return _$LessonQuery(
      reference.where(
        'students',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        arrayContainsAny: arrayContainsAny,
      ),
      _collection,
    );
  }

  LessonQuery whereMaxStudents({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  }) {
    return _$LessonQuery(
      reference.where(
        'maxStudents',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  LessonQuery orderByIsOpen({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    LessonDocumentSnapshot? startAtDocument,
    LessonDocumentSnapshot? endAtDocument,
    LessonDocumentSnapshot? endBeforeDocument,
    LessonDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('isOpen', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$LessonQuery(query, _collection);
  }

  LessonQuery orderBySubject({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    LessonDocumentSnapshot? startAtDocument,
    LessonDocumentSnapshot? endAtDocument,
    LessonDocumentSnapshot? endBeforeDocument,
    LessonDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('subject', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$LessonQuery(query, _collection);
  }

  LessonQuery orderByStudents({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    LessonDocumentSnapshot? startAtDocument,
    LessonDocumentSnapshot? endAtDocument,
    LessonDocumentSnapshot? endBeforeDocument,
    LessonDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('students', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$LessonQuery(query, _collection);
  }

  LessonQuery orderByMaxStudents({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    LessonDocumentSnapshot? startAtDocument,
    LessonDocumentSnapshot? endAtDocument,
    LessonDocumentSnapshot? endBeforeDocument,
    LessonDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('maxStudents', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$LessonQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$LessonQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class LessonQuerySnapshot
    extends FirestoreQuerySnapshot<LessonQueryDocumentSnapshot> {
  LessonQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<Lesson> snapshot;

  @override
  final List<LessonQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<LessonDocumentSnapshot>> docChanges;
}

class LessonQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements LessonDocumentSnapshot {
  LessonQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<Lesson> snapshot;

  @override
  LessonDocumentReference get reference {
    return LessonDocumentReference(snapshot.reference);
  }

  @override
  final Lesson data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lesson _$LessonFromJson(Map<String, dynamic> json) => Lesson(
      date: const TimestampConverter().fromJson(json['date'] as Timestamp),
      isOpen: json['isOpen'] as bool,
      subject: json['subject'] as String,
      students: (json['students'] as List<dynamic>)
          .map((e) => Map<String, String>.from(e as Map))
          .toList(),
      maxStudents: json['maxStudents'] as int,
    );

Map<String, dynamic> _$LessonToJson(Lesson instance) => <String, dynamic>{
      'date': const TimestampConverter().toJson(instance.date),
      'isOpen': instance.isOpen,
      'subject': instance.subject,
      'students': instance.students,
      'maxStudents': instance.maxStudents,
    };
