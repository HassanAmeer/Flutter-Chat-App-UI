import 'package:flutter/material.dart';
import 'package:ralestate/dataclass.dart';

class Openchat extends StatefulWidget {
  final int userid;
  final String username;
  const Openchat(this.userid, this.username, {super.key});
  // const Openchat({super.key});

  @override
  State<Openchat> createState() => _OpenchatState();
}

class _OpenchatState extends State<Openchat> {
  final keyforcheck = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${widget.username} '),
          actions: const [
            CircleAvatar(
              child: Icon(Icons.person),
            )
          ],
        ),
        body: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                  padding: const EdgeInsets.all(3),
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black,
                            offset: Offset(1, 1),
                            blurRadius: 10)
                      ]),
                  child: Text(
                      '${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second} ')),
            ),
            _Chatsmsgs(widget: widget),
            // const _Chatsmsgs(),
            const Spacer(),
            _Fortyping(keyforcheck: keyforcheck, widget: widget),
          ],
        ));
  }
}

class _Chatsmsgs extends StatefulWidget {
  const _Chatsmsgs({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final Openchat widget;
  static List<Getmsgs> getapimsg = Getmsgs.list;

  @override
  State<_Chatsmsgs> createState() => _ChatsmsgsState();
}

class _ChatsmsgsState extends State<_Chatsmsgs> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.79,
      child: Expanded(
        // flex: 11,
        child: RefreshIndicator(
          onRefresh: (() async {
            const CircularProgressIndicator.adaptive();
            print('${Getmsgs.list[widget.widget.userid].msgs} ');
          }),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            reverse: true,
            itemCount: _Chatsmsgs.getapimsg[widget.widget.userid].msgs.length,
            itemBuilder: (BuildContext context, int index) {
              return Align(
                alignment:
                    index.isOdd ? Alignment.centerRight : Alignment.centerLeft,
                child: Dismissible(
                  key: ValueKey(
                      _Chatsmsgs.getapimsg[widget.widget.userid].msgs.length),
                  background: const Icon(Icons.delete),
                  secondaryBackground: const Icon(Icons.restore),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(5),
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.68),
                    decoration: BoxDecoration(
                        color: index.isOdd
                            ? Theme.of(context).colorScheme.background
                            : Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(1, 1),
                              blurRadius: 20),
                        ]),
                    child: Text(
                        '${_Chatsmsgs.getapimsg[widget.widget.userid].msgs} '),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _Fortyping extends StatefulWidget {
  const _Fortyping({
    Key? key,
    required this.keyforcheck,
    required this.widget,
  }) : super(key: key);

  final GlobalKey<FormState> keyforcheck;
  final Openchat widget;

  @override
  State<_Fortyping> createState() => _FortypingState();
}

class _FortypingState extends State<_Fortyping> {
  var textmsginput = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: const BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Card(
        // margin: EdgeInsets.all(0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const IconButton(
                onPressed: null, icon: Icon(Icons.attach_file_outlined)),
            const IconButton(onPressed: null, icon: Icon(Icons.emoji_emotions)),
            Expanded(
              child: Form(
                key: widget.keyforcheck,
                child: TextFormField(
                  controller: textmsginput,
                  decoration: InputDecoration(
                      fillColor: Colors.greenAccent,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)),
                      suffixIcon: IconButton(
                          onPressed: () {
                            if (widget.keyforcheck.currentState!.validate()) {
                              var sendmsg = Getmsgs(
                                  reciveid: widget.widget.userid,
                                  senderid: 1,
                                  msgs: textmsginput.toString(),
                                  gettime: DateTime(02, 10));
                              Getmsgs.list.add(sendmsg);
                              // Getfakeapi.list.removeAt(1);
                              // getapimsg[widget.userid].msg[index]
                            }
                            setState(() {});
                          },
                          icon: const Icon(
                            Icons.send,
                          )),
                      hintText: 'Type Here',
                      label: Text('Type For ${widget.widget.username}'),
                      semanticCounterText: 'Counter'),
                  validator: (value) {
                    if (value == '') {
                      return 'plz Write SomeThing';
                    }
                    return null;
                  },
                ),
              ),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.mic))
          ],
        ),
      ),
    );
  }
}

// create owsome buttom with comments