import 'dart:async';

import '../../operations.dart';
import '../../requests.dart';
import '../../responses.dart';
import '../../wordpress_client.dart';

class CommentInterface extends IInterface
    with
        ICreate<Comment, CreateCommentRequest>,
        IDelete<Comment, DeleteCommentRequest>,
        IRetrive<Comment, RetriveCommentRequest>,
        IUpdate<Comment, UpdateCommentRequest>,
        IList<Comment, ListCommentRequest> {
  @override
  Future<WordpressResponse<Comment?>> create(
    WordpressRequest<CreateCommentRequest> request,
  ) async {
    return internalRequester.createRequest<Comment>(request);
  }

  @override
  Future<WordpressResponse<Comment?>> delete(
    WordpressRequest<DeleteCommentRequest> request,
  ) async {
    return internalRequester.deleteRequest<Comment>(request);
  }

  @override
  Future<WordpressResponse<List<Comment>?>> list(
    WordpressRequest<ListCommentRequest> request,
  ) async {
    return internalRequester.listRequest<Comment>(request);
  }

  @override
  Future<WordpressResponse<Comment?>> retrive(
    WordpressRequest<RetriveCommentRequest> request,
  ) async {
    return internalRequester.retriveRequest<Comment>(request);
  }

  @override
  Future<WordpressResponse<Comment?>> update(
    WordpressRequest<UpdateCommentRequest> request,
  ) async {
    return internalRequester.updateRequest<Comment>(request);
  }
}
