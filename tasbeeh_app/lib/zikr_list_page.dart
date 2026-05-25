import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ZikrListPage extends StatefulWidget {
  const ZikrListPage({super.key});

  @override
  State<ZikrListPage> createState() => _ZikrListPageState();
}

class _ZikrListPageState extends State<ZikrListPage> {
  List<String> zikrList = [];
  var zikrTextController = TextEditingController();

  void addOrEditItem({int index = -1}){
    if(index != -1){
      zikrTextController.text = zikrList[index];
    }
    showModalBottomSheet(
      isScrollControlled: true,
      //button peecha araha keyoboard ka usko sahi karna
      //bohatbara na ay
      context: context,
      showDragHandle: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: zikrTextController,
                  decoration: InputDecoration(
                    // hintText: "Add Zikr Here",
                    labelText: "Write Zikr Here", //floating label
                  ),
                ),
                SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 42,
                  child: FilledButton.icon(
                    onPressed: () {
                      String zikr = zikrTextController.text.trim();
                      if (zikr.isNotEmpty) {
                        setState(() {
                          if(index == -1){
                            zikrList.add(zikr);
                          } else {
                            zikrList[index] = zikr;
                          }
                        });
                        _saveZikrList();
                        zikrTextController.clear();
                        Navigator.of(context).pop();
                      }
                    },
                    label: Text("Save"),
                    icon: Icon(Icons.check),
                    style: FilledButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void initState(){
    super.initState();
    _loadZikrList();
  }

  Future<void> _loadZikrList() async{
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      zikrList = prefs.getStringList('zikrList') ?? [
        "Alhamdulillah",
        "Subhan Allah",
        "Allah o Akbar",
        "Ma Sha Allah",
        "In Sha Allah",
      ];
    });
  }

  Future<void> _saveZikrList() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('zikrList', zikrList);
  }

  @override void dispose() {
    zikrTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: zikrList.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 0, vertical: 6),
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          //agar container par decoration laga dein to color decoration ka andr ana chahya bahir nhi ho sakta
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusGeometry.circular(10),
                            color: Theme.of(
                              context,
                            ).colorScheme.primaryContainer,
                          ),
                          child: Icon(
                            Icons.circle_outlined,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        SizedBox(width: 14),
                        Text(
                          zikrList[index],
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 16,
                          ),
                        ),
                        Spacer(), //jitna jaga mil saka utna space create karo
                        PopupMenuButton(
                          itemBuilder: (context) {
                            return [
                              //edit/update ki functionality assignment
                              //update karna ha add nhi karna aik modal show ho phela sa pichla text show ho, empty can not be updated
                              PopupMenuItem(
                                child: Text("Edit"),
                                onTap: () {
                                  addOrEditItem(index: index);
                                },
                              ),
                              PopupMenuItem(
                                child: Text("Delete"),
                                onTap: () {
                                  setState(() {
                                    zikrList.removeAt(index);
                                  });
                                  _saveZikrList();
                                },
                              ),
                            ];
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 42,
            child: FilledButton.icon(
              onPressed: () {
                zikrTextController.clear();
                addOrEditItem();
              },
              label: Text("Add New Zikr"),
              icon: Icon(Icons.add),
              style: FilledButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
