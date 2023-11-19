// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'general_collectors_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GeneralCollectorsReport _$GeneralCollectorsReportFromJson(
    Map<String, dynamic> json) {
  return _GeneralCollectorsReport.fromJson(json);
}

/// @nodoc
mixin _$GeneralCollectorsReport {
  List<GeneralCollectorsReportElement>? get generalCollectorsReport =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeneralCollectorsReportCopyWith<GeneralCollectorsReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeneralCollectorsReportCopyWith<$Res> {
  factory $GeneralCollectorsReportCopyWith(GeneralCollectorsReport value,
          $Res Function(GeneralCollectorsReport) then) =
      _$GeneralCollectorsReportCopyWithImpl<$Res, GeneralCollectorsReport>;
  @useResult
  $Res call({List<GeneralCollectorsReportElement>? generalCollectorsReport});
}

/// @nodoc
class _$GeneralCollectorsReportCopyWithImpl<$Res,
        $Val extends GeneralCollectorsReport>
    implements $GeneralCollectorsReportCopyWith<$Res> {
  _$GeneralCollectorsReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? generalCollectorsReport = freezed,
  }) {
    return _then(_value.copyWith(
      generalCollectorsReport: freezed == generalCollectorsReport
          ? _value.generalCollectorsReport
          : generalCollectorsReport // ignore: cast_nullable_to_non_nullable
              as List<GeneralCollectorsReportElement>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GeneralCollectorsReportCopyWith<$Res>
    implements $GeneralCollectorsReportCopyWith<$Res> {
  factory _$$_GeneralCollectorsReportCopyWith(_$_GeneralCollectorsReport value,
          $Res Function(_$_GeneralCollectorsReport) then) =
      __$$_GeneralCollectorsReportCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<GeneralCollectorsReportElement>? generalCollectorsReport});
}

/// @nodoc
class __$$_GeneralCollectorsReportCopyWithImpl<$Res>
    extends _$GeneralCollectorsReportCopyWithImpl<$Res,
        _$_GeneralCollectorsReport>
    implements _$$_GeneralCollectorsReportCopyWith<$Res> {
  __$$_GeneralCollectorsReportCopyWithImpl(_$_GeneralCollectorsReport _value,
      $Res Function(_$_GeneralCollectorsReport) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? generalCollectorsReport = freezed,
  }) {
    return _then(_$_GeneralCollectorsReport(
      generalCollectorsReport: freezed == generalCollectorsReport
          ? _value._generalCollectorsReport
          : generalCollectorsReport // ignore: cast_nullable_to_non_nullable
              as List<GeneralCollectorsReportElement>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GeneralCollectorsReport implements _GeneralCollectorsReport {
  const _$_GeneralCollectorsReport(
      {final List<GeneralCollectorsReportElement>? generalCollectorsReport})
      : _generalCollectorsReport = generalCollectorsReport;

  factory _$_GeneralCollectorsReport.fromJson(Map<String, dynamic> json) =>
      _$$_GeneralCollectorsReportFromJson(json);

  final List<GeneralCollectorsReportElement>? _generalCollectorsReport;
  @override
  List<GeneralCollectorsReportElement>? get generalCollectorsReport {
    final value = _generalCollectorsReport;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GeneralCollectorsReport(generalCollectorsReport: $generalCollectorsReport)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GeneralCollectorsReport &&
            const DeepCollectionEquality().equals(
                other._generalCollectorsReport, _generalCollectorsReport));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_generalCollectorsReport));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GeneralCollectorsReportCopyWith<_$_GeneralCollectorsReport>
      get copyWith =>
          __$$_GeneralCollectorsReportCopyWithImpl<_$_GeneralCollectorsReport>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GeneralCollectorsReportToJson(
      this,
    );
  }
}

abstract class _GeneralCollectorsReport implements GeneralCollectorsReport {
  const factory _GeneralCollectorsReport(
      {final List<GeneralCollectorsReportElement>?
          generalCollectorsReport}) = _$_GeneralCollectorsReport;

  factory _GeneralCollectorsReport.fromJson(Map<String, dynamic> json) =
      _$_GeneralCollectorsReport.fromJson;

  @override
  List<GeneralCollectorsReportElement>? get generalCollectorsReport;
  @override
  @JsonKey(ignore: true)
  _$$_GeneralCollectorsReportCopyWith<_$_GeneralCollectorsReport>
      get copyWith => throw _privateConstructorUsedError;
}

GeneralCollectorsReportElement _$GeneralCollectorsReportElementFromJson(
    Map<String, dynamic> json) {
  return _GeneralCollectorsReportElement.fromJson(json);
}

/// @nodoc
mixin _$GeneralCollectorsReportElement {
  String? get id => throw _privateConstructorUsedError;
  int? get clean => throw _privateConstructorUsedError;
  int? get prize => throw _privateConstructorUsedError;
  int? get wins => throw _privateConstructorUsedError;
  int? get loses => throw _privateConstructorUsedError;
  int? get salary => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeneralCollectorsReportElementCopyWith<GeneralCollectorsReportElement>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeneralCollectorsReportElementCopyWith<$Res> {
  factory $GeneralCollectorsReportElementCopyWith(
          GeneralCollectorsReportElement value,
          $Res Function(GeneralCollectorsReportElement) then) =
      _$GeneralCollectorsReportElementCopyWithImpl<$Res,
          GeneralCollectorsReportElement>;
  @useResult
  $Res call(
      {String? id, int? clean, int? prize, int? wins, int? loses, int? salary});
}

/// @nodoc
class _$GeneralCollectorsReportElementCopyWithImpl<$Res,
        $Val extends GeneralCollectorsReportElement>
    implements $GeneralCollectorsReportElementCopyWith<$Res> {
  _$GeneralCollectorsReportElementCopyWithImpl(this._value, this._then);

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
abstract class _$$_GeneralCollectorsReportElementCopyWith<$Res>
    implements $GeneralCollectorsReportElementCopyWith<$Res> {
  factory _$$_GeneralCollectorsReportElementCopyWith(
          _$_GeneralCollectorsReportElement value,
          $Res Function(_$_GeneralCollectorsReportElement) then) =
      __$$_GeneralCollectorsReportElementCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id, int? clean, int? prize, int? wins, int? loses, int? salary});
}

/// @nodoc
class __$$_GeneralCollectorsReportElementCopyWithImpl<$Res>
    extends _$GeneralCollectorsReportElementCopyWithImpl<$Res,
        _$_GeneralCollectorsReportElement>
    implements _$$_GeneralCollectorsReportElementCopyWith<$Res> {
  __$$_GeneralCollectorsReportElementCopyWithImpl(
      _$_GeneralCollectorsReportElement _value,
      $Res Function(_$_GeneralCollectorsReportElement) _then)
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
    return _then(_$_GeneralCollectorsReportElement(
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
class _$_GeneralCollectorsReportElement
    implements _GeneralCollectorsReportElement {
  const _$_GeneralCollectorsReportElement(
      {this.id, this.clean, this.prize, this.wins, this.loses, this.salary});

  factory _$_GeneralCollectorsReportElement.fromJson(
          Map<String, dynamic> json) =>
      _$$_GeneralCollectorsReportElementFromJson(json);

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
    return 'GeneralCollectorsReportElement(id: $id, clean: $clean, prize: $prize, wins: $wins, loses: $loses, salary: $salary)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GeneralCollectorsReportElement &&
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
  _$$_GeneralCollectorsReportElementCopyWith<_$_GeneralCollectorsReportElement>
      get copyWith => __$$_GeneralCollectorsReportElementCopyWithImpl<
          _$_GeneralCollectorsReportElement>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GeneralCollectorsReportElementToJson(
      this,
    );
  }
}

abstract class _GeneralCollectorsReportElement
    implements GeneralCollectorsReportElement {
  const factory _GeneralCollectorsReportElement(
      {final String? id,
      final int? clean,
      final int? prize,
      final int? wins,
      final int? loses,
      final int? salary}) = _$_GeneralCollectorsReportElement;

  factory _GeneralCollectorsReportElement.fromJson(Map<String, dynamic> json) =
      _$_GeneralCollectorsReportElement.fromJson;

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
  _$$_GeneralCollectorsReportElementCopyWith<_$_GeneralCollectorsReportElement>
      get copyWith => throw _privateConstructorUsedError;
}
