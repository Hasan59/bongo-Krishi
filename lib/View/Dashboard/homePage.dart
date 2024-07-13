import 'package:bongokrishi/View/Category/categoryDetails.dart';
import 'package:flutter/material.dart';



class HomePage extends StatelessWidget {
  String greeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning!';
    } else if (hour < 17) {
      return 'Good Afternoon!';
    } else {
      return 'Good Evening!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[50],
      appBar: AppBar(
        backgroundColor: Colors.cyan[100],
        elevation: 0,
        title: Text('Service App', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // User Profile Section
            Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage('https://d2qp0siotla746.cloudfront.net/img/use-cases/profile-picture/template_0.jpg'),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Mrs. Kaberi Jaman',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text('Jobra, Chittagong, Bangladesh'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),

            // Greeting Section
            Text(
              greeting(),
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.cyan[800]),
            ),
            Text('What are you looking for today?', style: TextStyle(color: Colors.grey)),
            SizedBox(height: 20),

            // Recent Services Section
            Text(
              'Recents',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              height: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  ServiceCard(),
                  ServiceCard(),
                  ServiceCard(),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Service Category Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Category',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'See All',
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CategoryCard('Harvester','https://cdn0.iconfinder.com/data/icons/smart-farm-flat-outline-agriculture-technology/512/Harvest-512.png', Colors.white),
                CategoryCard('Powertriller', 'https://i0.wp.com/krishimachine.com/wp-content/uploads/2022/09/12Hp-Power-Tiller.png', Colors.white),
                CategoryCard('Fertilizer', 'https://th.bing.com/th/id/R.481db36756a6df71bce602fe5e3411c4?rik=vrgWkrC898UnFQ&pid=ImgRaw&r=0', Colors.redAccent[100]!),
                CategoryCard('Cultivator', 'https://th.bing.com/th/id/OIP.iG4Ez9NlVT6vEwR1vKD8xAHaHa?rs=1&pid=ImgDetMain', Colors.white),
                CategoryCard('Machinery', 'https://th.bing.com/th/id/R.481db36756a6df71bce602fe5e3411c4?rik=vrgWkrC898UnFQ&pid=ImgRaw&r=0', Colors.white),
              ],
            ),
            SizedBox(height:10),
              Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Recommended Section
            Text(
              'Recommended For You',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              height: 300,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  RecommendedCard(
                    imageUrl: 'https://d2qp0siotla746.cloudfront.net/img/use-cases/profile-picture/template_0.jpg',
                    name: 'Provider 098',
                    rating: 5,
                    reviews: 64,
                    service: 'Cleaning Service',
                    cost: '530 Tk',
                  ),
                  RecommendedCard(
                    imageUrl: 'https://d2qp0siotla746.cloudfront.net/img/use-cases/profile-picture/template_0.jpg',
                    name: 'Provider 067',
                    rating: 5,
                    reviews: 143,
                    service: 'Painting Service',
                    cost: '458 Tk',
                  ),
                  RecommendedCard(
                    imageUrl: 'https://d2qp0siotla746.cloudfront.net/img/use-cases/profile-picture/template_0.jpg',
                    name: 'Provider 034',
                    rating: 5,
                    reviews: 91,
                    service: 'Barber Service',
                    cost: '590 Tk',
                  ),
                ],
              ),
            ),
          ],
        ),
              ),

          ],
        ),
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      //height: 400,
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[500]!,
            offset: Offset(4.0, 4.0),
            blurRadius: 15.0,
            spreadRadius: 1.0,
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(-4.0, -4.0),
            blurRadius: 15.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(
            'https://th.bing.com/th/id/R.481db36756a6df71bce602fe5e3411c4?rik=vrgWkrC898UnFQ&pid=ImgRaw&r=0',
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Text(
            'Painting Service',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text('250 Tk/hr'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Status:'),
              Text(
                'Pending',
                style: TextStyle(color: Colors.orange),
              ),
            ],
          ),
          Text('3.0 hour, August 21, 2023'),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final Color backgroundColor;

  CategoryCard(this.name, this.imageUrl, this.backgroundColor);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ServiceProvidersPage()));
      },
      child: Container(
        width: 80,
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[500]!,
              offset: Offset(4.0, 4.0),
              blurRadius: 15.0,
              spreadRadius: 1.0,
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(-4.0, -4.0),
              blurRadius: 15.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            Image.network(
              imageUrl,
              height: 40,
              width: 40,
            ),
            SizedBox(height: 5),
            Text(
              name,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RecommendedCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final int rating;
  final int reviews;
  final String service;
  final String cost;

  RecommendedCard({
    required this.imageUrl,
    required this.name,
    required this.rating,
    required this.reviews,
    required this.service,
    required this.cost,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[500]!,
            offset: Offset(4.0, 4.0),
            blurRadius: 15.0,
            spreadRadius: 1.0,
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(-4.0, -4.0),
            blurRadius: 15.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(imageUrl),
          ),
          SizedBox(height: 10),
          Text(
            name,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              rating,
                  (index) => Icon(Icons.star, color: Colors.amber, size: 14),
            ),
          ),
          Text(
            '($reviews Reviews)',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          SizedBox(height: 5),
          Text(
            service,
            style: TextStyle(fontSize: 14, color: Colors.blue),
          ),
          SizedBox(height: 5),
          Text(
            cost,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.red),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            child: Text('Check'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: Colors.cyan,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
          ),
        ],
      ),
    );
  }
}
