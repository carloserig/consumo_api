import 'dart:convert';

import 'package:consumo_api/models/Cliente.dart';
import 'package:http/http.dart' as http;

class ClienteRepository {

  Future<List<Cliente>> buscarTodos() async {
    final clientesResponse = await http.get(Uri.parse('http://localhost:8080/clientes'));
    
    final clientesList = jsonDecode(clientesResponse.body);
    print('-------clientesList----------');
    print(clientesList);
    // Transformar lista de map em lista de alunos
    final todosClientes = clientesList.map<Cliente>((clienteMap) {
      return Cliente.fromMap(clienteMap);
    }).toList();
    return todosClientes;
  }

  Future<Cliente> buscarPorId(int id) async {
    final clientesResponse = await http.get(Uri.parse('http://localhost:8080/clientes/$id'));
    return Cliente.fromJason(clientesResponse.body);
  }

}