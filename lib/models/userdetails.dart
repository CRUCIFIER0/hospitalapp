class UserDetails{
  String name,
      uid,
      city,
  type, email;

  UserDetails({
    this.name,
    this.type,
    this.city,
    this.email,
    this.uid,


  });


  Map<String, dynamic> toJson() => {
    "name": name,
    "uid": uid,
    "type":type,
    "city":city,


    "email": email,


  };
}