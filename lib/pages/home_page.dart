import 'package:flutter/material.dart';
import 'package:pert12sall/model/student.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _scoreController = TextEditingController();

  List<Student> _students =[];

  @override
  void initState() {
    super.initState();
    
  }

  Future<void> _loadStudents()async {
    setState(() {
      _students =_students;
    });

  }

  Future<void> _addStudent()async{
    final name = _nameController.text.trim();
    final score = int.tryParse(_scoreController.text.trim());

    if(name.isEmpty || score == null) return;
    if(score < 0 || score > 100) return;

    final student = Student(name: name, score: score);
    _students.add(student);

    _nameController.clear();

    await _loadStudents();
  }

  Future<void> _deleteStudent(int index)async{
    _students.removeAt(index);
    await _loadStudents();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text("Data Mahasiswa"),
      ),

      body: Column(
        children: [

          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: "Nama Mahasiswa",
              border: OutlineInputBorder()
            ),
          ),

          SizedBox(height: 12,),
          TextField(
            controller: _scoreController,
            decoration: InputDecoration(
              labelText: "Nilai (0-100)",
              border: OutlineInputBorder()
            ),
          ),    

          SizedBox(height: 12,),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(onPressed: _addStudent, child: Text("Tambah")),
          ),

          SizedBox(height: 24,),
          Expanded(
            child: _students.isEmpty 
            ? Text ("Data Mahasiswa Belum Ada") 
            :ListView.builder(
              itemCount: _students.length,
              itemBuilder: (context, index){
                final student = _students[index];
                return Card(
                  child: ListTile(
                    title: Text(student.name),
                    subtitle: Text("Nilai ${student.score}"),
                    trailing: IconButton(
                      onPressed: () => _deleteStudent(index), 
                      icon: Icon(Icons.delete, color: Colors.blue,)),
                  ),
                );
              }
              )
              )


        ],
      ),
    );
  }
}