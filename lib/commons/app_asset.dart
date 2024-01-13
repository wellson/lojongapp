enum AppAsset {
  playBlue('assets/svgs/play_blue.svg'),
  playRed('assets/svgs/play_red.svg'),
  mountain('assets/svgs/mountain.svg'),
  arrowBackCircle('assets/svgs/arrow_back_circle.svg'),
  arrowBack('assets/svgs/arrow_back.svg');

  const AppAsset(
    this.path,
  );

  final String path;
}
