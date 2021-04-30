class UserDetails{
  String name,
      uid,
      city,
  type, email,
   covaxin, covishield;
  UserDetails({
    this.name,
    this.type,
    this.city,
    this.email,
    this.uid,
    this.covaxin,
    this.covishield

  });


  Map<String, dynamic> toJson() => {
    "name": name,
    "uid": uid,
    "type":type,
    "city":city,
    "covaxin":"0",
    "covishield":"0",

    "email": email,


  };
}