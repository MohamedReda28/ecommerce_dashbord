
abstract class DataBaseServeces {
  //خلي بالك هنا انت بتعمل خدمه لاي حاجه بيتعملها ارسال ل قاعده البيانات
  //المتغير الا اسمو path دلدا بياخد اما لنك api او اسم collection من firebase
  //بينما data دي الحاجه الا هتبعتها
  Future<void> addData({required String path, required Map<String, dynamic> data,String? documentId});
  //دي method بتجيب بانات المستخدم
  Future<Map<String,dynamic>> getData({required String path, required String documentId});
  Future<bool> chackIfDataExist({required String path, required String documentId});
}
