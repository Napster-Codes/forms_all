// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:forms_and_fields/models/pet_details.dart';
import 'package:forms_and_fields/models/user_details.dart';
import 'package:forms_and_fields/utils/constants.dart';
import 'package:forms_and_fields/views/home_page.dart';
import 'package:forms_and_fields/views/add_pet.dart';
import 'package:forms_and_fields/widgets/new_pet_list.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var stateController = TextEditingController();
  var firstnameController = TextEditingController();
  var lastnameController = TextEditingController();
  var passController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var orgController = TextEditingController();
  var commentController = TextEditingController();
  var addressController = TextEditingController();
  var dateController = TextEditingController();
  var ageController = TextEditingController();
  var roleController = TextEditingController();
  final _formKeyGlobal = GlobalKey<FormState>();

  late List<PetDetails> petProfilesList = [];
  late List<UserProfileData> userDetailsList = [];

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

  bool obscureText = true;
  String? password;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  // void newPet(String PetTitle, String Breed) {
  //   final newPet = PetDetails(name: PetTitle, breed: Breed);
  //   setState(() {
  //     petProfilesList.add(newPet);
  //   });
  // }

  // void _addNewPet(BuildContext ctx) {
  //   showModalBottomSheet(
  //       context: ctx,
  //       builder: (_) {
  //         return SubRegisterPage();
  //       });
  // }

  // void _submitError() {
  //   setState(() {
  //     AlertDialog(
  //       elevation: 9,
  //       title: Text('Caution!'),
  //       content: Text(
  //           'Please fill all the details correctly, the fields marked with * are mandatory'),
  //       actions: <Widget>[
  //         TextButton(
  //           onPressed: () => Navigator.pop(context, 'Cancel'),
  //           child: const Text('Cancel'),
  //         ),
  //         TextButton(
  //           onPressed: () => Navigator.pop(context, 'OK'),
  //           child: const Text('OK'),
  //         ),
  //       ],
  //     );
  //   });
  // }

  void _birthdayPicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1940), // Jan 1 2019
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
            key: _formKeyGlobal,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
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
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: passController,
                    validator: (val) =>
                        val!.length < 6 ? 'Password too short.' : null,
                    onSaved: (val) => password = val,
                    obscureText: obscureText,
                    minLines: 1,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          icon: Icon(Icons.visibility), onPressed: _toggle),
                      labelText: 'Enter a Password *',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    validator: (val) {
                      if (val != passController.text) {
                        return 'NOT MATCHING';
                      }
                    },
                    onSaved: (val) => password = val,
                    obscureText: obscureText,
                    minLines: 1,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          icon: Icon(Icons.visibility), onPressed: _toggle),
                      labelText: 'Retype Password *',
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
                    keyboardType: TextInputType.number,
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
                        return 'Enter a email address ';
                      } else if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(Email)) {
                        return 'Enter a valid email address';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Email ID *',
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
                        border: OutlineInputBorder(),
                        isDense: true,
                        labelText: 'Role or Designation*'),
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
                    onTap: _birthdayPicker,
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
                  const SizedBox(height: 13),
                  TextFormField(
                    maxLines: 5,
                    decoration: InputDecoration(
                      labelText: 'Comment Box',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () {
                        Get.to(SubRegisterPage())!.then(
                          (value) {
                            // add a condition to check if th epet details are not null. If not null add it to the list.
                            if (value != null) {
                              setState(() {
                                petProfilesList.add(value);
                              });
                            }
                          },
                        );
                      }, // CHANGE TO IF ALL FORMS ARE FILLED THEN Get.to(necxt page)
                      child: Text('Add Your Pet')),
                  const SizedBox(height: 12),
                  // SizedBox(
                  //   child: ListView.builder(itemBuilder: (context, index) {
                  //     return ListTile(
                  //       title: Text(petProfilesList[index].name),
                  //     );
                  //   }),
                  // ),
                  ///////////////////////////////////////////////
                  for (var pet in petProfilesList) ...[
                    ListTile(
                      dense: true,
                      leading: (pet.imageFile != null)
                          ? CircleAvatar(
                              backgroundImage:
                                  FileImage(File(pet.imageFile!.path)),
                              radius: 20.0,
                            )
                          : const CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://www.designyourway.net/blog/wp-content/uploads/2021/02/My-little-dog-Kodah-Hi-Dribbble.jpg"),
                              radius: 20.0,
                            ),
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(pet.name),
                          Text(pet.breed),
                          Text('Last vacc date: ' +
                              pet.lastVaccinationDate.toString())
                        ],
                      ),
                      //subtitle: Text(pet.breed),
                      trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              petProfilesList.remove(pet);
                            });
                          },
                          icon: Icon(Icons.close)),
                    )
                  ],

                  ElevatedButton(
                      onPressed: () {
                        if (_formKeyGlobal.currentState!.validate()) {
                          Get.to(HomeScreen())!.then(
                            (value) {
                              // add a condition to check if th epet details are not null. If not null add it to the list.
                              if (value != null) {
                                setState(() {
                                  userDetailsList.add(value);
                                });
                              }
                            },
                          );
                        }
                      },
                      child: Text('SUBMIT')),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
