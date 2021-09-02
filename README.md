<div align="center">
<h1>WordpressClient</h1>
  
[pub.dev](https://pub.dev/packages/wordpress_client)

![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white) ![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white) ![WordPress](https://img.shields.io/badge/WordPress-%23117AC9.svg?style=for-the-badge&logo=WordPress&logoColor=white)

[![likes](https://badges.bar/wordpress_client/likes)](https://pub.dev/packages/wordpress_client/score) [![popularity](https://badges.bar/wordpress_client/popularity)](https://pub.dev/packages/wordpress_client/score) [![pub points](https://badges.bar/wordpress_client/pub%20points)](https://pub.dev/packages/wordpress_client/score)

**wordpress_client** is a library written purely in Dart to interact with Wordpress REST API in a fluent pattern. This library is a port of [WordpressCore](https://github.com/ArunPrakashG/WordpressCore) library written in C# (also written by me)

</div>

---

## Features

- Complete fluent system, Define request parameters with builder functions which allows to fluently create a request or add extra custom headers, authorization etc.
- Most common 3 authorization systems are supported.
- Response preprocessor functions to pre process the response before it gets returned in a ResponseContainer.
- Provides statistics such as time taken for the request to complete.
- Support for Custom Requests / Authorization systems.
- And many more!

## NOTE

**Interface API (the way you get posts/users etc) has been changed a lot internally in 5.2.1 (latest) build from previous 5.1.0 build.**
The new system provides a standard structure for defining custom endpoint requests at the same time keeping request building fluidity.
Checkout [Custom Requests](https://github.com/ArunPrakashG/wordpress_client/wiki/Custom-Requests) section for changed API usage.

## Usage

You can use this library just like any other Dart package.

- Add `wordpress_client` as a dependency on `pubspec.yaml` file on your project root. At the time of this writing, the latest package version is 5.1.0. Do check [Package Page](https://pub.dev/packages/wordpress_client) to get latest version.

```dart
dependencies:
  wordpress_client: {latest}
```

- Import the library to your project class in which you want to use the library.

```dart
import 'package:wordpress_client/wordpress_client.dart';
```

- Initializing the client can be done in two ways. It is recommended to initialize `WordpressClient` once and assign the instance to a variable for later use. Else, if you are using cookies, it may not work properly.

  - Simple method, Initialize with default values.
  - Advanced method (with Bootstrapper to configure various settings like User Agent, Authorization etc)

### Simple method

```dart
WordpressClient client = new WordpressClient('https://www.replaceme.com/wp-json', 'wp/v2');
```

You can read about advanced method in [Advanced Method](https://github.com/ArunPrakashG/wordpress_client/wiki/Usage#advanced-method) wiki page.

- Now you are ready to send requests to Wordpress REST API. For example, to send request to get the latest 20 posts in your Wordpress site:

```dart
ResponseContainer<List<Post>> response = await client.posts.list(
    (builder) => builder
        .withPerPage(20)
        .withPageNumber(1)
        .sortResultsBy(FilterPostSortOrder.DATE)
        .build(),
  );
```

Here, the `ResponseContainer<T>` holds result `T` object, in this case, its `List<Post>` as we requested for list of latest posts, with some statistical data, like the time taken for the request to complete (it doesn't count the time taken to process the response information, just the raw request) as a `Duration()` object.

## Supported Authorization methods

This library has 3 authorization methods currently supported:

- `BasicAuth` - [Basic Auth](https://github.com/WP-API/Basic-Auth) by The Wordpress Team
- `BasicJwtAuth` - [Basic JWT Authentication](https://wordpress.org/plugins/jwt-authentication-for-wp-rest-api/) by Enrique Chavez
- `UsefulJwtAuth` - [Useful JWT Authentication](https://github.com/usefulteam/jwt-auth) by Useful Team

For Custom Authorization implementation, Check out [Authorization](https://github.com/ArunPrakashG/wordpress_client/wiki/Authorization#custom-authorization) wiki page.

## Supported REST Methods

|                    | Create | Read | Update | Delete |
| ------------------ | ------ | ---- | ------ | ------ |
| **Posts**          | yes    | yes  | yes    | yes    |
| **Pages**          | ---    | ---  | ---    | ---    |
| **Comments**       | yes    | yes  | yes    | yes    |
| **Categories**     | yes    | yes  | yes    | yes    |
| **Tags**           | yes    | yes  | yes    | yes    |
| **Users**          | yes    | yes  | yes    | yes    |
| **Me**             | yes    | yes  | yes    | yes    |
| **Media**          | yes    | yes  | yes    | yes    |
| **Post Revisions** | ---    | ---  | ---    | ---    |
| **Taxonomies**     | ---    | ---  | ---    | ---    |
| **Post Types**     | ---    | ---  | ---    | ---    |
| **Post Statuses**  | ---    | ---  | ---    | ---    |
| **Settings**       | ---    | ---  | ---    | ---    |

## Custom Response Types (Custom Requests)

Check out [Custom Response Types](https://github.com/ArunPrakashG/wordpress_client/wiki/Custom-Requests) wiki page.

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

## Contributions

Contributions are always welcome! If you find any bugs/errors, open an issue describing about it and how to reproduce it. :D
meanwhile, PR's for new features/bug fixes are always welcome!

## License

[MIT](License)

[license]: https://github.com/ArunPrakashG/wordpress_client/blob/master/LICENSE
[tracker]: https://github.com/ArunPrakashG/wordpress_client/issues
