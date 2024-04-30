// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offlinemap.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetOfflineMapCollection on Isar {
  IsarCollection<OfflineMap> get offlineMaps => this.collection();
}

const OfflineMapSchema = CollectionSchema(
  name: r'OfflineMap',
  id: -8346022046024721189,
  properties: {},
  estimateSize: _offlineMapEstimateSize,
  serialize: _offlineMapSerialize,
  deserialize: _offlineMapDeserialize,
  deserializeProp: _offlineMapDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _offlineMapGetId,
  getLinks: _offlineMapGetLinks,
  attach: _offlineMapAttach,
  version: '3.1.0+1',
);

int _offlineMapEstimateSize(
  OfflineMap object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _offlineMapSerialize(
  OfflineMap object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {}
OfflineMap _offlineMapDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = OfflineMap();
  object.id = id;
  return object;
}

P _offlineMapDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _offlineMapGetId(OfflineMap object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _offlineMapGetLinks(OfflineMap object) {
  return [];
}

void _offlineMapAttach(IsarCollection<dynamic> col, Id id, OfflineMap object) {
  object.id = id;
}

extension OfflineMapQueryWhereSort
    on QueryBuilder<OfflineMap, OfflineMap, QWhere> {
  QueryBuilder<OfflineMap, OfflineMap, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension OfflineMapQueryWhere
    on QueryBuilder<OfflineMap, OfflineMap, QWhereClause> {
  QueryBuilder<OfflineMap, OfflineMap, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<OfflineMap, OfflineMap, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<OfflineMap, OfflineMap, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<OfflineMap, OfflineMap, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<OfflineMap, OfflineMap, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension OfflineMapQueryFilter
    on QueryBuilder<OfflineMap, OfflineMap, QFilterCondition> {
  QueryBuilder<OfflineMap, OfflineMap, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflineMap, OfflineMap, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflineMap, OfflineMap, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<OfflineMap, OfflineMap, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension OfflineMapQueryObject
    on QueryBuilder<OfflineMap, OfflineMap, QFilterCondition> {}

extension OfflineMapQueryLinks
    on QueryBuilder<OfflineMap, OfflineMap, QFilterCondition> {}

extension OfflineMapQuerySortBy
    on QueryBuilder<OfflineMap, OfflineMap, QSortBy> {}

extension OfflineMapQuerySortThenBy
    on QueryBuilder<OfflineMap, OfflineMap, QSortThenBy> {
  QueryBuilder<OfflineMap, OfflineMap, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<OfflineMap, OfflineMap, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension OfflineMapQueryWhereDistinct
    on QueryBuilder<OfflineMap, OfflineMap, QDistinct> {}

extension OfflineMapQueryProperty
    on QueryBuilder<OfflineMap, OfflineMap, QQueryProperty> {
  QueryBuilder<OfflineMap, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }
}
