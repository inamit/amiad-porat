// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

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
abstract class MyUserCollectionReference
    implements MyUserQuery, FirestoreCollectionReference<MyUserQuerySnapshot> {
  factory MyUserCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$MyUserCollectionReference;

  static MyUser fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$MyUserFromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    MyUser value,
    SetOptions? options,
  ) {
    return _$MyUserToJson(value);
  }

  @override
  MyUserDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<MyUserDocumentReference> add(MyUser value);
}

class _$MyUserCollectionReference extends _$MyUserQuery
    implements MyUserCollectionReference {
  factory _$MyUserCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$MyUserCollectionReference._(
      firestore.collection('users').withConverter(
            fromFirestore: MyUserCollectionReference.fromFirestore,
            toFirestore: MyUserCollectionReference.toFirestore,
          ),
    );
  }

  _$MyUserCollectionReference._(
    CollectionReference<MyUser> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<MyUser> get reference =>
      super.reference as CollectionReference<MyUser>;

  @override
  MyUserDocumentReference doc([String? id]) {
    return MyUserDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<MyUserDocumentReference> add(MyUser value) {
    return reference.add(value).then((ref) => MyUserDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$MyUserCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class MyUserDocumentReference
    extends FirestoreDocumentReference<MyUserDocumentSnapshot> {
  factory MyUserDocumentReference(DocumentReference<MyUser> reference) =
      _$MyUserDocumentReference;

  DocumentReference<MyUser> get reference;

  /// A reference to the [MyUserCollectionReference] containing this document.
  MyUserCollectionReference get parent {
    return _$MyUserCollectionReference(reference.firestore);
  }

  @override
  Stream<MyUserDocumentSnapshot> snapshots();

  @override
  Future<MyUserDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String firstName,
    String lastName,
    String phoneNo,
    String birthDate,
    int role,
    String? group,
  });

  Future<void> set(MyUser value);
}

class _$MyUserDocumentReference
    extends FirestoreDocumentReference<MyUserDocumentSnapshot>
    implements MyUserDocumentReference {
  _$MyUserDocumentReference(this.reference);

  @override
  final DocumentReference<MyUser> reference;

  /// A reference to the [MyUserCollectionReference] containing this document.
  MyUserCollectionReference get parent {
    return _$MyUserCollectionReference(reference.firestore);
  }

  @override
  Stream<MyUserDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return MyUserDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<MyUserDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return MyUserDocumentSnapshot._(
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
    Object? firstName = _sentinel,
    Object? lastName = _sentinel,
    Object? phoneNo = _sentinel,
    Object? birthDate = _sentinel,
    Object? role = _sentinel,
    Object? group = _sentinel,
  }) async {
    final json = {
      if (firstName != _sentinel) "firstName": firstName as String,
      if (lastName != _sentinel) "lastName": lastName as String,
      if (phoneNo != _sentinel) "phoneNo": phoneNo as String,
      if (birthDate != _sentinel) "birthDate": birthDate as String,
      if (role != _sentinel) "role": role as int,
      if (group != _sentinel) "group": group as String?,
    };

    return reference.update(json);
  }

  Future<void> set(MyUser value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is MyUserDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class MyUserDocumentSnapshot extends FirestoreDocumentSnapshot {
  MyUserDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<MyUser> snapshot;

  @override
  MyUserDocumentReference get reference {
    return MyUserDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final MyUser? data;
}

abstract class MyUserQuery implements QueryReference<MyUserQuerySnapshot> {
  @override
  MyUserQuery limit(int limit);

  @override
  MyUserQuery limitToLast(int limit);

  MyUserQuery whereFirstName({
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
  MyUserQuery whereLastName({
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
  MyUserQuery wherePhoneNo({
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
  MyUserQuery whereBirthDate({
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
  MyUserQuery whereRole({
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
  MyUserQuery whereGroup({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });

  MyUserQuery orderByFirstName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    MyUserDocumentSnapshot? startAtDocument,
    MyUserDocumentSnapshot? endAtDocument,
    MyUserDocumentSnapshot? endBeforeDocument,
    MyUserDocumentSnapshot? startAfterDocument,
  });

  MyUserQuery orderByLastName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    MyUserDocumentSnapshot? startAtDocument,
    MyUserDocumentSnapshot? endAtDocument,
    MyUserDocumentSnapshot? endBeforeDocument,
    MyUserDocumentSnapshot? startAfterDocument,
  });

  MyUserQuery orderByPhoneNo({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    MyUserDocumentSnapshot? startAtDocument,
    MyUserDocumentSnapshot? endAtDocument,
    MyUserDocumentSnapshot? endBeforeDocument,
    MyUserDocumentSnapshot? startAfterDocument,
  });

  MyUserQuery orderByBirthDate({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    MyUserDocumentSnapshot? startAtDocument,
    MyUserDocumentSnapshot? endAtDocument,
    MyUserDocumentSnapshot? endBeforeDocument,
    MyUserDocumentSnapshot? startAfterDocument,
  });

  MyUserQuery orderByRole({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    MyUserDocumentSnapshot? startAtDocument,
    MyUserDocumentSnapshot? endAtDocument,
    MyUserDocumentSnapshot? endBeforeDocument,
    MyUserDocumentSnapshot? startAfterDocument,
  });

  MyUserQuery orderByGroup({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    MyUserDocumentSnapshot? startAtDocument,
    MyUserDocumentSnapshot? endAtDocument,
    MyUserDocumentSnapshot? endBeforeDocument,
    MyUserDocumentSnapshot? startAfterDocument,
  });
}

class _$MyUserQuery extends QueryReference<MyUserQuerySnapshot>
    implements MyUserQuery {
  _$MyUserQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<MyUser> reference;

  MyUserQuerySnapshot _decodeSnapshot(
    QuerySnapshot<MyUser> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return MyUserQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<MyUserDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: MyUserDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return MyUserQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<MyUserQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<MyUserQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  MyUserQuery limit(int limit) {
    return _$MyUserQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  MyUserQuery limitToLast(int limit) {
    return _$MyUserQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  MyUserQuery whereFirstName({
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
    return _$MyUserQuery(
      reference.where(
        'firstName',
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

  MyUserQuery whereLastName({
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
    return _$MyUserQuery(
      reference.where(
        'lastName',
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

  MyUserQuery wherePhoneNo({
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
    return _$MyUserQuery(
      reference.where(
        'phoneNo',
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

  MyUserQuery whereBirthDate({
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
    return _$MyUserQuery(
      reference.where(
        'birthDate',
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

  MyUserQuery whereRole({
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
    return _$MyUserQuery(
      reference.where(
        'role',
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

  MyUserQuery whereGroup({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$MyUserQuery(
      reference.where(
        'group',
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

  MyUserQuery orderByFirstName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MyUserDocumentSnapshot? startAtDocument,
    MyUserDocumentSnapshot? endAtDocument,
    MyUserDocumentSnapshot? endBeforeDocument,
    MyUserDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('firstName', descending: descending);

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

    return _$MyUserQuery(query, _collection);
  }

  MyUserQuery orderByLastName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MyUserDocumentSnapshot? startAtDocument,
    MyUserDocumentSnapshot? endAtDocument,
    MyUserDocumentSnapshot? endBeforeDocument,
    MyUserDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('lastName', descending: descending);

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

    return _$MyUserQuery(query, _collection);
  }

  MyUserQuery orderByPhoneNo({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MyUserDocumentSnapshot? startAtDocument,
    MyUserDocumentSnapshot? endAtDocument,
    MyUserDocumentSnapshot? endBeforeDocument,
    MyUserDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('phoneNo', descending: descending);

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

    return _$MyUserQuery(query, _collection);
  }

  MyUserQuery orderByBirthDate({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MyUserDocumentSnapshot? startAtDocument,
    MyUserDocumentSnapshot? endAtDocument,
    MyUserDocumentSnapshot? endBeforeDocument,
    MyUserDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('birthDate', descending: descending);

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

    return _$MyUserQuery(query, _collection);
  }

  MyUserQuery orderByRole({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MyUserDocumentSnapshot? startAtDocument,
    MyUserDocumentSnapshot? endAtDocument,
    MyUserDocumentSnapshot? endBeforeDocument,
    MyUserDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('role', descending: descending);

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

    return _$MyUserQuery(query, _collection);
  }

  MyUserQuery orderByGroup({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MyUserDocumentSnapshot? startAtDocument,
    MyUserDocumentSnapshot? endAtDocument,
    MyUserDocumentSnapshot? endBeforeDocument,
    MyUserDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('group', descending: descending);

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

    return _$MyUserQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$MyUserQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class MyUserQuerySnapshot
    extends FirestoreQuerySnapshot<MyUserQueryDocumentSnapshot> {
  MyUserQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<MyUser> snapshot;

  @override
  final List<MyUserQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<MyUserDocumentSnapshot>> docChanges;
}

class MyUserQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements MyUserDocumentSnapshot {
  MyUserQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<MyUser> snapshot;

  @override
  MyUserDocumentReference get reference {
    return MyUserDocumentReference(snapshot.reference);
  }

  @override
  final MyUser data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyUser _$MyUserFromJson(Map<String, dynamic> json) => MyUser(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      phoneNo: json['phoneNo'] as String,
      birthDate: json['birthDate'] as String,
      role: json['role'] as int,
      group: json['group'] as String?,
    );

Map<String, dynamic> _$MyUserToJson(MyUser instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phoneNo': instance.phoneNo,
      'birthDate': instance.birthDate,
      'role': instance.role,
      'group': instance.group,
    };
