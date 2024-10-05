import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tokosepatu/provider/providerop.dart';

class api_page extends StatelessWidget {
  const api_page({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProviderOperation(),
      child: MaterialApp(
        title: 'Flutter API',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 145, 145, 145)),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Api'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProviderOperation>(context, listen: false).getAllPosts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Consumer<ProviderOperation>(builder: (context, value, child) {
          if (value.isLoding) {
            return const CircularProgressIndicator();
          }
          final posts = value.posts;
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Text(posts[index].id.toString()),
                  tileColor: Colors.grey.withOpacity(0.2),
                  title: Text(
                    posts[index].title!,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(posts[index].body!),
                ),
              );
            },
          );
        }));
  }
}
