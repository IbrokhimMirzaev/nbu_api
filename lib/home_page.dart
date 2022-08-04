import 'package:flutter/material.dart';
import 'package:nbu_api/service/get_currency_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Currency API"),
      ),
      body: FutureBuilder(
          future: GetCurrencyService.getCurrency(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.data == "no") {
              return const Center(child: Text("No internet connection"));
            } else {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data[index]["cb_price"]),
                  );
                },
                itemCount: snapshot.data.length,
              );
            }
          }),
    );
  }
}
