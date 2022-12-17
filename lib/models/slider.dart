import 'package:flutter/cupertino.dart';

import '../constants/constants.dart';

class Slider {
  final String sliderImageUrl;
  final String sliderHeading;
  final String sliderSubHeading;
  //final String skipBtn;

  Slider(
      {required this.sliderImageUrl,
      required this.sliderHeading,
      required this.sliderSubHeading,
      //required this.skipBtn
  });
}

final sliderArrayList = [
    Slider(
        sliderImageUrl: 'lib/assets/images/slider_image_1.png',
        sliderHeading: Constants.SLIDER_HEADING_1,
        sliderSubHeading: Constants.SLIDER_DESC,),
        //skipBtn: Constants.SKIP),
    Slider(
        sliderImageUrl: 'lib/assets/images/slider_image_2.png',
        sliderHeading: Constants.SLIDER_HEADING_2,
        sliderSubHeading: Constants.SLIDER_DESC,),
        //skipBtn: Constants.SKIP),
    Slider(
        sliderImageUrl: 'lib/assets/images/slider_image_3.png',
        sliderHeading: Constants.SLIDER_HEADING_3,
        sliderSubHeading: Constants.SLIDER_DESC,),
        //skipBtn: ""),
  ];
