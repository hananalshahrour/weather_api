import 'dart:convert';
import 'package:http/http.dart' as http;

void main()async{
  List city=['Syria','London','Dubai','Lebanon','Canada'];
  for(int i=0;i<5;i++){
    var data= await getData(city[i],'d6f7291c42711d401fe230d3ff5b8314');
    print(data);}}

Future getData(String city,String apiKey)async{
  final url='https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=${apiKey}';
  //var uri=Uri.tryParse(url);
  var res=await http.get(Uri.tryParse(url)!);
  if(res.statusCode==200){
    var tmp= json.decode(res.body);
    return tmp;
  }else{
    throw Exception('Error!');
  }

}