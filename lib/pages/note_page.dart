import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getx_todo_app/controller/note_controller.dart';
import 'package:getx_todo_app/model/note_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NotePage extends StatelessWidget {
  NotePage({super.key});

  final NoteController noteController =
      Get.put(NoteController(),  permanent: true );

  TextEditingController titleController = TextEditingController();
  TextEditingController notedetailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add Note"),
      ),
      body: Container(
        margin: EdgeInsets.only(right: 5.w, left: 5.w),
        width: 100.w,
        child: Column(
          children: [
            SizedBox(
              height: 5.h,
            ),
            Expanded(
                child: Obx(() =>ListView.builder(
              itemCount: noteController.notes.value.length,
              itemBuilder: (context, index) {
                NoteModel noteModel = noteController.notes.value[index];

                return Container(
                  child: Column(
                    children: [
                      Text(noteModel.title, style: TextStyle(
                        fontSize: 2.2.h, fontWeight: FontWeight.bold
                      ),),
                      SizedBox(
                        height: 1.w,
                      ),
                      Text(noteModel.note),
                      Divider(
                        color: Colors.blueGrey,
                        thickness: 0.5.w,
                      )
                    ],
                  ),
                );
              },
            ) ,)
            ),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        actions: [
                          Row(
                            children: [Text("Add title"), Spacer()],
                          ),
                          SizedBox(
                            height: 5.h,
                            child: TextField(
                              controller: titleController,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(bottom: 1.w),
                                  //  isDense: true,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 0.5.w, color: Colors.blue))),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            children: [Text("Add note"), Spacer()],
                          ),
                          TextField(
                            controller: notedetailController,
                            maxLines: 10,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(bottom: 1.w),
                                //  isDense: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 0.5.w, color: Colors.blue))),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                NoteModel noteModel = NoteModel(
                                    note: notedetailController.text,
                                    title: titleController.text);
                                noteController.addNote(noteModel);
                              },
                              child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text("Save")))
                        ],
                      );
                    },
                  );
                },
                child: Text("Add Note"))
          ],
        ),
      ),
    );
  }
}
