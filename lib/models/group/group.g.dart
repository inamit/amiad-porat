// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.dart';

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
abstract class GroupCollectionReference
    implements GroupQuery, FirestoreCollectionReference<GroupQuerySnapshot> {
  factory GroupCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$GroupCollectionReference;

  static Group fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$GroupFromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Group value,
    SetOptions? options,
  ) {
    return _$GroupToJson(value);
  }

  @override
  GroupDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<GroupDocumentReference> add(Group value);
}

class _$GroupCollectionReference extends _$GroupQuery
    implements GroupCollectionReference {
  factory _$GroupCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$GroupCollectionReference._(
      firestore.collection('groups').withConverter(
            fromFirestore: GroupCollectionReference.fromFirestore,
            toFirestore: GroupCollectionReference.toFirestore,
          ),
    );
  }

  _$GroupCollectionReference._(
    CollectionReference<Group> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<Group> get reference =>
      super.reference as CollectionReference<Group>;

  @override
  GroupDocumentReference doc([String? id]) {
    return GroupDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<GroupDocumentReference> add(Group value) {
    return reference.add(value).then((ref) => GroupDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$GroupCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class GroupDocumentReference
    extends FirestoreDocumentReference<GroupDocumentSnapshot> {
  factory GroupDocumentReference(DocumentReference<Group> reference) =
      _$GroupDocumentReference;

  DocumentReference<Group> get reference;

  /// A reference to the [GroupCollectionReference] containing this document.
  GroupCollectionReference get parent {
    return _$GroupCollectionReference(reference.firestore);
  }

  @override
  Stream<GroupDocumentSnapshot> snapshots();

  @override
  Future<GroupDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String name,
    int dayInWeek,
    String hour,
    String subject,
    String teacher,
  });

  Future<void> set(Group value);
}

class _$GroupDocumentReference
    extends FirestoreDocumentReference<GroupDocumentSnapshot>
    implements GroupDocumentReference {
  _$GroupDocumentReference(this.reference);

  @override
  final DocumentReference<Group> reference;

  /// A reference to the [GroupCollectionReference] containing this document.
  GroupCollectionReference get parent {
    return _$GroupCollectionReference(reference.firestore);
  }

  @override
  Stream<GroupDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return GroupDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<GroupDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return GroupDocumentSnapshot._(
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
    Object? name = _sentinel,
    Object? dayInWeek = _sentinel,
    Object? hour = _sentinel,
    Object? subject = _sentinel,
    Object? teacher = _sentinel,
  }) async {
    final json = {
      if (name != _sentinel) "name": name as String,
      if (dayInWeek != _sentinel) "dayInWeek": dayInWeek as int,
      if (hour != _sentinel) "hour": hour as String,
      if (subject != _sentinel) "subject": subject as String,
      if (teacher != _sentinel) "teacher": teacher as String,
    };

    return reference.update(json);
  }

  Future<void> set(Group value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is GroupDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class GroupDocumentSnapshot extends FirestoreDocumentSnapshot {
  GroupDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<Group> snapshot;

  @override
  GroupDocumentReference get reference {
    return GroupDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Group? data;
}

abstract class GroupQuery implements QueryReference<GroupQuerySnapshot> {
  @override
  GroupQuery limit(int limit);

  @override
  GroupQuery limitToLast(int limit);

  GroupQuery whereName({
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
  GroupQuery whereDayInWeek({
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
  GroupQuery whereHour({
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
  GroupQuery whereSubject({
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
  GroupQuery whereTeacher({
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

  GroupQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    GroupDocumentSnapshot? startAtDocument,
    GroupDocumentSnapshot? endAtDocument,
    GroupDocumentSnapshot? endBeforeDocument,
    GroupDocumentSnapshot? startAfterDocument,
  });

  GroupQuery orderByDayInWeek({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    GroupDocumentSnapshot? startAtDocument,
    GroupDocumentSnapshot? endAtDocument,
    GroupDocumentSnapshot? endBeforeDocument,
    GroupDocumentSnapshot? startAfterDocument,
  });

  GroupQuery orderByHour({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    GroupDocumentSnapshot? startAtDocument,
    GroupDocumentSnapshot? endAtDocument,
    GroupDocumentSnapshot? endBeforeDocument,
    GroupDocumentSnapshot? startAfterDocument,
  });

  GroupQuery orderBySubject({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    GroupDocumentSnapshot? startAtDocument,
    GroupDocumentSnapshot? endAtDocument,
    GroupDocumentSnapshot? endBeforeDocument,
    GroupDocumentSnapshot? startAfterDocument,
  });

  GroupQuery orderByTeacher({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    GroupDocumentSnapshot? startAtDocument,
    GroupDocumentSnapshot? endAtDocument,
    GroupDocumentSnapshot? endBeforeDocument,
    GroupDocumentSnapshot? startAfterDocument,
  });
}

class _$GroupQuery extends QueryReference<GroupQuerySnapshot>
    implements GroupQuery {
  _$GroupQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<Group> reference;

  GroupQuerySnapshot _decodeSnapshot(
    QuerySnapshot<Group> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return GroupQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<GroupDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: GroupDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return GroupQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<GroupQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<GroupQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  GroupQuery limit(int limit) {
    return _$GroupQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  GroupQuery limitToLast(int limit) {
    return _$GroupQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  GroupQuery whereName({
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
    return _$GroupQuery(
      reference.where(
        'name',
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

  GroupQuery whereDayInWeek({
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
    return _$GroupQuery(
      reference.where(
        'dayInWeek',
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

  GroupQuery whereHour({
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
    return _$GroupQuery(
      reference.where(
        'hour',
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

  GroupQuery whereSubject({
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
    return _$GroupQuery(
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

  GroupQuery whereTeacher({
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
    return _$GroupQuery(
      reference.where(
        'teacher',
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

  GroupQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    GroupDocumentSnapshot? startAtDocument,
    GroupDocumentSnapshot? endAtDocument,
    GroupDocumentSnapshot? endBeforeDocument,
    GroupDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('name', descending: descending);

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

    return _$GroupQuery(query, _collection);
  }

  GroupQuery orderByDayInWeek({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    GroupDocumentSnapshot? startAtDocument,
    GroupDocumentSnapshot? endAtDocument,
    GroupDocumentSnapshot? endBeforeDocument,
    GroupDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('dayInWeek', descending: descending);

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

    return _$GroupQuery(query, _collection);
  }

  GroupQuery orderByHour({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    GroupDocumentSnapshot? startAtDocument,
    GroupDocumentSnapshot? endAtDocument,
    GroupDocumentSnapshot? endBeforeDocument,
    GroupDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('hour', descending: descending);

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

    return _$GroupQuery(query, _collection);
  }

  GroupQuery orderBySubject({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    GroupDocumentSnapshot? startAtDocument,
    GroupDocumentSnapshot? endAtDocument,
    GroupDocumentSnapshot? endBeforeDocument,
    GroupDocumentSnapshot? startAfterDocument,
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

    return _$GroupQuery(query, _collection);
  }

  GroupQuery orderByTeacher({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    GroupDocumentSnapshot? startAtDocument,
    GroupDocumentSnapshot? endAtDocument,
    GroupDocumentSnapshot? endBeforeDocument,
    GroupDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('teacher', descending: descending);

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

    return _$GroupQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$GroupQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class GroupQuerySnapshot
    extends FirestoreQuerySnapshot<GroupQueryDocumentSnapshot> {
  GroupQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<Group> snapshot;

  @override
  final List<GroupQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<GroupDocumentSnapshot>> docChanges;
}

class GroupQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements GroupDocumentSnapshot {
  GroupQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<Group> snapshot;

  @override
  GroupDocumentReference get reference {
    return GroupDocumentReference(snapshot.reference);
  }

  @override
  final Group data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Group _$GroupFromJson(Map<String, dynamic> json) => Group(
      name: json['name'] as String,
      dayInWeek: json['dayInWeek'] as int,
      hour: json['hour'] as String,
      subject: json['subject'] as String,
      teacher: json['teacher'] as String,
    );

Map<String, dynamic> _$GroupToJson(Group instance) => <String, dynamic>{
      'name': instance.name,
      'dayInWeek': instance.dayInWeek,
      'hour': instance.hour,
      'subject': instance.subject,
      'teacher': instance.teacher,
    };
