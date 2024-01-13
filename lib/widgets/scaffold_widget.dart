import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../commons/app_asset.dart';
import '../commons/app_theme.dart';

class ScaffoldWidget extends StatefulWidget {
  const ScaffoldWidget({
    super.key,
    this.appBarTitle,
    this.child,
  });

  final String? appBarTitle;
  final Widget? child;

  @override
  State<ScaffoldWidget> createState() => _ScaffoldWidgetState();
}

class _ScaffoldWidgetState extends State<ScaffoldWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBarTitle == null
          ? null
          : AppBar(
              centerTitle: true,
              title: Text(
                widget.appBarTitle ?? '',
                style: AppTheme.titleTextStyle5.copyWith(
                  letterSpacing: 1.02,
                ),
              ),
              foregroundColor: AppTheme.colorWhite,
              backgroundColor: AppTheme.colorOrange,
              leading: !Navigator.canPop(context)
                  ? null
                  : GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Stack(
                        children: [
                          Positioned.fill(
                            top: 0,
                            left: 0,
                            child: SvgPicture.asset(
                              AppAsset.arrowBackCircle.path,
                              fit: BoxFit.scaleDown,
                              width: 31.45,
                              height: 31.45,
                            ),
                          ),
                          Positioned.fill(
                            top: 0,
                            left: 0,
                            child: Align(
                              alignment: Alignment.center,
                              child: SvgPicture.asset(
                                AppAsset.arrowBack.path,
                                fit: BoxFit.scaleDown,
                                width: 11.48,
                                height: 11.98,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
      backgroundColor: AppTheme.colorOrange,
      body: widget.child,
    );
  }
}
