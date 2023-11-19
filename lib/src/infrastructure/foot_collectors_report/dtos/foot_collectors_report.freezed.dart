// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'foot_collectors_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FootCollectorsReport _$FootCollectorsReportFromJson(Map<String, dynamic> json) {
  return _FootCollectorsReport.fromJson(json);
}

/// @nodoc
mixin _$FootCollectorsReport {
  List<FootCollectorsReportElement>? get footCollectorsReport =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FootCollectorsReportCopyWith<FootCollectorsReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FootCollectorsReportCopyWith<$Res> {
  factory $FootCollectorsReportCopyWith(FootCollectorsReport value,
          $Res Function(FootCollectorsReport) then) =
      _$FootCollectorsReportCopyWithImpl<$Res, FootCollectorsReport>;
  @useResult
  $Res call({List<FootCollectorsReportElement>? footCollectorsReport});
}

/// @nodoc
class _$FootCollectorsReportCopyWithImpl<$Res,
        $Val extends FootCollectorsReport>
    implements $FootCollectorsReportCopyWith<$Res> {
  _$FootCollectorsReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? footCollectorsReport = freezed,
  }) {
    return _then(_value.copyWith(
      footCollectorsReport: freezed == footCollectorsReport
          ? _value.footCollectorsReport
          : footCollectorsReport // ignore: cast_nullable_to_non_nullable
              as List<FootCollectorsReportElement>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FootCollectorsReportCopyWith<$Res>
    implements $FootCollectorsReportCopyWith<$Res> {
  factory _$$_FootCollectorsReportCopyWith(_$_FootCollectorsReport value,
          $Res Function(_$_FootCollectorsReport) then) =
      __$$_FootCollectorsReportCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<FootCollectorsReportElement>? footCollectorsReport});
}

/// @nodoc
class __$$_FootCollectorsReportCopyWithImpl<$Res>
    extends _$FootCollectorsReportCopyWithImpl<$Res, _$_FootCollectorsReport>
    implements _$$_FootCollectorsReportCopyWith<$Res> {
  __$$_FootCollectorsReportCopyWithImpl(_$_FootCollectorsReport _value,
      $Res Function(_$_FootCollectorsReport) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? footCollectorsReport = freezed,
  }) {
    return _then(_$_FootCollectorsReport(
      footCollectorsReport: freezed == footCollectorsReport
          ? _value._footCollectorsReport
          : footCollectorsReport // ignore: cast_nullable_to_non_nullable
              as List<FootCollectorsReportElement>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FootCollectorsReport implements _FootCollectorsReport {
  const _$_FootCollectorsReport(
      {final List<FootCollectorsReportElement>? footCollectorsReport})
      : _footCollectorsReport = footCollectorsReport;

  factory _$_FootCollectorsReport.fromJson(Map<String, dynamic> json) =>
      _$$_FootCollectorsReportFromJson(json);

  final List<FootCollectorsReportElement>? _footCollectorsReport;
  @override
  List<FootCollectorsReportElement>? get footCollectorsReport {
    final value = _footCollectorsReport;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'FootCollectorsReport(footCollectorsReport: $footCollectorsReport)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FootCollectorsReport &&
            const DeepCollectionEquality()
                .equals(other._footCollectorsReport, _footCollectorsReport));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_footCollectorsReport));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FootCollectorsReportCopyWith<_$_FootCollectorsReport> get copyWith =>
      __$$_FootCollectorsReportCopyWithImpl<_$_FootCollectorsReport>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FootCollectorsReportToJson(
      this,
    );
  }
}

abstract class _FootCollectorsReport implements FootCollectorsReport {
  const factory _FootCollectorsReport(
          {final List<FootCollectorsReportElement>? footCollectorsReport}) =
      _$_FootCollectorsReport;

  factory _FootCollectorsReport.fromJson(Map<String, dynamic> json) =
      _$_FootCollectorsReport.fromJson;

  @override
  List<FootCollectorsReportElement>? get footCollectorsReport;
  @override
  @JsonKey(ignore: true)
  _$$_FootCollectorsReportCopyWith<_$_FootCollectorsReport> get copyWith =>
      throw _privateConstructorUsedError;
}

FootCollectorsReportElement _$FootCollectorsReportElementFromJson(
    Map<String, dynamic> json) {
  return _FootCollectorsReportElement.fromJson(json);
}

/// @nodoc
mixin _$FootCollectorsReportElement {
  String? get id => throw _privateConstructorUsedError;
  int? get clean => throw _privateConstructorUsedError;
  int? get prize => throw _privateConstructorUsedError;
  int? get wins => throw _privateConstructorUsedError;
  int? get loses => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FootCollectorsReportElementCopyWith<FootCollectorsReportElement>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FootCollectorsReportElementCopyWith<$Res> {
  factory $FootCollectorsReportElementCopyWith(
          FootCollectorsReportElement value,
          $Res Function(FootCollectorsReportElement) then) =
      _$FootCollectorsReportElementCopyWithImpl<$Res,
          FootCollectorsReportElement>;
  @useResult
  $Res call({String? id, int? clean, int? prize, int? wins, int? loses});
}

/// @nodoc
class _$FootCollectorsReportElementCopyWithImpl<$Res,
        $Val extends FootCollectorsReportElement>
    implements $FootCollectorsReportElementCopyWith<$Res> {
  _$FootCollectorsReportElementCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FootCollectorsReportElementCopyWith<$Res>
    implements $FootCollectorsReportElementCopyWith<$Res> {
  factory _$$_FootCollectorsReportElementCopyWith(
          _$_FootCollectorsReportElement value,
          $Res Function(_$_FootCollectorsReportElement) then) =
      __$$_FootCollectorsReportElementCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, int? clean, int? prize, int? wins, int? loses});
}

/// @nodoc
class __$$_FootCollectorsReportElementCopyWithImpl<$Res>
    extends _$FootCollectorsReportElementCopyWithImpl<$Res,
        _$_FootCollectorsReportElement>
    implements _$$_FootCollectorsReportElementCopyWith<$Res> {
  __$$_FootCollectorsReportElementCopyWithImpl(
      _$_FootCollectorsReportElement _value,
      $Res Function(_$_FootCollectorsReportElement) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? clean = freezed,
    Object? prize = freezed,
    Object? wins = freezed,
    Object? loses = freezed,
  }) {
    return _then(_$_FootCollectorsReportElement(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FootCollectorsReportElement implements _FootCollectorsReportElement {
  const _$_FootCollectorsReportElement(
      {this.id, this.clean, this.prize, this.wins, this.loses});

  factory _$_FootCollectorsReportElement.fromJson(Map<String, dynamic> json) =>
      _$$_FootCollectorsReportElementFromJson(json);

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
  String toString() {
    return 'FootCollectorsReportElement(id: $id, clean: $clean, prize: $prize, wins: $wins, loses: $loses)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FootCollectorsReportElement &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.clean, clean) || other.clean == clean) &&
            (identical(other.prize, prize) || other.prize == prize) &&
            (identical(other.wins, wins) || other.wins == wins) &&
            (identical(other.loses, loses) || other.loses == loses));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, clean, prize, wins, loses);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FootCollectorsReportElementCopyWith<_$_FootCollectorsReportElement>
      get copyWith => __$$_FootCollectorsReportElementCopyWithImpl<
          _$_FootCollectorsReportElement>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FootCollectorsReportElementToJson(
      this,
    );
  }
}

abstract class _FootCollectorsReportElement
    implements FootCollectorsReportElement {
  const factory _FootCollectorsReportElement(
      {final String? id,
      final int? clean,
      final int? prize,
      final int? wins,
      final int? loses}) = _$_FootCollectorsReportElement;

  factory _FootCollectorsReportElement.fromJson(Map<String, dynamic> json) =
      _$_FootCollectorsReportElement.fromJson;

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
  @JsonKey(ignore: true)
  _$$_FootCollectorsReportElementCopyWith<_$_FootCollectorsReportElement>
      get copyWith => throw _privateConstructorUsedError;
}
