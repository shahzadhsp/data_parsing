import 'package:flutter/material.dart';

import 'add_data.dart';
import 'model_class.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Method> items = []; // => List of items that come form next page.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cas"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push<Method>(MaterialPageRoute(builder: (_) => const AddData()))
              // fetching data form next page.
              .then(
                (value) => setState(
                  () {
                    if (value?.name != "" &&
                        value?.description != "" &&
                        value?.age != "" &&
                        value?.phone != "" &&
                        value?.city != "") {
                      items.add(
                        Method(
                          name: value!.name,
                          age: value.age,
                          phone: value.phone,
                          city: value.city,
                          description: value.description,
                        ),
                      );
                    }
                  },
                ),
              );
        },
        child: const Icon(Icons.add),
      ),
      body: items.isNotEmpty
          ? Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: ((context, index) {
                      return Container(
                        margin:
                            const EdgeInsets.only(top: 10, left: 10, right: 10),
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                            color: Colors.pinkAccent,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Column(
                          children: [
                            Text('Name:${items[index].name}'),
                            Text('Age:${items[index].age}'),
                            Text('Phone:${items[index].phone}'),
                            Text('City:${items[index].city}'),
                            Text('Description:${items[index].description}')
                          ],
                        )
                            //  ListTile(
                            //   title: Text(items[index].name),
                            //   subtitle: Text(items[index].description),
                            //   leading: const Icon(Icons.emoji_people),
                            // ),
                            ),
                      );
                    }),
                  ),
                ),
              ],
            )
          : const Center(
              child: Text("No Record Found"),
            ),
    );
  }
}
