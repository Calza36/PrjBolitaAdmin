// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'rule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Rule _$RuleFromJson(Map<String, dynamic> json) {
  return _Rule.fromJson(json);
}

/// @nodoc
mixin _$Rule {
  List<RuleElement>? get rules => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RuleCopyWith<Rule> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RuleCopyWith<$Res> {
  factory $RuleCopyWith(Rule value, $Res Function(Rule) then) =
      _$RuleCopyWithImpl<$Res, Rule>;
  @useResult
  $Res call({List<RuleElement>? rules});
}

/// @nodoc
class _$RuleCopyWithImpl<$Res, $Val extends Rule>
    implements $RuleCopyWith<$Res> {
  _$RuleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rules = freezed,
  }) {
    return _then(_value.copyWith(
      rules: freezed == rules
          ? _value.rules
          : rules // ignore: cast_nullable_to_non_nullable
              as List<RuleElement>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RuleCopyWith<$Res> implements $RuleCopyWith<$Res> {
  factory _$$_RuleCopyWith(_$_Rule value, $Res Function(_$_Rule) then) =
      __$$_RuleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<RuleElement>? rules});
}

/// @nodoc
class __$$_RuleCopyWithImpl<$Res> extends _$RuleCopyWithImpl<$Res, _$_Rule>
    implements _$$_RuleCopyWith<$Res> {
  __$$_RuleCopyWithImpl(_$_Rule _value, $Res Function(_$_Rule) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rules = freezed,
  }) {
    return _then(_$_Rule(
      rules: freezed == rules
          ? _value._rules
          : rules // ignore: cast_nullable_to_non_nullable
              as List<RuleElement>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Rule implements _Rule {
  const _$_Rule({final List<RuleElement>? rules}) : _rules = rules;

  factory _$_Rule.fromJson(Map<String, dynamic> json) => _$$_RuleFromJson(json);

  final List<RuleElement>? _rules;
  @override
  List<RuleElement>? get rules {
    final value = _rules;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Rule(rules: $rules)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Rule &&
            const DeepCollectionEquality().equals(other._rules, _rules));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_rules));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RuleCopyWith<_$_Rule> get copyWith =>
      __$$_RuleCopyWithImpl<_$_Rule>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RuleToJson(
      this,
    );
  }
}

abstract class _Rule implements Rule {
  const factory _Rule({final List<RuleElement>? rules}) = _$_Rule;

  factory _Rule.fromJson(Map<String, dynamic> json) = _$_Rule.fromJson;

  @override
  List<RuleElement>? get rules;
  @override
  @JsonKey(ignore: true)
  _$$_RuleCopyWith<_$_Rule> get copyWith => throw _privateConstructorUsedError;
}

RuleElement _$RuleElementFromJson(Map<String, dynamic> json) {
  return _RuleElement.fromJson(json);
}

/// @nodoc
mixin _$RuleElement {
  String? get id => throw _privateConstructorUsedError;
  bool? get isGeneral => throw _privateConstructorUsedError;
  bool? get isActive => throw _privateConstructorUsedError;
  int? get fixedPay => throw _privateConstructorUsedError;
  int? get runningPay => throw _privateConstructorUsedError;
  int? get parletPay => throw _privateConstructorUsedError;
  int? get centPay => throw _privateConstructorUsedError;
  int? get limitFixedPay => throw _privateConstructorUsedError;
  int? get limitRunningPay => throw _privateConstructorUsedError;
  int? get limitParletPay => throw _privateConstructorUsedError;
  List<String>? get footCollectors => throw _privateConstructorUsedError;
  TurnsLimits? get turnsLimits => throw _privateConstructorUsedError;
  int? get maxCentBet => throw _privateConstructorUsedError;
  int? get maxFixedBet => throw _privateConstructorUsedError;
  int? get maxParletBet => throw _privateConstructorUsedError;
  int? get maxRunningBet => throw _privateConstructorUsedError;
  int? get footCollectorPaymentPerCent => throw _privateConstructorUsedError;
  int? get footCollectorPaymentPerFixed => throw _privateConstructorUsedError;
  int? get footCollectorPaymentPerParlet => throw _privateConstructorUsedError;
  int? get footCollectorPaymentPerRunning => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RuleElementCopyWith<RuleElement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RuleElementCopyWith<$Res> {
  factory $RuleElementCopyWith(
          RuleElement value, $Res Function(RuleElement) then) =
      _$RuleElementCopyWithImpl<$Res, RuleElement>;
  @useResult
  $Res call(
      {String? id,
      bool? isGeneral,
      bool? isActive,
      int? fixedPay,
      int? runningPay,
      int? parletPay,
      int? centPay,
      int? limitFixedPay,
      int? limitRunningPay,
      int? limitParletPay,
      List<String>? footCollectors,
      TurnsLimits? turnsLimits,
      int? maxCentBet,
      int? maxFixedBet,
      int? maxParletBet,
      int? maxRunningBet,
      int? footCollectorPaymentPerCent,
      int? footCollectorPaymentPerFixed,
      int? footCollectorPaymentPerParlet,
      int? footCollectorPaymentPerRunning,
      DateTime? updatedAt,
      String? name});

  $TurnsLimitsCopyWith<$Res>? get turnsLimits;
}

/// @nodoc
class _$RuleElementCopyWithImpl<$Res, $Val extends RuleElement>
    implements $RuleElementCopyWith<$Res> {
  _$RuleElementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? isGeneral = freezed,
    Object? isActive = freezed,
    Object? fixedPay = freezed,
    Object? runningPay = freezed,
    Object? parletPay = freezed,
    Object? centPay = freezed,
    Object? limitFixedPay = freezed,
    Object? limitRunningPay = freezed,
    Object? limitParletPay = freezed,
    Object? footCollectors = freezed,
    Object? turnsLimits = freezed,
    Object? maxCentBet = freezed,
    Object? maxFixedBet = freezed,
    Object? maxParletBet = freezed,
    Object? maxRunningBet = freezed,
    Object? footCollectorPaymentPerCent = freezed,
    Object? footCollectorPaymentPerFixed = freezed,
    Object? footCollectorPaymentPerParlet = freezed,
    Object? footCollectorPaymentPerRunning = freezed,
    Object? updatedAt = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      isGeneral: freezed == isGeneral
          ? _value.isGeneral
          : isGeneral // ignore: cast_nullable_to_non_nullable
              as bool?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      fixedPay: freezed == fixedPay
          ? _value.fixedPay
          : fixedPay // ignore: cast_nullable_to_non_nullable
              as int?,
      runningPay: freezed == runningPay
          ? _value.runningPay
          : runningPay // ignore: cast_nullable_to_non_nullable
              as int?,
      parletPay: freezed == parletPay
          ? _value.parletPay
          : parletPay // ignore: cast_nullable_to_non_nullable
              as int?,
      centPay: freezed == centPay
          ? _value.centPay
          : centPay // ignore: cast_nullable_to_non_nullable
              as int?,
      limitFixedPay: freezed == limitFixedPay
          ? _value.limitFixedPay
          : limitFixedPay // ignore: cast_nullable_to_non_nullable
              as int?,
      limitRunningPay: freezed == limitRunningPay
          ? _value.limitRunningPay
          : limitRunningPay // ignore: cast_nullable_to_non_nullable
              as int?,
      limitParletPay: freezed == limitParletPay
          ? _value.limitParletPay
          : limitParletPay // ignore: cast_nullable_to_non_nullable
              as int?,
      footCollectors: freezed == footCollectors
          ? _value.footCollectors
          : footCollectors // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      turnsLimits: freezed == turnsLimits
          ? _value.turnsLimits
          : turnsLimits // ignore: cast_nullable_to_non_nullable
              as TurnsLimits?,
      maxCentBet: freezed == maxCentBet
          ? _value.maxCentBet
          : maxCentBet // ignore: cast_nullable_to_non_nullable
              as int?,
      maxFixedBet: freezed == maxFixedBet
          ? _value.maxFixedBet
          : maxFixedBet // ignore: cast_nullable_to_non_nullable
              as int?,
      maxParletBet: freezed == maxParletBet
          ? _value.maxParletBet
          : maxParletBet // ignore: cast_nullable_to_non_nullable
              as int?,
      maxRunningBet: freezed == maxRunningBet
          ? _value.maxRunningBet
          : maxRunningBet // ignore: cast_nullable_to_non_nullable
              as int?,
      footCollectorPaymentPerCent: freezed == footCollectorPaymentPerCent
          ? _value.footCollectorPaymentPerCent
          : footCollectorPaymentPerCent // ignore: cast_nullable_to_non_nullable
              as int?,
      footCollectorPaymentPerFixed: freezed == footCollectorPaymentPerFixed
          ? _value.footCollectorPaymentPerFixed
          : footCollectorPaymentPerFixed // ignore: cast_nullable_to_non_nullable
              as int?,
      footCollectorPaymentPerParlet: freezed == footCollectorPaymentPerParlet
          ? _value.footCollectorPaymentPerParlet
          : footCollectorPaymentPerParlet // ignore: cast_nullable_to_non_nullable
              as int?,
      footCollectorPaymentPerRunning: freezed == footCollectorPaymentPerRunning
          ? _value.footCollectorPaymentPerRunning
          : footCollectorPaymentPerRunning // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TurnsLimitsCopyWith<$Res>? get turnsLimits {
    if (_value.turnsLimits == null) {
      return null;
    }

    return $TurnsLimitsCopyWith<$Res>(_value.turnsLimits!, (value) {
      return _then(_value.copyWith(turnsLimits: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_RuleElementCopyWith<$Res>
    implements $RuleElementCopyWith<$Res> {
  factory _$$_RuleElementCopyWith(
          _$_RuleElement value, $Res Function(_$_RuleElement) then) =
      __$$_RuleElementCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      bool? isGeneral,
      bool? isActive,
      int? fixedPay,
      int? runningPay,
      int? parletPay,
      int? centPay,
      int? limitFixedPay,
      int? limitRunningPay,
      int? limitParletPay,
      List<String>? footCollectors,
      TurnsLimits? turnsLimits,
      int? maxCentBet,
      int? maxFixedBet,
      int? maxParletBet,
      int? maxRunningBet,
      int? footCollectorPaymentPerCent,
      int? footCollectorPaymentPerFixed,
      int? footCollectorPaymentPerParlet,
      int? footCollectorPaymentPerRunning,
      DateTime? updatedAt,
      String? name});

  @override
  $TurnsLimitsCopyWith<$Res>? get turnsLimits;
}

/// @nodoc
class __$$_RuleElementCopyWithImpl<$Res>
    extends _$RuleElementCopyWithImpl<$Res, _$_RuleElement>
    implements _$$_RuleElementCopyWith<$Res> {
  __$$_RuleElementCopyWithImpl(
      _$_RuleElement _value, $Res Function(_$_RuleElement) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? isGeneral = freezed,
    Object? isActive = freezed,
    Object? fixedPay = freezed,
    Object? runningPay = freezed,
    Object? parletPay = freezed,
    Object? centPay = freezed,
    Object? limitFixedPay = freezed,
    Object? limitRunningPay = freezed,
    Object? limitParletPay = freezed,
    Object? footCollectors = freezed,
    Object? turnsLimits = freezed,
    Object? maxCentBet = freezed,
    Object? maxFixedBet = freezed,
    Object? maxParletBet = freezed,
    Object? maxRunningBet = freezed,
    Object? footCollectorPaymentPerCent = freezed,
    Object? footCollectorPaymentPerFixed = freezed,
    Object? footCollectorPaymentPerParlet = freezed,
    Object? footCollectorPaymentPerRunning = freezed,
    Object? updatedAt = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_RuleElement(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      isGeneral: freezed == isGeneral
          ? _value.isGeneral
          : isGeneral // ignore: cast_nullable_to_non_nullable
              as bool?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      fixedPay: freezed == fixedPay
          ? _value.fixedPay
          : fixedPay // ignore: cast_nullable_to_non_nullable
              as int?,
      runningPay: freezed == runningPay
          ? _value.runningPay
          : runningPay // ignore: cast_nullable_to_non_nullable
              as int?,
      parletPay: freezed == parletPay
          ? _value.parletPay
          : parletPay // ignore: cast_nullable_to_non_nullable
              as int?,
      centPay: freezed == centPay
          ? _value.centPay
          : centPay // ignore: cast_nullable_to_non_nullable
              as int?,
      limitFixedPay: freezed == limitFixedPay
          ? _value.limitFixedPay
          : limitFixedPay // ignore: cast_nullable_to_non_nullable
              as int?,
      limitRunningPay: freezed == limitRunningPay
          ? _value.limitRunningPay
          : limitRunningPay // ignore: cast_nullable_to_non_nullable
              as int?,
      limitParletPay: freezed == limitParletPay
          ? _value.limitParletPay
          : limitParletPay // ignore: cast_nullable_to_non_nullable
              as int?,
      footCollectors: freezed == footCollectors
          ? _value._footCollectors
          : footCollectors // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      turnsLimits: freezed == turnsLimits
          ? _value.turnsLimits
          : turnsLimits // ignore: cast_nullable_to_non_nullable
              as TurnsLimits?,
      maxCentBet: freezed == maxCentBet
          ? _value.maxCentBet
          : maxCentBet // ignore: cast_nullable_to_non_nullable
              as int?,
      maxFixedBet: freezed == maxFixedBet
          ? _value.maxFixedBet
          : maxFixedBet // ignore: cast_nullable_to_non_nullable
              as int?,
      maxParletBet: freezed == maxParletBet
          ? _value.maxParletBet
          : maxParletBet // ignore: cast_nullable_to_non_nullable
              as int?,
      maxRunningBet: freezed == maxRunningBet
          ? _value.maxRunningBet
          : maxRunningBet // ignore: cast_nullable_to_non_nullable
              as int?,
      footCollectorPaymentPerCent: freezed == footCollectorPaymentPerCent
          ? _value.footCollectorPaymentPerCent
          : footCollectorPaymentPerCent // ignore: cast_nullable_to_non_nullable
              as int?,
      footCollectorPaymentPerFixed: freezed == footCollectorPaymentPerFixed
          ? _value.footCollectorPaymentPerFixed
          : footCollectorPaymentPerFixed // ignore: cast_nullable_to_non_nullable
              as int?,
      footCollectorPaymentPerParlet: freezed == footCollectorPaymentPerParlet
          ? _value.footCollectorPaymentPerParlet
          : footCollectorPaymentPerParlet // ignore: cast_nullable_to_non_nullable
              as int?,
      footCollectorPaymentPerRunning: freezed == footCollectorPaymentPerRunning
          ? _value.footCollectorPaymentPerRunning
          : footCollectorPaymentPerRunning // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RuleElement implements _RuleElement {
  const _$_RuleElement(
      {this.id,
      this.isGeneral,
      this.isActive,
      this.fixedPay,
      this.runningPay,
      this.parletPay,
      this.centPay,
      this.limitFixedPay,
      this.limitRunningPay,
      this.limitParletPay,
      final List<String>? footCollectors,
      this.turnsLimits,
      this.maxCentBet,
      this.maxFixedBet,
      this.maxParletBet,
      this.maxRunningBet,
      this.footCollectorPaymentPerCent,
      this.footCollectorPaymentPerFixed,
      this.footCollectorPaymentPerParlet,
      this.footCollectorPaymentPerRunning,
      this.updatedAt,
      this.name})
      : _footCollectors = footCollectors;

  factory _$_RuleElement.fromJson(Map<String, dynamic> json) =>
      _$$_RuleElementFromJson(json);

  @override
  final String? id;
  @override
  final bool? isGeneral;
  @override
  final bool? isActive;
  @override
  final int? fixedPay;
  @override
  final int? runningPay;
  @override
  final int? parletPay;
  @override
  final int? centPay;
  @override
  final int? limitFixedPay;
  @override
  final int? limitRunningPay;
  @override
  final int? limitParletPay;
  final List<String>? _footCollectors;
  @override
  List<String>? get footCollectors {
    final value = _footCollectors;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final TurnsLimits? turnsLimits;
  @override
  final int? maxCentBet;
  @override
  final int? maxFixedBet;
  @override
  final int? maxParletBet;
  @override
  final int? maxRunningBet;
  @override
  final int? footCollectorPaymentPerCent;
  @override
  final int? footCollectorPaymentPerFixed;
  @override
  final int? footCollectorPaymentPerParlet;
  @override
  final int? footCollectorPaymentPerRunning;
  @override
  final DateTime? updatedAt;
  @override
  final String? name;

  @override
  String toString() {
    return 'RuleElement(id: $id, isGeneral: $isGeneral, isActive: $isActive, fixedPay: $fixedPay, runningPay: $runningPay, parletPay: $parletPay, centPay: $centPay, limitFixedPay: $limitFixedPay, limitRunningPay: $limitRunningPay, limitParletPay: $limitParletPay, footCollectors: $footCollectors, turnsLimits: $turnsLimits, maxCentBet: $maxCentBet, maxFixedBet: $maxFixedBet, maxParletBet: $maxParletBet, maxRunningBet: $maxRunningBet, footCollectorPaymentPerCent: $footCollectorPaymentPerCent, footCollectorPaymentPerFixed: $footCollectorPaymentPerFixed, footCollectorPaymentPerParlet: $footCollectorPaymentPerParlet, footCollectorPaymentPerRunning: $footCollectorPaymentPerRunning, updatedAt: $updatedAt, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RuleElement &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isGeneral, isGeneral) ||
                other.isGeneral == isGeneral) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.fixedPay, fixedPay) ||
                other.fixedPay == fixedPay) &&
            (identical(other.runningPay, runningPay) ||
                other.runningPay == runningPay) &&
            (identical(other.parletPay, parletPay) ||
                other.parletPay == parletPay) &&
            (identical(other.centPay, centPay) || other.centPay == centPay) &&
            (identical(other.limitFixedPay, limitFixedPay) ||
                other.limitFixedPay == limitFixedPay) &&
            (identical(other.limitRunningPay, limitRunningPay) ||
                other.limitRunningPay == limitRunningPay) &&
            (identical(other.limitParletPay, limitParletPay) ||
                other.limitParletPay == limitParletPay) &&
            const DeepCollectionEquality()
                .equals(other._footCollectors, _footCollectors) &&
            (identical(other.turnsLimits, turnsLimits) ||
                other.turnsLimits == turnsLimits) &&
            (identical(other.maxCentBet, maxCentBet) ||
                other.maxCentBet == maxCentBet) &&
            (identical(other.maxFixedBet, maxFixedBet) ||
                other.maxFixedBet == maxFixedBet) &&
            (identical(other.maxParletBet, maxParletBet) ||
                other.maxParletBet == maxParletBet) &&
            (identical(other.maxRunningBet, maxRunningBet) ||
                other.maxRunningBet == maxRunningBet) &&
            (identical(other.footCollectorPaymentPerCent,
                    footCollectorPaymentPerCent) ||
                other.footCollectorPaymentPerCent ==
                    footCollectorPaymentPerCent) &&
            (identical(other.footCollectorPaymentPerFixed,
                    footCollectorPaymentPerFixed) ||
                other.footCollectorPaymentPerFixed ==
                    footCollectorPaymentPerFixed) &&
            (identical(other.footCollectorPaymentPerParlet,
                    footCollectorPaymentPerParlet) ||
                other.footCollectorPaymentPerParlet ==
                    footCollectorPaymentPerParlet) &&
            (identical(other.footCollectorPaymentPerRunning,
                    footCollectorPaymentPerRunning) ||
                other.footCollectorPaymentPerRunning ==
                    footCollectorPaymentPerRunning) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        isGeneral,
        isActive,
        fixedPay,
        runningPay,
        parletPay,
        centPay,
        limitFixedPay,
        limitRunningPay,
        limitParletPay,
        const DeepCollectionEquality().hash(_footCollectors),
        turnsLimits,
        maxCentBet,
        maxFixedBet,
        maxParletBet,
        maxRunningBet,
        footCollectorPaymentPerCent,
        footCollectorPaymentPerFixed,
        footCollectorPaymentPerParlet,
        footCollectorPaymentPerRunning,
        updatedAt,
        name
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RuleElementCopyWith<_$_RuleElement> get copyWith =>
      __$$_RuleElementCopyWithImpl<_$_RuleElement>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RuleElementToJson(
      this,
    );
  }
}

abstract class _RuleElement implements RuleElement {
  const factory _RuleElement(
      {final String? id,
      final bool? isGeneral,
      final bool? isActive,
      final int? fixedPay,
      final int? runningPay,
      final int? parletPay,
      final int? centPay,
      final int? limitFixedPay,
      final int? limitRunningPay,
      final int? limitParletPay,
      final List<String>? footCollectors,
      final TurnsLimits? turnsLimits,
      final int? maxCentBet,
      final int? maxFixedBet,
      final int? maxParletBet,
      final int? maxRunningBet,
      final int? footCollectorPaymentPerCent,
      final int? footCollectorPaymentPerFixed,
      final int? footCollectorPaymentPerParlet,
      final int? footCollectorPaymentPerRunning,
      final DateTime? updatedAt,
      final String? name}) = _$_RuleElement;

  factory _RuleElement.fromJson(Map<String, dynamic> json) =
      _$_RuleElement.fromJson;

  @override
  String? get id;
  @override
  bool? get isGeneral;
  @override
  bool? get isActive;
  @override
  int? get fixedPay;
  @override
  int? get runningPay;
  @override
  int? get parletPay;
  @override
  int? get centPay;
  @override
  int? get limitFixedPay;
  @override
  int? get limitRunningPay;
  @override
  int? get limitParletPay;
  @override
  List<String>? get footCollectors;
  @override
  TurnsLimits? get turnsLimits;
  @override
  int? get maxCentBet;
  @override
  int? get maxFixedBet;
  @override
  int? get maxParletBet;
  @override
  int? get maxRunningBet;
  @override
  int? get footCollectorPaymentPerCent;
  @override
  int? get footCollectorPaymentPerFixed;
  @override
  int? get footCollectorPaymentPerParlet;
  @override
  int? get footCollectorPaymentPerRunning;
  @override
  DateTime? get updatedAt;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$_RuleElementCopyWith<_$_RuleElement> get copyWith =>
      throw _privateConstructorUsedError;
}

TurnsLimits _$TurnsLimitsFromJson(Map<String, dynamic> json) {
  return _TurnsLimits.fromJson(json);
}

/// @nodoc
mixin _$TurnsLimits {
  Day? get day => throw _privateConstructorUsedError;
  Day? get night => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TurnsLimitsCopyWith<TurnsLimits> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TurnsLimitsCopyWith<$Res> {
  factory $TurnsLimitsCopyWith(
          TurnsLimits value, $Res Function(TurnsLimits) then) =
      _$TurnsLimitsCopyWithImpl<$Res, TurnsLimits>;
  @useResult
  $Res call({Day? day, Day? night, String? id});

  $DayCopyWith<$Res>? get day;
  $DayCopyWith<$Res>? get night;
}

/// @nodoc
class _$TurnsLimitsCopyWithImpl<$Res, $Val extends TurnsLimits>
    implements $TurnsLimitsCopyWith<$Res> {
  _$TurnsLimitsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = freezed,
    Object? night = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      day: freezed == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as Day?,
      night: freezed == night
          ? _value.night
          : night // ignore: cast_nullable_to_non_nullable
              as Day?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DayCopyWith<$Res>? get day {
    if (_value.day == null) {
      return null;
    }

    return $DayCopyWith<$Res>(_value.day!, (value) {
      return _then(_value.copyWith(day: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DayCopyWith<$Res>? get night {
    if (_value.night == null) {
      return null;
    }

    return $DayCopyWith<$Res>(_value.night!, (value) {
      return _then(_value.copyWith(night: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TurnsLimitsCopyWith<$Res>
    implements $TurnsLimitsCopyWith<$Res> {
  factory _$$_TurnsLimitsCopyWith(
          _$_TurnsLimits value, $Res Function(_$_TurnsLimits) then) =
      __$$_TurnsLimitsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Day? day, Day? night, String? id});

  @override
  $DayCopyWith<$Res>? get day;
  @override
  $DayCopyWith<$Res>? get night;
}

/// @nodoc
class __$$_TurnsLimitsCopyWithImpl<$Res>
    extends _$TurnsLimitsCopyWithImpl<$Res, _$_TurnsLimits>
    implements _$$_TurnsLimitsCopyWith<$Res> {
  __$$_TurnsLimitsCopyWithImpl(
      _$_TurnsLimits _value, $Res Function(_$_TurnsLimits) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = freezed,
    Object? night = freezed,
    Object? id = freezed,
  }) {
    return _then(_$_TurnsLimits(
      day: freezed == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as Day?,
      night: freezed == night
          ? _value.night
          : night // ignore: cast_nullable_to_non_nullable
              as Day?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TurnsLimits implements _TurnsLimits {
  const _$_TurnsLimits({this.day, this.night, this.id});

  factory _$_TurnsLimits.fromJson(Map<String, dynamic> json) =>
      _$$_TurnsLimitsFromJson(json);

  @override
  final Day? day;
  @override
  final Day? night;
  @override
  final String? id;

  @override
  String toString() {
    return 'TurnsLimits(day: $day, night: $night, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TurnsLimits &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.night, night) || other.night == night) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, day, night, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TurnsLimitsCopyWith<_$_TurnsLimits> get copyWith =>
      __$$_TurnsLimitsCopyWithImpl<_$_TurnsLimits>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TurnsLimitsToJson(
      this,
    );
  }
}

abstract class _TurnsLimits implements TurnsLimits {
  const factory _TurnsLimits(
      {final Day? day, final Day? night, final String? id}) = _$_TurnsLimits;

  factory _TurnsLimits.fromJson(Map<String, dynamic> json) =
      _$_TurnsLimits.fromJson;

  @override
  Day? get day;
  @override
  Day? get night;
  @override
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$_TurnsLimitsCopyWith<_$_TurnsLimits> get copyWith =>
      throw _privateConstructorUsedError;
}

Day _$DayFromJson(Map<String, dynamic> json) {
  return _Day.fromJson(json);
}

/// @nodoc
mixin _$Day {
  int? get startHour => throw _privateConstructorUsedError;
  int? get startMinute => throw _privateConstructorUsedError;
  int? get endHour => throw _privateConstructorUsedError;
  int? get endMinute => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DayCopyWith<Day> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DayCopyWith<$Res> {
  factory $DayCopyWith(Day value, $Res Function(Day) then) =
      _$DayCopyWithImpl<$Res, Day>;
  @useResult
  $Res call({int? startHour, int? startMinute, int? endHour, int? endMinute});
}

/// @nodoc
class _$DayCopyWithImpl<$Res, $Val extends Day> implements $DayCopyWith<$Res> {
  _$DayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startHour = freezed,
    Object? startMinute = freezed,
    Object? endHour = freezed,
    Object? endMinute = freezed,
  }) {
    return _then(_value.copyWith(
      startHour: freezed == startHour
          ? _value.startHour
          : startHour // ignore: cast_nullable_to_non_nullable
              as int?,
      startMinute: freezed == startMinute
          ? _value.startMinute
          : startMinute // ignore: cast_nullable_to_non_nullable
              as int?,
      endHour: freezed == endHour
          ? _value.endHour
          : endHour // ignore: cast_nullable_to_non_nullable
              as int?,
      endMinute: freezed == endMinute
          ? _value.endMinute
          : endMinute // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DayCopyWith<$Res> implements $DayCopyWith<$Res> {
  factory _$$_DayCopyWith(_$_Day value, $Res Function(_$_Day) then) =
      __$$_DayCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? startHour, int? startMinute, int? endHour, int? endMinute});
}

/// @nodoc
class __$$_DayCopyWithImpl<$Res> extends _$DayCopyWithImpl<$Res, _$_Day>
    implements _$$_DayCopyWith<$Res> {
  __$$_DayCopyWithImpl(_$_Day _value, $Res Function(_$_Day) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startHour = freezed,
    Object? startMinute = freezed,
    Object? endHour = freezed,
    Object? endMinute = freezed,
  }) {
    return _then(_$_Day(
      startHour: freezed == startHour
          ? _value.startHour
          : startHour // ignore: cast_nullable_to_non_nullable
              as int?,
      startMinute: freezed == startMinute
          ? _value.startMinute
          : startMinute // ignore: cast_nullable_to_non_nullable
              as int?,
      endHour: freezed == endHour
          ? _value.endHour
          : endHour // ignore: cast_nullable_to_non_nullable
              as int?,
      endMinute: freezed == endMinute
          ? _value.endMinute
          : endMinute // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Day implements _Day {
  const _$_Day(
      {this.startHour, this.startMinute, this.endHour, this.endMinute});

  factory _$_Day.fromJson(Map<String, dynamic> json) => _$$_DayFromJson(json);

  @override
  final int? startHour;
  @override
  final int? startMinute;
  @override
  final int? endHour;
  @override
  final int? endMinute;

  @override
  String toString() {
    return 'Day(startHour: $startHour, startMinute: $startMinute, endHour: $endHour, endMinute: $endMinute)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Day &&
            (identical(other.startHour, startHour) ||
                other.startHour == startHour) &&
            (identical(other.startMinute, startMinute) ||
                other.startMinute == startMinute) &&
            (identical(other.endHour, endHour) || other.endHour == endHour) &&
            (identical(other.endMinute, endMinute) ||
                other.endMinute == endMinute));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, startHour, startMinute, endHour, endMinute);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DayCopyWith<_$_Day> get copyWith =>
      __$$_DayCopyWithImpl<_$_Day>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DayToJson(
      this,
    );
  }
}

abstract class _Day implements Day {
  const factory _Day(
      {final int? startHour,
      final int? startMinute,
      final int? endHour,
      final int? endMinute}) = _$_Day;

  factory _Day.fromJson(Map<String, dynamic> json) = _$_Day.fromJson;

  @override
  int? get startHour;
  @override
  int? get startMinute;
  @override
  int? get endHour;
  @override
  int? get endMinute;
  @override
  @JsonKey(ignore: true)
  _$$_DayCopyWith<_$_Day> get copyWith => throw _privateConstructorUsedError;
}
