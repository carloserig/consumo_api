import 'dart:convert';

class Produto {
  int id;
  String descricao;

  Produto({required this.id, required this.descricao});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'descricao': descricao,
    };
  }

  String toJason() => jsonEncode(toMap());

  factory Produto.fromMap(Map<String, dynamic> map) {
    return Produto(
      id: map['id'] ?? 0, 
      descricao: map['descricao'] ?? ''
    );
  }

  factory Produto.fromJason(String json) {
    final jsonMap = jsonDecode(json);
    return Produto.fromMap(jsonMap);
  }
  
}