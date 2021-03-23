import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preference_module/services/text_provider.dart';
import 'package:shared_preference_module/services/theme_provider.dart';

class Home extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeNotifier()),
        ChangeNotifierProvider(create: (_) => TextNotifier())
      ],
      child: Consumer<ThemeNotifier>(
        builder: (context, value, child) {
          return MaterialApp(
            title: 'Theme-Brain',
            home: MyHomePage(title: 'Flutter Shared Preferences Module-Demo'),
            theme: value.darkTheme ? dark : light,
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final counterModel = Provider.of<TextNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<ThemeNotifier>(
              builder: (context, notifier, child) => SwitchListTile(
                title: Text('Dark'),
                value: notifier.darkTheme,
                onChanged: (value) {
                  notifier.toggleTheme();
                },
              ),
            ),
            Center(
              child: Consumer<TextNotifier>(
                builder: (context, value, child) {
                  return Text(counterModel.getCount().toString());
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counterModel.incementNumber(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
