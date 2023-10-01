// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.dart';

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
abstract class GroupCollectionReference
    implements
        GroupQuery,
        FirestoreCollectionReference<Group, GroupQuerySnapshot> {
  factory GroupCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$GroupCollectionReference;

  static Group fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$GroupFromJson({'id': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    Group value,
    SetOptions? options,
  ) {
    return {..._$GroupToJson(value)}..remove('id');
  }

  @override
  CollectionReference<Group> get reference;

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
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<Group> get reference =>
      super.reference as CollectionReference<Group>;

  @override
  GroupDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
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
    extends FirestoreDocumentReference<Group, GroupDocumentSnapshot> {
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

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String name,
    FieldValue nameFieldValue,
    int dayInWeek,
    FieldValue dayInWeekFieldValue,
    String hour,
    FieldValue hourFieldValue,
    String subject,
    FieldValue subjectFieldValue,
    String teacher,
    FieldValue teacherFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String name,
    FieldValue nameFieldValue,
    int dayInWeek,
    FieldValue dayInWeekFieldValue,
    String hour,
    FieldValue hourFieldValue,
    String subject,
    FieldValue subjectFieldValue,
    String teacher,
    FieldValue teacherFieldValue,
  });
}

class _$GroupDocumentReference
    extends FirestoreDocumentReference<Group, GroupDocumentSnapshot>
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
    return reference.snapshots().map(GroupDocumentSnapshot._);
  }

  @override
  Future<GroupDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(GroupDocumentSnapshot._);
  }

  @override
  Future<GroupDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(GroupDocumentSnapshot._);
  }

  Future<void> update({
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? dayInWeek = _sentinel,
    FieldValue? dayInWeekFieldValue,
    Object? hour = _sentinel,
    FieldValue? hourFieldValue,
    Object? subject = _sentinel,
    FieldValue? subjectFieldValue,
    Object? teacher = _sentinel,
    FieldValue? teacherFieldValue,
  }) async {
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      dayInWeek == _sentinel || dayInWeekFieldValue == null,
      "Cannot specify both dayInWeek and dayInWeekFieldValue",
    );
    assert(
      hour == _sentinel || hourFieldValue == null,
      "Cannot specify both hour and hourFieldValue",
    );
    assert(
      subject == _sentinel || subjectFieldValue == null,
      "Cannot specify both subject and subjectFieldValue",
    );
    assert(
      teacher == _sentinel || teacherFieldValue == null,
      "Cannot specify both teacher and teacherFieldValue",
    );
    final json = {
      if (name != _sentinel) _$GroupFieldMap['name']!: name as String,
      if (nameFieldValue != null) _$GroupFieldMap['name']!: nameFieldValue,
      if (dayInWeek != _sentinel)
        _$GroupFieldMap['dayInWeek']!: dayInWeek as int,
      if (dayInWeekFieldValue != null)
        _$GroupFieldMap['dayInWeek']!: dayInWeekFieldValue,
      if (hour != _sentinel) _$GroupFieldMap['hour']!: hour as String,
      if (hourFieldValue != null) _$GroupFieldMap['hour']!: hourFieldValue,
      if (subject != _sentinel) _$GroupFieldMap['subject']!: subject as String,
      if (subjectFieldValue != null)
        _$GroupFieldMap['subject']!: subjectFieldValue,
      if (teacher != _sentinel) _$GroupFieldMap['teacher']!: teacher as String,
      if (teacherFieldValue != null)
        _$GroupFieldMap['teacher']!: teacherFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? dayInWeek = _sentinel,
    FieldValue? dayInWeekFieldValue,
    Object? hour = _sentinel,
    FieldValue? hourFieldValue,
    Object? subject = _sentinel,
    FieldValue? subjectFieldValue,
    Object? teacher = _sentinel,
    FieldValue? teacherFieldValue,
  }) {
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      dayInWeek == _sentinel || dayInWeekFieldValue == null,
      "Cannot specify both dayInWeek and dayInWeekFieldValue",
    );
    assert(
      hour == _sentinel || hourFieldValue == null,
      "Cannot specify both hour and hourFieldValue",
    );
    assert(
      subject == _sentinel || subjectFieldValue == null,
      "Cannot specify both subject and subjectFieldValue",
    );
    assert(
      teacher == _sentinel || teacherFieldValue == null,
      "Cannot specify both teacher and teacherFieldValue",
    );
    final json = {
      if (name != _sentinel) _$GroupFieldMap['name']!: name as String,
      if (nameFieldValue != null) _$GroupFieldMap['name']!: nameFieldValue,
      if (dayInWeek != _sentinel)
        _$GroupFieldMap['dayInWeek']!: dayInWeek as int,
      if (dayInWeekFieldValue != null)
        _$GroupFieldMap['dayInWeek']!: dayInWeekFieldValue,
      if (hour != _sentinel) _$GroupFieldMap['hour']!: hour as String,
      if (hourFieldValue != null) _$GroupFieldMap['hour']!: hourFieldValue,
      if (subject != _sentinel) _$GroupFieldMap['subject']!: subject as String,
      if (subjectFieldValue != null)
        _$GroupFieldMap['subject']!: subjectFieldValue,
      if (teacher != _sentinel) _$GroupFieldMap['teacher']!: teacher as String,
      if (teacherFieldValue != null)
        _$GroupFieldMap['teacher']!: teacherFieldValue,
    };

    transaction.update(reference, json);
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

abstract class GroupQuery implements QueryReference<Group, GroupQuerySnapshot> {
  @override
  GroupQuery limit(int limit);

  @override
  GroupQuery limitToLast(int limit);

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
  GroupQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    GroupDocumentSnapshot? startAtDocument,
    GroupDocumentSnapshot? endAtDocument,
    GroupDocumentSnapshot? endBeforeDocument,
    GroupDocumentSnapshot? startAfterDocument,
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
  GroupQuery whereFieldPath(
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

  GroupQuery whereDocumentId({
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

  GroupQuery orderByDocumentId({
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

class _$GroupQuery extends QueryReference<Group, GroupQuerySnapshot>
    implements GroupQuery {
  _$GroupQuery(
    this._collection, {
    required Query<Group> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<GroupQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(GroupQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<GroupQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(GroupQuerySnapshot._fromQuerySnapshot);
  }

  @override
  GroupQuery limit(int limit) {
    return _$GroupQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  GroupQuery limitToLast(int limit) {
    return _$GroupQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  GroupQuery orderByFieldPath(
    FieldPath fieldPath, {
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
    return _$GroupQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  GroupQuery whereFieldPath(
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
    return _$GroupQuery(
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

  GroupQuery whereDocumentId({
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
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$GroupFieldMap['name']!,
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
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$GroupFieldMap['dayInWeek']!,
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
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$GroupFieldMap['hour']!,
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
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$GroupFieldMap['subject']!,
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
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$GroupFieldMap['teacher']!,
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

  GroupQuery orderByDocumentId({
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

    return _$GroupQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
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
    final query = $referenceWithoutCursor.orderBy(_$GroupFieldMap['name']!,
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

    return _$GroupQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
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
    final query = $referenceWithoutCursor.orderBy(_$GroupFieldMap['dayInWeek']!,
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

    return _$GroupQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
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
    final query = $referenceWithoutCursor.orderBy(_$GroupFieldMap['hour']!,
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

    return _$GroupQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
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
    final query = $referenceWithoutCursor.orderBy(_$GroupFieldMap['subject']!,
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

    return _$GroupQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
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
    final query = $referenceWithoutCursor.orderBy(_$GroupFieldMap['teacher']!,
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

    return _$GroupQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
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

class GroupDocumentSnapshot extends FirestoreDocumentSnapshot<Group> {
  GroupDocumentSnapshot._(this.snapshot) : data = snapshot.data();

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

class GroupQuerySnapshot
    extends FirestoreQuerySnapshot<Group, GroupQueryDocumentSnapshot> {
  GroupQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory GroupQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<Group> snapshot,
  ) {
    final docs = snapshot.docs.map(GroupQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        GroupDocumentSnapshot._,
      );
    }).toList();

    return GroupQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<GroupDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    GroupDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<GroupDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<Group> snapshot;

  @override
  final List<GroupQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<GroupDocumentSnapshot>> docChanges;
}

class GroupQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot<Group>
    implements GroupDocumentSnapshot {
  GroupQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<Group> snapshot;

  @override
  final Group data;

  @override
  GroupDocumentReference get reference {
    return GroupDocumentReference(snapshot.reference);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Group _$GroupFromJson(Map<String, dynamic> json) => Group(
      id: json['id'] as String,
      name: json['name'] as String,
      dayInWeek: json['dayInWeek'] as int,
      hour: json['hour'] as String,
      subject: json['subject'] as String,
      teacher: json['teacher'] as String,
    );

const _$GroupFieldMap = <String, String>{
  'id': 'id',
  'name': 'name',
  'dayInWeek': 'dayInWeek',
  'hour': 'hour',
  'subject': 'subject',
  'teacher': 'teacher',
};

Map<String, dynamic> _$GroupToJson(Group instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'dayInWeek': instance.dayInWeek,
      'hour': instance.hour,
      'subject': instance.subject,
      'teacher': instance.teacher,
    };
