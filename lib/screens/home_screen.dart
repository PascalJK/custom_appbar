import 'package:custom_appbar/const/images.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Image.network(
                kBackgroundImage,
                fit: BoxFit.cover,
              ),
              title: const Row(
                children: [
                  SizedBox(width: 12),
                  CircleAvatar(backgroundImage: NetworkImage(kUserImage)),
                  SizedBox(width: 12),
                  Text('Mitsuki'),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ListView.builder(
              itemCount: 50,
              primary: false,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return const FlutterLogo();
              },
            ),
          )
        ],
      ),
    );
  }
}
