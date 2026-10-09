# Food Ordering System

A web-based Food Ordering System developed using Java Full Stack technologies. The application allows users to browse restaurants, view food menus, manage their cart, and place orders.

## Features

* User registration and login
* Restaurant browsing
* Food menu display
* Add and manage cart items
* Order placement and order details
* Payment page
* User profile management
* Admin order management

## Technologies Used

**Frontend**

* HTML
* CSS
* JSP

**Backend**

* Java
* JDBC
* Servlets
* DAO and Service layers

**Database**

* MySQL

**Tools**

* Eclipse IDE
* Apache Tomcat
* Git and GitHub

## Project Structure

```text
Food-Ordering-System/
├── src/
│   └── main/
│       ├── java/
│       │   └── com/tap/
│       │       ├── DAO/
│       │       ├── DAOimple/
│       │       ├── model/
│       │       ├── service/
│       │       ├── servlet/
│       │       └── utility/
│       └── webapp/
│           ├── images/
│           ├── WEB-INF/
│           ├── index.html
│           ├── login.html
│           ├── signup.html
│           ├── restaurant.jsp
│           ├── menu.jsp
│           ├── cart.jsp
│           └── order.jsp
└── README.md
```

## Setup and Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/SwethaSenthilkumar30/Food-Ordering-System.git
   ```

2. Import the project into Eclipse IDE as an existing project.

3. Configure Apache Tomcat in Eclipse.

4. Create the required MySQL database and tables for the application.

5. Configure the following environment variables with your database details:

   * `DB_URL` — MySQL connection URL
   * `DB_USER` — MySQL username
   * `DB_PASSWORD` — MySQL password

6. Ensure the MySQL Connector/J driver is available to the application.

7. Run the project on the configured Tomcat server.

## Security

* Configure database credentials using environment variables.
* Never commit database passwords or other secret credentials to GitHub.

## Author

**Swetha SenthilKumar**

GitHub: [SwethaSenthilkumar30](https://github.com/SwethaSenthilkumar30)

## License

This project is available for learning and educational purposes.
