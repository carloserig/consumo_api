// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Cliente {
  int id;
  String nome;
  String senha;

  Cliente({required this.id, required this.nome, required this.senha});

  /* Serialização
  Passo 1: Pegar o objeto Cliente e transformar em um objeto Map<String, dynamic> */
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'senha': senha,
    };
  }

  /* Serialização
  Passo 2: Pegar o Map<String, dynamic> e transdormar em um json pelo pacote dart:convert (jsonEncode) */
  String toJason() => jsonEncode(toMap());


  /* Desserialização Passo 2 */
  factory Cliente.fromMap(Map<String, dynamic> map) {
    return Cliente(
      id: map['id'] ?? 0,
      nome: map['nome'] ?? '',
      senha: map['senha'] ?? '',
    );
  }

  /* Desserialização Passo 1 e Passo 2 aqui, mas por padrões de conversão/projeto cada método faz uma coisa 
  factory Cliente.fromJason(String json) {
    final jsonMap = jsonDecode(json);
    return Cliente(
      id: jsonMap['id'],
      nome: jsonMap['nome'],
      senha: jsonMap['senha'],
    );
  }*/
  
  // Desserialização Passo 1 
  factory Cliente.fromJason(String json) {
    final jsonMap = jsonDecode(json);
    return Cliente.fromMap(jsonMap);
  }


  @override
  String toString() => 'Cliente(id: $id, nome: $nome, senha: $senha)';
}
