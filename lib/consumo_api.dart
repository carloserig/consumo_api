import 'package:consumo_api/models/Cliente.dart';
import 'package:consumo_api/repositories/aluno_repository.dart';

void main() async {
  final clienteRepository = ClienteRepository();
  final clientes = await clienteRepository.buscarTodos(); 
  print(clientes);

  for (var c in clientes) {
    print('Cliente:  ${c.nome} senha  ${c.senha}');
  }

  final Cliente = await clienteRepository.buscarPorId(2);
  print(Cliente);
  
}