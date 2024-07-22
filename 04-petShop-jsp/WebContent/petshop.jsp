<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pet Shop</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #c6dff9;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: rgb(5, 5, 80);
            color: rgb(179, 174, 174);
            padding: 16px;
            text-align: center;
        }
        nav {
            display: flex;
            justify-content: center;
            background-color: #164771;
        }
        nav a {
            color: white;
            padding: 1em;
            text-decoration: none;
        }
        nav a:hover {
            background-color: #01223b;
        }
        main {
            padding: 32px;
        }
        section {
            margin-bottom: 2em;
        }
        .pet {
            display: flex;
            align-items: center;
            margin-bottom: 16px;
        }
        .pet img {
            width: 150px;
            height: 150px;
            border-radius: 8px;
            margin-right: 16px;
        }
        footer {
            background-color: rgb(5, 5, 80);
            color: rgb(179, 174, 174);
            text-align: center;
            padding: 16px;
            position: fixed;
            width: 100%;
            bottom: 0;
        }
    </style>
</head>
<body>
    <header>
        <h1>Welcome to Pet Shop</h1>
    </header>
    <nav>
        <a href="#home">Home</a>
        <a href="#about">About Us</a>
        <a href="#services">Services</a>
        <a href="#pets">Pets</a>
        <a href="#contact">Contact</a>
    </nav>
    <main>
        <section id="home">
            <h2>Home</h2>
            <p>Welcome to our pet shop! We believe that pets are family. Our mission is to provide you and your furry, feathery, and scaly friends with the best products and services to ensure their happiness and well-being. With over a decade of experience in the pet care industry, we are passionate about helping you find the perfect companion to bring joy into your home. Whether you are looking for a playful puppy, a cuddly kitten, ora chirpy bird our wide selection of pets will surely meet your needs.</p>
        </section>
        <section id="about">
            <h2>About Us</h2>
            <p>Our dedicated team of animal lovers is here to assist you every step of the way. From expert advice on pet care and nutrition to a variety of grooming, boarding, and training services, we are committed to making pet ownership a delightful experience. Explore our website to discover the wonderful pets waiting for a loving home, and learn more about our comprehensive range of services designed to keep your pets happy and healthy. Thank you for choosing us,where every pet is treated with the love and care they deserve.</p>
        </section>
        <section id="services">
            <h2>Services</h2>
            <ul>
                <li>Pet Grooming: Our professional pet grooming services ensure your furry friends look and feel their best. We offer a range of grooming options, including baths, haircuts, nail trimming, and ear cleaning. Our experienced groomers use gentle, pet-friendly products to provide a stress-free grooming experience. Treat your pet to a spa day and see the difference in their coat and overall well-being. Book an appointment today for a happy, healthy, and well-groomed pet!</li>
            <br><li>Pet Boarding: When you’re away, trust us to take care of your pets with our top-notch boarding services. Our safe, comfortable, and clean facilities provide a home away from home for your furry companions. Each pet receives personalized attention, daily exercise, and social interaction. Our dedicated staff ensures all pets are well-fed, happy, and healthy during their stay. Reserve a spot today for worry-free travel, knowing your pet is in loving hands.</li>
            <br><li>Pet Training: Unlock your pet’s full potential with our professional training services. We offer customized training programs for dogs of all ages, focusing on obedience, behavior modification, and socialization. Our experienced trainers use positive reinforcement techniques to ensure a fun and effective learning experience. From basic commands to advanced skills, we help your pet become a well-mannered and happy companion. Enroll today and watch your pet thrive with confidence!</li>
            </ul>
        </section>
        <section id="pets">
            <h2>Our Pets</h2>
            <div class="pet">
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQC9VUmMbkH6raTMK77XL7ZCGmw1lnKW6rYjw3Pea1deZ2LtLBc" alt="Golden Retriever">
                <div>
                    <h3>Golden Retriever</h3>
                    <p>Age: 2 years</p>
                    <p>Friendly and energetic, perfect for families with kids.</p>
                </div>
            </div>
            <div class="pet">
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlOd7VnHIf9ucWqUz6zpt7QacZ-_bN-xn3LPfX-0SPuP-7wB4SefMhafzvDy1ikyhTIkw&usqp=CAU" alt="Siamese Cat">
                <div>
                    <h3>Cat</h3>
                    <p>Age: 1 year</p>
                    <p>Affectionate and vocal, loves attention and playtime.</p>
                </div>
            </div>
            <div class="pet">
                <img src="data:image/jpeg;base64,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" alt="Parrot">
                <div>
                    <h3>Parrot</h3>
                    <p>Age: 3 years</p>
                    <p>Colorful and intelligent, enjoys social interaction.</p>
                </div>
            </div>
        </section>
        <section id="contact">
            <h2>Contact</h2>
            <p>Email: info@petshop.com</p>
            <p>Mobile: 9999900000</p><br>
        </section>
    </main>
    <footer>
        <p>&copy; 2024 Pet Shop. All rights reserved.</p>
    </footer>
</body>
</html>
