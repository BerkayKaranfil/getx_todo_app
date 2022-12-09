import 'package:get/get.dart';
import 'package:getx_todo_app/model/note_model.dart';

class NoteController extends GetxController{
  
  var notes = [].obs;

  addNote(NoteModel girilenNot){
    notes.add(girilenNot);
    Get.back();
  }

  removeNote(NoteModel girilenNot){
    notes.remove(girilenNot);
  }


}