import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        bottom: false,
        child: Drawer(
          child: ListView(
            children: <Widget>[
              const DrawerHeader(
                padding: EdgeInsets.zero,
                child: Icon(Icons.person),
                // child: Image(
                //   image: AssetImage(ImageAssets.mainImage),
                //   fit: BoxFit.cover,
                // ),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text(
                  'الصفحة الرئيسية',
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      );
}
