import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:najot_shop/utils/colors/app_colors.dart';
import 'package:provider/provider.dart';

import '../../../provider/auth_provider.dart';
import '../../../provider/profile_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    User? user = context.watch<ProfileProvider>().currentUser;


    return Scaffold(
      backgroundColor: AppColors.c_13181F,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.c_13181F,
        title: const Text("Profile"),
        actions: [
          IconButton(
              onPressed: () {
                context.read<AuthProvider>().logOutUser(context);
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView(
          children: [
            Image.network(
              user?.photoURL ?? "",
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                user?.email ?? "Empty",
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
            ),
            Center(
              child: Text(
                user?.displayName ?? "Empty",
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
            ),
            Center(
              child: Text(
                user?.phoneNumber ?? "Empty",
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Display Name",
              ),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              textAlign: TextAlign.start,
              controller: context.read<ProfileProvider>().nameController,
            ),
            TextButton(
              onPressed: () {
                context.read<ProfileProvider>().updateUsername(context);
              },
              child: const Text("Update name"),
            ),
            TextField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                textAlign: TextAlign.start,
                controller: context.read<ProfileProvider>().emailController,
              decoration: InputDecoration(
              hintText: "Email Update",

            )
            ),
            TextButton(
              onPressed: () {
                context.read<ProfileProvider>().updateEmail(context);
              },
              child: const Text("Update email"),
            ),
            TextButton(
              onPressed: () {
                context.read<ProfileProvider>().updateUserImage(context,
                    "https://cdn-icons-png.flaticon.com/512/3135/3135715.png");
              },
              child: const Text("Update profile image"),
            ),
          ],
        ),
      ),
    );
  }
}