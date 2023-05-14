import 'package:adpro/gen/assets.gen.dart';

final onboardingModel = [
  Onboarding(
      imageUrl: Assets.images.png.clarityImageGallerySolid.path,
      t1: 'Block intrusive and \nannoying ads',
      t2: 'No more interruptions from \nunwanted ads'),
  Onboarding(
      imageUrl: Assets.images.png.clarityImageGallerySolid.path,
      t1: 'Enhanced online \nprivacy protection',
      t2: 'Keep your online activity safe and \nsecure'),
  Onboarding(
      imageUrl: Assets.images.png.clarityImageGallerySolid.path,
      t1: 'Block malware \nand phishing',
      t2: 'Stay protected from harmful \nsoftware and phishing attempts'),
  Onboarding(
      imageUrl: Assets.images.png.clarityImageGallerySolid.path,
      t1: 'Improve browsing \nperformance',
      t2: 'Speed up your browsing experience \nand reduce page loading times'),
];

class Onboarding {
  final String? t1, t2, imageUrl;

  Onboarding({this.t1, this.t2, this.imageUrl});
}



  // AnimatedContainer buildDot({int? index}) {
  //   return AnimatedContainer(
  //     duration: const Duration(milliseconds: 200),
  //     margin: const EdgeInsets.only(right: 5),
  //     height: 6,
  //     width: _currentPage == index ? 20 : 6,
  //     decoration: BoxDecoration(
  //       color: _currentPage == index
  //           ? ColorManager.primary
  //           : const Color(0xFFD8D8D8),
  //       borderRadius: BorderRadius.circular(5),
  //     ),
  //   );
  // }