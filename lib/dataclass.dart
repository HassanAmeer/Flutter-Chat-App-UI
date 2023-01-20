// class Getfakeapi {
//   int userid;
//   String username;
//   String time;
//   List msg;

//   Getfakeapi(
//       {required this.userid,
//       required this.msg,
//       required this.username,
//       required this.time});

//   static List<Getfakeapi> list = [
//     Getfakeapi(
//       userid: 0,
//       username: 'Ali',
//       msg: ['hi how are you', 'where are you from', 'nice to meet you'],
//       time: '02:21',
//     ),
//     Getfakeapi(
//         userid: 1,
//         username: 'qasim',
//         time: '11:51',
//         msg: ['hi how are you', 'where are you from', 'nice to meet you']),
//     Getfakeapi(
//         userid: 2,
//         username: 'rafi',
//         time: '08:11',
//         msg: ['hi i am rafi', 'i am from pakistan', 'try to find new friend']),
//     Getfakeapi(
//         userid: 3,
//         username: 'sonia',
//         time: '10:33',
//         msg: ['hi sonia here', 'hope you better', ' Where are you from ']),
//     Getfakeapi(
//         userid: 4,
//         username: 'rasheed',
//         time: '07:54',
//         msg: ['hi rashid here', 'how can i help you', 'whats your demands']),
//     Getfakeapi(userid: 5, username: 'naina', time: '04:26', msg: [
//       'hi naina here',
//       'where to belong',
//       'how can i help you',
//     ]),
//     Getfakeapi(userid: 6, username: 'moeen', time: '11:21', msg: [
//       'hi moeen here',
//       'where to belong',
//       'how can i help you',
//     ]),
//     Getfakeapi(userid: 7, username: 'qasim', time: '04:54', msg: [
//       'hi naina here',
//       'where to belong',
//       'how can i help you',
//     ]),
//     Getfakeapi(userid: 8, username: 'tahir', time: '04:31', msg: [
//       'hi moeen here',
//       'where to belong',
//       'how can i help you',
//     ]),
//     Getfakeapi(userid: 9, username: 'john', time: '04:54', msg: [
//       'hi john here',
//       'where to belong',
//       'how can i help you',
//     ]),
//     Getfakeapi(userid: 10, username: 'wick', time: '10:32', msg: [
//       'hi wick here',
//       'where to belong',
//       'how can i help you',
//     ]),
//     Getfakeapi(userid: 11, username: 'majid', time: '10:32', msg: [
//       'hi majid here',
//       'where to belong',
//       'how can i help you',
//     ]),
//   ];
// }

/////////////////// A

class Getusers {
  int userid;
  String username;

  Getusers({
    required this.userid,
    required this.username,
  });

  static List<Getusers> list = [
    Getusers(userid: 0, username: 'rasheed'),
    Getusers(userid: 1, username: 'Ali'),
    Getusers(userid: 2, username: 'qasim'),
    Getusers(userid: 3, username: 'sonia'),
    Getusers(userid: 4, username: 'naina'),
    Getusers(userid: 5, username: 'rafi'),
    Getusers(userid: 6, username: 'majid'),
    Getusers(userid: 7, username: 'john'),
    Getusers(userid: 8, username: 'khalid'),
    Getusers(userid: 9, username: 'moeen'),
    Getusers(userid: 10, username: 'tahir'),
  ];
}

/////////////////// B

class Getmsgs {
  int reciveid;
  int senderid;
  String msgs;
  DateTime gettime;

  Getmsgs({
    required this.reciveid,
    required this.senderid,
    required this.msgs,
    required this.gettime,
  });

  static List<Getmsgs> list = [
    Getmsgs(
        reciveid: 0,
        senderid: 1,
        msgs: 'hi i am rasheed',
        gettime: DateTime(02, 10)),
    Getmsgs(
        reciveid: 1,
        senderid: 1,
        msgs: 'hi i am ali',
        gettime: DateTime(02, 10)),
    Getmsgs(
        reciveid: 2,
        senderid: 1,
        msgs: 'hi i am qasim',
        gettime: DateTime(02, 10)),
    Getmsgs(
        reciveid: 3,
        senderid: 1,
        msgs: 'hi i am sonia',
        gettime: DateTime(02, 10)),
    Getmsgs(
        reciveid: 4,
        senderid: 1,
        msgs: 'hi i am naina',
        gettime: DateTime(02, 10)),
    Getmsgs(
        reciveid: 5,
        senderid: 1,
        msgs: 'hi i am rafi',
        gettime: DateTime(02, 10)),
    Getmsgs(
        reciveid: 6,
        senderid: 1,
        msgs: 'hi i am majid',
        gettime: DateTime(02, 10)),
    Getmsgs(
        reciveid: 7,
        senderid: 1,
        msgs: 'hi i am john',
        gettime: DateTime(02, 10)),
    Getmsgs(
        reciveid: 8,
        senderid: 1,
        msgs: 'hi i am khalid',
        gettime: DateTime(02, 10)),
    Getmsgs(
        reciveid: 9,
        senderid: 1,
        msgs: 'hi i am moeen',
        gettime: DateTime(02, 10)),
    Getmsgs(
        reciveid: 10,
        senderid: 1,
        msgs: 'hi i am tahir',
        gettime: DateTime(02, 10)),
  ];
}
