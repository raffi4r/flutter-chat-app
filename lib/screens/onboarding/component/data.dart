class SliderModel {
  String imageAssetPath;
  String title;
  String desc;

  SliderModel(
      {required this.imageAssetPath, required this.title, required this.desc});

  void setImageAssetPath(String getImageAssetPath) {
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getImageAssetPath() {
    return imageAssetPath;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return desc;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = <SliderModel>[];
  SliderModel sliderModel =
      SliderModel(imageAssetPath: '', title: '', desc: '');

  //1
  sliderModel.setImageAssetPath("assets/images/intro1.webp");
  sliderModel.setTitle("Bisa melakukan One Day Survey");
  sliderModel.setDesc(
      "Proses analisa lebih cepat, dengan data real-time dari aplikasi");
  slides.add(sliderModel);

  sliderModel = SliderModel(imageAssetPath: '', title: '', desc: '');

  //2
  sliderModel.setImageAssetPath("assets/images/intro2.webp");
  sliderModel.setTitle("Cek persediaan barang menjadi lebih mudah");
  sliderModel.setDesc(
      "Tidak ada lagi pencarian yang rumit untuk pengecekan ketersediaan barang");
  slides.add(sliderModel);

  sliderModel = SliderModel(imageAssetPath: '', title: '', desc: '');

  //3
  sliderModel.setImageAssetPath("assets/images/intro3.webp");
  sliderModel.setTitle("Akurasi Tepat, pengiriman cepat");
  sliderModel.setDesc(
      "Dengan adanya track lokasi, kini menjadi lebih mudah untuk menemukan alamat");
  slides.add(sliderModel);

  sliderModel = SliderModel(imageAssetPath: '', title: '', desc: '');

  //4
  sliderModel.setImageAssetPath("assets/images/intro4.webp");
  sliderModel.setTitle("Memberikan pelayanan prima kepada pelanggan");
  sliderModel.setDesc(
      "Melalui Supporting Aplikasi pelayanan kepada pelanggan menjadi lebih efektif dan efisien");
  slides.add(sliderModel);

  sliderModel = SliderModel(imageAssetPath: '', title: '', desc: '');

  return slides;
}
