import 'package:flutter/material.dart';

import '../../utils/categories.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
        appBar: AppBar(
          title: Text('Discover',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
          actions: [
            Container(height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: Colors.grey,width: 0.5)
                ),
                child: Icon(Icons.notifications)),
            SizedBox(width: 8,),
            InkWell(
              onTap: () {
                setState(() {
                  Navigator.pushNamed(context, '/card');
                });
              },
              child: Container(height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.grey,width: 0.5)
                  ),
                  child: Icon(Icons.shopping_cart)),
            ),
            SizedBox(width: 8,),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Container(
                  height: 50,
                  width: 360,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Icon(Icons.search,color: Colors.grey.shade700,),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text('Search',style: TextStyle(color: Colors.grey.shade400,fontSize: 15),),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 230.0,top: 20),
                child: Text('Categories',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(l1.length, (index) => categories(l1[index]['name'],l1[index]['img'] ))
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 265.0,top: 20),
                child: Text('Brands',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0,top: 5),
                child: brandsButtons(),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 220.0,top: 20),
                child: Text('Best selling',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              ),
              Row(
                children: [
                  Column(
                    children: List.generate(product12.length, (index) => product1(product12[index]['name'], product12[index]['price'], product12[index]['category'], product12[index]['img'],index,context)),
                  ),
                  Column(
                    children: List.generate(product122.length, (index) => product2(product122[index]['name'], product122[index]['price'], product122[index]['category'], product122[index]['img'],index,context)),
                  ),
                ],
              )
            ],
          ),
        ),
      )
    );
  }
  Widget product1(String? name,int? prize,String? brand,String? image,int index,BuildContext context)
  {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/product',arguments: product12[index]);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0,top: 20),
            child: Container(
              height: 200,
              width: 160,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
              ),
              child: Image.asset(image!),
            ),
          ),
          Container(
            width: 160,
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Text(name!,overflow:TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Text(brand!,style: TextStyle(color: Colors.grey.shade400,fontSize: 15),),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Text('\$ $prize',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          ),
        ],
      ),
    );
  }
  Widget product2(String? name,int? prize,String? brand,String? image,int index,BuildContext context)
  {
    return InkWell(
      onTap: () {
          Navigator.of(context).pushNamed('/product',arguments: product122[index]);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0,top: 20),
            child: Container(
              height: 200,
              width: 160,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
              ),
              child: Image.asset(image!),
            ),
          ),
          Container(
            width: 160,
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Text(name!,overflow:TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Text(brand!,style: TextStyle(color: Colors.grey.shade400,fontSize: 15),),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Text('\$ $prize',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          ),
        ],
      ),
    );
  }
}
Widget categories(String? name,String? image)
{
  return Padding(
    padding: const EdgeInsets.only(left: 20.0,top: 20),
    child: Column(
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            shape: BoxShape.circle,
          ),
          child: Image.asset(image!,fit: BoxFit.cover,),
        ),
        Text(name!,style: TextStyle(fontSize: 15),)
      ],
    ),
  );
}
Widget brandsButtons() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        ...List.generate(brands.length, (index) =>
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: ElevatedButton(onPressed: () {},
                child: Text(
                brands[index],
                style: TextStyle(fontSize: 15,
                    color: Colors.black),
              ),),
            )),
      ],
    ),
  );
}