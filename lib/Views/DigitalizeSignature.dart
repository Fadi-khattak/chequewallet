
import 'package:chequewallet/Controllers/SignatureController.dart';
import 'package:chequewallet/Views/Drawer.dart';
import 'package:chequewallet/Views/LoadingScreen.dart';
import 'package:chequewallet/Widgets/SignatureWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DigitalizeSignature extends StatelessWidget
{
  var _c=Get.put(SignatureController());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetX<SignatureController>(
      builder: (_) {
        return _.isLoading.isTrue ? LoadingScreen() : Scaffold(
          appBar: AppBar(
            title: Text("Digitalized Signature"),
          ),
          drawer: MyDrawer(),
          body: Column(
            children: [
              Container(
                margin:const EdgeInsets.symmetric(vertical: 30,horizontal: 20),
                child: Text("You can directly add your signature to your cheques before printing them out.",textAlign: TextAlign.center,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _.signs.length,
                  itemBuilder: (context,index){
                    return item(index,_);
                  },
                ),
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: (){
              Get.to(()=>SignatureWidget());
            },
            child: Center(child: Icon(Icons.add),),
          ),
        );
      }
    );
  }

  Widget item(int index,SignatureController controller)
  {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey,width: 2),bottom: BorderSide(color: Colors.grey,width: 2))
      ),
      child: Row(
        children: [
          Text("${index}",style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
          SizedBox(width: 20,),
          Text(controller.signs[index].signModel.name,style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              child: PopupMenuButton(
                child: Icon(Icons.more_horiz,size: 30,),
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      child: FlatButton.icon(onPressed: (){}, icon: Icon(Icons.edit), label: Text("Edit")),
                    ),
                    PopupMenuItem(
                      child: FlatButton.icon(onPressed: (){}, icon: Icon(Icons.delete), label: Text("Delete")),
                    ),
                    PopupMenuItem(
                      child: FlatButton.icon(onPressed: (){}, icon: Icon(Icons.text_fields), label: Text("Edit")),
                    ),
                  ];
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}