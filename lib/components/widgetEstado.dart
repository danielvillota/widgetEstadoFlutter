import 'package:flutter/material.dart';

class MyTareas extends StatefulWidget {
  const MyTareas({super.key});
  

  @override
  State<MyTareas> createState() => MyTareasState();
}

class MyTareasState extends State<MyTareas> {
  final List<String> _tareas = [];
  final TextEditingController _controller = TextEditingController();

  void _agregarTarea() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _tareas.add(_controller.text);
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tareas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Nueva tarea',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _agregarTarea,
              child: const Text('Agregar Tarea'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _tareas.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(_tareas[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}