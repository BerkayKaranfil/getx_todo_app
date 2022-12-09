import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getx_todo_app/pages/note_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("ToDoApp"),
      ),
      body: Container(
        width: 100.w,
        margin: EdgeInsets.only(right: 5.w, left: 5.w),
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
             Expanded(
                child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                  height: 10.h,
                  width: 60.w,
                  child: Column(
                    children: [
                      ExpandableText(
                        "denemedenemedenemedeneemedenemedenemedenemedenemedenemedeneme",
                        expandText: 'show more',
                        collapseText: 'show less',
                        maxLines: 1,
                        linkColor: Colors.blue,
                      ),
                    ],
                  )
                );
              },
            )
            ),
            ElevatedButton(onPressed: () {
              Get.to(()=>NotePage());
            }, child: Text("Add Note")),
            Spacer()
          ],
        ),
      ),
    );
  }
}
