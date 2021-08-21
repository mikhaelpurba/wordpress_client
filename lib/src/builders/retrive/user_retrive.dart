import 'package:dio/src/cancel_token.dart';

import '../../authorization/authorization_base.dart';
import '../../enums.dart';
import '../../responses/user_response.dart';
import '../../utilities/callback.dart';
import '../../utilities/helpers.dart';
import '../../utilities/pair.dart';
import '../request.dart';
import '../request_builder_base.dart';

class UserRetriveBuilder implements IQueryBuilder<UserRetriveBuilder, User> {
  @override
  IAuthorization? authorization;

  @override
  CancelToken? cancelToken;

  @override
  String? endpoint;

  @override
  List<Pair<String, String>>? headers;

  @override
  List<Pair<String, String>>? queryParameters;

  @override
  bool Function(User)? responseValidationDelegate;

  @override
  Callback? callback;

  String? _context;

  UserRetriveBuilder withUserId(int? id) {
    endpoint = '$endpoint/$id';
    return this;
  }

  UserRetriveBuilder withContext(FilterContext context) {
    _context = context.toString().split('.').last.toLowerCase();
    return this;
  }

  @override
  Request<User> build() {
    return new Request<User>(
      endpoint,
      queryParams: _parseQueryParameters(),
      callback: callback,
      headers: headers,
      formBody: null,
      authorization: authorization,
      cancelToken: cancelToken,
      validationDelegate: responseValidationDelegate,
      httpMethod: HttpMethod.GET,
    );
  }

  Map<String, String?> _parseQueryParameters() {
    return {
      if (!isNullOrEmpty(_context)) 'context': _context,
    };
  }

  @override
  UserRetriveBuilder initializeWithDefaultValues() => this;

  @override
  UserRetriveBuilder withAuthorization(IAuthorization auth) {
    authorization = auth;
    return this;
  }

  @override
  UserRetriveBuilder withCancellationToken(CancelToken token) {
    cancelToken = token;
    return this;
  }

  @override
  UserRetriveBuilder withEndpoint(String newEndpoint) {
    endpoint = newEndpoint;
    return this;
  }

  @override
  UserRetriveBuilder withHeaders(Iterable<Pair<String, String>> customHeaders) {
    headers ??= [];
    headers!.addAll(customHeaders);
    return this;
  }

  @override
  UserRetriveBuilder withQueryParameters(
      Iterable<Pair<String, String>> extraQueryParameters) {
    queryParameters ??= [];
    queryParameters!.addAll(extraQueryParameters);
    return this;
  }

  @override
  UserRetriveBuilder withResponseValidationOverride(
      bool Function(User) responseDelegate) {
    responseValidationDelegate = responseDelegate;
    return this;
  }

  @override
  UserRetriveBuilder withCallback(Callback requestCallback) {
    callback = requestCallback;
    return this;
  }
}
