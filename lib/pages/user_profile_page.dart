import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_chatting_app/auth/auth_service.dart';
import 'package:firebase_chatting_app/models/user_model.dart';
import 'package:firebase_chatting_app/providers/user_provider.dart';
import 'package:firebase_chatting_app/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';


class UserProfilePage extends StatefulWidget {
  static const String routeName = '/userprofile';

  const UserProfilePage({Key? key}) : super(key: key);

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        title: const Text('My Profile'),
      ),
      body: Center(
        child: Consumer<UserProvider>(
          builder: (context, provider, _) =>
              StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            stream: provider.getUserById(AuthService.user!.uid),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final userModel = UserModel.fromMap(snapshot.data!.data()!);
                return ListView(
                  children: [
                    Center(
                        child: userModel.image == null
                            ? Image.asset(
                                'images/person.jpg',
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                userModel.image!,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              )),
                    TextButton.icon(
                        onPressed: _updateImage,
                        icon: const Icon(Icons.photo),
                        label: const Text('Change Image')),
                    const Divider(
                      color: Colors.grey,
                      height: 1,
                    ),
                    ListTile(
                      title: Text(userModel.name ?? 'No Display Name'),
                      trailing: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {},
                      ),
                    ),
                    ListTile(
                      title: Text(userModel.mobile ?? 'No Mobile Number'),
                      trailing: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {},
                      ),
                    ),
                    ListTile(
                      title: Text(userModel.email ?? 'No Email Address'),
                      trailing: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {},
                      ),
                    )
                  ],
                );
              }
              if (snapshot.hasError) {
                return const Text('Failed to fetch data');
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }

  void _updateImage() async {
    final xFile = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 75);
    if (xFile != null) {
      try {
        final downloadUrl =
            await Provider.of<UserProvider>(context, listen: false)
                .updateImage(xFile);
        await Provider.of<UserProvider>(context, listen: false)
                .updateProfile(AuthService.user!.uid,
          {'image' : downloadUrl}
        );
      } catch (e) {
        rethrow;
      }
    }
  }
}
