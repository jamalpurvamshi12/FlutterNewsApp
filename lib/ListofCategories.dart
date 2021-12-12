class Categories{
   String name;
}

List<Categories> getcategories() {

  List<Categories> ct=[];

  Categories c7 = new Categories();
  c7.name = "general";
  ct.add(c7);

  Categories c2 = new Categories();
  c2.name = "health";
  ct.add(c2);

  Categories c6 = new Categories();
  c6.name = "business";
  ct.add(c6);

  Categories c1 = new Categories();
  c1.name = "technology";
  ct.add(c1);


  Categories c3 = new Categories();
  c3.name = "science";
  ct.add(c3);

  Categories c4 = new Categories();
  c4.name = "sports";
  ct.add(c4);

  Categories c5 = new Categories();
  c5.name = "entertainment";
  ct.add(c5);

  return ct;


}


