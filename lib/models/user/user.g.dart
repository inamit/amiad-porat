// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, require_trailing_commas, prefer_single_quotes, prefer_double_quotes, use_super_parameters

class _Sentinel {
  const _Sentinel();
}

const _sentinel = _Sentinel();

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class MyUserCollectionReference
    implements
        MyUserQuery,
        FirestoreCollectionReference<MyUser, MyUserQuerySnapshot> {
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
  CollectionReference<MyUser> get reference;

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
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<MyUser> get reference =>
      super.reference as CollectionReference<MyUser>;

  @override
  MyUserDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
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
    extends FirestoreDocumentReference<MyUser, MyUserDocumentSnapshot> {
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

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String firstName,
    FieldValue firstNameFieldValue,
    String lastName,
    FieldValue lastNameFieldValue,
    String phoneNo,
    FieldValue phoneNoFieldValue,
    String birthDate,
    FieldValue birthDateFieldValue,
    int role,
    FieldValue roleFieldValue,
    String? group,
    FieldValue groupFieldValue,
    List<String>? subjects,
    FieldValue subjectsFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String firstName,
    FieldValue firstNameFieldValue,
    String lastName,
    FieldValue lastNameFieldValue,
    String phoneNo,
    FieldValue phoneNoFieldValue,
    String birthDate,
    FieldValue birthDateFieldValue,
    int role,
    FieldValue roleFieldValue,
    String? group,
    FieldValue groupFieldValue,
    List<String>? subjects,
    FieldValue subjectsFieldValue,
  });
}

class _$MyUserDocumentReference
    extends FirestoreDocumentReference<MyUser, MyUserDocumentSnapshot>
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
  Future<MyUserDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then((snapshot) {
      return MyUserDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  Future<void> update({
    Object? firstName = _sentinel,
    FieldValue? firstNameFieldValue,
    Object? lastName = _sentinel,
    FieldValue? lastNameFieldValue,
    Object? phoneNo = _sentinel,
    FieldValue? phoneNoFieldValue,
    Object? birthDate = _sentinel,
    FieldValue? birthDateFieldValue,
    Object? role = _sentinel,
    FieldValue? roleFieldValue,
    Object? group = _sentinel,
    FieldValue? groupFieldValue,
    Object? subjects = _sentinel,
    FieldValue? subjectsFieldValue,
  }) async {
    assert(
      firstName == _sentinel || firstNameFieldValue == null,
      "Cannot specify both firstName and firstNameFieldValue",
    );
    assert(
      lastName == _sentinel || lastNameFieldValue == null,
      "Cannot specify both lastName and lastNameFieldValue",
    );
    assert(
      phoneNo == _sentinel || phoneNoFieldValue == null,
      "Cannot specify both phoneNo and phoneNoFieldValue",
    );
    assert(
      birthDate == _sentinel || birthDateFieldValue == null,
      "Cannot specify both birthDate and birthDateFieldValue",
    );
    assert(
      role == _sentinel || roleFieldValue == null,
      "Cannot specify both role and roleFieldValue",
    );
    assert(
      group == _sentinel || groupFieldValue == null,
      "Cannot specify both group and groupFieldValue",
    );
    assert(
      subjects == _sentinel || subjectsFieldValue == null,
      "Cannot specify both subjects and subjectsFieldValue",
    );
    final json = {
      if (firstName != _sentinel) 'firstName': firstName as String,
      if (firstNameFieldValue != null) 'firstName': firstNameFieldValue,
      if (lastName != _sentinel) 'lastName': lastName as String,
      if (lastNameFieldValue != null) 'lastName': lastNameFieldValue,
      if (phoneNo != _sentinel) 'phoneNo': phoneNo as String,
      if (phoneNoFieldValue != null) 'phoneNo': phoneNoFieldValue,
      if (birthDate != _sentinel) 'birthDate': birthDate as String,
      if (birthDateFieldValue != null) 'birthDate': birthDateFieldValue,
      if (role != _sentinel) 'role': role as int,
      if (roleFieldValue != null) 'role': roleFieldValue,
      if (group != _sentinel) 'group': group as String?,
      if (groupFieldValue != null) 'group': groupFieldValue,
      if (subjects != _sentinel) 'subjects': subjects as List<String>?,
      if (subjectsFieldValue != null) 'subjects': subjectsFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? firstName = _sentinel,
    FieldValue? firstNameFieldValue,
    Object? lastName = _sentinel,
    FieldValue? lastNameFieldValue,
    Object? phoneNo = _sentinel,
    FieldValue? phoneNoFieldValue,
    Object? birthDate = _sentinel,
    FieldValue? birthDateFieldValue,
    Object? role = _sentinel,
    FieldValue? roleFieldValue,
    Object? group = _sentinel,
    FieldValue? groupFieldValue,
    Object? subjects = _sentinel,
    FieldValue? subjectsFieldValue,
  }) {
    assert(
      firstName == _sentinel || firstNameFieldValue == null,
      "Cannot specify both firstName and firstNameFieldValue",
    );
    assert(
      lastName == _sentinel || lastNameFieldValue == null,
      "Cannot specify both lastName and lastNameFieldValue",
    );
    assert(
      phoneNo == _sentinel || phoneNoFieldValue == null,
      "Cannot specify both phoneNo and phoneNoFieldValue",
    );
    assert(
      birthDate == _sentinel || birthDateFieldValue == null,
      "Cannot specify both birthDate and birthDateFieldValue",
    );
    assert(
      role == _sentinel || roleFieldValue == null,
      "Cannot specify both role and roleFieldValue",
    );
    assert(
      group == _sentinel || groupFieldValue == null,
      "Cannot specify both group and groupFieldValue",
    );
    assert(
      subjects == _sentinel || subjectsFieldValue == null,
      "Cannot specify both subjects and subjectsFieldValue",
    );
    final json = {
      if (firstName != _sentinel) 'firstName': firstName as String,
      if (firstNameFieldValue != null) 'firstName': firstNameFieldValue,
      if (lastName != _sentinel) 'lastName': lastName as String,
      if (lastNameFieldValue != null) 'lastName': lastNameFieldValue,
      if (phoneNo != _sentinel) 'phoneNo': phoneNo as String,
      if (phoneNoFieldValue != null) 'phoneNo': phoneNoFieldValue,
      if (birthDate != _sentinel) 'birthDate': birthDate as String,
      if (birthDateFieldValue != null) 'birthDate': birthDateFieldValue,
      if (role != _sentinel) 'role': role as int,
      if (roleFieldValue != null) 'role': roleFieldValue,
      if (group != _sentinel) 'group': group as String?,
      if (groupFieldValue != null) 'group': groupFieldValue,
      if (subjects != _sentinel) 'subjects': subjects as List<String>?,
      if (subjectsFieldValue != null) 'subjects': subjectsFieldValue,
    };

    transaction.update(reference, json);
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

class MyUserDocumentSnapshot extends FirestoreDocumentSnapshot<MyUser> {
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

abstract class MyUserQuery
    implements QueryReference<MyUser, MyUserQuerySnapshot> {
  @override
  MyUserQuery limit(int limit);

  @override
  MyUserQuery limitToLast(int limit);

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  MyUserQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    MyUserDocumentSnapshot? startAtDocument,
    MyUserDocumentSnapshot? endAtDocument,
    MyUserDocumentSnapshot? endBeforeDocument,
    MyUserDocumentSnapshot? startAfterDocument,
  });

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  MyUserQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  MyUserQuery whereDocumentId({
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
  MyUserQuery whereSubjects({
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    bool? isNull,
    String? arrayContains,
    List<String>? arrayContainsAny,
  });

  MyUserQuery orderByDocumentId({
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

  MyUserQuery orderBySubjects({
    bool descending = false,
    List<String>? startAt,
    List<String>? startAfter,
    List<String>? endAt,
    List<String>? endBefore,
    MyUserDocumentSnapshot? startAtDocument,
    MyUserDocumentSnapshot? endAtDocument,
    MyUserDocumentSnapshot? endBeforeDocument,
    MyUserDocumentSnapshot? startAfterDocument,
  });
}

class _$MyUserQuery extends QueryReference<MyUser, MyUserQuerySnapshot>
    implements MyUserQuery {
  _$MyUserQuery(
    this._collection, {
    required Query<MyUser> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

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
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  MyUserQuery limitToLast(int limit) {
    return _$MyUserQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  MyUserQuery orderByFieldPath(
    FieldPath fieldPath, {
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
    final query =
        $referenceWithoutCursor.orderBy(fieldPath, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }
    return _$MyUserQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  MyUserQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$MyUserQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        fieldPath,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull,
      ),
      $queryCursor: $queryCursor,
    );
  }

  MyUserQuery whereDocumentId({
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
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        FieldPath.documentId,
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
      $queryCursor: $queryCursor,
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
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$MyUserFieldMap['firstName']!,
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
      $queryCursor: $queryCursor,
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
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$MyUserFieldMap['lastName']!,
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
      $queryCursor: $queryCursor,
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
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$MyUserFieldMap['phoneNo']!,
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
      $queryCursor: $queryCursor,
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
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$MyUserFieldMap['birthDate']!,
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
      $queryCursor: $queryCursor,
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
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$MyUserFieldMap['role']!,
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
      $queryCursor: $queryCursor,
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
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$MyUserFieldMap['group']!,
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
      $queryCursor: $queryCursor,
    );
  }

  MyUserQuery whereSubjects({
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    bool? isNull,
    String? arrayContains,
    List<String>? arrayContainsAny,
  }) {
    return _$MyUserQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$MyUserFieldMap['subjects']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
      ),
      $queryCursor: $queryCursor,
    );
  }

  MyUserQuery orderByDocumentId({
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
    final query = $referenceWithoutCursor.orderBy(FieldPath.documentId,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$MyUserQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
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
    final query = $referenceWithoutCursor
        .orderBy(_$MyUserFieldMap['firstName']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$MyUserQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
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
    final query = $referenceWithoutCursor.orderBy(_$MyUserFieldMap['lastName']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$MyUserQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
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
    final query = $referenceWithoutCursor.orderBy(_$MyUserFieldMap['phoneNo']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$MyUserQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
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
    final query = $referenceWithoutCursor
        .orderBy(_$MyUserFieldMap['birthDate']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$MyUserQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
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
    final query = $referenceWithoutCursor.orderBy(_$MyUserFieldMap['role']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$MyUserQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
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
    final query = $referenceWithoutCursor.orderBy(_$MyUserFieldMap['group']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$MyUserQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  MyUserQuery orderBySubjects({
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
    final query = $referenceWithoutCursor.orderBy(_$MyUserFieldMap['subjects']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$MyUserQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
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
    extends FirestoreQuerySnapshot<MyUser, MyUserQueryDocumentSnapshot> {
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

class MyUserQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot<MyUser>
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
      subjects: (json['subjects'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

const _$MyUserFieldMap = <String, String>{
  'firstName': 'firstName',
  'lastName': 'lastName',
  'phoneNo': 'phoneNo',
  'birthDate': 'birthDate',
  'role': 'role',
  'group': 'group',
  'subjects': 'subjects',
};

Map<String, dynamic> _$MyUserToJson(MyUser instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phoneNo': instance.phoneNo,
      'birthDate': instance.birthDate,
      'role': instance.role,
      'group': instance.group,
      'subjects': instance.subjects,
    };
