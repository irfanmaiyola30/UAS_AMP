class ModelSurat {
  int? id;
  String? name;
  String? bismillah;
  String? arabic;
  String? latin;
  String? terjemahan;

  ModelSurat(this.id, this.name, this.bismillah, this.arabic, this.latin,
      this.terjemahan);

  ModelSurat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    bismillah = json['bismillah'];
    arabic = json['arabic'];
    latin = json['latin'];
    terjemahan = json['terjemahan'];
  }
}
