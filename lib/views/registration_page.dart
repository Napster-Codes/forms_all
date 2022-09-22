import 'package:flutter/material.dart';
import 'package:forms_and_fields/utils/constants.dart';
import 'package:forms_and_fields/views/sub_registration_page.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var firstnameController = TextEditingController();
  var lastnameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var orgController = TextEditingController();
  var commentController = TextEditingController();
  var addressController = TextEditingController();
  var dateController = TextEditingController();
  var ageController = TextEditingController();
  var roleController = TextEditingController();

  final _formKeyBirthday = GlobalKey<FormFieldState>();

  late DateTime dob;

  //   if (selectedDate != null) {
  //     setState(() {
  //        else if (controller == ageController) {
  //         dob = selectedDate;
  //         ageController.text = DateFormat('dd-MM-yyyy').format(DateTime(
  //           selectedDate.year,
  //           selectedDate.month,
  //           selectedDate.day,
  //         ));
  //       }

  //   }
  // }

  var selectedRole;
  // int?
  //  selectedRadioTile;
  // @override
  // void initState() {
  //   super.initState();
  //   selectedRadioTile = 0;
  // }

  // setSelectedRadioTile(int val) {
  //   setState(() {
  //     selectedRadioTile = val;
  //   });
  // }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019), // Jan 1 2019
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        dateController.text = DateFormat('dd-MM-yyyy').format(DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
        ));

        dateController.text = pickedDate.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(children: [
          Form(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 10),
                  // RadioListTile(
                  //   value: 1,
                  //   groupValue: selectedRadioTile,
                  //   title: Text("Radio 1"),
                  //   subtitle: Text("Radio 1 Subtitle"),
                  //   onChanged: (val) {
                  //     print("Radio Tile pressed $val");
                  //     setSelectedRadioTile(val);
                  //   },
                  //   activeColor: Colors.deepPurple,
                  //   selected: true,
                  // ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter a Name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'First Name *',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter a SurName';
                      }
                      return null;
                    },
                    minLines: 1,
                    decoration: InputDecoration(
                      labelText: 'Last Name *',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter a Phone Number';
                      }
                    },
                    maxLength: 10,
                    decoration: InputDecoration(
                      labelText: 'Phone Number ',
                      prefixText: '+91',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    validator: (val) {
                      var Email = val!.trim();
                      if (Email.isEmpty) {
                        return 'Enter a email address';
                      } else if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(Email)) {
                        return 'Enter a valid email address';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Email ID',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter the Name of your Organization';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Organization *',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField(
                    decoration: const InputDecoration(
                        isDense: true, labelText: 'Role or Designation*'),
                    validator: (v) => v == null ? "Required field" : null,
                    items: AppConstants.roles
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: ((dynamic value) {
                      setState(() {
                        roleController.text = selectedRole;
                      });
                    }),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    readOnly: true,
                    controller: dateController,
                    onTap: _presentDatePicker,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.calendar_month_sharp),
                      isDense: true,
                      labelText: 'Date of Birth*',
                    ),
                    validator: (val) {
                      if (val != null && val.trim().isNotEmpty) {
                        return null;
                      } else {
                        return 'This field is required';
                      }
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Comment Box',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () => Get.to(
                          SubRegisterPage()), // CHANGE TO IF ALL FORMS ARE FILLED THEN Get.to(necxt page)
                      child: Text('Add Documents')),
                  ElevatedButton(onPressed: null, child: Text('SUBMIT')),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
