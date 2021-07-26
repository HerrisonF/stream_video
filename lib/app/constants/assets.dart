final String imageAssetsRoot = "images/";
final String logo = _getImagePath("logo.svg");

String _getImagePath(String fileName){
  return imageAssetsRoot + fileName;
}