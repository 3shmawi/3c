class UserModel {
  final String name;
  final String image;
  final String email;

  UserModel({
    required this.name,
    required this.image,
    required this.email,
  });

  factory UserModel.fromMap(Map<String, dynamic> json) {
    final data = json["results"][0];
    return UserModel(
      name:
          "${data["name"]["title"]}: ${data["name"]["first"]} ${data["name"]["last"]}",
      image: data["picture"]["large"],
      email: data["email"],
    );
  }
}
/*
{"results":
[{
"gender":"female",
"name":{"title":"Mademoiselle","first":"Diana","last":"Bourgeois"},
"location":{"street":{"number":5827,"name":"Place de L'Abbé-Jean-Lebeuf"},"city":"Auswil","state":"Schaffhausen","country":"Switzerland","postcode":4793,"coordinates":{"latitude":"-58.5418","longitude":"148.9375"},"timezone":{"offset":"+10:00","description":"Eastern Australia, Guam, Vladivostok"}},
"email":"diana.bourgeois@example.com",
"login":{"uuid":"310f9309-e2e2-4004-b8ce-b89f3566712f","username":"tinypeacock566","password":"sensei","salt":"i6ibdppF","md5":"5aaf7ef35d2f6d3613e7e7b83f6eded7","sha1":"c9abe3c6cdcd57a861afaf041bbb1ca3a7d4cc06","sha256":"64a94348848a3e90cc72a5677e96b898560b48d6ec306dad5cfe93a3d4e46f7d"},"dob":{"date":"1978-03-08T05:47:30.869Z","age":46},"registered":{"date":"2021-08-18T18:28:49.769Z","age":2},
"phone":"077 411 90 75","cell":"078 285 33 56","id":{"name":"AVS","value":"756.1509.1074.73"},
"picture":{"large":"https://randomuser.me/api/portraits/women/22.jpg","medium":"https://randomuser.me/api/portraits/med/women/22.jpg","thumbnail":"https://randomuser.me/api/portraits/thumb/women/22.jpg"},"nat":"CH"}],
"info":{"seed":"d3e6887544b11a22","results":1,"page":1,"version":"1.4"}}
 */
