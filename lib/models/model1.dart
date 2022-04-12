class History {
  final int id;
  final String oper;
  final String txt;
  final String date;

  History({required this.id, required this.oper ,required this.txt, required this.date});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'oper': oper,
      'txt': txt,
      'date': date 
    };
  }
}