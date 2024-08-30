
enum DeviceType {
  mobile,
  tablet,
  desktop
}

class ScreenUtils{
  static const double mobileMaxSize = 640;
  static const double tabletMaxSize = 640;
  static const double desktopMinSize = 640;

  static DeviceType getDeviceType({required double width}){
    if(width < mobileMaxSize){
      return DeviceType.mobile;
    }else if(width >= tabletMaxSize && width < desktopMinSize){
      return DeviceType.tablet;
    }
    return DeviceType.desktop;
  }
}