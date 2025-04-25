// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// ignore_for_file: type=lint
class $UserTable extends User with TableInfo<$UserTable, UserData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _firstNameMeta = const VerificationMeta(
    'firstName',
  );
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
    'first_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastNameMeta = const VerificationMeta(
    'lastName',
  );
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
    'last_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 63),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _passKeyMeta = const VerificationMeta(
    'passKey',
  );
  @override
  late final GeneratedColumn<String> passKey = GeneratedColumn<String>(
    'pass_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    firstName,
    lastName,
    email,
    createdAt,
    passKey,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('first_name')) {
      context.handle(
        _firstNameMeta,
        firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta),
      );
    } else if (isInserting) {
      context.missing(_firstNameMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(
        _lastNameMeta,
        lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('pass_key')) {
      context.handle(
        _passKeyMeta,
        passKey.isAcceptableOrUnknown(data['pass_key']!, _passKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_passKeyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {email};
  @override
  UserData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserData(
      firstName:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}first_name'],
          )!,
      lastName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_name'],
      ),
      email:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}email'],
          )!,
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
      passKey:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}pass_key'],
          )!,
    );
  }

  @override
  $UserTable createAlias(String alias) {
    return $UserTable(attachedDatabase, alias);
  }
}

class UserData extends DataClass implements Insertable<UserData> {
  final String firstName;
  final String? lastName;
  final String email;
  final DateTime createdAt;
  final String passKey;
  const UserData({
    required this.firstName,
    this.lastName,
    required this.email,
    required this.createdAt,
    required this.passKey,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['first_name'] = Variable<String>(firstName);
    if (!nullToAbsent || lastName != null) {
      map['last_name'] = Variable<String>(lastName);
    }
    map['email'] = Variable<String>(email);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['pass_key'] = Variable<String>(passKey);
    return map;
  }

  UserCompanion toCompanion(bool nullToAbsent) {
    return UserCompanion(
      firstName: Value(firstName),
      lastName:
          lastName == null && nullToAbsent
              ? const Value.absent()
              : Value(lastName),
      email: Value(email),
      createdAt: Value(createdAt),
      passKey: Value(passKey),
    );
  }

  factory UserData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserData(
      firstName: serializer.fromJson<String>(json['firstName']),
      lastName: serializer.fromJson<String?>(json['lastName']),
      email: serializer.fromJson<String>(json['email']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      passKey: serializer.fromJson<String>(json['passKey']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'firstName': serializer.toJson<String>(firstName),
      'lastName': serializer.toJson<String?>(lastName),
      'email': serializer.toJson<String>(email),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'passKey': serializer.toJson<String>(passKey),
    };
  }

  UserData copyWith({
    String? firstName,
    Value<String?> lastName = const Value.absent(),
    String? email,
    DateTime? createdAt,
    String? passKey,
  }) => UserData(
    firstName: firstName ?? this.firstName,
    lastName: lastName.present ? lastName.value : this.lastName,
    email: email ?? this.email,
    createdAt: createdAt ?? this.createdAt,
    passKey: passKey ?? this.passKey,
  );
  UserData copyWithCompanion(UserCompanion data) {
    return UserData(
      firstName: data.firstName.present ? data.firstName.value : this.firstName,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      email: data.email.present ? data.email.value : this.email,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      passKey: data.passKey.present ? data.passKey.value : this.passKey,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserData(')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('email: $email, ')
          ..write('createdAt: $createdAt, ')
          ..write('passKey: $passKey')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(firstName, lastName, email, createdAt, passKey);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserData &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.email == this.email &&
          other.createdAt == this.createdAt &&
          other.passKey == this.passKey);
}

class UserCompanion extends UpdateCompanion<UserData> {
  final Value<String> firstName;
  final Value<String?> lastName;
  final Value<String> email;
  final Value<DateTime> createdAt;
  final Value<String> passKey;
  final Value<int> rowid;
  const UserCompanion({
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.email = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.passKey = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserCompanion.insert({
    required String firstName,
    this.lastName = const Value.absent(),
    required String email,
    this.createdAt = const Value.absent(),
    required String passKey,
    this.rowid = const Value.absent(),
  }) : firstName = Value(firstName),
       email = Value(email),
       passKey = Value(passKey);
  static Insertable<UserData> custom({
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<String>? email,
    Expression<DateTime>? createdAt,
    Expression<String>? passKey,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (email != null) 'email': email,
      if (createdAt != null) 'created_at': createdAt,
      if (passKey != null) 'pass_key': passKey,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserCompanion copyWith({
    Value<String>? firstName,
    Value<String?>? lastName,
    Value<String>? email,
    Value<DateTime>? createdAt,
    Value<String>? passKey,
    Value<int>? rowid,
  }) {
    return UserCompanion(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      createdAt: createdAt ?? this.createdAt,
      passKey: passKey ?? this.passKey,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (passKey.present) {
      map['pass_key'] = Variable<String>(passKey.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserCompanion(')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('email: $email, ')
          ..write('createdAt: $createdAt, ')
          ..write('passKey: $passKey, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$OrderManagementDatabase extends GeneratedDatabase {
  _$OrderManagementDatabase(QueryExecutor e) : super(e);
  $OrderManagementDatabaseManager get managers =>
      $OrderManagementDatabaseManager(this);
  late final $UserTable user = $UserTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [user];
}

typedef $$UserTableCreateCompanionBuilder =
    UserCompanion Function({
      required String firstName,
      Value<String?> lastName,
      required String email,
      Value<DateTime> createdAt,
      required String passKey,
      Value<int> rowid,
    });
typedef $$UserTableUpdateCompanionBuilder =
    UserCompanion Function({
      Value<String> firstName,
      Value<String?> lastName,
      Value<String> email,
      Value<DateTime> createdAt,
      Value<String> passKey,
      Value<int> rowid,
    });

class $$UserTableFilterComposer
    extends Composer<_$OrderManagementDatabase, $UserTable> {
  $$UserTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get firstName => $composableBuilder(
    column: $table.firstName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastName => $composableBuilder(
    column: $table.lastName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get passKey => $composableBuilder(
    column: $table.passKey,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UserTableOrderingComposer
    extends Composer<_$OrderManagementDatabase, $UserTable> {
  $$UserTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get firstName => $composableBuilder(
    column: $table.firstName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastName => $composableBuilder(
    column: $table.lastName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get passKey => $composableBuilder(
    column: $table.passKey,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UserTableAnnotationComposer
    extends Composer<_$OrderManagementDatabase, $UserTable> {
  $$UserTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get firstName =>
      $composableBuilder(column: $table.firstName, builder: (column) => column);

  GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get passKey =>
      $composableBuilder(column: $table.passKey, builder: (column) => column);
}

class $$UserTableTableManager
    extends
        RootTableManager<
          _$OrderManagementDatabase,
          $UserTable,
          UserData,
          $$UserTableFilterComposer,
          $$UserTableOrderingComposer,
          $$UserTableAnnotationComposer,
          $$UserTableCreateCompanionBuilder,
          $$UserTableUpdateCompanionBuilder,
          (
            UserData,
            BaseReferences<_$OrderManagementDatabase, $UserTable, UserData>,
          ),
          UserData,
          PrefetchHooks Function()
        > {
  $$UserTableTableManager(_$OrderManagementDatabase db, $UserTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$UserTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$UserTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$UserTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> firstName = const Value.absent(),
                Value<String?> lastName = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<String> passKey = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserCompanion(
                firstName: firstName,
                lastName: lastName,
                email: email,
                createdAt: createdAt,
                passKey: passKey,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String firstName,
                Value<String?> lastName = const Value.absent(),
                required String email,
                Value<DateTime> createdAt = const Value.absent(),
                required String passKey,
                Value<int> rowid = const Value.absent(),
              }) => UserCompanion.insert(
                firstName: firstName,
                lastName: lastName,
                email: email,
                createdAt: createdAt,
                passKey: passKey,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UserTableProcessedTableManager =
    ProcessedTableManager<
      _$OrderManagementDatabase,
      $UserTable,
      UserData,
      $$UserTableFilterComposer,
      $$UserTableOrderingComposer,
      $$UserTableAnnotationComposer,
      $$UserTableCreateCompanionBuilder,
      $$UserTableUpdateCompanionBuilder,
      (
        UserData,
        BaseReferences<_$OrderManagementDatabase, $UserTable, UserData>,
      ),
      UserData,
      PrefetchHooks Function()
    >;

class $OrderManagementDatabaseManager {
  final _$OrderManagementDatabase _db;
  $OrderManagementDatabaseManager(this._db);
  $$UserTableTableManager get user => $$UserTableTableManager(_db, _db.user);
}
