import 'package:custom_appbar/const/images.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double top = 0;

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
              title: LayoutBuilder(builder: (context, constraints) {
                top = constraints.biggest.height;
                return AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: top <= 200 ? 1 : 0,
                  child: const Row(
                    children: [
                      SizedBox(width: 12),
                      CircleAvatar(backgroundImage: NetworkImage(kUserImage)),
                      SizedBox(width: 12),
                      Text('Mitsuki'),
                    ],
                  ),
                );
              }),
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
