import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import '../commons/app_text.dart';
import '../commons/app_theme.dart';
import '../controllers/inspiration_controller.dart';
import '../widgets/scaffold_widget.dart';
import 'inspiration_page.dart';

class MainPage extends StatefulWidget {
  const MainPage(
    this._inspirationController, {
    super.key,
  });

  final InspirationController _inspirationController;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return InspirationPage(widget._inspirationController);
                      },
                    ),
                  );
                },
                style: const ButtonStyle(
                  padding: MaterialStatePropertyAll(
                    EdgeInsets.only(
                      left: 30,
                      right: 10,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppText.inspirations.text.toUpperCase(),
                      style: AppTheme.buttonTextStyle.copyWith(
                        color: AppTheme.colorOrange3,
                        letterSpacing: 1.02,
                      ),
                    ),
                    SizedBox(
                      width: 35,
                      child: MirrorAnimationBuilder(
                        tween: Tween<double>(begin: 0.0, end: 1.0),
                        duration: const Duration(
                          milliseconds: 500,
                        ),
                        curve: Curves.easeInCirc,
                        builder: (context, value, child) {
                          return Padding(
                            padding: EdgeInsets.only(right: value * 10),
                            child: const Icon(
                              Icons.arrow_forward,
                              size: 16,
                              color: AppTheme.colorOrange3,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
