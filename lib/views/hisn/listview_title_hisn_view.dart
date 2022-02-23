import 'package:flutter/material.dart';
import 'package:quran/styles/txt_style.dart';
import 'package:quran/tools/push.dart';
import 'package:quran/views/hisn/detais_husn_view.dart';
import 'package:quran/widgets/custom_card.dart';
import 'hisn_model.dart';

class ListViewTitleHisnView extends StatefulWidget {
  //
  const ListViewTitleHisnView({
    Key? key,
    required this.listMTxt,
  }) : super(key: key);
  final List<MText> listMTxt;

  @override
  State<ListViewTitleHisnView> createState() => _ListViewTitleHisnViewState();
}

class _ListViewTitleHisnViewState extends State<ListViewTitleHisnView> {
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomCard(
        margin: const EdgeInsets.all(2.0),
        padding: const EdgeInsets.all(2.0),
        child: ListView.builder(
          itemCount: widget.listMTxt.length,
          itemBuilder: (BuildContext context, int index) {
            return CustomCard(
              margin: const EdgeInsets.all(2.0),
              padding: const EdgeInsets.all(2.0),
              child: ListTile(
                onTap: () => Push.to(
                    context, DetalsTitleHisnView(MTxt: widget.listMTxt[index])),
                contentPadding: const EdgeInsets.all(2.0),
                title: Text(
                  widget.listMTxt[index].arabicText,
                  style: TxtStyle.customStyle(fontSize: 18.0),
                ),
                subtitle: Text(
                  widget.listMTxt[index].translatedText,
                  textAlign: TextAlign.start,
                  softWrap: true,
                  style: TxtStyle.customStyle(
                    fontSize: 16.0,
                    color: Colors.green[900],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
