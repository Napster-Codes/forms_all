import 'dart:io';
import 'dart:ui';
import 'package:forms_and_fields/models/user_details.dart';

import 'registration_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  // const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        children: [
          Image.network(
            'https://media.istockphoto.com/vectors/approval-symbol-check-mark-in-a-circle-drawn-by-hand-vector-green-ok-vector-id1094780808?k=20&m=1094780808&s=612x612&w=0&h=MJnPlAnouRMEPeKCkNLH_3MGqsRr50tXevFS3TF607o=',
            height: 300,
            width: 300,
          )
          //  for (var User in userDetailsList) ...[
          //         ListTile(
          //           dense: true,
          //           leading: (pet.imageFile != null)
          //               ? CircleAvatar(
          //                   backgroundImage:
          //                       FileImage(File(pet.imageFile!.path)),
          //                   radius: 20.0,
          //                 )
          //               : const CircleAvatar(
          //                   backgroundImage: NetworkImage(
          //                       "https://www.designyourway.net/blog/wp-content/uploads/2021/02/My-little-dog-Kodah-Hi-Dribbble.jpg"),
          //                   radius: 20.0,
          //                 ),
          //           title: Column(
          //             mainAxisAlignment: MainAxisAlignment.start,
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Text(pet.name),
          //               Text(pet.breed),
          //               Text('Last vacc date: ' +
          //                   pet.lastVaccinationDate.toString())
          //             ],
          //           ),
          //           //subtitle: Text(pet.breed),
          //           trailing: IconButton(
          //               onPressed: () {
          //                 setState(() {
          //                   petProfilesList.remove(pet);
          //                 });
          //               },
          //               icon: Icon(Icons.close)),
          //         )
          //       ],
        ],
      )),
    );
  }
}
