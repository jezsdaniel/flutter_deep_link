import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

final goRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MainScreen(),
      routes: [
        GoRoute(
          path: 'details/:itemId',
          builder: (context, state) =>
              DetailsScreen(id: state.pathParameters['itemId']!),
        )
      ],
    )
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouter,
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deep Links'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => ListTile(
          onTap: () => context.go('/details/$index'),
          title: Text('Item #$index'),
        ),
        separatorBuilder: (_, __) => Divider(
          height: 0.5,
          color: Colors.grey.shade300,
        ),
        itemCount: 15,
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Screen'),
      ),
      body: Center(child: Text('Details of item #$id')),
    );
  }
}
