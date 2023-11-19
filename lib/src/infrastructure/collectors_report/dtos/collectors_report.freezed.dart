// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'collectors_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CollectorsReport _$CollectorsReportFromJson(Map<String, dynamic> json) {
  return _CollectorsReport.fromJson(json);
}

/// @nodoc
mixin _$CollectorsReport {
  List<CollectorsReportElement>? get collectorsReport =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CollectorsReportCopyWith<CollectorsReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollectorsReportCopyWith<$Res> {
  factory $CollectorsReportCopyWith(
          CollectorsReport value, $Res Function(CollectorsReport) then) =
      _$CollectorsReportCopyWithImpl<$Res, CollectorsReport>;
  @useResult
  $Res call({List<CollectorsReportElement>? collectorsReport});
}

/// @nodoc
class _$CollectorsReportCopyWithImpl<$Res, $Val extends CollectorsReport>
    implements $CollectorsReportCopyWith<$Res> {
  _$CollectorsReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collectorsReport = freezed,
  }) {
    return _then(_value.copyWith(
      collectorsReport: freezed == collectorsReport
          ? _value.collectorsReport
          : collectorsReport // ignore: cast_nullable_to_non_nullable
              as List<CollectorsReportElement>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CollectorsReportCopyWith<$Res>
    implements $CollectorsReportCopyWith<$Res> {
  factory _$$_CollectorsReportCopyWith(
          _$_CollectorsReport value, $Res Function(_$_CollectorsReport) then) =
      __$$_CollectorsReportCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CollectorsReportElement>? collectorsReport});
}

/// @nodoc
class __$$_CollectorsReportCopyWithImpl<$Res>
    extends _$CollectorsReportCopyWithImpl<$Res, _$_CollectorsReport>
    implements _$$_CollectorsReportCopyWith<$Res> {
  __$$_CollectorsReportCopyWithImpl(
      _$_CollectorsReport _value, $Res Function(_$_CollectorsReport) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collectorsReport = freezed,
  }) {
    return _then(_$_CollectorsReport(
      collectorsReport: freezed == collectorsReport
          ? _value._collectorsReport
          : collectorsReport // ignore: cast_nullable_to_non_nullable
              as List<CollectorsReportElement>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CollectorsReport implements _CollectorsReport {
  const _$_CollectorsReport(
      {final List<CollectorsReportElement>? collectorsReport})
      : _collectorsReport = collectorsReport;

  factory _$_CollectorsReport.fromJson(Map<String, dynamic> json) =>
      _$$_CollectorsReportFromJson(json);

  final List<CollectorsReportElement>? _collectorsReport;
  @override
  List<CollectorsReportElement>? get collectorsReport {
    final value = _collectorsReport;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CollectorsReport(collectorsReport: $collectorsReport)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CollectorsReport &&
            const DeepCollectionEquality()
                .equals(other._collectorsReport, _collectorsReport));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_collectorsReport));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CollectorsReportCopyWith<_$_CollectorsReport> get copyWith =>
      __$$_CollectorsReportCopyWithImpl<_$_CollectorsReport>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CollectorsReportToJson(
      this,
    );
  }
}

abstract class _CollectorsReport implements CollectorsReport {
  const factory _CollectorsReport(
          {final List<CollectorsReportElement>? collectorsReport}) =
      _$_CollectorsReport;

  factory _CollectorsReport.fromJson(Map<String, dynamic> json) =
      _$_CollectorsReport.fromJson;

  @override
  List<CollectorsReportElement>? get collectorsReport;
  @override
  @JsonKey(ignore: true)
  _$$_CollectorsReportCopyWith<_$_CollectorsReport> get copyWith =>
      throw _privateConstructorUsedError;
}

CollectorsReportElement _$CollectorsReportElementFromJson(
    Map<String, dynamic> json) {
  return _CollectorsReportElement.fromJson(json);
}

/// @nodoc
mixin _$CollectorsReportElement {
  String? get id => throw _privateConstructorUsedError;
  int? get clean => throw _privateConstructorUsedError;
  int? get prize => throw _privateConstructorUsedError;
  int? get wins => throw _privateConstructorUsedError;
  int? get loses => throw _privateConstructorUsedError;
  int? get salary => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CollectorsReportElementCopyWith<CollectorsReportElement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollectorsReportElementCopyWith<$Res> {
  factory $CollectorsReportElementCopyWith(CollectorsReportElement value,
          $Res Function(CollectorsReportElement) then) =
      _$CollectorsReportElementCopyWithImpl<$Res, CollectorsReportElement>;
  @useResult
  $Res call(
      {String? id, int? clean, int? prize, int? wins, int? loses, int? salary});
}

/// @nodoc
class _$CollectorsReportElementCopyWithImpl<$Res,
        $Val extends CollectorsReportElement>
    implements $CollectorsReportElementCopyWith<$Res> {
  _$CollectorsReportElementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? clean = freezed,
    Object? prize = freezed,
    Object? wins = freezed,
    Object? loses = freezed,
    Object? salary = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      clean: freezed == clean
          ? _value.clean
          : clean // ignore: cast_nullable_to_non_nullable
              as int?,
      prize: freezed == prize
          ? _value.prize
          : prize // ignore: cast_nullable_to_non_nullable
              as int?,
      wins: freezed == wins
          ? _value.wins
          : wins // ignore: cast_nullable_to_non_nullable
              as int?,
      loses: freezed == loses
          ? _value.loses
          : loses // ignore: cast_nullable_to_non_nullable
              as int?,
      salary: freezed == salary
          ? _value.salary
          : salary // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CollectorsReportElementCopyWith<$Res>
    implements $CollectorsReportElementCopyWith<$Res> {
  factory _$$_CollectorsReportElementCopyWith(_$_CollectorsReportElement value,
          $Res Function(_$_CollectorsReportElement) then) =
      __$$_CollectorsReportElementCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id, int? clean, int? prize, int? wins, int? loses, int? salary});
}

/// @nodoc
class __$$_CollectorsReportElementCopyWithImpl<$Res>
    extends _$CollectorsReportElementCopyWithImpl<$Res,
        _$_CollectorsReportElement>
    implements _$$_CollectorsReportElementCopyWith<$Res> {
  __$$_CollectorsReportElementCopyWithImpl(_$_CollectorsReportElement _value,
      $Res Function(_$_CollectorsReportElement) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? clean = freezed,
    Object? prize = freezed,
    Object? wins = freezed,
    Object? loses = freezed,
    Object? salary = freezed,
  }) {
    return _then(_$_CollectorsReportElement(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      clean: freezed == clean
          ? _value.clean
          : clean // ignore: cast_nullable_to_non_nullable
              as int?,
      prize: freezed == prize
          ? _value.prize
          : prize // ignore: cast_nullable_to_non_nullable
              as int?,
      wins: freezed == wins
          ? _value.wins
          : wins // ignore: cast_nullable_to_non_nullable
              as int?,
      loses: freezed == loses
          ? _value.loses
          : loses // ignore: cast_nullable_to_non_nullable
              as int?,
      salary: freezed == salary
          ? _value.salary
          : salary // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CollectorsReportElement implements _CollectorsReportElement {
  const _$_CollectorsReportElement(
      {this.id, this.clean, this.prize, this.wins, this.loses, this.salary});

  factory _$_CollectorsReportElement.fromJson(Map<String, dynamic> json) =>
      _$$_CollectorsReportElementFromJson(json);

  @override
  final String? id;
  @override
  final int? clean;
  @override
  final int? prize;
  @override
  final int? wins;
  @override
  final int? loses;
  @override
  final int? salary;

  @override
  String toString() {
    return 'CollectorsReportElement(id: $id, clean: $clean, prize: $prize, wins: $wins, loses: $loses, salary: $salary)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CollectorsReportElement &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.clean, clean) || other.clean == clean) &&
            (identical(other.prize, prize) || other.prize == prize) &&
            (identical(other.wins, wins) || other.wins == wins) &&
            (identical(other.loses, loses) || other.loses == loses) &&
            (identical(other.salary, salary) || other.salary == salary));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, clean, prize, wins, loses, salary);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CollectorsReportElementCopyWith<_$_CollectorsReportElement>
      get copyWith =>
          __$$_CollectorsReportElementCopyWithImpl<_$_CollectorsReportElement>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CollectorsReportElementToJson(
      this,
    );
  }
}

abstract class _CollectorsReportElement implements CollectorsReportElement {
  const factory _CollectorsReportElement(
      {final String? id,
      final int? clean,
      final int? prize,
      final int? wins,
      final int? loses,
      final int? salary}) = _$_CollectorsReportElement;

  factory _CollectorsReportElement.fromJson(Map<String, dynamic> json) =
      _$_CollectorsReportElement.fromJson;

  @override
  String? get id;
  @override
  int? get clean;
  @override
  int? get prize;
  @override
  int? get wins;
  @override
  int? get loses;
  @override
  int? get salary;
  @override
  @JsonKey(ignore: true)
  _$$_CollectorsReportElementCopyWith<_$_CollectorsReportElement>
      get copyWith => throw _privateConstructorUsedError;
}
