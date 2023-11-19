// import 'package:injectable/injectable.dart';
// import 'package:wankar/domain/acount/index.dart';
// import 'package:wankar/infrastructure/acount/graphql/mutations.dart';
// import 'package:wankar/infrastructure/auth/dtos/success_dto/success_dto.dart';
// import 'package:wankar/infrastructure/auth/dtos/user_dto/user_dto.dart';
// import 'package:wankar/infrastructure/auth/graphql/queries.dart';
// import 'package:wankar/infrastructure/core/network_handler.dart';
//
// @injectable
// class AccountRemoteDataSource {
//   final NetworkHandler networkHandler;
//
//   AccountRemoteDataSource({required this.networkHandler});
//
//   Future<UserDto> meUser() async {
//     final result =
//         await networkHandler.callQuery(query: SignQueries.getTypeByUsername);
//
//     final r = UserDto.fromJson(
//       result!['me'][0] as Map<String, dynamic>,
//     );
//     return r;
//   }
//
//   /// update phone
//   Future<SuccessDto> updateUserPhone(UserEntity user) async {
//     final result = await networkHandler.callMutation(
//       mutation: AccountMutations.updateAccountPhone,
//       runMutation: {'usuario': user.id, 'celular': user.phone},
//     );
//
//     if (result.isNotEmpty != true) SuccessDto.empty();
//     final r = result.isNotEmpty == true
//         ? SuccessDto.fromJson(result['setUserCelular'] as Map<String, dynamic>)
//         : SuccessDto.empty();
//     return r;
//   }
// }
