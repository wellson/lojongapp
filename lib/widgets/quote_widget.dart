import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share_plus/share_plus.dart';

import '../commons/app_asset.dart';
import '../commons/app_text.dart';
import '../commons/app_theme.dart';
import '../entities/quote_entity.dart';

class QuoteWidget extends StatelessWidget {
  const QuoteWidget({
    super.key,
    required this.quote,
  });

  final QuoteEntity quote;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15,
        left: 30,
        right: 30,
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 35,
              left: 15,
              right: 15,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppTheme.colorBlue2.withOpacity(0.9),
                  AppTheme.colorWhite.withOpacity(0.9),
                ],
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.colorBlack.withOpacity(0.13),
                  blurRadius: 2,
                  spreadRadius: 0,
                  offset: const Offset(0, 3),
                )
              ],
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  bottom: 0,
                  left: 0,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SvgPicture.asset(
                      AppAsset.mountain.path,
                      width: 336,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      quote.text,
                      textAlign: TextAlign.center,
                      style: AppTheme.titleTextStyle3.copyWith(
                        color: AppTheme.colorBlue,
                        letterSpacing: 1.06,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      quote.author,
                      textAlign: TextAlign.center,
                      style: AppTheme.titleTextStyle3.copyWith(
                        color: AppTheme.colorBlue,
                        letterSpacing: 1.06,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 123,
                      height: 27,
                      child: ElevatedButton(
                        onPressed: () async {
                          await Share.share(quote.text);
                        },
                        style: const ButtonStyle(
                          padding: MaterialStatePropertyAll(EdgeInsets.all(0)),
                          backgroundColor: MaterialStatePropertyAll(AppTheme.colorBlue),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.share,
                              color: AppTheme.colorWhite,
                              size: 15,
                            ),
                            const SizedBox(width: 7),
                            Text(
                              AppText.share.text,
                              style: AppTheme.buttonTextStyle.copyWith(
                                color: AppTheme.colorWhite,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Divider(
            color: AppTheme.colorBlack2.withOpacity(0.1),
          ),
        ],
      ),
    );
  }
}
