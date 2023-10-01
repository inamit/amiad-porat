// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson.dart';

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
abstract class LessonCollectionReference
    implements
        LessonQuery,
        FirestoreCollectionReference<Lesson, LessonQuerySnapshot> {
  factory LessonCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$LessonCollectionReference;

  static Lesson fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$LessonFromJson({'id': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    Lesson value,
    SetOptions? options,
  ) {
    return {..._$LessonToJson(value)}..remove('id');
  }

  @override
  CollectionReference<Lesson> get reference;

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
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<Lesson> get reference =>
      super.reference as CollectionReference<Lesson>;

  @override
  LessonDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
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
    extends FirestoreDocumentReference<Lesson, LessonDocumentSnapshot> {
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

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    DateTime date,
    FieldValue dateFieldValue,
    bool isOpen,
    FieldValue isOpenFieldValue,
    String subject,
    FieldValue subjectFieldValue,
    int maxStudents,
    FieldValue maxStudentsFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    DateTime date,
    FieldValue dateFieldValue,
    bool isOpen,
    FieldValue isOpenFieldValue,
    String subject,
    FieldValue subjectFieldValue,
    int maxStudents,
    FieldValue maxStudentsFieldValue,
  });
}

class _$LessonDocumentReference
    extends FirestoreDocumentReference<Lesson, LessonDocumentSnapshot>
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
    return reference.snapshots().map(LessonDocumentSnapshot._);
  }

  @override
  Future<LessonDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(LessonDocumentSnapshot._);
  }

  @override
  Future<LessonDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(LessonDocumentSnapshot._);
  }

  Future<void> update({
    Object? date = _sentinel,
    FieldValue? dateFieldValue,
    Object? isOpen = _sentinel,
    FieldValue? isOpenFieldValue,
    Object? subject = _sentinel,
    FieldValue? subjectFieldValue,
    Object? maxStudents = _sentinel,
    FieldValue? maxStudentsFieldValue,
  }) async {
    assert(
      date == _sentinel || dateFieldValue == null,
      "Cannot specify both date and dateFieldValue",
    );
    assert(
      isOpen == _sentinel || isOpenFieldValue == null,
      "Cannot specify both isOpen and isOpenFieldValue",
    );
    assert(
      subject == _sentinel || subjectFieldValue == null,
      "Cannot specify both subject and subjectFieldValue",
    );
    assert(
      maxStudents == _sentinel || maxStudentsFieldValue == null,
      "Cannot specify both maxStudents and maxStudentsFieldValue",
    );
    final json = {
      if (date != _sentinel) _$LessonFieldMap['date']!: date as DateTime,
      if (dateFieldValue != null) _$LessonFieldMap['date']!: dateFieldValue,
      if (isOpen != _sentinel) _$LessonFieldMap['isOpen']!: isOpen as bool,
      if (isOpenFieldValue != null)
        _$LessonFieldMap['isOpen']!: isOpenFieldValue,
      if (subject != _sentinel) _$LessonFieldMap['subject']!: subject as String,
      if (subjectFieldValue != null)
        _$LessonFieldMap['subject']!: subjectFieldValue,
      if (maxStudents != _sentinel)
        _$LessonFieldMap['maxStudents']!: maxStudents as int,
      if (maxStudentsFieldValue != null)
        _$LessonFieldMap['maxStudents']!: maxStudentsFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? date = _sentinel,
    FieldValue? dateFieldValue,
    Object? isOpen = _sentinel,
    FieldValue? isOpenFieldValue,
    Object? subject = _sentinel,
    FieldValue? subjectFieldValue,
    Object? maxStudents = _sentinel,
    FieldValue? maxStudentsFieldValue,
  }) {
    assert(
      date == _sentinel || dateFieldValue == null,
      "Cannot specify both date and dateFieldValue",
    );
    assert(
      isOpen == _sentinel || isOpenFieldValue == null,
      "Cannot specify both isOpen and isOpenFieldValue",
    );
    assert(
      subject == _sentinel || subjectFieldValue == null,
      "Cannot specify both subject and subjectFieldValue",
    );
    assert(
      maxStudents == _sentinel || maxStudentsFieldValue == null,
      "Cannot specify both maxStudents and maxStudentsFieldValue",
    );
    final json = {
      if (date != _sentinel) _$LessonFieldMap['date']!: date as DateTime,
      if (dateFieldValue != null) _$LessonFieldMap['date']!: dateFieldValue,
      if (isOpen != _sentinel) _$LessonFieldMap['isOpen']!: isOpen as bool,
      if (isOpenFieldValue != null)
        _$LessonFieldMap['isOpen']!: isOpenFieldValue,
      if (subject != _sentinel) _$LessonFieldMap['subject']!: subject as String,
      if (subjectFieldValue != null)
        _$LessonFieldMap['subject']!: subjectFieldValue,
      if (maxStudents != _sentinel)
        _$LessonFieldMap['maxStudents']!: maxStudents as int,
      if (maxStudentsFieldValue != null)
        _$LessonFieldMap['maxStudents']!: maxStudentsFieldValue,
    };

    transaction.update(reference, json);
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

abstract class LessonQuery
    implements QueryReference<Lesson, LessonQuerySnapshot> {
  @override
  LessonQuery limit(int limit);

  @override
  LessonQuery limitToLast(int limit);

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
  LessonQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    LessonDocumentSnapshot? startAtDocument,
    LessonDocumentSnapshot? endAtDocument,
    LessonDocumentSnapshot? endBeforeDocument,
    LessonDocumentSnapshot? startAfterDocument,
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
  LessonQuery whereFieldPath(
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

  LessonQuery whereDocumentId({
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
  LessonQuery whereDate({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime>? whereIn,
    List<DateTime>? whereNotIn,
  });
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

  LessonQuery orderByDocumentId({
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

  LessonQuery orderByDate({
    bool descending = false,
    DateTime startAt,
    DateTime startAfter,
    DateTime endAt,
    DateTime endBefore,
    LessonDocumentSnapshot? startAtDocument,
    LessonDocumentSnapshot? endAtDocument,
    LessonDocumentSnapshot? endBeforeDocument,
    LessonDocumentSnapshot? startAfterDocument,
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

class _$LessonQuery extends QueryReference<Lesson, LessonQuerySnapshot>
    implements LessonQuery {
  _$LessonQuery(
    this._collection, {
    required Query<Lesson> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<LessonQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(LessonQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<LessonQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(LessonQuerySnapshot._fromQuerySnapshot);
  }

  @override
  LessonQuery limit(int limit) {
    return _$LessonQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  LessonQuery limitToLast(int limit) {
    return _$LessonQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  LessonQuery orderByFieldPath(
    FieldPath fieldPath, {
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
    return _$LessonQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  LessonQuery whereFieldPath(
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
    return _$LessonQuery(
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

  LessonQuery whereDocumentId({
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

  LessonQuery whereDate({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime>? whereIn,
    List<DateTime>? whereNotIn,
  }) {
    return _$LessonQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$LessonFieldMap['date']!,
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
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$LessonFieldMap['isOpen']!,
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
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$LessonFieldMap['subject']!,
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
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$LessonFieldMap['students']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        arrayContainsAny: arrayContainsAny,
      ),
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
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$LessonFieldMap['maxStudents']!,
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

  LessonQuery orderByDocumentId({
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

    return _$LessonQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  LessonQuery orderByDate({
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
    final query = $referenceWithoutCursor.orderBy(_$LessonFieldMap['date']!,
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

    return _$LessonQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
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
    final query = $referenceWithoutCursor.orderBy(_$LessonFieldMap['isOpen']!,
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

    return _$LessonQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
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
    final query = $referenceWithoutCursor.orderBy(_$LessonFieldMap['subject']!,
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

    return _$LessonQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
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
    final query = $referenceWithoutCursor
        .orderBy(_$LessonFieldMap['maxStudents']!, descending: descending);
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

    return _$LessonQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
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

class LessonDocumentSnapshot extends FirestoreDocumentSnapshot<Lesson> {
  LessonDocumentSnapshot._(this.snapshot) : data = snapshot.data();

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

class LessonQuerySnapshot
    extends FirestoreQuerySnapshot<Lesson, LessonQueryDocumentSnapshot> {
  LessonQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory LessonQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<Lesson> snapshot,
  ) {
    final docs = snapshot.docs.map(LessonQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        LessonDocumentSnapshot._,
      );
    }).toList();

    return LessonQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<LessonDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    LessonDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<LessonDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<Lesson> snapshot;

  @override
  final List<LessonQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<LessonDocumentSnapshot>> docChanges;
}

class LessonQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot<Lesson>
    implements LessonDocumentSnapshot {
  LessonQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<Lesson> snapshot;

  @override
  final Lesson data;

  @override
  LessonDocumentReference get reference {
    return LessonDocumentReference(snapshot.reference);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lesson _$LessonFromJson(Map<String, dynamic> json) => Lesson(
      id: json['id'] as String,
      date: const TimestampConverter().fromJson(json['date'] as Timestamp),
      isOpen: json['isOpen'] as bool,
      subject: json['subject'] as String,
      students: (json['students'] as List<dynamic>)
          .map((e) => Map<String, String>.from(e as Map))
          .toList(),
      maxStudents: json['maxStudents'] as int,
    );

const _$LessonFieldMap = <String, String>{
  'id': 'id',
  'date': 'date',
  'isOpen': 'isOpen',
  'subject': 'subject',
  'students': 'students',
  'maxStudents': 'maxStudents',
};

Map<String, dynamic> _$LessonToJson(Lesson instance) => <String, dynamic>{
      'id': instance.id,
      'date': const TimestampConverter().toJson(instance.date),
      'isOpen': instance.isOpen,
      'subject': instance.subject,
      'students': instance.students,
      'maxStudents': instance.maxStudents,
    };
