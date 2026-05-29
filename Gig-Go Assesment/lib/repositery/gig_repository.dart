import '../models/gig_model.dart';

class GigRepository {
  Future<List<GigModel>> getGigs() async {
    await Future.delayed(const Duration(milliseconds: 500));

    final data = [
      {
        "id": 1,
        "name": "Sarah Wilson",
        "title": "Flutter Developer",
        "category": "Development",
        "description":
            "Expert Flutter developer for scalable mobile applications.",
        "price": 120,
        "rating": 4.9,
        "reviews": 240,
        "imageUrl": "",
        "isTopRated": true,
        "isInstantBook": true,
        "isAvailable": true,
        "skills": ["Flutter", "Firebase", "Dart"]
      },
      {
        "id": 2,
        "name": "Alex Johnson",
        "title": "Logo Designer",
        "category": "Design",
        "description":
            "Creative logo and brand identity designer.",
        "price": 80,
        "rating": 4.7,
        "reviews": 180,
        "imageUrl": "",
        "isTopRated": false,
        "isInstantBook": true,
        "isAvailable": true,
        "skills": ["Photoshop", "Illustrator", "Branding"]
      },
      {
        "id": 3,
        "name": "Emily Brown",
        "title": "Video Editor",
        "category": "Editing",
        "description":
            "Professional video editor for social media and YouTube.",
        "price": 100,
        "rating": 4.8,
        "reviews": 150,
        "imageUrl": "",
        "isTopRated": true,
        "isInstantBook": false,
        "isAvailable": false,
        "skills": ["Premiere Pro", "After Effects"]
      },
      {
        "id": 4,
        "name": "Michael Lee",
        "title": "UI/UX Designer",
        "category": "Design",
        "description":
            "Modern UI/UX designer for web and mobile apps.",
        "price": 95,
        "rating": 4.6,
        "reviews": 132,
        "imageUrl": "",
        "isTopRated": true,
        "isInstantBook": true,
        "isAvailable": true,
        "skills": ["Figma", "Adobe XD", "Wireframing"]
      },
      {
        "id": 5,
        "name": "David Clark",
        "title": "Backend Developer",
        "category": "Development",
        "description":
            "Node.js and API development expert.",
        "price": 140,
        "rating": 4.9,
        "reviews": 210,
        "imageUrl": "",
        "isTopRated": true,
        "isInstantBook": false,
        "isAvailable": true,
        "skills": ["Node.js", "MongoDB", "Express"]
      },
      {
        "id": 6,
        "name": "Sophia Taylor",
        "title": "Content Writer",
        "category": "Writing",
        "description":
            "SEO optimized blog and article writing services.",
        "price": 60,
        "rating": 4.5,
        "reviews": 95,
        "imageUrl": "",
        "isTopRated": false,
        "isInstantBook": true,
        "isAvailable": true,
        "skills": ["SEO", "Copywriting", "Blogs"]
      },
      {
        "id": 7,
        "name": "James Martin",
        "title": "Digital Marketer",
        "category": "Marketing",
        "description":
            "Social media marketing and ad campaign specialist.",
        "price": 110,
        "rating": 4.8,
        "reviews": 175,
        "imageUrl": "",
        "isTopRated": true,
        "isInstantBook": true,
        "isAvailable": false,
        "skills": ["Facebook Ads", "SEO", "Google Ads"]
      },
      {
        "id": 8,
        "name": "Olivia White",
        "title": "Mobile App Tester",
        "category": "Testing",
        "description":
            "Manual and automation mobile app testing.",
        "price": 70,
        "rating": 4.4,
        "reviews": 88,
        "imageUrl": "",
        "isTopRated": false,
        "isInstantBook": false,
        "isAvailable": true,
        "skills": ["QA Testing", "Automation", "Bug Reports"]
      },
      {
        "id": 9,
        "name": "Daniel Scott",
        "title": "React Developer",
        "category": "Development",
        "description":
            "Frontend React developer for modern web apps.",
        "price": 130,
        "rating": 4.9,
        "reviews": 205,
        "imageUrl": "",
        "isTopRated": true,
        "isInstantBook": true,
        "isAvailable": true,
        "skills": ["React", "JavaScript", "Redux"]
      },
      {
        "id": 10,
        "name": "Emma Davis",
        "title": "Thumbnail Designer",
        "category": "Design",
        "description":
            "High-converting YouTube thumbnail designer.",
        "price": 50,
        "rating": 4.3,
        "reviews": 70,
        "imageUrl": "",
        "isTopRated": false,
        "isInstantBook": true,
        "isAvailable": true,
        "skills": ["Canva", "Photoshop", "YouTube Design"]
      }
    ];

    return data.map((e) => GigModel.fromJson(e)).toList();
  }
}