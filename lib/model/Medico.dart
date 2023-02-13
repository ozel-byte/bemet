// To parse this JSON data, do
//
//     final medicoResponse = medicoResponseFromJson(jsonString);




class Medico {
    Medico({
        required this.name,
        required this.piezas,
        required this.referencia,
        required this.marca,
        required this.img
    });

    String name;
    String piezas;
    String referencia;
    String marca;
    String img;

    factory Medico.fromJson(Map<String, dynamic> json) => Medico(
        name: json["name"],
        piezas: json["piezas"],
        referencia: json["referencia"],
        marca: json["marca"],
        img: json["img"]
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "piezas": piezas,
        "referencia": referencia,
        "marca": marca,
    };
}
