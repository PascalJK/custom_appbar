import 'dart:io';

import 'package:custom_appbar/const/images.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double top = 0;
  final _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              _sliverAppbarWidget(),
              SliverToBoxAdapter(
                child: ListView.builder(
                  itemCount: 50,
                  primary: false,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return const FlutterLogo();
                  },
                ),
              ),
            ],
          ),
          _buildFab(),
        ],
      ),
    );
  }

  SliverAppBar _sliverAppbarWidget() {
    return SliverAppBar(
      expandedHeight: 250,
      toolbarHeight: 65,
      pinned: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        background: Image.network(kBackgroundImage, fit: BoxFit.cover),
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
    );
  }

  Widget _buildFab() {
    double defaultMargin = Platform.isAndroid ? 250 : 270;
    double defaultStart = 150;
    double defaultEnd = defaultStart / 2;

    double top = defaultMargin;
    double scale = 1.0;

    if (_scrollController.hasClients) {
      double offset = _scrollController.offset;
      top -= offset;

      if (offset < defaultMargin - defaultStart) {
        scale = 1;
      } else if (offset < defaultStart - defaultMargin) {
        scale = (defaultMargin - defaultEnd - offset) / defaultEnd;
      } else {
        scale = 0;
      }
    }

    return Positioned(
      top: top,
      right: 20,
      child: Transform(
        transform: Matrix4.identity()..scale(scale),
        child: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.star_outline),
        ),
      ),
    );
  }
}
