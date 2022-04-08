

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:infoquario/services/peixe_agua_doce_service.dart';

class PeixeAguaDoceCadastroView extends StatefulWidget {
  const PeixeAguaDoceCadastroView({Key? key}) : super(key: key);

  @override
  _PeixeAguaDoceCadastroViewState createState() => _PeixeAguaDoceCadastroViewState();
}

class _PeixeAguaDoceCadastroViewState extends State<PeixeAguaDoceCadastroView> {
  final nomeCientifico = TextEditingController();
  final nomePopular = TextEditingController();
  final expectativa = TextEditingController();
  String tipo = 'Carnívoros';

  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<void> upload(String path) async{
    File file = File(path);
    try{
      String ref = 'images/img-${DateTime.now().toString()}.png';
      await storage.ref(ref).putFile(file);
    } on FirebaseException catch(e){
       throw Exception("Erro no upload: ${e.code}");
    }

  }

  Future<XFile?> getImage() async{
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    return image;
  }

  pickAndUploadImage() async{
    XFile? file = await getImage();
    if(file != null){

      await upload(file.path);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            TextFormField(
              controller: nomeCientifico,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: "Nome científico",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  )
              ),
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),

            Container(
              child: DropdownButtonFormField<String>(
                value: tipo,
                icon: Icon(null),
                elevation: 15,
                decoration: InputDecoration(labelText: 'Responsável'),
                onChanged: (String? newValue) {
                  setState(() {
                    tipo = newValue!;
                  });
                },
                items: <String>[
                  'Carnívoros',
                  'Herbívoros',
                  'Onívoros',
                  'Planctógafos',
                  'Detritívoros',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: nomePopular,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: "Nome popular",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  )
              ),
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: expectativa,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: "Expectativa de vida",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  )
              ),
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.only(right: 50, left: 50),
              child: ElevatedButton(
                child: Text("Buscar imagem"),
                onPressed: () {
                  pickAndUploadImage();
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.only(right: 50, left: 50),
              child: ElevatedButton(
                child: Text("Cadastrar"),
                onPressed: () {
                  PeixeAguaDoceService().registerFreshwater(nomeCientifico.text, tipo,nomePopular.text, expectativa.text);
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
