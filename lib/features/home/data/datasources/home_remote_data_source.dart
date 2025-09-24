import '../../../../core/api/dio_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/services/firestore_service.dart';
import '../../domain/entities/suggested_user_entity.dart';
import '../models/post_model.dart';
import '../models/suggested_user_model/suggested_user_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<SuggestedUserEntity>> getSuggestedUsers();

  Future<void> createPost({required PostModel post});
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final DioConsumer dioConsumer;

  HomeRemoteDataSourceImpl({required this.dioConsumer});

  @override
  Future<List<SuggestedUserEntity>> getSuggestedUsers() async {
    final response = await dioConsumer.get(path: EndPoints.suggestedUsers);

    final List<SuggestedUserEntity> suggestedUsers = [];

    for (var user in response['users']) {
      suggestedUsers.add(SuggestedUserModel.fromJson(user));
    }
    return suggestedUsers;
  }

  @override
  Future<void> createPost({required PostModel post}) async {
    await FirestoreService.createPost(post);
  }
}
