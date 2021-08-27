import 'dart:async';

import '../../wordpress_client.dart';
import '../builders_import.dart';
import '../operations/delete.dart';
import '../operations/retrive.dart';
import '../operations/update.dart';
import '../responses/response_container.dart';
import '../responses/user_response.dart';
import 'interface_base.dart';

class MeInterface extends IInterface
    implements IDeleteOperation<User, MeDeleteBuilder>, IRetriveOperation<User, MeRetriveBuilder>, IUpdateOperation<User, MeUpdateBuilder> {
  @override
  Future<ResponseContainer<User?>> delete(Request<User>? Function(MeDeleteBuilder) builder, {bool shouldWaitWhileClientBusy = false}) async {
    return (shouldWaitWhileClientBusy ? await getInternalRequesterWhenFree() : internalRequester).deleteRequest<User>(
      User(),
      builder(
        MeDeleteBuilder().withEndpoint('users').initializeWithDefaultValues(),
      ),
    );
  }

  @override
  Future<ResponseContainer<User?>> retrive(Request<User>? Function(MeRetriveBuilder) builder, {bool shouldWaitWhileClientBusy = false}) async {
    return (shouldWaitWhileClientBusy ? await getInternalRequesterWhenFree() : internalRequester).retriveRequest<User>(
      User(),
      builder(
        MeRetriveBuilder().withEndpoint('users').initializeWithDefaultValues(),
      ),
    );
  }

  @override
  Future<ResponseContainer<User?>> update(Request<User>? Function(MeUpdateBuilder) builder, {bool shouldWaitWhileClientBusy = false}) async {
    return (shouldWaitWhileClientBusy ? await getInternalRequesterWhenFree() : internalRequester).updateRequest<User>(
      User(),
      builder(
        MeUpdateBuilder().withEndpoint('users').initializeWithDefaultValues(),
      ),
    );
  }
}
