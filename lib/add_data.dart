import 'package:flutter/material.dart';

import 'model_class.dart';

class AddData extends StatefulWidget {
  const AddData({super.key});

  @override
  State<AddData> createState() => _AddDataState();
}

// Creating a Class and constructor.

class _AddDataState extends State<AddData> {
  // Creating a TextEditingController for following Fiends,

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  // Creating a Method for Passing a data to back page.
  onPressed(BuildContext context) {
    var data = Method(
      name: nameController.text,
      description: descriptionController.text,
      age: ageController.text,
      phone: phoneController.text,
      city: cityController.text,
    );
    Navigator.pop(context, data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Add Data")),
        body: Form(child: Builder(builder: (context) {
          return Column(children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(hintText: "Name"),
              validator: (value) {
                var newValue = value ?? "";
                if (newValue.isEmpty) {
                  return 'Name is Required';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 6,
            ),
            TextFormField(
              controller: ageController,
              decoration: const InputDecoration(hintText: "Age"),
              validator: (value) {
                var newValue = value ?? "";
                if (newValue.isEmpty) {
                  return 'Age is Required';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 6,
            ),
            TextFormField(
              controller: phoneController,
              decoration: const InputDecoration(
                hintText: "Phone",
              ),
              validator: (value) {
                var newValue = value ?? "";
                if (newValue.isEmpty) {
                  return 'Phone is Required';
                }
                return null;
              },
            ),
            TextFormField(
              controller: cityController,
              decoration: const InputDecoration(
                hintText: "City",
              ),
              validator: (value) {
                var newValue = value ?? "";
                if (newValue.isEmpty) {
                  return 'City is Required';
                }
                return null;
              },
            ),
            TextFormField(
              controller: descriptionController,
              decoration: const InputDecoration(
                hintText: "Description",
              ),
              validator: (value) {
                var newValue = value ?? "";
                if (newValue.isEmpty) {
                  return 'Discription is Required';
                }
                return null;
              },
            ),
            MaterialButton(
              color: Colors.red,
              onPressed: () {
                if (Form.of(context)?.validate() ?? false) {
                  onPressed(context);
                }
              },
              child: const Text("Save"),
            )
          ]);
        })));
  }
}
