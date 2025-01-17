import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:infoquario/models/crustaceo.dart';
import 'package:infoquario/services/crustaceos_service.dart';
import 'package:infoquario/widget/form_field.dart';

class CrustaceoCadastroView extends StatefulWidget {
  const CrustaceoCadastroView({Key? key}) : super(key: key);

  @override
  State<CrustaceoCadastroView> createState() => _CrustaceoCadastroViewState();
}

class _CrustaceoCadastroViewState extends State<CrustaceoCadastroView> {
  final FirebaseStorage storage = FirebaseStorage.instance;

  final nomeCientifico = TextEditingController();
  final nomePopular = TextEditingController();
  final classe = TextEditingController();
  final ordem = TextEditingController();
  final familia = TextEditingController();
  final genero = TextEditingController();
  final origem = TextEditingController();
  final tamanho = TextEditingController();
  final expectativa = TextEditingController();
  final populacaoMinima = TextEditingController();
  final volumeMinimo = TextEditingController();
  final fachadaMinima = TextEditingController();
  final phAgua = TextEditingController();
  final temperatura = TextEditingController();

  String imagem = "";
  String carregar = "Carregue uma imagem";
  String tipo = 'Selecione o tipo...';
  String tipoHabitat = 'Selecione o tipo...';
  String tipoAquario = 'Selecione o tipo...';
  String dificuldade = 'Selecione a dificuldade...';
  bool uploading = false;
  double total = 0;



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
            FormFieldPadrao(
              controle: nomePopular,
              title: "Nome popular",
            ),
            SizedBox(
              height: 20,
            ),
            FormFieldPadrao(
              controle: nomeCientifico,
              title: "Nome cientifico",
            ),
            SizedBox(
              height: 20,
            ),
            FormFieldPadrao(
              controle: classe,
              title: "Classe",
            ),
            SizedBox(
              height: 20,
            ),
            FormFieldPadrao(
              controle: ordem,
              title: "Ordem",
            ),
            SizedBox(
              height: 20,
            ),
            FormFieldPadrao(
              controle: familia,
              title: "Família",
            ),
            SizedBox(
              height: 20,
            ),
            FormFieldPadrao(
              controle: genero,
              title: "Gênero",
            ),
            SizedBox(
              height: 20,
            ),
            FormFieldPadrao(
              controle: origem,
              title: "Origem",
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: DropdownButtonFormField<String>(
                value: tipo,
                icon: Icon(null),
                elevation: 15,
                decoration: InputDecoration(labelText: 'Tipo de crustáceo'),
                onChanged: (String? newValue) {
                  setState(() {
                    tipo = newValue!;
                  });
                },
                items: <String>[
                  'Selecione o tipo...',
                  'Caranguejo',
                  'Lagosta',
                  'Camarão',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            Container(
              child: DropdownButtonFormField<String>(
                value: tipoHabitat,
                icon: Icon(null),
                elevation: 15,
                decoration: InputDecoration(labelText: 'Tipo de habitat'),
                onChanged: (String? newValue) {
                  setState(() {
                    tipoHabitat = newValue!;
                  });
                },
                items: <String>[
                  'Selecione o tipo...',
                  'Água doce',
                  'Água salgada',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            FormFieldPadrao(
              controle: tamanho,
              title: "Tamanho",
            ),
            SizedBox(
              height: 20,
            ),
            FormFieldPadrao(
              controle: expectativa,
              title: "Expectativa",
            ),
            SizedBox(
              height: 20,
            ),
            FormFieldPadrao(
              controle: populacaoMinima,
              title: "População mínima",
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: DropdownButtonFormField<String>(
                value: tipoAquario,
                icon: Icon(null),
                elevation: 15,
                decoration: InputDecoration(labelText: 'Tipo de aquário'),
                onChanged: (String? newValue) {
                  setState(() {
                    tipoAquario = newValue!;
                  });
                },
                items: <String>[
                  'Selecione o tipo...',
                  'Comunidade',
                  'Solitário',
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
            FormFieldPadrao(
              controle: volumeMinimo,
              title: "Volume mínimo",
            ),
            SizedBox(
              height: 20,
            ),
            FormFieldPadrao(
              controle: fachadaMinima,
              title: "Fachada mínima",
            ),
            SizedBox(
              height: 20,
            ),
            FormFieldPadrao(
              controle: phAgua,
              title: "pH da água",
            ),
            SizedBox(
              height: 20,
            ),
            FormFieldPadrao(
              controle: temperatura,
              title: "Temperatura da água",
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: DropdownButtonFormField<String>(
                value: dificuldade,
                icon: Icon(null),
                elevation: 15,
                decoration: InputDecoration(labelText: 'Dificuldade'),
                onChanged: (String? newValue) {
                  setState(() {
                    dificuldade = newValue!;
                  });
                },
                items: <String>[
                  'Selecione a dificuldade...',
                  'Iniciante',
                  'Intermediário',
                  'Avançado',
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
            Container(
                height: 50,
                padding: EdgeInsets.only(right: 50, left: 50),
                child: IconButton(
                  icon: Icon(Icons.photo_library_rounded),
                  onPressed: () {
                    pickAndUploadImage();
                  },
                )),
            Center(
              child: uploading
                  ? Text("${total.round()}% enviado")
                  : Text(carregar),
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
                  if (imagem == "" ||
                      tipo == 'Selecione o tipo...' ||
                      dificuldade == 'Selecione a dificuldade...' ||
                      tipoAquario == 'Selecione o tipo...') {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            "Verifique se uma imagem foi anexada ou todos os campos foram preenchidos")));
                  }else {
                    Crustaceo crustaceo = Crustaceo(
                        nomePopular.text,
                        nomeCientifico.text,
                        classe.text,
                        ordem.text,
                        familia.text,
                        genero.text,
                        origem.text,
                        tipoHabitat,
                        tipo,
                        tamanho.text,
                        expectativa.text,
                        populacaoMinima.text,
                        tipoAquario,
                        volumeMinimo.text,
                        fachadaMinima.text,
                        phAgua.text,
                        temperatura.text,
                        dificuldade,
                        imagem);


                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(CrustaceoService().registrarCrustaceo(
                            crustaceo).toString())));
                    Navigator.of(context).pop();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<UploadTask> upload(String path) async {
    File file = File(path);
    try {
      String ref = 'images/img-${DateTime.now().toString()}.png';
      imagem = ref;
      return storage.ref(ref).putFile(file);
    } on FirebaseException catch (e) {
      throw Exception("Erro no upload: ${e.code}");
    }
  }

  Future<XFile?> getImage() async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    return image;
  }

  pickAndUploadImage() async {
    XFile? file = await getImage();
    if (file != null) {
      UploadTask task = await upload(file.path);

      task.snapshotEvents.listen((TaskSnapshot snapshot) async {
        if (snapshot.state == TaskState.running) {
          setState(() {
            uploading = true;
            total = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
          });
        } else if (snapshot.state == TaskState.success) {
          setState(() {
            carregar = "Imagem anexada";
            uploading = false;
          });
        }
      });
    }
  }
}
