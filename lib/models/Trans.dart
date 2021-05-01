class Trans{
  String uid,
  fromhos,
  tohos,
  status,
  covaxamount,
  city,
  coviamount;
  Trans({

    this.uid,
    this.covaxamount,
    this.coviamount,
    this.fromhos,
    this.status,
    this.tohos,
    this.city

  });


  Map<String, dynamic> toJson() => {
    "requestedhospital": fromhos,
    "uid": uid,
    "reqestedtohos":tohos,
    "city":city,
    "covaxin":covaxamount,
    "covishield":coviamount,
    "status":status


  };
}