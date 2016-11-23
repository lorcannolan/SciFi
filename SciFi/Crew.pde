class Crew
{
  String firstName;
  String surname;
  int age;
  String birthplace;
  String tall;
  int weight;
  String profession;
  
  Crew(TableRow row)
  {
    firstName = row.getString("firstname");
    surname = row.getString("lastname");
    age = row.getInt("age");
    birthplace = row.getString("place of birth");
    tall = row.getString("height");
    weight = row.getInt("weight");
    profession = row.getString("profession");
  }
}