// import 'package:flutter/cupertino.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';

// class client() async {
//   // We're using HiveStore for persistence,
//   // so we need to initialize Hive.
//   await initHiveForFlutter();

//   final HttpLink httpLink = HttpLink(
//     'http://dev.haldiram.com/graphql',
//   );

//   final AuthLink authLink = AuthLink(
//     getToken: () async => 'Bearer ',
//     // OR
//     // getToken: () => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
//   );

//   final Link link = authLink.concat(httpLink);

//   ValueNotifier<GraphQLClient> client = ValueNotifier(
//     GraphQLClient(
//       link: link,
//       // The default store is the InMemoryStore, which does NOT persist to disk
//       cache: GraphQLCache(store: HiveStore()),
//     ),
//   );
//   return client;
// }
