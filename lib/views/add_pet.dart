// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forms_and_fields/models/pet_details.dart';
//import 'package:forms_and_fields/views/registration_page.dart';
//import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:io';

import '../utils/constants.dart';

class SubRegisterPage extends StatefulWidget {
  //final Function addPet;
  // ignore: use_key_in_widget_constructors
  //const SubRegisterPage(this.addPet);

  @override
  State<SubRegisterPage> createState() => _SubRegisterPageState();
}

class _SubRegisterPageState extends State<SubRegisterPage> {
  String? petImageUrl;
  var vaccdateController = TextEditingController();
  final petNameController = TextEditingController();
  final breedController = TextEditingController();
  var birthdateController = TextEditingController();
  //var breedController = TextEditingController();
  final _formKeyDetails = GlobalKey<FormState>();
  XFile? image;
  bool showUpload = true;
  late DateTime vaccinatedDate;

  Future buildShowImageSourceDialog(BuildContext context) {
    if (Platform.isAndroid) {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              "Pick image from where?",
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text("CAMERA"),
                onPressed: () {
                  getImageFromCamera();
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: const Text("GALLERY"),
                onPressed: () {
                  getImageFromGallery();
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text("CLOSE"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      return showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => CupertinoActionSheet(
          title: const Text(
            "Pick image from?",
            style: TextStyle(
                fontSize: 17, fontWeight: FontWeight.w400, color: Colors.black),
          ),
          actions: <CupertinoActionSheetAction>[
            CupertinoActionSheetAction(
              child: const Text('CAMERA'),
              onPressed: () {
                getImageFromCamera();
                Navigator.pop(context);
              },
            ),
            CupertinoActionSheetAction(
              child: const Text('GALLERY'),
              onPressed: () {
                getImageFromGallery();
                Navigator.pop(context);
              },
            )
          ],
          cancelButton: CupertinoActionSheetAction(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      );
    }
  }

  Future getImageFromGallery() async {
    XFile? image2 = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 60);
    if (image2 != null) {
      setState(() {
        image = image2;
      });
    }
  }

  Future getImageFromCamera() async {
    XFile? image1 = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 60);
    if (image1 != null) {
      setState(() {
        image = image1;
      });
    }
  }

  File getFile() {
    return File(image!.path);
  }

  ImageProvider getImage() {
    if (showUpload) {
      return FileImage(File(image!.path));
    } else {
      return NetworkImage(petImageUrl!);
    }
  }

  void _vaccDatePicker() {
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
        vaccinatedDate = pickedDate;
        vaccdateController.text = DateFormat('dd-MM-yyyy').format(DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
        ));

        //vaccdateController.text = pickedDate.toString();
      });
    });
  }

  // void _submitPet() {
  //   if (petNameController.text.isEmpty) {
  //     return;
  //   }
  //   final petName = petNameController.text;
  //   final petBreed = breedController.text;

  //   if (petName.isEmpty || petBreed.isEmpty) {
  //     return;
  //   }
  //   //widget.addPet(petName, petBreed);
  //   Navigator.of(context).pop();
  // }

  void _birthDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020), // Jan 1 2019
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        birthdateController.text = DateFormat('dd-MM-yyyy').format(DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
        ));

        //birthdateController.text = pickedDate.toString();
      });
    });
  }

  //var selectedBreed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Form(
                key: _formKeyDetails,
                child: Column(children: [
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: petNameController,
                    validator: (val) =>
                        val!.length < 2 ? 'Username too short.' : null,
                    minLines: 1,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.pets),
                      labelText: 'PET NAME *',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  TextFormField(
                    readOnly: true,
                    controller: vaccdateController,
                    onTap: _vaccDatePicker,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.calendar_month_sharp),
                      isDense: true,
                      labelText: 'Last vaccinated on *',
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
                    readOnly: true,
                    controller: birthdateController,
                    onTap: _birthDatePicker,
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
                  DropdownButtonFormField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true,
                        labelText: 'Breed of your pet *'),
                    validator: (v) => v == null ? "Required field" : null,
                    items: AppConstants.breeds
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: ((dynamic value) {
                      setState(() {
                        breedController.text = value;
                      });
                    }),
                  ),
                  const SizedBox(height: 10),
                  if (image == null)
                    ElevatedButton.icon(
                      onPressed: () {
                        buildShowImageSourceDialog(context);
                      },
                      icon: Icon(Icons.add_a_photo),
                      label: Text('ADD IMAGE'),
                    )
                  else
                    Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            width: 0.5, color: Colors.grey.withOpacity(0.5)),
                        // image: DecorationImage(image: FileImage(url), fit: BoxFit.cover)),
                        image: DecorationImage(
                            image: getImage(), fit: BoxFit.cover),
                      ),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: -12,
                            right: -13,
                            child: IconButton(
                              icon: CircleAvatar(
                                  radius: 12.0,
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                  child: const Icon(
                                    Icons.close,
                                    color: Colors.white,
                                    size: 10,
                                  )),
                              onPressed: () {
                                setState(() {
                                  image = null;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                  const SizedBox(
                    height: 12,
                  ),
                  //this button adds
                  ElevatedButton(
                      onPressed: () {
                        if (_formKeyDetails.currentState!.validate()) {
                          var pet = PetDetails(
                              lastVaccinationDate: vaccinatedDate,
                              imageFile: image,
                              name: petNameController.text,
                              breed: breedController.text);
                          //_submitPet();
                          Get.back(result: pet);
                          _formKeyDetails.currentState!.dispose();
                          // Navigator.pop(context, pet);
                          // petNameController.clear();
                          // breedController.clear();
                        }
                      },
                      child: Text('DONE'))
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
