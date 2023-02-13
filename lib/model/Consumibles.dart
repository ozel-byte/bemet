// To parse this JSON data, do
//
//     final consumiblesResponse = consumiblesResponseFromJson(jsonString);



class Consumible {
    Consumible({
        required this.piezas,
        required this.referencia,
        required this.marca,
        required this.name,
        required this.compatibleCon,
        required this.ubicacion,
        required this.descripcion,
    });

    String piezas;
    String referencia;
    String marca;
    String name;
    String compatibleCon;
    String ubicacion;
    String descripcion;

}
