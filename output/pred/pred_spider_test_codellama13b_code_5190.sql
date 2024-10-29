SELECT count(*) FROM club
SELECT count(*) FROM club
SELECT name FROM club ORDER BY name ASC
SELECT name FROM club ORDER BY name
SELECT Manager ,  Captain FROM club
SELECT manager ,  captain FROM club
SELECT name FROM club WHERE manufacturer != "Nike"
SELECT name FROM club WHERE manufacturer != 'Nike'
SELECT name FROM player ORDER BY Wins_count ASC
SELECT name FROM player ORDER BY Wins_count ASC
SELECT Name FROM player ORDER BY Earnings DESC LIMIT 1
SELECT Name FROM player ORDER BY Earnings DESC LIMIT 1
SELECT DISTINCT Country FROM player WHERE Earnings  >  1200000
SELECT country FROM player WHERE earnings  >  1200000
SELECT country FROM player WHERE wins_count  >  2 ORDER BY earnings DESC LIMIT 1
SELECT Country FROM player WHERE Wins_count  >  2 ORDER BY Earnings DESC LIMIT 1
SELECT T1.Name ,  T2.Name FROM player AS T1 JOIN club AS T2 ON T1.Club_ID  =  T2.Club_ID
SELECT T1.Name ,  T2.Name FROM player AS T1 JOIN club AS T2 ON T1.Club_ID  =  T2.Club_ID
SELECT T1.name FROM club AS T1 JOIN player AS T2 ON T1.club_id  =  T2.club_id GROUP BY T2.club_id HAVING sum(T2.wins_count)  >  2
SELECT T1.name FROM club AS T1 JOIN player AS T2 ON T1.club_id  =  T2.club_id WHERE T2.wins_count  >  2
SELECT T1.Name FROM player AS T1 JOIN club AS T2 ON T1.Club_ID  =  T2.Club_ID WHERE T2.Manager  =  "Sam Allardyce"
SELECT T1.Name FROM player AS T1 JOIN club AS T2 ON T1.Club_ID  =  T2.Club_ID WHERE T2.Manager  =  "Sam Allardyce"
SELECT t1.name FROM club AS t1 JOIN player AS t2 ON t1.club_id  =  t2.club_id ORDER BY avg(t2.earnings) DESC
SELECT T2.Name FROM player AS T1 JOIN club AS T2 ON T1.Club_ID  =  T2.Club_ID GROUP BY T1.Club_ID ORDER BY AVG(T1.Earnings) DESC
SELECT Manufacturer ,  count(*) FROM club GROUP BY Manufacturer
SELECT Manufacturer ,  COUNT(*) FROM club GROUP BY Manufacturer
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY count(*) DESC LIMIT 1
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY count(*) DESC LIMIT 1
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING count(*)  >  1
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(*)  >  1
SELECT Country FROM player GROUP BY Country HAVING count(*)  >  1
SELECT Country FROM player GROUP BY Country HAVING count(*)  >  1
SELECT Name FROM club WHERE Club_ID NOT IN (SELECT Club_ID FROM player)
SELECT name FROM club WHERE club_id NOT IN (SELECT club_id FROM player)
SELECT Country FROM player WHERE Earnings  >  1400000 UNION SELECT Country FROM player WHERE Earnings  <  1100000
SELECT country FROM player WHERE earnings  >  1400000 INTERSECT SELECT country FROM player WHERE earnings  <  1100000
SELECT count(DISTINCT Country) FROM player
SELECT count(DISTINCT country) FROM player
SELECT Earnings FROM player WHERE Country  =  "Australia" OR Country  =  "Zimbabwe"
SELECT Earnings FROM player WHERE Country  =  "Australia" OR Country  =  "Zimbabwe"
SELECT T1.customer_id ,  T3.customer_first_name ,  T3.customer_last_name FROM orders AS T1 JOIN order_items AS T2 ON T1.order_id = T2.order_id JOIN customers AS T3 ON T1.customer_id = T3.customer_id GROUP BY T1.customer_id HAVING count(*)  >=  2 INTERSECT SELECT T1.customer_id ,  T3.customer_first_name ,  T3.customer_last_name FROM orders AS T1 JOIN order_items AS T2 ON T1.order_id = T2.order_id JOIN customers AS T3 ON T1.customer_id = T3.customer_id GROUP BY T1.customer_id HAVING count(*)  >=  3
SELECT T1.customer_id ,  T2.customer_first_name ,  T2.customer_last_name FROM orders AS T1 JOIN customers AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id HAVING count(*)  >  2 INTERSECT SELECT T1.customer_id ,  T2.customer_first_name ,  T2.customer_last_name FROM orders AS T1 JOIN customers AS T2 ON T1.customer_id  =  T2.customer_id JOIN order_items AS T3 ON T3.order_id  =  T1.order_id GROUP BY T1.customer_id HAVING count(*)  >=  3
SELECT T1.order_id ,  T1.order_status_code ,  count(*) FROM ORDERS AS T1 JOIN Order_Items AS T2 ON T1.order_id  =  T2.order_id GROUP BY T1.order_id
SELECT T1.order_id ,  count(*) ,  T1.order_status_code FROM Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id  =  T2.order_id GROUP BY T1.order_id
SELECT T2.date_order_placed FROM orders AS T1 JOIN orders AS T2 ON T1.order_id = T2.order_id GROUP BY T1.order_id HAVING count(*)  >  1 UNION SELECT date_order_placed FROM orders ORDER BY date_order_placed LIMIT 1
SELECT T2.date_order_placed ,  count(*) FROM orders AS T1 JOIN orders AS T2 ON T1.order_id  =  T2.order_id GROUP BY T1.date_order_placed HAVING count(*)  >  1 UNION SELECT T2.date_order_placed FROM orders AS T1 JOIN orders AS T2 ON T1.order_id  =  T2.order_id GROUP BY T1.date_order_placed HAVING count(*)  =  1 ORDER BY T2.date_order_placed LIMIT 1
SELECT customer_first_name ,  customer_middle_initial ,  customer_last_name FROM customers WHERE customer_id NOT IN (SELECT customer_id FROM orders)
SELECT customer_first_name ,  customer_last_name ,  customer_middle_initial FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM orders)
SELECT product_id ,  product_name ,  product_price ,  product_color FROM products EXCEPT SELECT T1.product_id ,  T1.product_name ,  T1.product_price ,  T1.product_color FROM products AS T1 JOIN Order_Items AS T2 ON T1.product_id  =  T2.product_id GROUP BY T1.product_id HAVING count(*)  >  2
SELECT T2.product_id ,  T2.product_name ,  T2.product_price ,  T2.product_color FROM Order_Items AS T1 JOIN products AS T2 ON T1.product_id  =  T2.product_id GROUP BY T2.product_id HAVING count(*)  <  2
SELECT T2.order_id ,  T2.date_order_placed FROM Order_Items AS T1 JOIN Orders AS T2 ON T1.order_id = T2.order_id GROUP BY T2.order_id HAVING count(*)  >=  2
SELECT T1.order_id ,  T1.date_order_placed FROM Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id GROUP BY T1.order_id HAVING COUNT(*)  >=  2
SELECT T2.product_id ,  T2.product_name ,  T2.product_price FROM orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id GROUP BY T2.product_id ORDER BY count(*) DESC LIMIT 1
SELECT T2.product_id ,  T2.product_name ,  T2.product_price FROM Order_Items AS T1 JOIN Products AS T2 ON T1.product_id  =  T2.product_id GROUP BY T1.product_id ORDER BY count(*) DESC LIMIT 1
SELECT T2.order_id ,  sum(T1.product_price) FROM products AS T1 JOIN order_items AS T2 ON T1.product_id  =  T2.product_id GROUP BY T2.order_id ORDER BY sum(T1.product_price) LIMIT 1
SELECT T2.order_id ,  sum(T1.product_price) FROM products AS T1 JOIN order_items AS T2 ON T1.product_id  =  T2.product_id GROUP BY T2.order_id ORDER BY sum(T1.product_price) ASC LIMIT 1
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY count(*) DESC LIMIT 1
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY count(*) DESC LIMIT 1
SELECT T2.gender_code ,  count(*) FROM customers AS T1 JOIN orders AS T2 ON T1.customer_id  =  T2.customer_id JOIN order_items AS T3 ON T2.order_id  =  T3.order_id GROUP BY T2.customer_id
SELECT count(*) ,  T1.gender_code FROM Customers AS T1 JOIN orders AS T2 JOIN order_items AS T3 JOIN products AS T4 ON T1.customer_id = T2.customer_id AND T2.order_id = T3.order_id AND T3.product_id = T4.product_id GROUP BY T1.gender_code
SELECT count(*) ,  T1.gender_code FROM customers AS T1 JOIN orders AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.gender_code
SELECT count(*) ,  T1.gender_code FROM customers AS T1 JOIN orders AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.gender_code
SELECT T1.customer_first_name ,  T1.customer_middle_initial ,  T1.customer_last_name ,  T2.payment_method_code FROM Customers AS T1 JOIN Customer_Payment_Methods AS T2 ON T1.customer_id  =  T2.customer_id
SELECT customer_first_name ,  customer_middle_initial ,  customer_last_name ,  payment_method_code FROM Customers AS T1 JOIN Customer_Payment_Methods AS T2 ON T1.customer_id  =  T2.customer_id
SELECT T1.invoice_status_code ,  T1.invoice_date ,  T2.shipment_date FROM INVOICES AS T1 JOIN shipments AS T2 ON T1.invoice_number  =  T2.invoice_number
SELECT T1.invoice_status_code ,  T1.invoice_date ,  T2.shipment_date FROM INVOICES AS T1 JOIN SHIPMENTS AS T2 ON T1.invoice_number  =  T2.invoice_number
SELECT T3.product_name ,  T2.shipment_date FROM shipments AS T2 JOIN order_items AS T1 ON T2.shipment_id = T1.shipment_id JOIN products AS T3 ON T1.product_id = T3.product_id
SELECT T3.product_name ,  T2.shipment_date FROM shipments AS T2 JOIN order_items AS T1 ON T2.shipment_id = T1.shipment_id JOIN products AS T3 ON T1.product_id = T3.product_id
SELECT T2.order_item_status_code ,  T1.shipment_tracking_number FROM shipments AS T1 JOIN order_items AS T2 ON T1.shipment_id = T2.order_item_id WHERE T1.shipment_date != "0"
SELECT T1.order_item_status_code ,  T2.shipment_tracking_number FROM Order_Items AS T1 JOIN Shipment_Items AS T2 ON T1.order_item_id  =  T2.order_item_id WHERE T1.order_item_status_code  =  'Ordered'
SELECT DISTINCT T2.product_name ,  T2.product_color FROM order_items AS T1 JOIN products AS T2 ON T1.product_id = T2.product_id JOIN shipments AS T3 ON T3.shipment_id = T1.shipment_id
SELECT DISTINCT T3.product_name ,  T3.product_color FROM shipments AS T1 JOIN shipment_items AS T2 ON T1.shipment_id  =  T2.shipment_id JOIN products AS T3 ON T2.order_item_id  =  T3.product_id
SELECT DISTINCT T3.product_name ,  T3.product_price ,  T3.product_description FROM orders AS T1 JOIN order_items AS T2 JOIN products AS T3 ON T1.order_id = T2.order_id AND T2.product_id = T3.product_id JOIN customers AS T4 ON T1.customer_id = T4.customer_id WHERE T4.gender_code  =  'F'
SELECT DISTINCT T1.product_name ,  T1.product_price ,  T1.product_description FROM products AS T1 JOIN orders AS T2 JOIN order_items AS T3 JOIN customers AS T4 ON T1.product_id  =  T3.product_id AND T2.customer_id  =  T4.customer_id AND T2.order_id  =  T3.order_id WHERE T4.gender_code  =  'F'
SELECT T1.invoice_status_code FROM INVOICES AS T1 JOIN SHIPMENTS AS T2 ON T1.invoice_number  =  T2.invoice_number GROUP BY T1.invoice_number HAVING count(*)  =  0
SELECT DISTINCT T1.invoice_status_code FROM invoices AS T1 JOIN shipments AS T2 ON T1.invoice_number  =  T2.invoice_number
SELECT T1.order_id ,  T1.date_order_placed ,  sum(T2.product_price) FROM orders AS T1 JOIN order_items AS T2 ON T1.order_id = T2.order_id GROUP BY T1.order_id
SELECT T1.order_id ,  T1.date_order_placed ,  T2.total_amount FROM Orders AS T1 JOIN Invoices AS T2 ON T1.order_id  =  T2.invoice_number
SELECT count(DISTINCT customer_id) FROM orders
SELECT count(DISTINCT customer_id) FROM orders
SELECT count(DISTINCT order_item_status_code) FROM order_items
SELECT count(DISTINCT order_item_status_code) FROM Order_Items
SELECT count(DISTINCT payment_method_code) FROM customer_payment_methods
SELECT count(DISTINCT payment_method_code) FROM customer_payment_methods
SELECT login_name ,  login_password FROM Customers WHERE phone_number LIKE '+12%'
SELECT login_name ,  login_password FROM Customers WHERE phone_number LIKE '+12%'
SELECT product_size FROM products WHERE product_name LIKE '%Dell%'
SELECT product_size FROM products WHERE product_name LIKE "%Dell%"
SELECT product_price ,  product_size FROM products WHERE product_price  >  (SELECT avg(product_price) FROM products)
SELECT product_price ,  product_size FROM products WHERE product_price  >  (SELECT avg(product_price) FROM products)
SELECT count(*) FROM products WHERE product_id NOT IN ( SELECT product_id FROM order_items )
SELECT count(*) FROM products WHERE product_id NOT IN (SELECT product_id FROM order_items)
SELECT count(*) FROM customers WHERE customer_id NOT IN (SELECT customer_id FROM customer_payment_methods)
SELECT count(*) FROM customers WHERE customer_id NOT IN (SELECT customer_id FROM customer_payment_methods)
SELECT order_status_code ,  date_order_placed FROM orders
SELECT order_status_code ,  date_order_placed FROM ORDERS
SELECT address_line_1 ,  town_city ,  county FROM customers WHERE country  =  'USA'
SELECT address_line_1 ,  town_city ,  county FROM customers WHERE country  =  'United States'
SELECT T2.customer_first_name ,  T1.product_name FROM products AS T1 JOIN orders AS T2 JOIN order_items AS T3 ON T1.product_id = T3.product_id AND T2.order_id = T3.order_id
SELECT T3.customer_first_name ,  T1.product_name FROM orders AS T2 JOIN order_items AS T1 ON T2.order_id = T1.order_id JOIN customers AS T3 ON T2.customer_id = T3.customer_id
SELECT count(*) FROM shipment_items
SELECT count(*) FROM shipments
SELECT avg(product_price) FROM products
SELECT avg(product_price) FROM products
SELECT avg(T2.product_price) FROM orders AS T1 JOIN order_items AS T2 ON T1.order_id = T2.order_id
SELECT avg(T1.product_price) FROM products AS T1 JOIN order_items AS T2 ON T1.product_id  =  T2.product_id
SELECT email_address ,  town_city ,  county FROM Customers GROUP BY gender_code ORDER BY count(*) ASC LIMIT 1
SELECT T1.email_address ,  T1.town_city ,  T1.county FROM Customers AS T1 JOIN orders AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id ORDER BY count(*) ASC LIMIT 1
SELECT T1.date_order_placed FROM orders AS T1 JOIN customers AS T2 ON T1.customer_id = T2.customer_id JOIN customer_payment_methods AS T3 ON T3.customer_id = T2.customer_id GROUP BY T1.customer_id HAVING count(*)  >=  2
SELECT T1.date_order_placed FROM orders AS T1 JOIN customers AS T2 ON T1.customer_id  =  T2.customer_id JOIN customer_payment_methods AS T3 ON T2.customer_id  =  T3.customer_id GROUP BY T1.customer_id HAVING count(*)  >=  2
SELECT order_status_code FROM orders GROUP BY order_status_code ORDER BY count(*) ASC LIMIT 1
SELECT order_status_code FROM orders GROUP BY order_status_code ORDER BY count(*) ASC LIMIT 1
SELECT T2.product_id ,  T2.product_description FROM Order_Items AS T1 JOIN Products AS T2 ON T1.product_id  =  T2.product_id GROUP BY T1.product_id HAVING count(*)  >  3
SELECT T2.product_id ,  T2.product_description FROM Order_Items AS T1 JOIN Products AS T2 ON T1.product_id  =  T2.product_id GROUP BY T1.product_id HAVING count(*)  >  3
SELECT T1.invoice_date ,  T1.invoice_number FROM Invoices AS T1 JOIN Shipments AS T2 ON T1.invoice_number  =  T2.invoice_number GROUP BY T1.invoice_number HAVING count(*)  >=  2
SELECT T1.invoice_date ,  T1.invoice_number FROM Invoices AS T1 JOIN Shipments AS T2 ON T1.invoice_number  =  T2.invoice_number GROUP BY T1.invoice_number HAVING count(*)  >=  2
SELECT shipment_tracking_number ,  shipment_date FROM shipments
SELECT shipment_tracking_number ,  shipment_date FROM shipments
SELECT product_color ,  product_description ,  product_size FROM products WHERE product_price  <  (SELECT max(product_price) FROM products)
SELECT product_color ,  product_description ,  product_size FROM products WHERE product_price != (SELECT max(product_price) FROM products)
SELECT name FROM director WHERE age  >  (SELECT avg(age) FROM director)
SELECT name FROM director ORDER BY age DESC LIMIT 1
SELECT count(*) FROM channel WHERE internet LIKE "%bbc%"
SELECT count(DISTINCT digital_terrestrial_channel) FROM channel
SELECT title FROM program ORDER BY start_year DESC
SELECT T1.name FROM director AS T1 JOIN program AS T2 ON T1.director_id  =  T2.director_id GROUP BY T1.director_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.name ,  T1.age FROM director AS T1 JOIN program AS T2 ON T1.director_id  =  T2.director_id GROUP BY T1.director_id ORDER BY count(*) DESC LIMIT 1
SELECT title FROM program ORDER BY start_year DESC LIMIT 1
SELECT t1.name ,  t1.internet FROM channel AS t1 JOIN program AS t2 ON t1.channel_id  =  t2.channel_id GROUP BY t2.channel_id HAVING count(*)  >  1
SELECT count(*) ,  T1.name FROM channel AS T1 JOIN program AS T2 ON T1.channel_id  =  T2.channel_id GROUP BY T1.channel_id
SELECT count(*) FROM channel WHERE channel_id NOT IN (SELECT channel_id FROM program)
SELECT T1.Name FROM director AS T1 JOIN program AS T2 ON T1.Director_ID  =  T2.Director_ID WHERE T2.Title  =  "Dracula"
SELECT T2.Name ,  T2.Internet FROM director_admin AS T1 JOIN channel AS T2 ON T1.Channel_ID  =  T2.Channel_ID GROUP BY T1.Channel_ID ORDER BY count(*) DESC LIMIT 1
SELECT name FROM director WHERE age BETWEEN 30 AND 60
SELECT T3.Name FROM director_admin AS T1 JOIN director AS T2 ON T1.Director_ID  =  T2.Director_ID JOIN channel AS T3 ON T1.Channel_ID  =  T3.Channel_ID WHERE T2.age  <  40 INTERSECT SELECT T3.Name FROM director_admin AS T1 JOIN director AS T2 ON T1.Director_ID  =  T2.Director_ID JOIN channel AS T3 ON T1.Channel_ID  =  T3.Channel_ID WHERE T2.age  >  60
SELECT channel_id ,  name FROM channel EXCEPT SELECT T1.channel_id ,  T2.name FROM director_admin AS T1 JOIN channel AS T2 ON T1.channel_id  =  T2.channel_id JOIN director AS T3 ON T1.director_id  =  T3.director_id WHERE T3.name  =  'Hank Baskett'
SELECT count(*) FROM radio
SELECT Transmitter FROM radio ORDER BY ERP_kW ASC
SELECT tv_show_name ,  original_airdate FROM tv_show
SELECT station_name FROM city_channel WHERE affiliation != 'ABC'
SELECT Transmitter FROM radio WHERE ERP_kW  >  150 OR ERP_kW  <  30
SELECT transmitter FROM radio ORDER BY ERP_kW DESC LIMIT 1
SELECT avg(ERP_kW) FROM radio
SELECT affiliation ,  count(*) FROM city_channel GROUP BY affiliation
SELECT affiliation FROM city_channel GROUP BY affiliation ORDER BY count(*) DESC LIMIT 1
SELECT affiliation FROM city_channel GROUP BY affiliation HAVING count(*)  >  3
SELECT city ,  station_name FROM city_channel ORDER BY station_name ASC
SELECT T1.Transmitter ,  T2.city FROM radio AS T1 JOIN city_channel_radio AS T2 ON T1.radio_id  =  T2.radio_id
SELECT T1.Transmitter ,  T2.Station_name FROM radio AS T1 JOIN city_channel AS T2 ON T1.Radio_ID  =  T2.Radio_ID ORDER BY T1.ERP_kW DESC
SELECT T1.Transmitter ,  count(*) FROM radio AS T1 JOIN city_channel_radio AS T2 ON T1.Radio_ID  =  T2.Radio_ID GROUP BY T1.Transmitter
SELECT DISTINCT transmitter FROM radio EXCEPT SELECT T1.transmitter FROM radio AS T1 JOIN city_channel_radio AS T2 ON T1.radio_id  =  T2.radio_id
SELECT Model FROM vehicle WHERE Power  >  6000 AND Top_Speed  =  (SELECT max(Top_Speed) FROM vehicle)
SELECT Model FROM vehicle WHERE Power  >  6000 ORDER BY Top_Speed DESC LIMIT 1
SELECT Name FROM driver WHERE Citizenship  =  "United States"
SELECT Name FROM driver WHERE Citizenship = "United States"
SELECT count(*) ,  T1.Driver_ID FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID  =  T2.Driver_ID GROUP BY T1.Driver_ID ORDER BY count(*) DESC LIMIT 1
SELECT T2.Driver_ID ,  COUNT(*) FROM vehicle_driver AS T1 JOIN driver AS T2 ON T1.Driver_ID  =  T2.Driver_ID GROUP BY T2.Driver_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT max(power) ,  avg(power) FROM vehicle WHERE builder  =  'Zhuzhou'
SELECT max(Power) ,  avg(Power) FROM vehicle WHERE Builder  =  "Zhuzhou"
SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT vehicle_id FROM vehicle_driver GROUP BY vehicle_id ORDER BY count(*) ASC LIMIT 1
SELECT Top_Speed ,  Power FROM vehicle WHERE Build_Year  =  1996
SELECT Top_Speed ,  Power FROM vehicle WHERE Build_Year  =  1996
SELECT Build_Year ,  Model ,  Builder FROM vehicle
SELECT Build_Year ,  Model ,  Builder FROM vehicle
SELECT count(*) FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.Vehicle_ID  =  T2.Vehicle_ID WHERE T1.Build_Year  =  2012
SELECT COUNT(DISTINCT T1.name) FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.driver_id  =  T2.driver_id JOIN vehicle AS T3 ON T2.vehicle_id  =  T3.vehicle_id WHERE T3.Build_Year  =  2012
SELECT count(*) FROM driver WHERE Racing_Series  =    "NASCAR"
SELECT count(*) FROM driver WHERE Racing_Series  =    "NASCAR"
SELECT avg(Top_Speed) FROM vehicle
SELECT avg(Top_Speed) FROM vehicle
SELECT DISTINCT T1.Name FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID  =  T2.Driver_ID JOIN vehicle AS T3 ON T2.Vehicle_ID  =  T3.Vehicle_ID WHERE T3.Power  >  5000
SELECT T2.Name FROM vehicle AS T1 JOIN driver AS T2 ON T1.Vehicle_ID  =  T2.Driver_ID WHERE T1.Power  >  5000
SELECT Model FROM vehicle WHERE Total_Production  >  100 OR Top_Speed  >  150
SELECT Model FROM vehicle WHERE Total_Production  >  100 OR Top_Speed  >  150
SELECT Model ,  Build_Year FROM vehicle WHERE Model LIKE "%DJ%"
SELECT model ,  build_year FROM vehicle WHERE model LIKE "%DJ%"
SELECT Model FROM vehicle WHERE Vehicle_ID NOT IN (SELECT Vehicle_ID FROM vehicle_driver)
SELECT Model FROM vehicle WHERE Vehicle_ID NOT IN (SELECT Vehicle_ID FROM vehicle_driver)
SELECT T2.Vehicle_ID ,  T2.Model FROM vehicle_driver AS T1 JOIN vehicle AS T2 ON T1.Vehicle_ID  =  T2.Vehicle_ID GROUP BY T1.Vehicle_ID HAVING COUNT(*)  >=  2 UNION SELECT T2.Vehicle_ID ,  T2.Model FROM vehicle_driver AS T1 JOIN vehicle AS T2 ON T1.Vehicle_ID  =  T2.Vehicle_ID WHERE T2.Builder  =  'Ziyang'
SELECT T2.Vehicle_ID ,  T2.Model FROM vehicle_driver AS T1 JOIN vehicle AS T2 ON T1.Vehicle_ID  =  T2.Vehicle_ID GROUP BY T2.Vehicle_ID HAVING COUNT(*)  =  2 UNION SELECT Vehicle_ID ,  Model FROM vehicle WHERE Builder  =  'Ziyang'
SELECT T2.Vehicle_ID ,  T2.Model FROM vehicle_driver AS T1 JOIN vehicle AS T2 ON T1.Vehicle_ID  =  T2.Vehicle_ID JOIN driver AS T3 ON T1.Driver_ID  =  T3.Driver_ID GROUP BY T2.Vehicle_ID HAVING COUNT(*)  >  2 OR T3.Name  =  'Jeff Gordon'
SELECT T2.Vehicle_ID ,  T2.Model FROM vehicle_driver AS T1 JOIN vehicle AS T2 ON T1.Vehicle_ID  =  T2.Vehicle_ID JOIN driver AS T3 ON T1.Driver_ID  =  T3.Driver_ID WHERE T3.Name  =  'Jeff Gordon' GROUP BY T2.Vehicle_ID HAVING COUNT(*)  >  2
SELECT count(*) FROM vehicle GROUP BY Top_Speed ORDER BY count(*) DESC LIMIT 1
SELECT count(*) FROM vehicle WHERE Top_Speed  =  (SELECT max(Top_Speed) FROM vehicle)
SELECT Name FROM driver ORDER BY Name ASC
SELECT Name FROM driver ORDER BY Name ASC
SELECTcount(*) ,  Racing_Series FROM driver GROUP BY Racing_Series
SELECTcount(*) ,  Racing_Series FROM driver GROUP BY Racing_Series
SELECT T3.Name ,  T3.Citizenship FROM vehicle_driver AS T1 JOIN vehicle AS T2 ON T1.Vehicle_ID  =  T2.Vehicle_ID JOIN driver AS T3 ON T1.Driver_ID  =  T3.Driver_ID WHERE T2.Model  =  'DJ1'
SELECT T3.Name ,  T3.Citizenship FROM vehicle_driver AS T1 JOIN vehicle AS T2 ON T1.Vehicle_ID  =  T2.Vehicle_ID JOIN driver AS T3 ON T1.Driver_ID  =  T3.Driver_ID WHERE T2.Model  =  'DJ1'
SELECT count(*) FROM driver WHERE driver_id NOT IN (SELECT driver_id FROM vehicle_driver)
SELECT count(*) FROM driver WHERE driver_id NOT IN (SELECT driver_id FROM vehicle_driver)
SELECT count(*) FROM EXAMS
SELECT count(*) FROM exams
SELECT DISTINCT subject_code FROM exams ORDER BY subject_code ASC
SELECT DISTINCT subject_code FROM exams ORDER BY subject_code
SELECT exam_name ,  exam_date FROM exams WHERE subject_code != "Database"
SELECT exam_date ,  exam_name FROM exams WHERE subject_code != "Database"
SELECT exam_date FROM exams WHERE subject_code LIKE "%data%" ORDER BY exam_date DESC
SELECT exam_date FROM exams WHERE subject_code LIKE "%data%" ORDER BY exam_date DESC
SELECT TYPE_of_Question_Code ,  count(*) FROM Questions GROUP BY TYPE_of_Question_Code
SELECT TYPE_of_Question_Code ,  count(*) FROM Questions GROUP BY TYPE_of_Question_Code
SELECT DISTINCT student_answer_text FROM student_answers WHERE comments  =  "Normal"
SELECT DISTINCT T1.student_answer_text FROM student_answers AS T1 JOIN students AS T2 ON T1.student_id  =  T2.student_id WHERE T1.comments  =  "Normal"
SELECT count(DISTINCT comments) FROM student_answers
SELECT count(DISTINCT comments) FROM student_answers
SELECT student_answer_text FROM student_answers GROUP BY student_answer_text ORDER BY count(*) DESC
SELECT student_answer_text FROM student_answers GROUP BY student_answer_text ORDER BY count(*) DESC
SELECT first_name ,  date_of_answer FROM Students AS T1 JOIN student_answers AS T2 ON T1.student_id  =  T2.student_id
SELECT T2.first_name ,  T1.Date_of_answer FROM Student_Answers AS T1 JOIN Students AS T2 ON T1.Student_ID  =  T2.Student_ID
SELECT Date_of_answer ,  email_adress FROM Students ORDER BY Date_of_answer DESC
SELECT T2.Email_adress ,  T1.Date_of_answer FROM Student_Answers AS T1 JOIN Students AS T2 ON T1.Student_ID  =  T2.Student_ID ORDER BY T1.Date_of_answer DESC
SELECT assessment FROM student_assessments GROUP BY assessment ORDER BY count(*) ASC LIMIT 1
SELECT assessment FROM student_assessments GROUP BY assessment ORDER BY count(*) ASC LIMIT 1
SELECT first_name FROM students AS T1 JOIN student_answers AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING count(*)  >=  2
SELECT first_name FROM students AS T1 JOIN student_answers AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING count(*)  >=  2
SELECT valid_answer_text FROM valid_answers GROUP BY valid_answer_text ORDER BY count(*) DESC LIMIT 1
SELECT valid_answer_text FROM student_assessments GROUP BY valid_answer_text ORDER BY count(*) DESC LIMIT 1
SELECT last_name FROM Students WHERE gender_mfu != "M"
SELECT last_name FROM Students WHERE gender_mfu != "M"
SELECT gender_MFU ,  count(*) FROM students GROUP BY gender_MFU
SELECT gender_MFU ,  count(*) FROM students GROUP BY gender_MFU
SELECT last_name FROM Students WHERE gender_mfu  =  "F" OR gender_mfu  =  "M"
SELECT last_name FROM students WHERE gender_mfu  =  "F" OR gender_mfu  =  "M"
SELECT first_name FROM students WHERE student_id NOT IN (SELECT student_id FROM student_answers)
SELECT first_name FROM students WHERE student_id NOT IN (SELECT student_id FROM student_answers)
SELECT T1.student_answer_text FROM student_assessments AS T1 JOIN students AS T2 ON T1.student_id  =  T2.student_id WHERE T1.Assessment  =  "Normal" INTERSECT SELECT T1.student_answer_text FROM student_assessments AS T1 JOIN students AS T2 ON T1.student_id  =  T2.student_id WHERE T1.Assessment  =  "Absent"
SELECT T1.student_answer_text FROM student_assessments AS T1 JOIN students AS T2 ON T1.student_id  =  T2.student_id WHERE T1.assessment  =  "Normal" INTERSECT SELECT T1.student_answer_text FROM student_assessments AS T1 JOIN students AS T2 ON T1.student_id  =  T2.student_id WHERE T1.assessment  =  "Absent"
SELECT TYPE_of_Question_Code FROM Questions GROUP BY TYPE_of_Question_Code HAVING count(*)  >=  3
SELECT TYPE_of_Question_Code FROM Questions GROUP BY TYPE_of_Question_Code HAVING count(*)  >=  3
SELECT * FROM Students
SELECT * FROM STUDENTS
SELECT count(*) FROM addresses
SELECT count(*) FROM addresses
SELECT address_id ,  address_details FROM addresses
SELECT address_id ,  address_details FROM addresses
SELECT count(*) FROM products
SELECT count(*) FROM products
SELECT product_id ,  product_type_code ,  product_name FROM products
SELECT product_id ,  product_type_code ,  product_name FROM products
SELECT product_price FROM products WHERE product_name  =  "Monitor"
SELECT product_price FROM products WHERE product_name  =  "Monitor"
SELECT min(product_price) ,  avg(product_price) ,  max(product_price) FROM products
SELECT min(product_price) ,  avg(product_price) ,  max(product_price) FROM products
SELECT avg(product_price) FROM products WHERE product_type_code  =  'Clothes'
SELECT avg(product_price) FROM products WHERE product_type_code  =  'Clothes'
SELECT count(*) FROM products WHERE product_type_code  =  'Hardware'
SELECT count(*) FROM products WHERE product_type_code  =  'Hardware'
SELECT product_name FROM products WHERE product_price  >  (SELECT avg(product_price) FROM products)
SELECT product_name FROM products WHERE product_price  >  (SELECT avg(product_price) FROM products)
SELECT product_name FROM products WHERE product_type_code  =  'Hardware' AND product_price  >  (SELECT avg(product_price) FROM products WHERE product_type_code  =  'Hardware')
SELECT product_name FROM products WHERE product_type_code  =  'Hardware' AND product_price  >  (SELECT avg(product_price) FROM products WHERE product_type_code  =  'Hardware')
SELECT product_name FROM products WHERE product_type_code  =  "Clothes" ORDER BY product_price DESC LIMIT 1
SELECT product_name FROM products WHERE product_type_code  =  'Clothes' ORDER BY product_price DESC LIMIT 1
SELECT product_id ,  product_name FROM products WHERE product_type_code  =  'Hardware' ORDER BY product_price LIMIT 1
SELECT product_id ,  product_name FROM products WHERE product_type_code  =  'Hardware' ORDER BY product_price LIMIT 1
SELECT product_name FROM products ORDER BY product_price DESC
SELECT product_name FROM products ORDER BY product_price DESC
SELECT product_name FROM products WHERE product_type_code  =  'Hardware' ORDER BY product_price ASC
SELECT product_name FROM products WHERE product_type_code  =  'Hardware' ORDER BY product_price
SELECT product_type_code ,  count(*) FROM products GROUP BY product_type_code
SELECT product_type_code ,  count(*) FROM products GROUP BY product_type_code
SELECT product_type_code ,  avg(product_price) FROM products GROUP BY product_type_code
SELECT product_type_code ,  avg(product_price) FROM products GROUP BY product_type_code
SELECT product_type_code FROM products GROUP BY product_type_code HAVING count(*)  >=  2
SELECT product_type_code FROM products GROUP BY product_type_code HAVING count(*)  >=  2
SELECT product_type_code FROM products GROUP BY product_type_code ORDER BY count(*) DESC LIMIT 1
SELECT product_type_code FROM products GROUP BY product_type_code ORDER BY count(*) DESC LIMIT 1
SELECT count(*) FROM customers
SELECT count(*) FROM customers
SELECT customer_id ,  customer_name FROM customers
SELECT customer_id ,  customer_name FROM customers
SELECT customer_address ,  customer_phone ,  customer_email FROM Customers WHERE customer_name  =  "Jeromy"
SELECT customer_address ,  customer_phone ,  customer_email FROM Customers WHERE customer_name  =  "Jeromy"
SELECT payment_method_code ,  count(*) FROM customers GROUP BY payment_method_code
SELECT payment_method_code ,  count(*) FROM customers GROUP BY payment_method_code
SELECT payment_method_code FROM customers GROUP BY payment_method_code ORDER BY count(*) DESC LIMIT 1
SELECT payment_method_code FROM customers GROUP BY payment_method_code ORDER BY count(*) DESC LIMIT 1
SELECT customer_name FROM customers WHERE payment_method_code  =  (SELECT payment_method_code FROM customers GROUP BY payment_method_code ORDER BY count(*) ASC LIMIT 1)
SELECT customer_name FROM customers GROUP BY payment_method_code ORDER BY count(*) ASC LIMIT 1
SELECT payment_method_code ,  customer_number FROM customers WHERE customer_name  =  "Jeromy"
SELECT payment_method_code ,  customer_number FROM customers WHERE customer_name  =  "Jeromy"
SELECT DISTINCT payment_method_code FROM customers
SELECT DISTINCT payment_method_code FROM customers
SELECT product_id ,  product_type_code FROM products ORDER BY product_name
SELECT product_id ,  product_type_code FROM products ORDER BY product_name
SELECT product_type_code FROM products GROUP BY product_type_code ORDER BY count(*) ASC LIMIT 1
SELECT product_type_code FROM products GROUP BY product_type_code ORDER BY count(*) ASC LIMIT 1
SELECT count(*) FROM customer_orders
SELECT count(*) FROM customer_orders
SELECT T2.order_id ,  T2.order_date ,  T2.order_status_code FROM Customers AS T1 JOIN Customer_Orders AS T2 ON T1.customer_id  =  T2.customer_id WHERE T1.customer_name  =  "Jeromy"
SELECT T1.order_id ,  T1.order_date ,  T1.order_status_code FROM Customer_Orders AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id WHERE T2.customer_name  =  "Jeromy"
SELECT T2.customer_name ,  T1.customer_id ,  count(*) FROM customer_orders AS T1 JOIN customers AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id
SELECT T2.customer_name ,  T1.customer_id ,  count(*) FROM Customer_Orders AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id
SELECT T1.customer_id ,  T1.customer_name ,  T1.customer_phone ,  T1.customer_email FROM customers AS T1 JOIN customer_orders AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.customer_id ,  T1.customer_name ,  T1.customer_phone ,  T1.customer_email FROM Customers AS T1 JOIN Customer_Orders AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id ORDER BY count(*) DESC LIMIT 1
SELECT order_status_code ,  count(*) FROM customer_orders GROUP BY order_status_code
SELECT order_status_code ,  count(*) FROM customer_orders GROUP BY order_status_code
SELECT order_status_code FROM customer_orders GROUP BY order_status_code ORDER BY count(*) DESC LIMIT 1
SELECT order_status_code FROM customer_orders GROUP BY order_status_code ORDER BY count(*) DESC LIMIT 1
SELECT count(*) FROM customers WHERE customer_id NOT IN (SELECT customer_id FROM customer_orders)
SELECT count(*) FROM customers WHERE customer_id NOT IN (SELECT customer_id FROM customer_orders)
SELECT product_name FROM products EXCEPT SELECT T1.product_name FROM products AS T1 JOIN order_items AS T2 ON T1.product_id  =  T2.product_id
SELECT product_name FROM products EXCEPT SELECT T1.product_name FROM products AS T1 JOIN order_items AS T2 ON T1.product_id  =  T2.product_id
SELECT sum(t2.order_quantity) FROM products AS t1 JOIN order_items AS t2 ON t1.product_id  =  t2.product_id WHERE t1.product_name  =  "Monitor"
SELECT sum(t2.order_quantity) FROM products AS t1 JOIN order_items AS t2 ON t1.product_id  =  t2.product_id WHERE t1.product_type_code  =  'Monitor'
SELECT count(*) FROM customers AS t1 JOIN customer_orders AS t2 ON t1.customer_id  =  t2.customer_id JOIN order_items AS t3 ON t2.order_id  =  t3.order_id JOIN products AS t4 ON t3.product_id  =  t4.product_id WHERE t4.product_name  =  "Monitor"
SELECT count(DISTINCT t1.customer_id) FROM customer_orders AS t1 JOIN order_items AS t2 ON t1.order_id  =  t2.order_id JOIN products AS t3 ON t2.product_id  =  t3.product_id WHERE t3.product_name  =  'Monitor Product'
SELECT count(DISTINCT customer_id) FROM customer_orders
SELECT count(DISTINCT customer_id) FROM customer_orders
SELECT customer_id FROM customers EXCEPT SELECT customer_id FROM customer_orders
SELECT customer_id FROM customers EXCEPT SELECT customer_id FROM customer_orders
SELECT T1.order_date ,  T1.order_id FROM customer_orders AS T1 JOIN order_items AS T2 ON T1.order_id  =  T2.order_id GROUP BY T1.order_id HAVING sum(T2.order_quantity)  >  6 OR count(*)  >  3
SELECT T1.order_id ,  T1.order_date FROM customer_orders AS T1 JOIN order_items AS T2 ON T1.order_id  =  T2.order_id GROUP BY T1.order_id HAVING sum(T2.order_quantity)  >  6 OR count(*)  >  3
SELECT count(*) FROM building
SELECT count(*) FROM building
SELECT Name FROM building ORDER BY Number_of_Stories ASC
SELECT Name FROM building ORDER BY Number_of_Stories ASC
SELECT Address FROM building ORDER BY Completed_Year DESC
SELECT Address FROM building ORDER BY Completed_Year DESC
SELECT max(Number_of_Stories) FROM building WHERE Completed_Year != 1980
SELECT max(Number_of_Stories) FROM building WHERE Completed_Year != 1980
SELECT avg(Population) FROM region
SELECT avg(Population) FROM region
SELECT Name FROM region ORDER BY Name ASC
SELECT Name FROM region ORDER BY Name ASC
SELECT Capital FROM region WHERE Area  >  10000
SELECT Capital FROM region WHERE Area  >  10000
SELECT Capital FROM region ORDER BY Population DESC LIMIT 1
SELECT Capital FROM region ORDER BY Population DESC LIMIT 1
SELECT Name FROM region ORDER BY Area DESC LIMIT 5
SELECT Name FROM region ORDER BY Area DESC LIMIT 5
SELECT T2.Name ,  T1.Name FROM building AS T1 JOIN region AS T2 ON T1.Region_ID  =  T2.Region_ID
SELECT T2.Name ,  T1.Name FROM building AS T1 JOIN region AS T2 ON T1.Region_ID  =  T2.Region_ID
SELECT T2.Name FROM building AS T1 JOIN region AS T2 ON T1.Region_ID  =  T2.Region_ID GROUP BY T1.Region_ID HAVING COUNT(*)  >  1
SELECT T2.Name FROM building AS T1 JOIN region AS T2 ON T1.Region_ID  =  T2.Region_ID GROUP BY T1.Region_ID HAVING COUNT(*)  >  1
SELECT t1.Capital FROM region AS t1 JOIN building AS t2 ON t1.Region_ID  =  t2.Region_ID GROUP BY t1.Region_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.Capital FROM region AS T1 JOIN building AS T2 ON T1.Region_ID  =  T2.Region_ID GROUP BY T2.Region_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.Address ,  T2.Capital FROM building AS T1 JOIN region AS T2 ON T1.Region_ID  =  T2.Region_ID
SELECT T2.Address ,  T1.Name FROM building AS T1 JOIN region AS T2 ON T1.Region_ID  =  T2.Region_ID
SELECT sum(Number_of_Stories) FROM building AS T1 JOIN region AS T2 ON T1.Region_ID  =  T2.Region_ID WHERE T2.Name  =  "Abruzzo"
SELECT T1.Number_of_Stories FROM building AS T1 JOIN region AS T2 ON T1.Region_ID  =  T2.Region_ID WHERE T2.Name  =  "Abruzzo"
SELECT completed_year ,  count(*) FROM building GROUP BY completed_year
SELECT completed_year ,  count(*) FROM building GROUP BY completed_year
SELECT Completed_Year FROM building GROUP BY Completed_Year ORDER BY Count(*) DESC LIMIT 1
SELECT Completed_Year FROM building GROUP BY Completed_Year ORDER BY count(*) DESC LIMIT 1
SELECT Name FROM region WHERE Region_ID NOT IN (SELECT Region_ID FROM building)
SELECT Name FROM region WHERE Region_ID NOT IN (SELECT Region_ID FROM building)
SELECT Completed_Year FROM building WHERE Number_of_Stories  >  20 INTERSECT SELECT Completed_Year FROM building WHERE Number_of_Stories  <  15
SELECT Completed_Year FROM building WHERE Number_of_Stories  >  20 INTERSECT SELECT Completed_Year FROM building WHERE Number_of_Stories  <  15
SELECT DISTINCT Address FROM building
SELECT DISTINCT Address FROM building
SELECT Completed_Year FROM building ORDER BY Number_of_Stories DESC
SELECT Completed_Year FROM building ORDER BY Number_of_Stories DESC
SELECT channel_details FROM channels ORDER BY channel_details
SELECT channel_details FROM channels ORDER BY channel_details
SELECT count(*) FROM services
SELECT count(*) FROM services
SELECT Analytical_Layer_Type_Code FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code ORDER BY count(*) DESC LIMIT 1
SELECT Analytical_Layer_Type_Code FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code ORDER BY count(*) DESC LIMIT 1
SELECT T3.service_details FROM customers AS T1 JOIN customers_and_services AS T2 ON T1.customer_id  =  T2.customer_id JOIN services AS T3 ON T3.service_id  =  T2.service_id WHERE T1.customer_details  =  "Hardy Kutch"
SELECT T3.service_details FROM customers AS T1 JOIN customers_and_services AS T2 ON T1.customer_id  =  T2.customer_id JOIN services AS T3 ON T3.service_id  =  T2.service_id WHERE T1.customer_details  =  "Hardy Kutch"
SELECT T1.service_details FROM services AS T1 JOIN customers_and_services AS T2 ON T1.service_id  =  T2.service_id GROUP BY T1.service_id HAVING count(*)  >  3
SELECT T2.service_details FROM customers_and_services AS T1 JOIN services AS T2 ON T1.service_id  =  T2.service_id GROUP BY T1.service_id HAVING count(*)  >  3
SELECT T1.Customer_Details FROM Customers AS T1 JOIN Customers_and_Services AS T2 ON T1.Customer_ID  =  T2.Customer_ID GROUP BY T1.Customer_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.Customer_Details FROM Customers_and_Services AS T1 JOIN Customers AS T2 ON T1.Customer_ID  =  T2.Customer_ID GROUP BY T2.Customer_Details ORDER BY Count(*) DESC LIMIT 1
SELECT T1.Customer_Details FROM Customers AS T1 JOIN Customers_and_Services AS T2 ON T1.Customer_ID  =  T2.Customer_ID GROUP BY T1.Customer_Details ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.customer_details FROM customers AS T1 JOIN customers_and_services AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id ORDER BY count(*) DESC LIMIT 1
SELECT customer_details FROM customers EXCEPT SELECT T1.customer_details FROM customers AS T1 JOIN customers_and_services AS T2 ON T1.customer_id  =  T2.customer_id
SELECT customer_details FROM customers EXCEPT SELECT T1.customer_details FROM customers AS T1 JOIN customers_and_services AS T2 ON T1.customer_id  =  T2.customer_id
SELECT T1.customer_details FROM customers AS T1 JOIN customers_and_services AS T2 ON T1.customer_id  =  T2.customer_id JOIN services AS T3 ON T3.service_id  =  T2.service_id GROUP BY T1.customer_id ORDER BY count(*) ASC LIMIT 1
SELECT DISTINCT T1.customer_details FROM customers AS T1 JOIN customers_and_services AS T2 ON T1.customer_id  =  T2.customer_id JOIN services AS T3 ON T3.service_id  =  T2.service_id GROUP BY T1.customer_details ORDER BY count(*) ASC LIMIT 1
SELECT count(DISTINCT customers_and_services_details) FROM customers_and_services
SELECT count(*) FROM services UNION SELECT count(*) FROM customers
SELECT customer_details FROM customers WHERE customer_details LIKE "%Kutch%"
SELECT Customer_Details FROM Customers WHERE Customer_Details LIKE "%Kutch%"
SELECT DISTINCT T2.service_details FROM customers_and_services AS T1 JOIN services AS T2 ON T1.service_id  =  T2.service_id JOIN customer_interactions AS T3 ON T3.service_id  =  T2.service_id WHERE T1.customer_id  =  (SELECT T1.customer_id FROM customers AS T1 JOIN customers_and_services AS T2 ON T1.customer_id  =  T2.customer_id WHERE T1.customer_details  =  "Hardy Kutch") UNION SELECT T2.service_details FROM customers_and_services AS T1 JOIN services AS T2 ON T1.service_id  =  T2.service_id JOIN customer_interactions AS T3 ON T3.service_id  =  T2.service_id WHERE T3.Status_Code  =  "good"
SELECT DISTINCT T3.service_details FROM customers_and_services AS T1 JOIN analytical_layer AS T2 ON T1.Customers_and_Services_ID  =  T2.Customers_and_Services_ID JOIN services AS T3 ON T1.service_id  =  T3.service_id WHERE T1.Customer_id IN ( SELECT T1.customer_id FROM customers AS T1 JOIN customer_interactions AS T2 ON T1.customer_id  =  T2.customer_id WHERE T2.status_code  =  "good" UNION SELECT T1.customer_id FROM customers AS T1 WHERE T1.customer_details  =  "Hardy Kutch")
SELECT DISTINCT T4.service_details FROM customers_and_services AS T1 JOIN customers AS T2 ON T1.customer_id  =  T2.customer_id JOIN customers_and_services AS T3 ON T3.service_id  =  T4.service_id JOIN services AS T4 ON T4.service_id  =  T1.service_id JOIN customer_interactions AS T5 ON T5.service_id  =  T4.service_id WHERE T2.customer_details  =  "Hardy Kutch" AND T5.status_code  =  "bad" AND T3.customers_and_services_details  =  "bad"
SELECT DISTINCT T4.service_details FROM customers_and_services AS T1 JOIN Customers AS T2 ON T1.Customer_ID  =  T2.Customer_ID JOIN Customers_and_Services AS T3 ON T1.Service_ID  =  T3.Service_ID JOIN customer_interactions AS T4 ON T4.customer_id  =  T2.customer_id AND T4.service_id  =  T1.service_id WHERE T2.Customer_details  =  "Hardy Kutch" AND T4.status_code  =  "bad"
SELECT T1.channel_details FROM channels AS T1 JOIN customer_interactions AS T2 ON T1.channel_id  =  T2.channel_id WHERE T2.service_id  =  15 UNION SELECT T1.channel_details FROM channels AS T1 JOIN customer_interactions AS T2 ON T1.channel_id  =  T2.channel_id WHERE T2.service_id  =  15
SELECT T1.service_details FROM services AS T1 JOIN customer_interactions AS T2 ON T1.service_id  =  T2.service_id JOIN channels AS T3 ON T2.channel_id  =  T3.channel_id WHERE T3.channel_details  =  "15 ij"
SELECT T1.customer_details FROM customers AS T1 JOIN customers_and_services AS T2 ON T1.customer_id  =  T2.customer_id JOIN customer_interactions AS T3 ON T2.customer_id  =  T3.customer_id AND T2.service_id  =  T3.service_id WHERE T3.Status_Code  =  "Stuck" AND T3.Services_and_Channels_Details  =  "bad"
SELECT T2.Customer_Details FROM Customer_Interactions AS T1 JOIN Customers AS T2 ON T1.Customer_ID  =  T2.Customer_ID WHERE T1.Status_Code  =  "Stuck" AND T1.Services_and_Channels_Details  =  "bad"
SELECT count(*) FROM integration_platform WHERE status_code  =  'Success'
SELECT count(*) FROM integration_platform WHERE integration_platform_details  =  "Success"
SELECT T2.customer_details FROM integration_platform AS T1 JOIN customers AS T2 ON T1.customer_id  =  T2.customer_id WHERE T1.status_code  =  "Failed"
SELECT T1.Customer_Details FROM Customers AS T1 JOIN Customer_Interactions AS T2 ON T1.Customer_ID  =  T2.Customer_ID JOIN Integration_Platform AS T3 ON T2.Customer_Interaction_ID  =  T3.Customer_Interaction_ID WHERE T3.Integration_Platform_Details  =  "Fail"
SELECT service_details FROM services WHERE service_id NOT IN (SELECT service_id FROM Customers_and_Services)
SELECT service_details FROM services EXCEPT SELECT T1.service_details FROM services AS T1 JOIN Customers_and_Services AS T2 ON T1.Service_ID  =  T2.Service_ID
SELECT Analytical_Layer_Type_Code ,  count(*) FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code
SELECT Analytical_Layer_Type_Code ,  count(*) FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code
SELECT service_details FROM services WHERE service_details LIKE "%unsatisfied%"
SELECT service_details FROM customers_and_services WHERE customers_and_services_details  =  "unsatisfied"
SELECT count(*) FROM vehicles
SELECT count(*) FROM vehicles
SELECT name FROM vehicles ORDER BY model_year DESC
SELECT name FROM vehicles ORDER BY model_year DESC
SELECT DISTINCT TYPE_of_powertrain FROM Vehicles
SELECT DISTINCT TYPE_of_powertrain FROM Vehicles
SELECT name ,  type_of_powertrain ,  annual_fuel_cost FROM vehicles WHERE model_year  =  2013 OR model_year  =  2014
SELECT name ,  TYPE_of_powertrain ,  annual_fuel_cost FROM vehicles WHERE model_year  =  2013 OR model_year  =  2014
SELECT TYPE_of_powertrain FROM vehicles WHERE model_year  =  2014 INTERSECT SELECT TYPE_of_powertrain FROM vehicles WHERE model_year  =  2013
SELECT TYPE_of_powertrain FROM vehicles WHERE model_year  =  2013 INTERSECT SELECT TYPE_of_powertrain FROM vehicles WHERE model_year  =  2014
SELECT TYPE_of_powertrain ,  count(*) FROM Vehicles GROUP BY TYPE_of_powertrain
SELECT TYPE_of_powertrain ,  count(*) FROM vehicles GROUP BY TYPE_of_powertrain
SELECT TYPE_of_powertrain FROM vehicles GROUP BY TYPE_of_powertrain ORDER BY count(*) DESC LIMIT 1
SELECT TYPE_of_powertrain FROM vehicles GROUP BY TYPE_of_powertrain ORDER BY count(*) DESC LIMIT 1
SELECT min(annual_fuel_cost) ,  max(annual_fuel_cost) ,  avg(annual_fuel_cost) FROM vehicles
SELECT min(annual_fuel_cost) ,  max(annual_fuel_cost) ,  avg(annual_fuel_cost) FROM vehicles
SELECT name ,  model_year FROM vehicles WHERE city_fuel_economy_rate <= highway_fuel_economy_rate
SELECT name ,  model_year FROM vehicles WHERE city_fuel_economy_rate  <=  highway_fuel_economy_rate
SELECT TYPE_of_powertrain ,  avg(Annual_fuel_cost) FROM vehicles GROUP BY TYPE_of_powertrain HAVING count(*)  >=  2
SELECT TYPE_of_powertrain ,  avg(Annual_fuel_cost) FROM vehicles GROUP BY TYPE_of_powertrain HAVING count(*)  >=  2
SELECT name ,  age ,  membership_credit FROM customers
SELECT name ,  age ,  membership_credit FROM customers
SELECT name ,  age FROM customers ORDER BY membership_credit DESC LIMIT 1
SELECT name ,  age FROM customers ORDER BY membership_credit DESC LIMIT 1
SELECT avg(age) FROM customers WHERE membership_credit  >  (SELECT avg(membership_credit) FROM customers)
SELECT avg(age) FROM customers WHERE membership_credit  >  (SELECT avg(membership_credit) FROM customers)
SELECT * FROM Discount
SELECT * FROM Discount
SELECT T2.name ,  T1.total_hours FROM Renting_history AS T1 JOIN Vehicles AS T2 ON T1.vehicles_id  =  T2.id
SELECT T2.name ,  T1.total_hours FROM Renting_history AS T1 JOIN Vehicles AS T2 ON T1.vehicles_id  =  T2.id
SELECT name FROM vehicles WHERE id NOT IN (SELECT vehicles_id FROM renting_history)
SELECT name FROM vehicles WHERE id NOT IN (SELECT vehicles_id FROM Renting_history)
SELECT T1.name FROM customers AS T1 JOIN renting_history AS T2 ON T1.id  =  T2.customer_id GROUP BY T1.id HAVING count(*)  >=  2
SELECT T2.name FROM renting_history AS T1 JOIN customers AS T2 ON T1.customer_id  =  T2.id GROUP BY T1.customer_id HAVING count(*)  >=  2
SELECT T1.name ,  T1.model_year FROM vehicles AS T1 JOIN renting_history AS T2 ON T1.id  =  T2.vehicles_id GROUP BY T2.vehicles_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.name ,  T1.model_year FROM vehicles AS T1 JOIN renting_history AS T2 ON T1.id  =  T2.vehicles_id GROUP BY T2.vehicles_id ORDER BY sum(T2.total_hours) DESC LIMIT 1
SELECT T2.name FROM renting_history AS T1 JOIN vehicles AS T2 ON T1.vehicles_id  =  T2.id ORDER BY T1.total_hours DESC
SELECT T2.name FROM renting_history AS T1 JOIN vehicles AS T2 ON T1.vehicles_id  =  T2.id ORDER BY T1.total_hours DESC
SELECT T1.name FROM discount AS T1 JOIN renting_history AS T2 ON T1.id  =  T2.discount_id GROUP BY T1.id ORDER BY count(*) DESC LIMIT 1
SELECT T2.name FROM renting_history AS T1 JOIN discount AS T2 ON T1.discount_id  =  T2.id GROUP BY T1.discount_id ORDER BY count(*) DESC LIMIT 1
SELECT T2.name ,  T2.type_of_powertrain FROM renting_history AS T1 JOIN vehicles AS T2 ON T1.vehicles_id  =  T2.id WHERE T1.total_hours  >  30
SELECT T1.name ,  T1.type_of_powertrain FROM vehicles AS T1 JOIN renting_history AS T2 ON T1.id  =  T2.vehicles_id GROUP BY T1.id HAVING sum(T2.total_hours)  >  30
SELECT TYPE_of_powertrain ,  avg(city_fuel_economy_rate) ,  avg(highway_fuel_economy_rate) FROM vehicles WHERE TYPE_of_powertrain LIKE '%car%' GROUP BY TYPE_of_powertrain
SELECT TYPE_of_powertrain ,  avg(city_fuel_economy_rate) ,  avg(highway_fuel_economy_rate) FROM vehicles GROUP BY TYPE_of_powertrain
SELECT avg(amount_of_loan) FROM Student_Loans
SELECT avg(amount_of_loan) FROM Student_Loans
SELECT T1.bio_data ,  T1.student_id FROM Students AS T1 JOIN CLASSES AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING COUNT(*)  >=  2 UNION SELECT T1.bio_data ,  T1.student_id FROM Students AS T1 JOIN Detention AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING COUNT(*)  <  2
SELECT T1.bio_data ,  T1.student_id FROM Students AS T1 JOIN CLASSES AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING count(*)  >=  2 UNION SELECT T1.bio_data ,  T1.student_id FROM Students AS T1 JOIN Detention AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING count(*)  <  2
SELECT T1.teacher_details FROM Teachers AS T1 JOIN CLASSES AS T2 ON T1.teacher_id  =  T2.teacher_id WHERE T2.class_details LIKE '%data%' EXCEPT SELECT T1.teacher_details FROM Teachers AS T1 JOIN CLASSES AS T2 ON T1.teacher_id  =  T2.teacher_id WHERE T2.class_details LIKE 'net%'
SELECT T1.teacher_details FROM Teachers AS T1 JOIN CLASSES AS T2 ON T1.teacher_id  =  T2.teacher_id WHERE T2.class_details LIKE '%data%' EXCEPT SELECT T1.teacher_details FROM Teachers AS T1 JOIN CLASSES AS T2 ON T1.teacher_id  =  T2.teacher_id WHERE T2.class_details LIKE 'net%'
SELECT bio_data FROM Students EXCEPT SELECT T1.bio_data FROM Students AS T1 JOIN Detention AS T2 ON T1.student_id  =  T2.student_id UNION SELECT T1.bio_data FROM Students AS T1 JOIN Student_Loans AS T2 ON T1.student_id  =  T2.student_id
SELECT T1.bio_data FROM Students AS T1 WHERE T1.student_id NOT IN (SELECT T2.student_id FROM Detention AS T2 JOIN Students_Loans AS T3 ON T2.student_id  =  T3.student_id)
SELECT T1.amount_of_loan ,  T1.date_of_loan FROM Student_Loans AS T1 JOIN Achievements AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING count(*)  >=  2
SELECT T1.amount_of_loan ,  T1.date_of_loan FROM Student_Loans AS T1 JOIN Achievements AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING count(*)  >  2
SELECT T1.teacher_details ,  T2.teacher_id FROM Teachers AS T1 JOIN CLASSES AS T2 ON T1.teacher_id  =  T2.teacher_id GROUP BY T2.teacher_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.teacher_details ,  T2.teacher_id FROM Teachers AS T1 JOIN CLASSES AS T2 ON T1.teacher_id  =  T2.teacher_id GROUP BY T2.teacher_id ORDER BY count(*) DESC LIMIT 1
SELECT DISTINCT detention_summary FROM Detention
SELECT DISTINCT detention_summary FROM Detention
SELECT T1.bio_data ,  T4.address_type_description FROM Students AS T1 JOIN Students_Addresses AS T2 ON T1.student_id  =  T2.student_id JOIN Addresses AS T3 ON T2.address_id  =  T3.address_id JOIN Ref_Address_Types AS T4 ON T2.address_type_code  =  T4.address_type_code
SELECT T1.bio_data ,  T3.address_type_description FROM Students AS T1 JOIN Students_Addresses AS T2 ON T1.student_id  =  T2.student_id JOIN Addresses AS T4 ON T4.address_id  =  T2.address_id JOIN Ref_Address_Types AS T3 ON T3.address_type_code  =  T2.address_type_code
SELECT T1.bio_data ,  T2.address_details FROM Students AS T1 JOIN Students_Addresses AS T2 ON T1.student_id  =  T2.student_id JOIN Addresses AS T3 ON T2.address_id  =  T3.address_id
SELECT T1.bio_data ,  T2.address_details FROM Students AS T1 JOIN Students_Addresses AS T2 ON T1.student_id  =  T2.student_id JOIN Addresses AS T3 ON T2.address_id  =  T3.address_id
SELECT T1.bio_data ,  T2.date_of_transcript FROM Students AS T1 JOIN Transcripts AS T2 ON T1.student_id  =  T2.student_id
SELECT T1.bio_data ,  T2.date_of_transcript FROM Students AS T1 JOIN Transcripts AS T2 ON T1.student_id  =  T2.student_id
SELECT behavior_monitoring_details ,  count(*) FROM Behaviour_Monitoring GROUP BY behavior_monitoring_details ORDER BY count(*) DESC LIMIT 1
SELECT count(*) ,  behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY count(*) DESC LIMIT 1
SELECT T1.bio_data ,  T1.student_details FROM Students AS T1 JOIN Behaviour_Monitoring AS T2 ON T1.student_id  =  T2.student_id GROUP BY T2.student_id ORDER BY count(*) DESC LIMIT 1 UNION SELECT T1.bio_data ,  T1.student_details FROM Students AS T1 JOIN Behaviour_Monitoring AS T2 ON T1.student_id  =  T2.student_id GROUP BY T2.student_id ORDER BY count(*) DESC LIMIT 1 OFFSET 1
SELECT T1.bio_data ,  T1.student_details FROM Students AS T1 JOIN Behaviour_Monitoring AS T2 ON T1.student_id  =  T2.student_id GROUP BY T2.student_id HAVING count(*)  =  3
SELECT T1.bio_data FROM Students AS T1 JOIN Behaviour_Monitoring AS T2 ON T1.student_id  =  T2.student_id GROUP BY T2.student_id HAVING count(*)  =  1
SELECT T1.bio_data FROM Students AS T1 JOIN Behaviour_Monitoring AS T2 ON T1.student_id  =  T2.student_id GROUP BY T2.behaviour_monitoring_details ORDER BY count(*) DESC LIMIT 1
SELECT T1.bio_data ,  T2.event_date FROM Students AS T1 JOIN Student_Events AS T2 ON T1.student_id  =  T2.student_id
SELECT T1.bio_data ,  T2.event_date FROM Students AS T1 JOIN Student_Events AS T2 ON T1.student_id  =  T2.student_id
SELECT T1.event_type_description ,  count(*) FROM Ref_event_types AS T1 JOIN Student_Events AS T2 ON T1.event_type_code  =  T2.event_type_code GROUP BY T1.event_type_code ORDER BY count(*) DESC LIMIT 1
SELECT count(*) ,  T1.event_type_code ,  T2.event_type_description FROM Student_Events AS T1 JOIN Ref_Event_Types AS T2 ON T1.event_type_code  =  T2.event_type_code GROUP BY T1.event_type_code ORDER BY count(*) DESC LIMIT 1
SELECT T1.achievement_details ,  T2.achievement_type_description FROM Achievements AS T1 JOIN Ref_Achievement_Type AS T2 ON T1.achievement_type_code  =  T2.achievement_type_code
SELECT T1.achievement_details ,  T2.achievement_type_description FROM Achievements AS T1 JOIN Ref_Achievement_Type AS T2 ON T1.achievement_type_code  =  T2.achievement_type_code
SELECT count(DISTINCT T1.teacher_id) FROM CLASSES AS T1 JOIN Students AS T2 ON T1.student_id  =  T2.student_id LEFT JOIN Achievements AS T3 ON T2.student_id  =  T3.student_id WHERE T3.achievement_id IS NULL
SELECT count(DISTINCT T1.teacher_id) FROM CLASSES AS T1 JOIN Students AS T2 ON T1.student_id  =  T2.student_id LEFT JOIN Achievements AS T3 ON T2.student_id  =  T3.student_id WHERE T3.achievement_id IS NULL
SELECT date_of_transcript ,  transcript_details FROM TRANSCRIPTS
SELECT date_of_transcript ,  transcript_details FROM TRANSCRIPTS
SELECT achievement_type_code ,  achievement_details ,  date_achievement FROM Achievements
SELECT achievement_type_code ,  achievement_details ,  date_achievement FROM Achievements
SELECT datetime_detention_start ,  datetime_detention_end FROM Detention
SELECT datetime_detention_start ,  datetime_detention_end FROM Detention
SELECT bio_data FROM Students WHERE student_details LIKE '%Suite%'
SELECT bio_data FROM Students WHERE student_details LIKE '%Suite%'
SELECT T1.class_details ,  T2.class_details FROM CLASSES AS T1 JOIN CLASSES AS T2 ON T1.class_id  =  T2.class_id WHERE T1.student_id  !=  T2.student_id
SELECT T1.teacher_details ,  T2.student_details FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id  =  T2.teacher_id
SELECT count(*) ,  max(count(*) ,  teacher_id) FROM CLASSES GROUP BY teacher_id
SELECT T1.teacher_id ,  count(*) FROM CLASSES AS T1 JOIN Teachers AS T2 ON T1.teacher_id  =  T2.teacher_id GROUP BY T1.teacher_id ORDER BY count(*) DESC LIMIT 1
SELECT count(*) ,  T1.student_id FROM CLASSES AS T1 JOIN STUDENTS AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.student_id ,  count(*) FROM Classes AS T1 JOIN Students AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.student_details FROM Students AS T1 JOIN CLASSES AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING count(*)  =  2
SELECT T1.student_id ,  T1.class_details FROM CLASSES AS T1 JOIN STUDENTS AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING count(*)  =  2
SELECT T1.detention_type_code ,  T2.detention_type_description FROM Detention AS T1 JOIN Ref_Detention_Type AS T2 ON T1.detention_type_code  =  T2.detention_type_code GROUP BY T1.detention_type_code ORDER BY count(*) ASC LIMIT 1
SELECT T1.detention_type_code ,  T2.detention_type_description FROM Detention AS T1 JOIN Ref_Detention_Type AS T2 ON T1.detention_type_code  =  T2.detention_type_code GROUP BY T1.detention_type_code ORDER BY count(*) ASC LIMIT 1
SELECT T2.bio_data ,  T2.student_details FROM Student_Loans AS T1 JOIN Students AS T2 ON T1.student_id  =  T2.student_id WHERE T1.amount_of_loan  >  ( SELECT avg(amount_of_loan) FROM Student_Loans )
SELECT T2.bio_data ,  T2.student_details FROM Student_Loans AS T1 JOIN Students AS T2 ON T1.student_id  =  T2.student_id WHERE T1.amount_of_loan  >  ( SELECT avg(amount_of_loan) FROM Student_Loans )
SELECT date_of_loan FROM Student_Loans ORDER BY date_of_loan ASC LIMIT 1
SELECT date_of_loan FROM Student_Loans ORDER BY date_of_loan ASC LIMIT 1
SELECT T2.bio_data FROM Student_Loans AS T1 JOIN Students AS T2 ON T1.student_id  =  T2.student_id WHERE amount_of_loan  =  (SELECT min(amount_of_loan) FROM Student_Loans)
SELECT T2.bio_data FROM Student_Loans AS T1 JOIN Students AS T2 ON T1.student_id  =  T2.student_id ORDER BY T1.amount_of_loan LIMIT 1
SELECT T2.date_of_transcript FROM Student_Loans AS T1 JOIN Transcripts AS T2 ON T1.student_id  =  T2.student_id WHERE amount_of_loan  =  (SELECT max(amount_of_loan) FROM Student_Loans)
SELECT T2.date_of_transcript FROM Student_Loans AS T1 JOIN Transcripts AS T2 ON T1.student_id  =  T2.student_id ORDER BY T1.amount_of_loan DESC LIMIT 1
SELECT T2.teacher_details FROM Transcripts AS T1 JOIN CLASSES AS T2 ON T1.student_id  =  T2.student_id ORDER BY T1.date_of_transcript LIMIT 1
SELECT T2.teacher_details FROM Transcripts AS T1 JOIN CLASSES AS T2 ON T1.student_id  =  T2.student_id ORDER BY T1.date_of_transcript LIMIT 1
SELECT T1.student_id ,  sum(T1.amount_of_loan) FROM Student_Loans AS T1 JOIN Students AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id
SELECT T1.student_id ,  sum(T1.amount_of_loan) FROM Student_Loans AS T1 JOIN Students AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id
SELECT T1.bio_data ,  count(*) FROM Students AS T1 JOIN CLASSES AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id
SELECT T1.student_id ,  T1.bio_data ,  count(*) FROM Students AS T1 JOIN Classes AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id
SELECT count(DISTINCT student_id) FROM Detention
SELECT count(DISTINCT student_id) FROM detention
SELECT T1.address_type_code ,  T2.address_type_description FROM Students_addresses AS T1 JOIN Ref_address_types AS T2 ON T1.address_type_code  =  T2.address_type_code GROUP BY T1.address_type_code ORDER BY count(*) DESC LIMIT 1
SELECT T1.address_type_code ,  T2.address_type_description FROM Students_addresses AS T1 JOIN Ref_Address_Types AS T2 ON T1.address_type_code  =  T2.address_type_code GROUP BY T1.address_type_code ORDER BY count(*) DESC LIMIT 1
SELECT T1.bio_data FROM Students AS T1 WHERE T1.student_id NOT IN (SELECT T2.student_id FROM Student_Loans AS T2) INTERSECT SELECT bio_data FROM Students AS T1 JOIN Student_Events AS T2 ON T1.student_id  =  T2.student_id
SELECT T1.bio_data FROM Students AS T1 WHERE T1.student_id NOT IN (SELECT T2.student_id FROM Student_Loans AS T2)
SELECT T1.datetime_detention_start ,  T1.datetime_detention_end FROM Detention AS T1 JOIN Students AS T2 ON T1.student_id  =  T2.student_id JOIN TRANSCRIPTS AS T3 ON T3.student_id  =  T2.student_id GROUP BY T1.student_id HAVING count(*)  =  2
SELECT T1.datetime_detention_start ,  T1.datetime_detention_end FROM Detention AS T1 JOIN Students AS T2 ON T1.student_id  =  T2.student_id JOIN TRANSCRIPTS AS T3 ON T3.student_id  =  T2.student_id GROUP BY T1.student_id HAVING count(*)  =  2
SELECT datetime_detention_start FROM DETENTION
SELECT datetime_detention_start FROM Detention
SELECT name FROM Author
SELECT name FROM Author
SELECT name ,  address FROM Client
SELECT name ,  address FROM Client
SELECT title ,  isbn ,  saleprice FROM book
SELECT title ,  isbn ,  saleprice FROM BOOK
SELECT count(*) FROM Book
SELECT count(*) FROM BOOK
SELECT count(*) FROM AUTHOR
SELECT count(*) FROM AUTHOR
SELECT count(*) FROM CLIENT
SELECT count(*) FROM CLIENT
SELECT name ,  address FROM Client ORDER BY Name
SELECT name ,  address FROM Client ORDER BY name
SELECT T1.title ,  T2.name FROM BOOK AS T1 JOIN AUTHOR AS T2 ON T1.author  =  T2.idauthor
SELECT T1.Title ,  T2.Name FROM Book AS T1 JOIN Author AS T2 ON T1.Author  =  T2.idAuthor
SELECT T2.idorder ,  T1.name FROM CLIENT AS T1 JOIN orders AS T2 ON T1.idclient  =  T2.idclient
SELECT T1.idorder ,  T2.name FROM orders AS T1 JOIN client AS T2 ON T1.idclient  =  T2.idclient
SELECT T2.name ,  count(*) FROM Author_Book AS T1 JOIN Author AS T2 ON T1.Author  =  T2.idAuthor GROUP BY T2.idAuthor
SELECT T1.name ,  count(*) FROM Author AS T1 JOIN Author_Book AS T2 ON T1.idAuthor  =  T2.Author GROUP BY T1.idAuthor
SELECT ISBN ,  count(*) FROM Books_order GROUP BY ISBN
SELECT T1.title ,  sum(T2.amount) FROM BOOK AS T1 JOIN Books_order AS T2 ON T1.isbn  =  T2.isbn GROUP BY T1.isbn
SELECT idOrder ,  sum(amount) FROM Books_order GROUP BY idOrder
SELECT isbn ,  sum(amount) FROM Books_order GROUP BY isbn
SELECT T1.title FROM book AS T1 JOIN books_order AS T2 ON T1.isbn  =  T2.isbn GROUP BY T2.idorder ORDER BY amount DESC LIMIT 1
SELECT T1.title FROM book AS T1 JOIN books_order AS T2 ON T1.isbn  =  T2.isbn GROUP BY T2.idorder ORDER BY amount DESC LIMIT 1
SELECT T1.title ,  T1.purchaseprice FROM BOOK AS T1 JOIN Books_order AS T2 ON T1.isbn  =  T2.isbn GROUP BY T2.isbn ORDER BY sum(T2.amount) DESC LIMIT 1
SELECT T1.title ,  T1.purchaseprice FROM BOOK AS T1 JOIN Books_Order AS T2 ON T1.ISBN  =  T2.ISBN GROUP BY T2.idorder ORDER BY sum(T2.amount) DESC LIMIT 1
SELECT TITLE FROM BOOKS AS B WHERE B.ISBN IN (SELECT T1.ISBN FROM Books_Order AS T1 JOIN Orders AS T2 ON T1.IdOrder  =  T2.IdOrder)
SELECT DISTINCT T1.title FROM book AS T1 JOIN books_order AS T2 ON T1.isbn  =  T2.isbn WHERE T1.isbn IN (SELECT T1.isbn FROM book AS T1 JOIN orders AS T2 ON T1.isbn  =  T2.isbn)
SELECT DISTINCT T1.name FROM client AS T1 JOIN orders AS T2 ON T1.idclient  =  T2.idclient
SELECT DISTINCT T1.name FROM client AS T1 JOIN orders AS T2 ON T1.idclient  =  T2.idclient
SELECT T2.name ,  count(*) FROM Books_order AS T1 JOIN client AS T2 ON T1.idorder  =  T2.idclient GROUP BY T2.idclient
SELECT name ,  count(*) FROM client AS T1 JOIN orders AS T2 ON T1.idclient  =  T2.idclient GROUP BY T1.idclient
SELECT T1.name FROM client AS T1 JOIN orders AS T2 ON T1.idclient  =  T2.idclient GROUP BY T1.idclient ORDER BY count(*) DESC LIMIT 1
SELECT T2.Name FROM Books_Order AS T1 JOIN Client AS T2 ON T1.IdOrder  =  T2.IdClient GROUP BY T2.Name ORDER BY count(*) DESC LIMIT 1
SELECT T3.name ,  sum(T2.amount) FROM Books_order AS T1 JOIN Orders AS T2 ON T1.idorder  =  T2.idorder JOIN client AS T3 ON T2.idclient  =  T3.idclient GROUP BY T3.idclient
SELECT T3.name ,  sum(T2.amount) FROM Books_order AS T1 JOIN Orders AS T2 ON T1.idorder  =  T2.idorder JOIN client AS T3 ON T3.idclient  =  T2.idclient GROUP BY T3.idclient
SELECT T2.name FROM books_order AS T1 JOIN client AS T2 ON T1.idclient  =  T2.idclient GROUP BY T2.idclient ORDER BY sum(T1.amount) DESC LIMIT 1
SELECT T1.name FROM client AS T1 JOIN books_order AS T2 ON T1.idclient  =  T2.idorder GROUP BY T1.idclient ORDER BY sum(T2.amount) DESC LIMIT 1
SELECT title FROM book EXCEPT SELECT T1.title FROM book AS T1 JOIN Books_order AS T2 ON T1.isbn  =  T2.isbn
SELECT title FROM book WHERE isbn NOT IN (SELECT isbn FROM books_order)
SELECT name FROM client WHERE idclient NOT IN (SELECT idclient FROM orders)
SELECT Name FROM Client WHERE IdClient NOT IN (SELECT IdClient FROM Orders)
SELECT max(saleprice) ,  min(saleprice) FROM Book
SELECT max(saleprice) ,  min(saleprice) FROM Book
SELECT avg(purchaseprice) ,  avg(saleprice) FROM Book
SELECT avg(purchaseprice) ,  avg(saleprice) FROM BOOK
SELECT max(saleprice - purchaseprice) FROM book
SELECT max(saleprice - purchaseprice) FROM book
SELECT title FROM book WHERE saleprice  >  (SELECT avg(saleprice) FROM book)
SELECT title FROM book WHERE saleprice  >  (SELECT avg(saleprice) FROM book)
SELECT title FROM book ORDER BY saleprice LIMIT 1
SELECT title FROM book WHERE saleprice  =  (SELECT min(saleprice) FROM book)
SELECT title FROM book ORDER BY purchaseprice DESC LIMIT 1
SELECT title FROM book ORDER BY purchaseprice DESC LIMIT 1
SELECT avg(SalePrice) FROM BOOK WHERE Author  =  (SELECT T1.idAuthor FROM Author AS T1 JOIN Book AS T2 ON T1.idAuthor  =  T2.Author WHERE T1.Name  =  "George Orwell")
SELECT AVG(SalePrice) FROM BOOK WHERE Author IN (SELECT T2.name FROM Author_Book AS T1 JOIN Author AS T2 ON T1.Author  =  T2.idAuthor WHERE T1.ISBN IN (SELECT T2.ISBN FROM Author_Book AS T1 JOIN Author AS T2 ON T1.Author  =  T2.idAuthor WHERE T2.Name  =  "George Orwell"))
SELECT T2.SalePrice FROM Author_Book AS T1 JOIN Book AS T2 ON T1.ISBN  =  T2.ISBN WHERE T1.Author  =  (SELECT T3.idAuthor FROM Author AS T3 WHERE T3.Name  =  "Plato")
SELECT T2.SalePrice FROM Author_Book AS T1 JOIN Book AS T2 ON T1.ISBN  =  T2.ISBN JOIN Author AS T3 ON T1.Author  =  T3.idAuthor WHERE T3.Name  =  "Plato"
SELECT T1.title FROM BOOK AS T1 JOIN Author_Book AS T2 ON T1.ISBN  =  T2.ISBN JOIN Author AS T3 ON T2.Author  =  T3.idAuthor WHERE T3.name  =  "George Orwell" ORDER BY T1.saleprice ASC LIMIT 1
SELECT T1.title FROM BOOK AS T1 JOIN Author_Book AS T2 ON T1.ISBN  =  T2.ISBN JOIN Author AS T3 ON T2.Author  =  T3.idAuthor WHERE T3.name  =  "George Orwell" ORDER BY T1.saleprice ASC LIMIT 1
SELECT title FROM book WHERE author  =  "Plato" AND saleprice  <  (SELECT avg(saleprice) FROM book)
SELECT title FROM book WHERE author  =  "Plato" AND saleprice  <  (SELECT avg(saleprice) FROM book)
SELECT T2.name FROM Book AS T1 JOIN Author AS T2 ON T1.author  =  T2.idauthor WHERE T1.title  =  "Pride and Prejudice"
SELECT T2.name FROM BOOK AS T1 JOIN AUTHOR AS T2 ON T1.author =  T2.idauthor WHERE T1.title  =  "Pride and Prejudice"
SELECT T2.title FROM Author_Book AS T1 JOIN Book AS T2 ON T1.ISBN = T2.ISBN JOIN Author AS T3 ON T1.Author = T3.idAuthor WHERE T3.name LIKE '%Plato%'
SELECT T1.title FROM BOOK AS T1 JOIN Author_Book AS T2 ON T1.ISBN  =  T2.ISBN JOIN Author AS T3 ON T2.Author  =  T3.idAuthor WHERE T3.name LIKE '%Plato%'
SELECT count(*) FROM books AS T1 JOIN books_order AS T2 ON T1.isbn  =  T2.isbn WHERE T1.title  =  "Pride and Prejudice"
SELECT sum(T2.amount) FROM books AS T1 JOIN books_order AS T2 ON T1.isbn = T2.isbn WHERE T1.title = "Pride and Prejudice"
SELECT idorder FROM Books_order AS T1 JOIN order AS T2 ON T1.idorder  =  T2.idorder JOIN book AS T3 ON T3.isbn  =  T1.isbn WHERE T3.title  =  'Pride and Prejudice' INTERSECT SELECT idorder FROM Books_order AS T1 JOIN order AS T2 ON T1.idorder  =  T2.idorder JOIN book AS T3 ON T3.isbn  =  T1.isbn WHERE T3.title  =  'The Little Prince'
SELECT T1.idorder FROM Books_order AS T1 JOIN book AS T2 ON T1.isbn  =  T2.isbn WHERE T2.title  =  'Pride and Prejudice' INTERSECT SELECT T1.idorder FROM Books_order AS T1 JOIN book AS T2 ON T1.isbn  =  T2.isbn WHERE T2.title  =  'The Little Prince'
SELECT DISTINCT T1.Isbn FROM Books_Order AS T1 JOIN Orders AS T2 ON T1.IdOrder  =  T2.IdOrder JOIN Client AS T3 ON T2.IdClient  =  T3.IdClient WHERE T3.Name  =  "Peter Doe" INTERSECT SELECT DISTINCT T1.Isbn FROM Books_Order AS T1 JOIN Orders AS T2 ON T1.IdOrder  =  T2.IdOrder JOIN Client AS T3 ON T2.IdClient  =  T3.IdClient WHERE T3.Name  =  "James Smith"
SELECT T1.isbn FROM books_order AS T1 JOIN orders AS T2 ON T1.idorder  =  T2.idorder JOIN client AS T3 ON T2.idclient  =  T3.idclient WHERE T3.name  =  'Peter Doe' INTERSECT SELECT T1.isbn FROM books_order AS T1 JOIN orders AS T2 ON T1.idorder  =  T2.idorder JOIN client AS T3 ON T2.idclient  =  T3.idclient WHERE T3.name  =  'James Smith'
SELECT T3.title FROM books_order AS T1 JOIN orders AS T2 ON T1.idorder  =  T2.idorder JOIN book AS T3 ON T3.isbn  =  T1.isbn JOIN client AS T4 ON T4.idclient  =  T2.idclient WHERE T4.name  =  "Peter Doe" EXCEPT SELECT T3.title FROM books_order AS T1 JOIN orders AS T2 ON T1.idorder  =  T2.idclient JOIN book AS T3 ON T3.isbn  =  T1.isbn JOIN client AS T4 ON T4.idclient  =  T2.idclient WHERE T4.name  =  "James Smith"
SELECT T3.title FROM orders AS T1 JOIN books_order AS T2 ON T1.idorder  =  T2.idorder JOIN book AS T3 ON T2.isbn  =  T3.isbn JOIN client AS T4 ON T1.idclient  =  T4.idclient WHERE T4.name  =  'Peter Doe' EXCEPT SELECT T3.title FROM orders AS T1 JOIN books_order AS T2 ON T1.idorder  =  T2.idorder JOIN book AS T3 ON T2.isbn  =  T3.isbn JOIN client AS T4 ON T1.idclient  =  T4.idclient WHERE T4.name  =  'James Smith'
SELECT T2.name FROM books AS T1 JOIN client AS T2 JOIN books_order AS T3 ON T1.isbn  =  T3.isbn WHERE T1.title  =  'Pride and Prejudice'
SELECT T3.name FROM books AS T1 JOIN books_order AS T2 ON T1.isbn  =  T2.isbn JOIN client AS T3 ON T2.idclient  =  T3.idclient WHERE T1.title  =  'Pride and Prejudice'
SELECT count(*) FROM book
SELECT Title FROM book ORDER BY Title ASC
SELECT Title FROM book ORDER BY Pages DESC
SELECT TYPE ,  Release FROM book
SELECT max(Chapters) ,  min(Chapters) FROM book
SELECT Title FROM book WHERE Title != "Poet"
SELECT avg(Rating) FROM review
SELECT T2.Title ,  T1.Rating FROM review AS T1 JOIN book AS T2 ON T1.Book_ID  =  T2.Book_ID
SELECT t1.Rating FROM review AS t1 JOIN book AS t2 ON t1.Book_ID  =  t2.Book_ID ORDER BY t2.Chapters DESC LIMIT 1
SELECT t1.Rank FROM book AS t2 JOIN review AS t1 ON t1.Book_ID  =  t2.Book_ID ORDER BY t2.Pages ASC LIMIT 1
SELECT T2.Title FROM review AS T1 JOIN book AS T2 ON T1.Book_ID  =  T2.Book_ID ORDER BY T1.Rank ASC LIMIT 1
SELECT avg(T2.Readers_in_Million) FROM book AS T1 JOIN review AS T2 ON T1.Book_ID  =  T2.Book_ID WHERE T1.Type  =  "Novel"
SELECT TYPE ,  COUNT(*) FROM book GROUP BY TYPE
SELECT TYPE FROM book GROUP BY TYPE ORDER BY COUNT(*) DESC LIMIT 1
SELECT TYPE FROM book GROUP BY TYPE HAVING COUNT(*)  >=  3
SELECT T2.Title FROM review AS T1 JOIN book AS T2 ON T1.Book_ID  =  T2.Book_ID ORDER BY T1.Rating ASC
SELECT T1.title ,  T1.audio FROM book AS T1 JOIN review AS T2 ON T1.book_id  =  T2.book_id ORDER BY T2.Readers_in_Million DESC
SELECT count(*) FROM book WHERE book_id NOT IN (SELECT book_id FROM review)
SELECT TYPE FROM book WHERE Chapters  >  75 INTERSECT SELECT TYPE FROM book WHERE Chapters  <  50
SELECT count(DISTINCT TYPE) FROM book
SELECT TYPE ,  Title FROM book WHERE book_id NOT IN (SELECT book_id FROM review)
SELECT count(*) FROM customer
SELECT count(*) FROM customer
SELECT name FROM customer ORDER BY Level_of_Membership ASC
SELECT name FROM customer ORDER BY Level_of_Membership ASC
SELECT nationality ,  card_credit FROM customer
SELECT nationality ,  card_credit FROM customer
SELECT name FROM customer WHERE nationality  =  "England" OR nationality  =  "Australia"
SELECT name FROM customer WHERE nationality  =  "England" OR nationality  =  "Australia"
SELECT avg(card_credit) FROM customer WHERE level_of_membership  >  1
SELECT avg(card_credit) FROM customer WHERE level_of_membership  >  1
SELECT card_credit FROM customer ORDER BY LEVEL_of_Membership DESC LIMIT 1
SELECT card_credit FROM customer ORDER BY level_of_membership DESC LIMIT 1
SELECT nationality ,  count(*) FROM customer GROUP BY nationality
SELECT nationality ,  count(*) FROM customer GROUP BY nationality
SELECT nationality FROM customer GROUP BY nationality ORDER BY count(*) DESC LIMIT 1
SELECT nationality FROM customer GROUP BY nationality ORDER BY count(*) DESC LIMIT 1
SELECT nationality FROM customer WHERE card_credit  <  50 INTERSECT SELECT nationality FROM customer WHERE card_credit  >  75
SELECT nationality FROM customer WHERE card_credit  >  50 INTERSECT SELECT nationality FROM customer WHERE card_credit  <  75
SELECT T3.name ,  T2.Dish_Name FROM customer_order AS T1 JOIN branch AS T2 ON T1.Branch_ID  =  T2.Branch_ID JOIN customer AS T3 ON T1.Customer_ID  =  T3.Customer_ID
SELECT T2.name ,  T1.Dish_Name FROM customer_order AS T1 JOIN customer AS T2 ON T1.Customer_ID  =  T2.Customer_ID
SELECT T3.name ,  T2.Dish_Name FROM customer_order AS T1 JOIN branch AS T2 ON T1.branch_id  =  T2.branch_id JOIN customer AS T3 ON T1.customer_id  =  T3.customer_id ORDER BY T1.quantity DESC
SELECT T3.name ,  T2.Dish_Name FROM customer_order AS T1 JOIN branch AS T2 ON T1.Branch_ID  =  T2.Branch_ID JOIN customer AS T3 ON T1.Customer_ID  =  T3.Customer_ID ORDER BY T1.Quantity DESC
SELECT T2.name ,  sum(T1.quantity) FROM customer_order AS T1 JOIN customer AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T2.name
SELECT T2.name ,  sum(T1.quantity) FROM customer_order AS T1 JOIN customer AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T2.customer_id
SELECT sum(quantity) ,  T1.name FROM customer AS T1 JOIN customer_order AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.name HAVING sum(quantity)  >  1
SELECT T2.name FROM customer_order AS T1 JOIN customer AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id HAVING sum(quantity)  >  1
SELECT DISTINCT manager FROM branch
SELECT DISTINCT manager FROM branch
SELECT name FROM customer WHERE customer_id NOT IN (SELECT customer_id FROM customer_order)
SELECT name FROM customer WHERE customer_id NOT IN (SELECT customer_id FROM customer_order)
SELECT count(*) FROM member
SELECT name FROM member ORDER BY age ASC
SELECT name ,  nationality FROM member
SELECT name FROM member WHERE nationality != "England"
SELECT Name FROM member WHERE Age  =  19 OR Age  =  20
SELECT Name FROM member ORDER BY Age DESC LIMIT 1
SELECT Nationality ,  COUNT(*) FROM member GROUP BY Nationality
SELECT Nationality FROM member GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT Nationality FROM member GROUP BY Nationality HAVING COUNT(*)  >=  2
SELECT T2.Team_Leader ,  T1.Club_Name FROM club AS T1 JOIN club_leader AS T2 ON T1.Club_ID  =  T2.Club_ID
SELECT Team_Leader FROM club WHERE Overall_Ranking  >  100
SELECT T1.Team_Leader FROM club AS T1 JOIN club_leader AS T2 ON T1.Club_ID  =  T2.Club_ID WHERE T2.Year_Join  <  2018
SELECT Team_Leader FROM club WHERE Club_Name  =  "Houston"
SELECT name FROM member EXCEPT SELECT t1.name FROM member AS t1 JOIN club_leader AS t2 ON t1.member_id  =  t2.member_id
SELECT Nationality FROM member WHERE Age  >  22 INTERSECT SELECT Nationality FROM member WHERE Age  <  19
SELECT avg(T2.age) FROM club AS T1 JOIN member AS T2 ON T1.team_leader  =  T2.name
SELECT Club_Name FROM club WHERE Club_Name LIKE "%state%"
SELECT Collection_Subset_Name FROM Collection_Subsets
SELECT Collection_Subset_Name FROM Collection_Subsets
SELECT Collecrtion_Subset_Details FROM Collection_Subsets WHERE Collection_Subset_Name  =  "Top collection"
SELECT Collecrtion_Subset_Details FROM Collection_Subsets WHERE Collection_Subset_Name  =  "Top collection"
SELECT document_subset_name FROM Document_Subsets
SELECT document_subset_name FROM Document_Subsets
SELECT document_subset_details FROM Document_Subsets WHERE document_subset_name  =  'Best for 2000'
SELECT document_subset_details FROM Document_Subsets WHERE document_subset_name  =  "Best for 2000"
SELECT document_object_id FROM Document_Objects
SELECT document_object_id FROM Document_Objects
SELECT parent_document_object_id FROM Document_Objects WHERE OWNER  =  "Marlin"
SELECT document_object_id FROM Document_Objects WHERE OWNER  =  "Marlin"
SELECT OWNER FROM Document_Objects WHERE Description  =  "Braeden Collection"
SELECT T2.Owner FROM Collections AS T1 JOIN Document_Objects AS T2 JOIN Documents_in_Collections AS T3 ON T1.Collection_ID  =  T3.Collection_ID WHERE T1.Collection_Name  =  "Braeden Collection"
SELECT OWNER FROM Document_Objects WHERE Document_Object_ID  =  (SELECT Parent_Document_Object_ID FROM Document_Objects WHERE OWNER  =  'Marlin')
SELECT OWNER FROM Document_Objects WHERE Parent_Document_Object_ID IN (SELECT Document_Object_ID FROM Document_Objects WHERE OWNER  =  'Marlin')
SELECT DISTINCT Description FROM Document_Objects WHERE Parent_Document_Object_ID  =  "null"
SELECT DISTINCT Description FROM Document_Objects WHERE Parent_Document_Object_ID  =  "-1"
SELECT count(*) FROM Document_Objects WHERE OWNER  =  "Marlin"
SELECT count(*) FROM Document_Objects WHERE OWNER  =  "Marlin"
SELECT document_object_id FROM Document_Objects EXCEPT SELECT parent_document_object_id FROM Document_Objects
SELECT document_object_id FROM Document_Objects WHERE parent_document_object_id  =  "null"
SELECT Parent_Document_Object_ID ,  COUNT(*) FROM Document_Objects GROUP BY Parent_Document_Object_ID
SELECT count(*) ,  parent_document_object_id FROM Document_Objects GROUP BY parent_document_object_id
SELECT Collection_Name FROM Collections
SELECT Collection_Name FROM Collections
SELECT Collection_Description FROM COLLECTIONS WHERE Collection_Name  =  "Best"
SELECT collection_description FROM collections WHERE collection_name  =  'Best'
SELECT Parent_Collection_ID FROM Collections WHERE Collection_Name  =  "Nice"
SELECT Parent_Collection_ID FROM Collections WHERE Collection_Name  =  "Nice"
SELECT Collection_Name FROM Collections WHERE Collection_ID NOT IN (SELECT Parent_Collection_ID FROM Collections)
SELECT Collection_Name FROM Collections WHERE Collection_ID NOT IN (SELECT Parent_Collection_ID FROM Collections)
SELECT document_object_id FROM document_objects WHERE parent_document_object_id IS NOT NULL GROUP BY parent_document_object_id HAVING count(*)  >  1
SELECT document_object_id FROM document_objects GROUP BY parent_document_object_id HAVING count(*)  >  1
SELECT count(*) FROM COLLECTIONS WHERE PARENT_COLLECTION_ID  =  (SELECT collection_id FROM collections WHERE collection_name  =  "Best")
SELECT count(*) FROM COLLECTIONS WHERE Parent_Collection_ID  =  (SELECT Collection_ID FROM COLLECTIONS WHERE Collection_Name  =  "Best")
SELECT T1.document_object_id FROM Documents_in_Collections AS T1 JOIN Collections AS T2 ON T1.collection_id  =  T2.collection_id JOIN Document_Objects AS T3 ON T3.Document_Object_ID  =  T1.Document_Object_ID WHERE T3.Owner  =  "Ransom"
SELECT Related_Document_Object_ID FROM Document_Objects WHERE Owner  =  "Ransom"
SELECT T1.Collection_Subset_ID ,  T1.Collection_Subset_Name ,  count(*) FROM Collection_Subsets AS T1 JOIN Collection_Subset_Members AS T2 ON T1.Collection_Subset_ID  =  T2.Collection_Subset_ID GROUP BY T1.Collection_Subset_ID
SELECT T2.Collection_Subset_ID ,  T2.Collection_Subset_Name ,  COUNT(*) FROM Collection_Subset_Members AS T1 JOIN Collection_Subsets AS T2 ON T1.Collection_Subset_ID  =  T2.Collection_Subset_ID GROUP BY T2.Collection_Subset_ID
SELECT T1.Document_Object_ID ,  count(*) FROM Document_Objects AS T1 JOIN Document_Objects AS T2 ON T1.Document_Object_ID  =  T2.Parent_Document_Object_ID GROUP BY T1.Document_Object_ID ORDER BY count(*) DESC LIMIT 1
SELECT count(*) ,  parent_document_object_id FROM document_objects GROUP BY parent_document_object_id
SELECT document_object_id ,  count(*) FROM document_subset_members GROUP BY document_object_id ORDER BY count(*) ASC LIMIT 1
SELECT document_object_id FROM document_objects GROUP BY document_object_id ORDER BY count(*) ASC LIMIT 1
SELECT T2.Document_Object_ID ,  COUNT(*) FROM Document_Subset_Members AS T1 JOIN Document_Objects AS T2 ON T1.Related_Document_Object_ID  =  T2.Document_Object_ID GROUP BY T2.Document_Object_ID HAVING COUNT(*) BETWEEN 2 AND 4
SELECT T2.Document_Object_ID ,  COUNT(*) FROM Document_Subset_Members AS T1 JOIN Document_Objects AS T2 ON T1.Document_Object_ID  =  T2.Document_Object_ID WHERE COUNT(*) BETWEEN 2 AND 4 GROUP BY T2.Document_Object_ID
SELECT T2.Owner FROM Document_Objects AS T1 JOIN Documents_in_Collections AS T2 ON T1.Document_Object_ID  =  T2.Document_Object_ID JOIN Document_Objects AS T3 ON T3.Document_Object_ID  =  T1.Parent_Document_Object_ID WHERE T3.Owner  =  "Braeden"
SELECT DISTINCT OWNER FROM Document_Objects WHERE Document_Object_ID IN ( SELECT Related_Document_Object_ID FROM Document_Subset_Members WHERE Document_Object_ID IN ( SELECT Document_Object_ID FROM Document_Objects WHERE OWNER  =  "Braeden" ) )
SELECT T2.Document_subset_name FROM Document_objects AS T1 JOIN Document_Subset_Members AS T2 ON T1.document_object_id  =  T2.document_object_id JOIN Document_Subsets AS T3 ON T2.document_subset_id  =  T3.document_subset_id WHERE T1.Owner  =  "Braeden" GROUP BY T2.document_subset_id HAVING count(*)  =  1
SELECT DISTINCT T2.Document_subset_name FROM document_objects AS T1 JOIN document_subset_members AS T2 ON T1.document_object_id  =  T2.document_object_id JOIN document_subsets AS T3 ON T2.document_subset_id  =  T3.document_subset_id WHERE T1.Owner  =  "Braeden"
SELECT document_subset_id ,  document_subset_name ,  count(DISTINCT related_document_object_id) FROM document_subset_members GROUP BY document_subset_id
SELECT document_subset_id ,  document_subset_name ,  count(DISTINCT related_document_object_id) FROM document_subset_members GROUP BY document_subset_id
SELECT T1.document_subset_id ,  T1.document_subset_name ,  count(DISTINCT T2.document_object_id) FROM document_subsets AS T1 JOIN document_subset_members AS T2 ON T1.document_subset_id  =  T2.document_subset_id GROUP BY T1.document_subset_id ORDER BY count(DISTINCT T2.document_object_id) DESC LIMIT 1
SELECT T1.document_subset_id ,  T1.document_subset_name , count(*) FROM document_subset_members AS T2 JOIN document_subsets AS T1 ON T1.document_subset_id  =  T2.document_subset_id GROUP BY T1.document_subset_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.Document_Object_ID FROM Document_Subset_Members AS T1 JOIN Document_Subsets AS T2 ON T1.Document_Subset_ID  =  T2.Document_Subset_ID WHERE T2.Document_Subset_Name  =  "Best for 2000"
SELECT Document_Object_ID FROM Document_Subset_Members WHERE Document_Subset_ID  =  (SELECT Document_Subset_ID FROM Document_Subsets WHERE Document_Subset_Name  =  "Best for 2000")
SELECT T2.Document_subset_name ,  T1.Document_Object_ID FROM Document_subset_members AS T1 JOIN Document_subsets AS T2 ON T1.Document_subset_id  =  T2.Document_subset_id
SELECT T2.Document_subset_name ,  T1.Document_Object_ID FROM Document_subset_members AS T1 JOIN Document_subsets AS T2 ON T1.Document_subset_id  =  T2.Document_subset_id GROUP BY T1.Document_Object_ID
SELECT T2.Collection_Name FROM Document_Objects AS T1 JOIN Collections AS T2 JOIN Documents_in_Collections AS T3 ON T1.Document_Object_ID  =  T3.Document_Object_ID AND T2.Collection_ID  =  T3.Collection_ID WHERE T1.Owner  =  "Ransom"
SELECT T2.Collection_Name FROM Document_Objects AS T1 JOIN Collections AS T2 JOIN Documents_in_Collections AS T3 ON T1.Document_Object_ID  =  T3.Document_Object_ID AND T2.Collection_ID  =  T3.Collection_ID WHERE T1.Owner  =  "Ransom"
SELECT count(*) ,  T1.document_object_id FROM Documents_in_Collections AS T1 JOIN Collections AS T2 ON T1.collection_id  =  T2.collection_id GROUP BY T1.document_object_id
SELECT count(*) ,  document_object_id FROM documents_in_collections GROUP BY document_object_id
SELECT count(*) FROM COLLECTIONS AS T1 JOIN Documents_in_Collections AS T2 ON T1.Collection_id  =  T2.Collection_id WHERE T1.Collection_name  =  "Best"
SELECT count(*) FROM COLLECTIONS AS T1 JOIN Documents_in_Collections AS T2 ON T1.Collection_id  =  T2.Collection_id WHERE T1.Collection_name  =  "Best"
SELECT T1.Document_Object_ID FROM Documents_in_Collections AS T1 JOIN Collections AS T2 ON T1.Collection_ID  =  T2.Collection_ID WHERE T2.Collection_Name  =  "Best"
SELECT count(*) FROM Documents_in_Collections AS T1 JOIN Collections AS T2 ON T1.collection_id  =  T2.collection_id WHERE T2.Collection_Name  =  "Best"
SELECT T1.Collection_Name ,  T1.Collection_ID ,  COUNT(*) FROM Collections AS T1 JOIN Documents_in_Collections AS T2 ON T1.Collection_ID  =  T2.Collection_ID GROUP BY T1.Collection_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.collection_name ,  T1.collection_id FROM collections AS T1 JOIN documents_in_collections AS T2 ON T1.collection_id  =  T2.collection_id WHERE T1.collection_name  =  "Best" GROUP BY T1.collection_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.Document_Object_ID FROM Document_Objects AS T1 JOIN Documents_in_Collections AS T2 ON T1.Document_Object_ID  =  T2.Document_Object_ID JOIN Collections AS T3 ON T2.Collection_ID  =  T3.Collection_ID JOIN Document_Subset_Members AS T4 ON T4.Document_Object_ID  =  T1.Document_Object_ID JOIN Document_Subsets AS T5 ON T4.Document_Subset_ID  =  T5.Document_Subset_ID WHERE T5.Document_Subset_Name  =  "Best" AND T3.Collection_Name  =  "Best" AND T3.Collection_Description  =  2000
SELECT T1.document_object_id FROM Document_objects AS T1 JOIN Document_subset_members AS T2 ON T1.document_object_id  =  T2.document_object_id JOIN Document_subsets AS T3 ON T2.document_subset_id  =  T3.document_subset_id JOIN COLLECTIONS AS T4 ON T4.collection_id  =  T3.collection_subset_id WHERE T3.document_subset_name  =  "Best for 2000" AND T4.collection_name  =  "Best"
SELECT TM.document_object_id FROM collections AS T1 JOIN documents_in_collections AS T2 ON T1.collection_id  =  T2.collection_id WHERE T1.collection_name  =  "Best" EXCEPT SELECT TM.document_object_id FROM document_subsets AS T3 JOIN document_subset_members AS TM ON T3.document_subset_id  =  TM.document_subset_id WHERE T3.document_subset_name  =  "Best for 2000"
SELECT DISTINCT T1.document_object_id FROM documents_in_collections AS T1 JOIN collections AS T2 ON T1.collection_id  =  T2.collection_id WHERE T2.collection_name  =  "Best" EXCEPT SELECT T1.document_object_id FROM Document_Subset_Members AS T1 JOIN Document_Objects AS T2 ON T1.document_object_id  =  T2.document_object_id JOIN Document_Subsets AS T3 ON T1.document_subset_id  =  T3.document_subset_id WHERE T3.document_subset_name  =  "Best for 2000"
SELECT T1.document_object_id FROM Document_subset_members AS T1 JOIN document_objects AS T2 ON T1.document_object_id  =  T2.document_object_id JOIN document_subsets AS T3 ON T1.document_subset_id  =  T3.document_subset_id WHERE T3.Document_subset_name  =  "Best" AND T3.document_subset_details  =  2000 UNION SELECT T1.document_object_id FROM Documents_in_collections AS T1 JOIN collections AS T2 ON T1.collection_id  =  T2.collection_id WHERE T2.Collection_name  =  "Best"
SELECT DISTINCT T1.document_object_id FROM documents_in_collections AS T1 JOIN collections AS T2 ON T1.collection_id  =  T2.collection_id WHERE T2.Collection_Name  =  "Best" UNION SELECT DISTINCT document_object_id FROM document_subset_members AS T1 JOIN document_subsets AS T2 ON T1.document_subset_id  =  T2.document_subset_id WHERE T2.Document_Subset_Name  =  "Best for 2000"
SELECT T1.Collection_Name FROM Collections AS T1 JOIN Collection_Subset_Members AS T2 ON T1.Collection_ID  =  T2.Related_Collection_ID JOIN Collection_Subsets AS T3 ON T2.Collection_Subset_ID  =  T3.Collection_Subset_ID WHERE T3.Collection_Subset_Name  =  "Best"
SELECT T2.Collection_Name FROM Collections AS T1 JOIN Collections AS T2 ON T1.Collection_ID  =  T2.Parent_Collection_ID WHERE T1.Collection_Name  =  "Best"
SELECT count(*) FROM COLLECTIONS AS T1 JOIN Collection_Subset_Members AS T2 ON T1.collection_id  =  T2.collection_id JOIN COLLECTION_SUBSETS AS T3 ON T2.Collection_Subset_ID  =  T3.Collection_Subset_ID WHERE T1.Collection_Name  =  "Best"
SELECT count(*) FROM Collections WHERE Collection_Name !=  'Best' AND Collection_ID IN ( SELECT Related_Collection_ID FROM Collection_Subset_Members WHERE Collection_Subset_ID  =  ( SELECT Collection_Subset_ID FROM Collection_Subsets WHERE Collection_Subset_Name  =  'Best' ) )
SELECT T2.Collection_Subset_Name FROM Collections AS T1 JOIN Collection_Subset_Members AS T2 ON T1.Collection_ID  =  T2.Related_Collection_ID WHERE T1.Collection_Name  =  "Best"
SELECT T2.Collection_Subset_Name FROM Collections AS T1 JOIN Collection_Subset_Members AS T2 ON T1.Collection_ID  =  T2.Collection_ID WHERE T1.Collection_Name  =  "Best"
SELECT count(*) FROM songs WHERE name LIKE "%Love%"
SELECT name FROM songs ORDER BY name ASC
SELECT name ,  language FROM songs
SELECT max(voice_sound_quality) ,  min(voice_sound_quality) FROM performance_score
SELECT T2.voice_sound_quality ,  T2.rhythm_tempo ,  T2.stage_presence FROM participants AS T1 JOIN performance_score AS T2 ON T1.id  =  T2.participant_id WHERE T1.name  =  "Freeway"
SELECT id ,  language ,  original_artist FROM songs WHERE name != 'Love'
SELECT name ,  original_artist FROM songs WHERE english_translation  =  "All the streets of love"
SELECT DISTINCT T1.stage_presence FROM performance_score AS T1 JOIN songs AS T2 ON T1.songs_id  =  T2.id WHERE T2.language  =  'English'
SELECT T1.id ,  T1.name FROM participants AS T1 JOIN performance_score AS T2 ON T1.id  =  T2.participant_id GROUP BY T1.id HAVING count(*)  >=  2
SELECT T1.id ,  T1.name ,  T1.popularity FROM participants AS T1 JOIN performance_score AS T2 ON T1.id  =  T2.participant_id GROUP BY T1.id ORDER BY count(*)
SELECT T2.id ,  T2.name FROM performance_score AS T1 JOIN participants AS T2 ON T1.participant_id  =  T2.id WHERE T1.voice_sound_quality  =  5 OR T1.rhythm_tempo  =  5
SELECT T2.voice_sound_quality FROM songs AS T1 JOIN performance_score AS T2 ON T1.id  =  T2.songs_id WHERE T1.name  =  'The Balkan Girls' AND T1.language  =  'English'
SELECT T2.id ,  T2.name FROM performance_score AS T1 JOIN songs AS T2 ON T1.songs_id  =  T2.id GROUP BY T1.songs_id ORDER BY count(*) DESC LIMIT 1
SELECT count(*) FROM performance_score WHERE stage_presence  <  7 OR stage_presence  >  9
SELECT count(*) FROM songs WHERE id NOT IN ( SELECT songs_id FROM performance_score )
SELECT avg(T2.rhythm_tempo) ,  T1.language FROM songs AS T1 JOIN performance_score AS T2 ON T1.id  =  T2.songs_id GROUP BY T1.language
SELECT DISTINCT T1.name FROM participants AS T1 JOIN songs AS T2 ON T1.id  =  T2.original_artist WHERE T2.language  =  'English'
SELECT T1.name ,  T1.popularity FROM participants AS T1 JOIN performance_score AS T2 ON T1.id  =  T2.participant_id JOIN songs AS T3 ON T2.songs_id  =  T3.id WHERE T3.language  =  'Croatian' INTERSECT SELECT T1.name ,  T1.popularity FROM participants AS T1 JOIN performance_score AS T2 ON T1.id  =  T2.participant_id JOIN songs AS T3 ON T2.songs_id  =  T3.id WHERE T3.language  =  'English'
SELECT name FROM songs WHERE name LIKE "%Is%"
SELECT T2.original_artist FROM performance_score AS T1 JOIN songs AS T2 ON T1.songs_id  =  T2.id WHERE T1.rhythm_tempo  >  5 ORDER BY T1.voice_sound_quality DESC
SELECT count(*) FROM city
SELECT count(*) FROM city
SELECT DISTINCT state FROM city
SELECT DISTINCT state FROM city
SELECT count(DISTINCT country) FROM city
SELECT count(DISTINCT country) FROM city
SELECT city_name ,  city_code ,  state ,  country FROM City
SELECT city_name ,  city_code ,  state ,  country FROM City
SELECT latitude ,  longitude FROM city WHERE city_name  =  "Baltimore"
SELECT latitude ,  longitude FROM city WHERE city_name  =  "Baltimore"
SELECT city_name FROM city WHERE state  =  "PA"
SELECT city_name FROM city WHERE state  =  "PA"
SELECT count(*) FROM city WHERE country  =  "Canada"
SELECT count(*) FROM city WHERE country  =  "Canada"
SELECT city_name FROM city WHERE country  =  "USA" ORDER BY latitude
SELECT city_name FROM city WHERE country  =  'USA' ORDER BY latitude
SELECT state ,  count(*) FROM city GROUP BY state
SELECT count(*) ,  state FROM city GROUP BY state
SELECT country ,  count(*) FROM city GROUP BY country
SELECT count(*) ,  country FROM city GROUP BY country
SELECT state FROM city GROUP BY state HAVING count(*)  >=  2
SELECT state FROM city GROUP BY state HAVING count(*)  >=  2
SELECT state FROM city GROUP BY state ORDER BY count(*) DESC LIMIT 1
SELECT state FROM city GROUP BY state ORDER BY count(*) DESC LIMIT 1
SELECT country FROM city GROUP BY country ORDER BY count(*) LIMIT 1
SELECT country FROM city GROUP BY country ORDER BY count(*) ASC LIMIT 1
SELECT T2.fname ,  T2.lname FROM student AS T1 JOIN Student AS T2 ON T1.stuid  =  T2.advisor WHERE T1.city_code IN (SELECT city_code FROM city WHERE state  =  "MD")
SELECT T2.lname ,  T2.fname FROM student AS T1 JOIN Student AS T2 ON T1.stuid  =  T2.stuid JOIN city AS T3 ON T3.city_code  =  T1.city_code WHERE T3.state  =  "MD"
SELECT count(*) FROM student WHERE city_code IN (SELECT city_code FROM city WHERE country  =  "China")
SELECT count(*) FROM student WHERE city_code IN (SELECT city_code FROM city WHERE country  =  "China")
SELECT Fname ,  major FROM Student WHERE city_code  =  "BOS"
SELECT fname ,  major FROM Student WHERE city_code  =  "BOS"
SELECT count(*) ,  country FROM city JOIN student ON city_code  =  city_code GROUP BY country
SELECT count(*) ,  country FROM city JOIN student ON city_code  =  city_code GROUP BY country
SELECT count(*) ,  city_code FROM student GROUP BY city_code
SELECT count(*) ,  city_code FROM student GROUP BY city_code
SELECT T1.state FROM city AS T1 JOIN student AS T2 ON T1.city_code  =  T2.city_code GROUP BY T1.state ORDER BY count(*) DESC LIMIT 1
SELECT state FROM city AS T1 JOIN student AS T2 ON T1.city_code  =  T2.city_code GROUP BY state ORDER BY count(*) DESC LIMIT 1
SELECT country FROM city AS T1 JOIN student AS T2 ON T1.city_code  =  T2.city_code GROUP BY country ORDER BY count(*) ASC LIMIT 1
SELECT T1.country FROM city AS T1 JOIN student AS T2 ON T1.city_code  =  T2.city_code GROUP BY T1.country ORDER BY count(*) LIMIT 1
SELECT T1.city_name FROM city AS T1 JOIN student AS T2 ON T1.city_code  =  T2.city_code GROUP BY T1.city_code HAVING count(*)  >=  3
SELECT T2.city_name FROM student AS T1 JOIN city AS T2 ON T1.city_code  =  T2.city_code GROUP BY T1.city_code HAVING count(*)  >=  3
SELECT T1.state FROM city AS T1 JOIN student AS T2 ON T1.city_code  =  T2.city_code GROUP BY T1.state HAVING count(*)  >  5
SELECT count(*) ,  T1.state FROM city AS T1 JOIN student AS T2 ON T1.city_code  =  T2.city_code GROUP BY T1.state HAVING count(*)  >  5
SELECT stuid FROM student WHERE city_code NOT IN (SELECT city_code FROM city WHERE country  =  "USA")
SELECT StuID FROM student WHERE city_code NOT IN (SELECT city_code FROM city WHERE country  =  "USA")
SELECT StuID FROM Student WHERE sex  =  "F" AND city_code IN (SELECT city_code FROM City WHERE state  =  "PA")
SELECT StuID FROM Student WHERE sex  =  'F' AND city_code IN (SELECT city_code FROM City WHERE state  =  'PA')
SELECT StuID FROM student WHERE sex  =  'M' AND city_code NOT IN (SELECT city_code FROM city WHERE country  =  'USA')
SELECT StuID FROM student WHERE sex  =  'M' AND city_code NOT IN (SELECT city_code FROM city WHERE country  =  'USA')
SELECT distance FROM direct_distance WHERE city1_code  =  "BAL" AND city2_code  =  "CHI"
SELECT distance FROM direct_distance WHERE city1_code  =  "BAL" AND city2_code  =  "CHI"
SELECT distance FROM direct_distance WHERE city1_code  =  "BOS" AND city2_code  =  "EWR"
SELECT distance FROM direct_distance WHERE city1_code  =  "BOS" AND city2_code  =  "EWR"
SELECT avg(distance) ,  min(distance) ,  max(distance) FROM direct_distance
SELECT avg(distance) ,  min(distance) ,  max(distance) FROM Direct_distance
SELECT city1_code ,  city2_code FROM Direct_distance ORDER BY distance DESC LIMIT 1
SELECT city1_code FROM direct_distance ORDER BY distance DESC LIMIT 1
SELECT city1_code FROM Direct_distance WHERE distance  >  (SELECT avg(distance) FROM Direct_distance)
SELECT city1_code FROM Direct_distance WHERE distance  >  (SELECT avg(distance) FROM Direct_distance)
SELECT city1_code FROM direct_distance WHERE distance  <  1000 INTERSECT SELECT city2_code FROM direct_distance WHERE distance  <  1000
SELECT city1_code FROM Direct_distance WHERE distance  <  1000
SELECT sum(distance) FROM direct_distance WHERE city1_code  =  "BAL" OR city2_code  =  "BAL"
SELECT sum(distance) FROM direct_distance WHERE city1_code  =  "BAL"
SELECT avg(distance) FROM direct_distance WHERE city1_code  =  "BOS"
SELECT avg(distance) FROM direct_distance WHERE city1_code  =  "BOS"
SELECT city_name FROM city ORDER BY distance LIMIT 1 FROM (SELECT city_name ,  distance FROM city AS t1 JOIN direct_distance AS t2 ON t1.city_code  =  city1_code WHERE city_name  =  "Chicago" UNION SELECT city_name ,  distance FROM city AS t1 JOIN direct_distance AS t2 ON t1.city_code  =  city2_code WHERE city_name  =  "Chicago") ORDER BY distance
SELECT city_name FROM city WHERE city_code  =  (SELECT city_code1 FROM direct_distance WHERE city_code2  =  "Chi" AND distance  =  (SELECT min(distance) FROM direct_distance WHERE city_code2  =  "Chi"))
SELECT city_name FROM city WHERE city_code IN (SELECT city2_code FROM Direct_distance WHERE city1_code  =  "BOS" AND distance  =  (SELECT MAX (distance) FROM Direct_distance WHERE city1_code  =  "BOS"))
SELECT city_name FROM city WHERE city_code NOT IN (SELECT city1_code FROM direct_distance WHERE city2_code  =  "BOS") ORDER BY distance DESC LIMIT 1
SELECT city_code ,  sum(distance) FROM direct_distance GROUP BY city_code
SELECT city_code ,  sum(distance) FROM direct_distance GROUP BY city_code
SELECT T1.city_name ,  avg(T2.distance) FROM city AS T1 JOIN direct_distance AS T2 ON T1.city_code  =  T2.city1_code GROUP BY T1.city_name
SELECT T1.city_name ,  avg(T2.distance) FROM city AS T1 JOIN direct_distance AS T2 ON T1.city_code  =  T2.city1_code GROUP BY T1.city_code
SELECT direct_distance.distance FROM student AS T1 JOIN direct_distance AS T2 ON T1.city_code  =  T2.city1_code JOIN student AS T3 ON T2.city2_code  =  T3.city_code WHERE T1.fname  =  "Linda" AND T1.lname  =  "Smith" AND T3.fname  =  "Tracy" AND T3.lname  =  "Kim"
SELECT DISTANCE FROM direct_distance AS T1 JOIN city AS T2 ON  T1.city1_code  =  T2.city_code WHERE T2.city_name  =  "Linda Vista" INTERSECT SELECT DISTANCE FROM direct_distance AS T1 JOIN city AS T2 ON  T1.city2_code  =  T2.city_code WHERE T2.city_name  =  "Tracyville"
SELECT T1.fname ,  T1.lname FROM student AS T1 JOIN student AS T2 ON T1.city_code  =  T2.city_code WHERE T2.fname  =  "Linda" AND T2.lname  =  "Smith" ORDER BY T1.advisor DESC LIMIT 1
SELECT T2.fname ,  T2.lname FROM direct_distance AS T1 JOIN student AS T2 ON T1.city1_code  =  T2.city_code WHERE T2.lname  =  "Smith" AND T2.fname  =  "Linda" ORDER BY T1.distance DESC LIMIT 1
SELECT T2.state FROM student AS T1 JOIN city AS T2 ON T1.city_code  =  T2.city_code WHERE T1.fname  =  "Linda"
SELECT T2.state FROM student AS T1 JOIN city AS T2 ON T1.city_code  =  T2.city_code WHERE T1.fname  =  "Linda"
SELECT * FROM Sailors WHERE age  >  30
SELECT name FROM Sailors WHERE age  >  30
SELECT name ,  age FROM Sailors WHERE age  <  30
SELECT name ,  age FROM Sailors WHERE age  <  30
SELECT T2.name FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid WHERE T1.sid  =  1
SELECT DISTINCT bid FROM Reserves WHERE sid  =  1
SELECT name FROM Sailors WHERE sid IN (SELECT sid FROM Reserves WHERE bid  =  102)
SELECT T2.name FROM Reserves AS T1 JOIN Sailors AS T2 ON T1.sid  =  T2.sid WHERE T1.bid  =  102
SELECT DISTINCT bid FROM Reserves
SELECT bid FROM Reserves
SELECT name FROM Sailors WHERE name LIKE '%e%'
SELECT name FROM Sailors WHERE name LIKE '%e%'
SELECT sid FROM Sailors WHERE age  >  (SELECT min(age) FROM Sailors)
SELECT DISTINCT id FROM Sailors EXCEPT SELECT DISTINCT id FROM Sailors ORDER BY age ASC LIMIT 1
SELECT DISTINCT name FROM Sailors WHERE age  >  (SELECT min(age) FROM Sailors WHERE rating  >  7)
SELECT DISTINCT name FROM Sailors WHERE age  >  (SELECT min(age) FROM Sailors WHERE rating  >  7)
SELECT T2.name ,  T1.sid FROM Reserves AS T1 JOIN Sailors AS T2 ON T1.sid  =  T2.sid GROUP BY T1.sid HAVING count(*)  >=  1
SELECT T2.name ,  T1.sid FROM Reserves AS T1 JOIN Sailors AS T2 ON T1.sid  =  T2.sid
SELECT T2.sid ,  T1.name FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid  =  T2.sid GROUP BY T2.sid HAVING count(*)  >  1
SELECT DISTINCT T1.name FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid  =  T2.sid GROUP BY T1.sid HAVING COUNT ( DISTINCT T2.name )  >=  2
SELECT T2.sid FROM Boats AS T1 JOIN Reserves AS T2 ON T1.bid  =  T2.bid WHERE T1.color  =  'red' OR T1.color  =  'blue'
SELECT T2.sid FROM Boats AS T1 JOIN Reserves AS T2 ON T1.bid  =  T2.bid WHERE T1.color  =  'red' OR T1.color  =  'blue'
SELECT T1.name ,  T1.sid FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid  =  T2.sid JOIN Boats AS T3 ON T2.bid  =  T3.bid WHERE T3.color  =  'red' OR T3.color  =  'blue'
SELECT T1.name ,  T1.sid FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid  =  T2.sid JOIN Boats AS T3 ON T2.bid  =  T3.bid WHERE T3.color  =  'red' OR T3.color  =  'blue'
SELECT T1.sid FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid WHERE T2.color  =  'red' INTERSECT SELECT T1.sid FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid WHERE T2.color  =  'blue'
SELECT T1.sid FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid WHERE T2.color  =  'red' INTERSECT SELECT T1.sid FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid WHERE T2.color  =  'blue'
SELECT T1.name ,  T1.sid FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid  =  T2.sid JOIN Boats AS T3 ON T2.bid  =  T3.bid WHERE T3.color  =  'red' INTERSECT SELECT T1.name ,  T1.sid FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid  =  T2.sid JOIN Boats AS T3 ON T2.bid  =  T3.bid WHERE T3.color  =  'blue'
SELECT T1.name ,  T1.sid FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid  =  T2.sid JOIN Boats AS T3 ON T2.bid  =  T3.bid WHERE T3.color  =  'red' INTERSECT SELECT T1.name ,  T1.sid FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid  =  T2.sid JOIN Boats AS T3 ON T2.bid  =  T3.bid WHERE T3.color  =  'blue'
SELECT sid FROM sailors EXCEPT SELECT sid FROM reserves
SELECT sid FROM sailors EXCEPT SELECT sid FROM reserves
SELECT name ,  sid FROM Sailors WHERE sid NOT IN (SELECT sid FROM Reserves)
SELECT name ,  sid FROM Sailors EXCEPT SELECT T2.name ,  T2.sid FROM Reserves AS T1 JOIN Sailors AS T2 ON T1.sid  =  T2.sid
SELECT sid FROM sailors EXCEPT SELECT sid FROM reserves
SELECT sid FROM Sailors EXCEPT SELECT sid FROM Reserves
SELECT T2.name FROM Reserves AS T1 JOIN Sailors AS T2 ON T1.sid  =  T2.sid WHERE T1.bid  =  103
SELECT T2.name FROM Reserves AS T1 JOIN Sailors AS T2 ON T1.sid  =  T2.sid WHERE T1.bid  =  103
SELECT name FROM Sailors WHERE rating  >  (SELECT max(rating) FROM Sailors WHERE name  =  'Luis')
SELECT name FROM Sailors WHERE rating  >  (SELECT max(rating) FROM Sailors WHERE name  =  'Luis')
SELECT name FROM Sailors WHERE rating  >  (SELECT max(rating) FROM Sailors WHERE name  =  "Luis")
SELECT name FROM Sailors WHERE rating  >  (SELECT max(rating) FROM Sailors WHERE name  =  'Luis')
SELECT T2.name ,  T1.sid FROM Reserves AS T3 JOIN Sailors AS T2 ON T3.sid  =  T2.sid JOIN BOATS AS T1 ON T3.bid  =  T1.bid WHERE T2.rating  >  2
SELECT T2.name ,  T2.sid FROM Reserves AS T1 JOIN Sailors AS T2 ON T1.sid  =  T2.sid WHERE T2.rating  >=  3
SELECT name ,  age FROM Sailors ORDER BY age DESC LIMIT 1
SELECT name ,  age FROM Sailors ORDER BY age DESC LIMIT 1
SELECT count(*) FROM Sailors
SELECT count(*) FROM Sailors
SELECT avg(age) FROM Sailors WHERE rating  =  7
SELECT avg(age) FROM Sailors WHERE rating  =  7
SELECT count(*) FROM Sailors WHERE name LIKE 'D%'
SELECT count(*) FROM Sailors WHERE name LIKE 'D%'
SELECT avg(rating) ,  max(age) FROM Sailors
SELECT avg(rating) ,  max(age) FROM Sailors
SELECT count(*) ,  T1.name FROM Boats AS T1 JOIN Reserves AS T2 ON T1.bid  =  T2.bid GROUP BY T1.name
SELECT count(*) ,  T1.name FROM BOATS AS T1 JOIN RESERVES AS T2 ON T1.bid  =  T2.bid GROUP BY T1.name
SELECT count(*) ,  bid FROM Reserves WHERE bid  >  50 GROUP BY bid
SELECT count(*) ,  bid FROM Reserves WHERE bid  >  50 GROUP BY bid
SELECT count(*) ,  T1.name FROM boats AS T1 JOIN reserves AS T2 ON T1.bid  =  T2.bid GROUP BY T1.name HAVING count(*)  >  1
SELECT count(*) ,  T1.name FROM boats AS T1 JOIN reserves AS T2 ON T1.bid  =  T2.bid GROUP BY T1.name HAVING count(*)  >  1
SELECT count(*) ,  T1.name FROM boats AS T1 JOIN reserves AS T2 ON T1.bid  =  T2.bid WHERE T2.sid  >  1 GROUP BY T1.name
SELECT bid ,  count(*) FROM Reserves WHERE sid  >  1 GROUP BY bid
SELECT T1.rating ,  avg(T1.age) FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid  =  T2.sid JOIN Boats AS T3 ON T3.bid  =  T2.bid WHERE T3.color  =  'red' GROUP BY T1.rating
SELECT T1.rating ,  avg(T1.age) FROM Sailors AS T1 JOIN reserves AS T2 ON T1.sid  =  T2.sid JOIN boats AS T3 ON T2.bid  =  T3.bid WHERE T3.color  =  'red' GROUP BY T1.rating
SELECT name ,  rating ,  age FROM Sailors ORDER BY rating ,  age
SELECT name ,  rating ,  age FROM Sailors ORDER BY rating ,  age
SELECT count(*) FROM Boats
SELECT count(*) FROM Boats
SELECT count(*) FROM BOATS WHERE color  =  'red'
SELECT count(*) FROM BOATS WHERE color  =  'red'
SELECT T3.name FROM Reserves AS T1 JOIN Sailors AS T2 ON T1.sid  =  T2.sid JOIN Boats AS T3 ON T1.bid  =  T3.bid WHERE T2.age BETWEEN 20 AND 30
SELECT T3.name FROM Reserves AS T1 JOIN Sailors AS T2 ON T1.sid  =  T2.sid JOIN Boats AS T3 ON T1.bid  =  T3.bid WHERE T2.age BETWEEN 20 AND 30
SELECT T1.name FROM Sailors AS T1 JOIN reserves AS T2 ON T1.sid  =  T2.sid JOIN boats AS T3 ON T3.bid  =  T2.bid WHERE T1.rating  >  (SELECT max(T1.rating) FROM Sailors AS T1 JOIN reserves AS T2 ON T1.sid  =  T2.sid JOIN boats AS T3 ON T3.bid  =  T2.bid WHERE T3.color  =  'red')
SELECT T2.name FROM reserves AS T1 JOIN sailors AS T2 ON T1.sid  =  T2.sid JOIN boats AS T3 ON T1.bid  =  T3.bid WHERE T3.color  =  'red' INTERSECT SELECT name FROM sailors WHERE rating  >  (SELECT max(rating) FROM sailors AS T2 JOIN reserves AS T1 ON T2.sid  =  T1.sid JOIN boats AS T3 ON T1.bid  =  T3.bid WHERE T3.color  =  'red')
SELECT max(rating) FROM Sailors
SELECT max(rating) FROM Sailors
SELECT T3.name FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid JOIN Sailors AS T3 ON T1.sid  =  T3.sid WHERE T2.name  =  'Melon'
SELECT T3.name FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid JOIN Sailors AS T3 ON T1.sid  =  T3.sid WHERE T2.name  =  'Melon'
SELECT name ,  age FROM Sailors ORDER BY rating DESC
SELECT name ,  age FROM Sailors ORDER BY rating DESC
SELECT Model FROM headphone ORDER BY Price DESC LIMIT 1
SELECT Model FROM headphone ORDER BY Price DESC LIMIT 1
SELECT DISTINCT Model FROM headphone ORDER BY Model
SELECT DISTINCT Model FROM headphone ORDER BY Model
SELECT CLASS FROM headphone GROUP BY CLASS ORDER BY count(*) DESC LIMIT 1
SELECT CLASS FROM headphone GROUP BY CLASS ORDER BY count(*) DESC LIMIT 1
SELECT CLASS FROM headphone GROUP BY CLASS HAVING count(*)  >  2
SELECT CLASS FROM headphone GROUP BY CLASS HAVING count(*)  <=  2
SELECT count(*) ,  CLASS FROM headphone WHERE price  >  200 GROUP BY CLASS
SELECT count(*) ,  CLASS FROM headphone WHERE Price  >  200 GROUP BY CLASS
SELECT count(DISTINCT earpads) FROM headphone
SELECT count(DISTINCT earpads) FROM headphone
SELECT Earpads FROM headphone GROUP BY Earpads ORDER BY COUNT(*) DESC LIMIT 2
SELECT earpads FROM headphone GROUP BY earpads ORDER BY count(*) DESC LIMIT 2
SELECT Model ,  CLASS ,  Construction FROM headphone ORDER BY price ASC LIMIT 1
SELECT Model ,  CLASS ,  Construction FROM headphone ORDER BY price ASC LIMIT 1
SELECT avg(Price) ,  Construction FROM headphone GROUP BY Construction
SELECT avg(Price) ,  Construction FROM headphone GROUP BY Construction
SELECT CLASS FROM headphone WHERE earpads  =  "Bowls" INTERSECT SELECT CLASS FROM headphone WHERE earpads  =  "Comfort Pads"
SELECT CLASS FROM headphone WHERE earpads  =  "Bowls" INTERSECT SELECT CLASS FROM headphone WHERE earpads  =  "Comfort Pads"
SELECT Earpads FROM headphone EXCEPT SELECT Earpads FROM headphone WHERE Construction  =  'Plastic'
SELECT Earpads FROM headphone WHERE Construction != 'Plastic'
SELECT Model FROM headphone WHERE Price  <  (SELECT avg(Price) FROM headphone)
SELECT Model FROM headphone WHERE Price  <  (SELECT avg(Price) FROM headphone)
SELECT Name FROM store ORDER BY Date_Opened
SELECT Name FROM store ORDER BY Date_Opened
SELECT name ,  parking FROM store WHERE neighborhood  =  'Tarzana'
SELECT Name ,  Parking FROM store WHERE Neighborhood  =  "Tarzana"
SELECT count(DISTINCT neighborhood) FROM store
SELECT count(DISTINCT neighborhood) FROM store
SELECT Neighborhood ,  COUNT(*) FROM store GROUP BY Neighborhood
SELECT Neighborhood ,  COUNT(*) FROM store GROUP BY Neighborhood
SELECT T2.Name ,  count(*) FROM stock AS T1 JOIN store AS T2 ON T1.Store_ID  =  T2.Store_ID GROUP BY T1.Store_ID ORDER BY count(*) DESC LIMIT 1
SELECT T3.Name ,  SUM(T2.quantity) FROM stock AS T1 JOIN headphone AS T2 ON T1.headphone_id  =  T2.headphone_id JOIN store AS T3 ON T1.store_id  =  T3.store_id GROUP BY T3.Name
SELECT Name FROM store WHERE Store_ID NOT IN (SELECT Store_ID FROM stock)
SELECT Name FROM store WHERE Store_ID NOT IN (SELECT Store_ID FROM stock)
SELECT Model FROM headphone WHERE headphone_id NOT IN (SELECT Headphone_ID FROM stock)
SELECT Model FROM headphone WHERE headphone_id NOT IN (SELECT Headphone_ID FROM stock)
SELECT T2.Model FROM stock AS T1 JOIN headphone AS T2 ON T1.Headphone_ID  =  T2.Headphone_ID GROUP BY T1.Headphone_ID ORDER BY sum(T1.quantity) DESC LIMIT 1
SELECT T2.Model FROM stock AS T1 JOIN headphone AS T2 ON T1.Headphone_ID  =  T2.Headphone_ID GROUP BY T2.Model ORDER BY sum(T1.quantity) DESC LIMIT 1
SELECT sum(t1.quantity) FROM stock AS t1 JOIN store AS t2 ON t1.store_id  =  t2.store_id WHERE t2.name  =  "Woodman"
SELECT sum(T2.quantity) FROM store AS T1 JOIN stock AS T2 ON T1.store_id = T2.store_id WHERE T1.name = "Woodman"
SELECT Neighborhood FROM store WHERE Neighborhood NOT IN (SELECT Neighborhood FROM store JOIN stock ON store.Store_ID  =  stock.Store_ID)
SELECT Neighborhood FROM store WHERE Store_ID NOT IN (SELECT Store_ID FROM stock)
SELECT count(*) FROM AUTHOR
SELECT count(*) FROM AUTHOR
SELECT count(*) FROM paper;
SELECT count(*) FROM paper;
SELECT count(*) FROM affiliation
SELECT count(*) FROM affiliation
SELECT DISTINCT COUNT ( DISTINCT t1.paper_id ) FROM paper AS t1 JOIN citation AS t2 ON t1.paper_id  =  t2.cited_paper_id WHERE t1.year  =  2000 AND t1.venue  =  "NAACL";
SELECT COUNT ( DISTINCT paper_id ) FROM paper WHERE venue  =  "NAACL" AND YEAR  =  2000;
SELECT COUNT ( DISTINCT t3.paper_id ) FROM affiliation AS t1 JOIN author_list AS t2 ON t1.affiliation_id  =  t2.affiliation_id JOIN paper AS t3 ON t3.paper_id  =  t2.paper_id WHERE t1.name  =  "Columbia University" AND t3.year  =  2009;
SELECT COUNT ( DISTINCT t3.paper_id ) FROM affiliation AS t1 JOIN author_list AS t2 ON t1.affiliation_id  =  t2.affiliation_id JOIN paper AS t3 ON t3.paper_id  =  t2.paper_id WHERE t1.name  =  "Columbia University" AND t3.year  =  2009;
SELECT name ,  address FROM Affiliation
SELECT name ,  address FROM Affiliation
SELECT venue ,  YEAR FROM paper ORDER BY YEAR
SELECT DISTINCT venue FROM paper ORDER BY YEAR ASC
SELECT t2.title ,  t2.paper_id FROM affiliation AS t1 JOIN author_list AS t2 ON t1.affiliation_id  =  t2.affiliation_id WHERE t1.name  =  "Harvard University"
SELECT t3.title ,  t3.paper_id FROM affiliation AS t1 JOIN author_list AS t2 ON t1.affiliation_id  =  t2.affiliation_id JOIN paper AS t3 ON t3.paper_id  =  t2.paper_id WHERE t1.name  =  "Harvard University";
SELECT DISTINCT t2.title ,  t1.paper_id FROM author_list AS t3 JOIN paper AS t2 ON t3.paper_id  =  t2.paper_id JOIN author AS t1 ON t1.author_id  =  t3.author_id WHERE t1.name  =  "Mckeown";
SELECT t2.title ,  t2.paper_id FROM author AS t1 JOIN author_list AS t2 ON t1.author_id  =  t2.author_id WHERE t1.name  =  "Mckeown";
SELECT DISTINCT t3.paper_id FROM affiliation AS t1 JOIN author_list AS t2 ON t1.affiliation_id  =  t2.affiliation_id JOIN paper AS t3 ON t3.paper_id  =  t2.paper_id WHERE t1.name  =  "Stanford University" INTERSECT SELECT DISTINCT t3.paper_id FROM affiliation AS t1 JOIN author_list AS t2 ON t1.affiliation_id  =  t2.affiliation_id JOIN paper AS t3 ON t3.paper_id  =  t2.paper_id WHERE t1.name  =  "Columbia University"
SELECT t3.title ,  t3.paper_id FROM affiliation AS t1 JOIN author_list AS t2 ON t1.affiliation_id  =  t2.affiliation_id JOIN paper AS t3 ON t3.paper_id  =  t2.paper_id WHERE t1.name  =  "Stanford University" INTERSECT SELECT t3.title ,  t3.paper_id FROM affiliation AS t1 JOIN author_list AS t2 ON t1.affiliation_id  =  t2.affiliation_id JOIN paper AS t3 ON t3.paper_id  =  t2.paper_id WHERE t1.name  =  "Columbia University"
SELECT DISTINCT t3.title ,  t3.paper_id FROM author AS t1 JOIN author_list AS t2 ON t1.author_id  =  t2.author_id JOIN paper AS t3 ON t3.paper_id  =  t2.paper_id WHERE t1.name  =  "Mckeown , Kathleen" INTERSECT SELECT DISTINCT t3.title ,  t3.paper_id FROM author AS t1 JOIN author_list AS t2 ON t1.author_id  =  t2.author_id JOIN paper AS t3 ON t3.paper_id  =  t2.paper_id WHERE t1.name  =  "Rambow , Owen"
SELECT DISTINCT t3.title ,  t3.paper_id FROM author AS t1 JOIN author_list AS t2 ON t1.author_id  =  t2.author_id JOIN paper AS t3 ON t3.paper_id  =  t2.paper_id WHERE t1.name  =  "Mckeown , Kathleen" AND t1.name  =  "Rambow , Owen";
SELECT DISTINCT t3.title ,  t3.paper_id FROM author_list AS t2 JOIN author AS t1 ON t2.author_id  =  t1.author_id JOIN paper AS t3 ON t3.paper_id  =  t2.paper_id WHERE t1.name  =  "Mckeown" EXCEPT SELECT DISTINCT t3.title ,  t3.paper_id FROM author_list AS t2 JOIN author AS t1 ON t2.author_id  =  t1.author_id JOIN paper AS t3 ON t3.paper_id  =  t2.paper_id WHERE t1.name  =  "Rambow"
SELECT DISTINCT t3.title ,  t3.paper_id FROM author_list AS t2 JOIN author AS t1 ON t2.author_id  =  t1.author_id JOIN paper AS t3 ON t3.paper_id  =  t2.paper_id WHERE t1.name  =  "Mckeown" EXCEPT SELECT DISTINCT t3.title ,  t3.paper_id FROM author_list AS t2 JOIN author AS t1 ON t2.author_id  =  t1.author_id JOIN paper AS t3 ON t3.paper_id  =  t2.paper_id WHERE t1.name  =  "Rambow"
SELECT DISTINCT t3.title ,  t3.paper_id FROM author AS t1 JOIN author_list AS t2 ON t1.author_id  =  t2.author_id JOIN paper AS t3 ON t3.paper_id  =  t2.paper_id WHERE t1.name  =  "Mckeown , Kathleen" OR t1.name  =  "Rambow , Owen"
SELECT DISTINCT t3.title ,  t1.paper_id FROM author_list AS t2 JOIN author AS t5 ON t2.author_id  =  t5.author_id JOIN paper_list AS t4 ON t4.paper_id  =  t2.paper_id JOIN paper AS t3 ON t3.paper_id  =  t4.paper_id WHERE t5.name  =  "Mckeown ,  Kathleen" OR t5.name  =  "Rambow ,  Owen"
SELECT t1.name ,  COUNT(*) FROM Author AS t1 JOIN author_list AS t2 ON t1.author_id  =  t2.author_id GROUP BY t1.author_id ORDER BY COUNT ( DISTINCT t2.paper_id ) DESC;
SELECT COUNT ( DISTINCT t2.paper_id )  ,  t1.author_id FROM Author AS t1 JOIN Author_list AS t2 ON t1.author_id  =  t2.author_id GROUP BY t1.author_id ORDER BY COUNT ( DISTINCT t2.paper_id ) ASC;
SELECT t1.name FROM affiliation AS t1 JOIN author_list AS t2 ON t1.affiliation_id  =  t2.affiliation_id GROUP BY t1.affiliation_id ORDER BY COUNT ( DISTINCT t2.paper_id ) ASC;
SELECT t1.name FROM affiliation AS t1 JOIN author_list AS t2 ON t1.affiliation_id  =  t2.affiliation_id GROUP BY t1.affiliation_id ORDER BY COUNT ( DISTINCT t2.paper_id ) DESC;
SELECT t1.name FROM author AS t1 JOIN author_list AS t2 ON t1.author_id  =  t2.author_id GROUP BY t1.author_id HAVING COUNT ( DISTINCT t2.paper_id )  >  50;
SELECT t1.name FROM author AS t1 JOIN author_list AS t2 ON t1.author_id  =  t2.author_id GROUP BY t1.author_id HAVING COUNT ( DISTINCT t2.paper_id )  >  50;
SELECT t1.name FROM author AS t1 JOIN author_list AS t2 ON t1.author_id  =  t2.author_id JOIN paper AS t3 ON t3.paper_id  =  t2.paper_id GROUP BY t1.author_id HAVING count(t3.paper_id)  =  1;
SELECT t1.name FROM author AS t1 JOIN author_list AS t2 ON t1.author_id  =  t2.author_id JOIN paper AS t3 ON t3.paper_id  =  t2.paper_id GROUP BY t1.author_id HAVING count(t3.paper_id)  =  1;
SELECT venue ,  YEAR FROM Paper GROUP BY venue ,  YEAR ORDER BY count(*) DESC LIMIT 1;
SELECT venue ,  YEAR FROM Paper GROUP BY YEAR ORDER BY COUNT(*) DESC LIMIT 1;
SELECT venue FROM paper GROUP BY venue ORDER BY COUNT(*) ASC LIMIT 1;
SELECT venue FROM paper GROUP BY venue ORDER BY COUNT(*) ASC LIMIT 1;
SELECT COUNT ( DISTINCT t2.paper_id ) FROM citation AS t2 JOIN paper AS t1 ON t2.cited_paper_id  =  t1.paper_id WHERE t1.paper_id  =  A00-1002;
SELECT COUNT ( DISTINCT paper_id ) FROM citation WHERE cited_paper_id  =  A00-1002;
SELECT COUNT ( DISTINCT t2.cited_paper_id ) FROM citation AS t2 JOIN paper AS t1 ON t2.paper_id  =  t1.paper_id WHERE t1.paper_id  =  D12-1027;
SELECT COUNT ( DISTINCT cited_paper_id ) FROM citation WHERE paper_id  =  D12-1027;
SELECT t1.cited_paper_id ,  COUNT(*) FROM citation AS t1 GROUP BY t1.cited_paper_id ORDER BY COUNT ( DISTINCT t1.paper_id ) DESC LIMIT 1;
SELECT t1.cited_paper_id ,  COUNT(*) FROM citation AS t1 JOIN paper AS t2 ON t1.cited_paper_id  =  t2.paper_id GROUP BY t1.cited_paper_id ORDER BY COUNT(*) DESC LIMIT 1;
SELECT t3.title FROM citation AS t2 JOIN paper AS t3 ON t2.cited_paper_id  =  t3.paper_id GROUP BY t2.cited_paper_id ORDER BY COUNT ( DISTINCT t2.cited_paper_id ) DESC LIMIT 1;
SELECT t3.title FROM citation AS t2 JOIN paper AS t3 ON t2.cited_paper_id  =  t3.paper_id GROUP BY t2.cited_paper_id ORDER BY COUNT ( DISTINCT t2.paper_id ) DESC LIMIT 1;
SELECT t2.cited_paper_id  ,  COUNT(*) FROM citation AS t1 JOIN paper AS t2 ON t1.cited_paper_id  =  t2.paper_id GROUP BY t1.cited_paper_id ORDER BY COUNT(*) DESC LIMIT 10;
SELECT t2.cited_paper_id ,  COUNT(*) FROM citation AS t1 JOIN paper AS t2 ON t1.cited_paper_id  =  t2.paper_id GROUP BY t1.cited_paper_id ORDER BY COUNT(*) DESC LIMIT 10;
SELECT COUNT ( DISTINCT t4.cited_paper_id ) FROM affiliation AS t1 JOIN author AS t2 ON t1.affiliation_id  =  t2.author_id JOIN author_list AS t3 ON t3.author_id  =  t2.author_id JOIN citation AS t4 ON t4.cited_paper_id  =  t3.paper_id WHERE t2.name  =  "Mckeown , Kathleen";
SELECT COUNT ( DISTINCT t4.cited_paper_id ) FROM citation AS t4 JOIN paper AS t2 ON t4.cited_paper_id  =  t2.paper_id JOIN author_list AS t1 ON t4.paper_id  =  t1.paper_id JOIN author AS t3 ON t1.author_id  =  t3.author_id WHERE t3.name  =  "Mckeown , Kathleen";
SELECT COUNT ( DISTINCT t2.cited_paper_id ) FROM citation AS t2 JOIN author_list AS t1 ON t2.cited_paper_id  =  t1.paper_id JOIN author AS t3 ON t3.author_id  =  t1.author_id WHERE t3.name  =  "Mckeown , Kathleen";
SELECT COUNT ( DISTINCT t2.cited_paper_id ) FROM citation AS t2 JOIN author AS t1 ON t2.cited_paper_id  =  t1.paper_id WHERE t1.name  =  "Mckeown , Kathleen";
SELECT t2.name ,  COUNT(t3.cited_paper_id) FROM author_list AS t1 JOIN author AS t2 ON t1.author_id  =  t2.author_id JOIN citation AS t3 ON t3.paper_id  =  t1.paper_id GROUP BY t2.name ORDER BY COUNT(t3.cited_paper_id) DESC LIMIT 1;
SELECT t1.name ,  COUNT(DISTINCT t3.cited_paper_id) FROM author AS t1 JOIN author_list AS t2 ON t1.author_id  =  t2.author_id JOIN citation AS t3 ON t2.paper_id  =  t3.cited_paper_id GROUP BY t1.author_id ORDER BY COUNT(DISTINCT t3.cited_paper_id) DESC LIMIT 1;
SELECT DISTINCT t3.venue ,  t3.year FROM author AS t1 JOIN author_list AS t2 ON t1.author_id  =  t2.author_id JOIN paper AS t3 ON t3.paper_id  =  t2.paper_id WHERE t1.name  =  "Mckeown , Kathleen";
SELECT DISTINCT t3.venue ,  t3.year FROM author AS t1 JOIN author_list AS t2 ON t1.author_id  =  t2.author_id JOIN paper AS t3 ON t3.paper_id  =  t2.paper_id WHERE t1.name  =  "Mckeown , Kathleen";
SELECT t3.venue ,  t3.year FROM affiliation AS t1 JOIN author_list AS t2 ON t1.affiliation_id  =  t2.affiliation_id JOIN paper AS t3 ON t2.paper_id  =  t3.paper_id WHERE t1.name  =  "Columbia University";
SELECT DISTINCT T3.venue ,  T3.year FROM affiliation AS T1 JOIN author_list AS T2 ON T1.affiliation_id  =  T2.affiliation_id JOIN paper AS T3 ON T2.paper_id  =  T3.paper_id WHERE T1.name  =  "Columbia University";
SELECT t1.name FROM author AS t1 JOIN author_list AS t2 ON t1.author_id  =  t2.author_id JOIN paper AS t3 ON t3.paper_id  =  t2.paper_id WHERE t3.year  =  2009 GROUP BY t1.author_id ORDER BY COUNT ( DISTINCT t3.paper_id ) DESC LIMIT 1;
SELECT t1.name FROM author AS t1 JOIN author_list AS t2 ON t1.author_id  =  t2.author_id JOIN paper AS t3 ON t3.paper_id  =  t2.paper_id WHERE t3.year  =  2009 GROUP BY t1.author_id ORDER BY COUNT ( DISTINCT t3.paper_id ) DESC LIMIT 1;
SELECT t1.name FROM affiliation AS t1 JOIN author_list AS t2 ON t1.affiliation_id  =  t2.affiliation_id JOIN paper AS t3 ON t3.paper_id  =  t2.paper_id WHERE t3.year  =  2009 GROUP BY t1.affiliation_id ORDER BY COUNT ( DISTINCT t3.paper_id ) DESC LIMIT 3;
SELECT T1.name FROM affiliation AS T1 JOIN author_list AS T2 ON T1.affiliation_id  =  T2.affiliation_id JOIN paper AS T3 ON T3.paper_id  =  T2.paper_id WHERE T3.year  =  2009 GROUP BY T1.affiliation_id ORDER BY COUNT ( DISTINCT T3.paper_id ) DESC LIMIT 3;
SELECT DISTINCT COUNT ( DISTINCT t3.paper_id ) FROM affiliation AS t1 JOIN author_list AS t2 ON t1.affiliation_id  =  t2.affiliation_id JOIN paper AS t3 ON t3.paper_id  =  t2.paper_id WHERE t1.name  =  "Columbia University" AND t3.year  <=  2009;
SELECT DISTINCT COUNT ( DISTINCT t3.paper_id ) FROM affiliation AS t1 JOIN author_list AS t2 ON t1.affiliation_id  =  t2.affiliation_id JOIN paper AS t3 ON t3.paper_id  =  t2.paper_id WHERE t1.name  =  "Columbia University" AND t3.year  <=  2009;
SELECT COUNT ( DISTINCT t3.paper_id ) FROM affiliation AS t1 JOIN author_list AS t2 ON t1.affiliation_id  =  t2.affiliation_id JOIN paper AS t3 ON t3.paper_id  =  t2.paper_id WHERE t1.name  =  "Stanford University" AND t3.year  >=  2000 AND t3.year  <=  2009;
SELECT COUNT ( DISTINCT t3.paper_id ) FROM affiliation AS t1 JOIN author_list AS t2 ON t1.affiliation_id  =  t2.affiliation_id JOIN paper AS t3 ON t3.paper_id  =  t2.paper_id WHERE t1.name  =  "Stanford University" AND t3.year  >=  2000 AND t3.year  <=  2009;
SELECT t1.title FROM paper AS t1 JOIN author_list AS t2 ON t1.paper_id  =  t2.paper_id GROUP BY t1.paper_id ORDER BY COUNT ( DISTINCT t2.author_id ) DESC LIMIT 1;
SELECT t1.title FROM paper AS t1 JOIN author_list AS t2 ON t1.paper_id  =  t2.paper_id GROUP BY t1.paper_id ORDER BY COUNT ( t2.author_id ) DESC LIMIT 1;
SELECT COUNT ( DISTINCT T1.name ) FROM author AS T1 JOIN author_list AS T2 ON T1.author_id  =  T2.author_id JOIN paper AS T3 ON T3.paper_id  =  T2.paper_id JOIN citation AS T4 ON T4.paper_id  =  T3.paper_id JOIN author_list AS T5 ON T5.paper_id  =  T4.cited_paper_id JOIN author AS T6 ON T6.author_id  =  T5.author_id WHERE T1.name  =  "Mckeown , Kathleen";
SELECT COUNT ( DISTINCT T2.name ) FROM author AS T1 JOIN author_list AS T2 ON T1.author_id  =  T2.author_id JOIN paper AS T3 ON T3.paper_id  =  T2.paper_id WHERE T1.name  =  "Mckeown , Kathleen";
SELECT t2.name FROM author_list AS t4 JOIN author AS t2 ON t4.author_id  =  t2.author_id JOIN paper AS t1 ON t1.paper_id  =  t4.paper_id WHERE t2.name  =  "Mckeown , Kathleen" GROUP BY t2.name ORDER BY COUNT ( DISTINCT t1.paper_id ) DESC LIMIT 1;
SELECT t2.name FROM author_list AS t3 JOIN author AS t2 ON t3.author_id  =  t2.author_id JOIN paper AS t1 ON t1.paper_id  =  t3.paper_id WHERE t2.name  =  "Mckeown , Kathleen" GROUP BY t2.name ORDER BY COUNT ( DISTINCT t1.title ) DESC LIMIT 1;
SELECT paper_id FROM paper WHERE title LIKE "%translation%"
SELECT paper_id FROM paper WHERE title LIKE "%translation%"
SELECT paper_id ,  title FROM paper WHERE paper_id NOT IN ( SELECT paper_id FROM citation )
SELECT paper_id ,  title FROM paper WHERE paper_id NOT IN (SELECT paper_id FROM citation)
SELECT t1.name FROM affiliation AS t1 JOIN author_list AS t2 ON t1.affiliation_id  =  t2.affiliation_id WHERE t1.address LIKE "%China%" GROUP BY t1.affiliation_id ORDER BY COUNT ( DISTINCT t2.paper_id ) DESC LIMIT 1;
SELECT T2.name FROM affiliation_list AS T1 JOIN affiliation AS T2 ON T1.affiliation_id  =  T2.affiliation_id WHERE T2.address LIKE "%China%" GROUP BY T1.affiliation_id ORDER BY COUNT(*) DESC LIMIT 1;
SELECT COUNT ( DISTINCT title )  ,  venue ,  YEAR FROM Paper GROUP BY venue ,  YEAR ORDER BY YEAR DESC END
SELECT venue ,  YEAR ,  COUNT(*) FROM Paper GROUP BY venue ,  YEAR
SELECT count(*) ,  T1.affiliation_id FROM affiliation AS T1 JOIN author_list AS T2 ON T1.affiliation_id  =  T2.affiliation_id GROUP BY T1.affiliation_id
SELECT T2.name ,  COUNT(*) FROM affiliation_list AS T1 JOIN affiliation AS T2 ON T1.affiliation_id  =  T2.affiliation_id GROUP BY T2.affiliation_id
SELECT t3.title FROM citation AS t2 JOIN paper AS t3 ON t2.cited_paper_id  =  t3.paper_id GROUP BY t2.cited_paper_id HAVING COUNT ( DISTINCT t2.cited_paper_id )  >  50;
SELECT t2.title FROM citation AS t1 JOIN paper AS t2 ON t1.cited_paper_id  =  t2.paper_id GROUP BY t1.cited_paper_id HAVING COUNT ( DISTINCT t1.paper_id )  >  50;
SELECT DISTINCT COUNT ( t2.author_id ) FROM citation AS t1 JOIN author_list AS t2 ON t1.cited_paper_id  =  t2.paper_id WHERE COUNT ( DISTINCT t1.paper_id )  >  50;
SELECT DISTINCT COUNT ( t2.author_id ) FROM citation AS t1 JOIN author_list AS t2 ON t1.cited_paper_id  =  t2.paper_id WHERE COUNT ( DISTINCT t1.paper_id )  >  50;
SELECT T1.name FROM author AS T1 JOIN author_list AS T2 ON T1.author_id  =  T2.author_id JOIN paper AS T3 ON T3.paper_id  =  T2.paper_id WHERE T3.year  =  2009 AND T3.venue  =  "NAACL" INTERSECT SELECT T1.name FROM author AS T1 JOIN author_list AS T2 ON T1.author_id  =  T2.author_id JOIN paper AS T3 ON T3.paper_id  =  T2.paper_id WHERE T3.year  =  2009 AND T3.venue  =  "ACL"
SELECT t1.name FROM author AS t1 JOIN author_list AS t2 ON t1.author_id  =  t2.author_id JOIN paper AS t3 ON t3.paper_id  =  t2.paper_id WHERE t3.year  =  2009 AND t3.venue  =  "NAACL" INTERSECT SELECT t1.name FROM author AS t1 JOIN author_list AS t2 ON t1.author_id  =  t2.author_id JOIN paper AS t3 ON t3.paper_id  =  t2.paper_id WHERE t3.year  =  2009 AND t3.venue  =  "ACL"
SELECT name FROM author WHERE author_id NOT IN (SELECT T1.author_id FROM Paper AS T2 JOIN Author_list AS T1 ON T2.paper_id  =  T1.paper_id WHERE venue  =  "ACL")
SELECT name FROM author WHERE author_id NOT IN (SELECT T1.author_id FROM Paper AS T2 JOIN Author_list AS T1 ON T2.paper_id  =  T1.paper_id WHERE venue  =  "ACL")
SELECT count(*) FROM conference
SELECT count(*) FROM conference
SELECT DISTINCT Conference_Name FROM conference
SELECT DISTINCT Conference_Name FROM conference
SELECT Conference_Name ,  YEAR ,  LOCATION FROM conference
SELECT Conference_Name ,  YEAR ,  LOCATION FROM conference
SELECT Conference_Name ,  COUNT(*) FROM conference GROUP BY Conference_Name
SELECT Conference_Name ,  COUNT(*) FROM conference GROUP BY Conference_Name
SELECT YEAR ,  count(*) FROM conference GROUP BY YEAR
SELECT count(*) FROM conference GROUP BY YEAR
SELECT YEAR FROM conference GROUP BY YEAR ORDER BY count(*) ASC LIMIT 1
SELECT YEAR FROM conference GROUP BY YEAR ORDER BY count(*) ASC LIMIT 1
SELECT LOCATION FROM conference GROUP BY LOCATION HAVING COUNT(*)  >=  2
SELECT LOCATION FROM conference GROUP BY LOCATION HAVING COUNT(*)  >=  2
SELECT Institution_Name ,  LOCATION ,  founded FROM institution
SELECT Institution_Name ,  LOCATION ,  Founded FROM institution
SELECT count(*) FROM institution WHERE founded BETWEEN 1850 AND 1900
SELECT count(*) FROM institution WHERE founded BETWEEN 1850 AND 1900
SELECT Institution_Name ,  LOCATION FROM institution ORDER BY founded DESC LIMIT 1
SELECT Institution_Name ,  LOCATION FROM institution ORDER BY founded DESC LIMIT 1
SELECT Institution_Name ,  COUNT(*) FROM institution WHERE founded  >  1800 GROUP BY Institution_Name
SELECT T1.Institution_Name ,  T2.name FROM institution AS T1 JOIN staff AS T2 ON T1.institution_id  =  T2.institution_id WHERE T1.founded  >  1800
SELECT Institution_Name FROM institution WHERE Institution_ID NOT IN (SELECT Institution_ID FROM staff)
SELECT Institution_Name FROM institution WHERE institution_ID NOT IN (SELECT Institution_ID FROM staff)
SELECT name FROM staff WHERE age  >  (SELECT avg(age) FROM staff)
SELECT name FROM staff WHERE age  >  (SELECT avg(age) FROM staff)
SELECT max(Age) ,  min(Age) FROM staff WHERE Nationality  =  "United States"
SELECT max(Age) ,  min(Age) FROM staff
SELECT T3.Conference_Name FROM staff AS T1 JOIN conference_participation AS T2 ON T1.staff_ID  =  T2.staff_ID JOIN conference AS T3 ON T2.Conference_ID  =  T3.Conference_ID WHERE T1.Nationality  =  "Canada"
SELECT T3.Conference_Name FROM conference_participation AS T1 JOIN staff AS T2 ON T1.staff_ID  =  T2.staff_ID JOIN conference AS T3 ON T1.Conference_ID  =  T3.Conference_ID WHERE T2.Nationality  =  "Canada"
SELECT T1.name FROM staff AS T1 JOIN conference_participation AS T2 ON T1.staff_ID  =  T2.staff_ID WHERE T2.role  =  'Speaker' INTERSECT SELECT T1.name FROM staff AS T1 JOIN conference_participation AS T2 ON T1.staff_ID  =  T2.staff_ID WHERE T2.role  =  'Sponsor'
SELECT T1.name FROM staff AS T1 JOIN conference_participation AS T2 ON T1.staff_id  =  T2.staff_id WHERE T2.role  =  'Speaker' INTERSECT SELECT T1.name FROM staff AS T1 JOIN conference_participation AS T2 ON T1.staff_id  =  T2.staff_id WHERE T2.role  =  'Sponsor'
SELECT T1.name FROM staff AS T1 JOIN conference_participation AS T2 ON T1.staff_ID  =  T2.staff_ID WHERE T2.role  =  'ACL' INTERSECT SELECT T1.name FROM staff AS T1 JOIN conference_participation AS T2 ON T1.staff_ID  =  T2.staff_ID WHERE T2.role  =  'Naccl'
SELECT T1.name FROM staff AS T1 JOIN conference_participation AS T2 ON T1.staff_ID  =  T2.staff_ID JOIN conference AS T3 ON T2.Conference_ID  =  T3.Conference_ID WHERE T3.Conference_Name  =  'ACL' INTERSECT SELECT T1.name FROM staff AS T1 JOIN conference_participation AS T2 ON T1.staff_ID  =  T2.staff_ID JOIN conference AS T3 ON T2.Conference_ID  =  T3.Conference_ID WHERE T3.Conference_Name  =  'NACCL'
SELECT T1.name FROM staff AS T1 JOIN conference_participation AS T2 ON T1.staff_ID  =  T2.staff_ID JOIN conference AS T3 ON T2.Conference_ID  =  T3.Conference_ID WHERE T3.Year  =  2003 OR T3.Year  =  2004
SELECT T1.name FROM staff AS T1 JOIN conference_participation AS T2 ON T1.staff_ID  =  T2.staff_ID JOIN conference AS T3 ON T2.Conference_ID  =  T3.Conference_ID WHERE T3.year  =  2003 OR T3.year  =  2004
SELECT T3.Conference_Name ,  T3.year ,  COUNT(*) FROM conference_participation AS T1 JOIN staff AS T2 ON T1.staff_ID  =  T2.staff_ID JOIN conference AS T3 ON T1.Conference_ID  =  T3.Conference_ID GROUP BY T1.Conference_ID
SELECT T1.Conference_Name ,  T1.year ,  COUNT(*) FROM conference AS T1 JOIN conference_participation AS T2 ON T1.Conference_ID  =  T2.Conference_ID GROUP BY T1.Conference_ID
SELECT T1.Conference_Name FROM conference AS T1 JOIN conference_participation AS T2 ON T1.Conference_ID  =  T2.Conference_ID GROUP BY T1.Conference_Name ORDER BY COUNT(*) DESC LIMIT 2
SELECT T1.Conference_Name FROM conference AS T1 JOIN conference_participation AS T2 ON T1.Conference_ID  =  T2.Conference_ID GROUP BY T1.Conference_ID ORDER BY COUNT(*) DESC LIMIT 2
SELECT name ,  nationality FROM staff WHERE staff_id NOT IN (SELECT staff_id FROM conference_participation WHERE role  =  'ACL')
SELECT name ,  nationality FROM staff WHERE staff_id NOT IN (SELECT staff_id FROM conference_participation WHERE role  =  'ACL')
SELECT institution_name ,  LOCATION FROM institution WHERE institution_id NOT IN (SELECT institution_id FROM conference_participation WHERE conference_id IN (SELECT conference_id FROM conference WHERE YEAR  =  2004))
SELECT institution_name ,  LOCATION FROM institution WHERE institution_id NOT IN (SELECT institution_id FROM conference_participation WHERE conference_id IN (SELECT conference_id FROM conference WHERE YEAR  =  2004))
SELECT pilot_name FROM PilotSkills ORDER BY age DESC LIMIT 1
SELECT pilot_name FROM PilotSkills ORDER BY age DESC LIMIT 1
SELECT pilot_name FROM PilotSkills WHERE age  <  (SELECT avg(age) FROM PilotSkills) ORDER BY age
SELECT pilot_name FROM PilotSkills ORDER BY age ASC
SELECT * FROM PilotSkills WHERE age  <  30
SELECT * FROM PilotSkills WHERE age  <  30
SELECT pilot_name FROM pilotskills WHERE plane_name  =  'Piper Cub' AND age  <  35
SELECT pilot_name FROM pilotskills WHERE age  <  35 AND plane_name  =  'Piper Cub'
SELECT location FROM Hangar WHERE plane_name  =  "F-14 Fighter"
SELECT T2.location FROM Hangar AS T1 JOIN PilotSkills AS T2 ON T1.plane_name  =  T2.plane_name WHERE T2.plane_name  =  'F-14 Fighter'
SELECT count(DISTINCT location) FROM Hangar
SELECT count(DISTINCT location) FROM Hangar
SELECT plane_name FROM PilotSkills WHERE pilot_name  =  'Jones' AND age  =  32
SELECT T2.plane_name FROM PilotSkills AS T1 JOIN Hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T1.pilot_name  =  'Jones' AND T1.age  =  32
SELECT count(*) FROM PilotSkills WHERE age  >  40
SELECT count(*) FROM PilotSkills WHERE age  >  40
SELECT count(*) FROM pilotskills AS T1 JOIN hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T2.plane_name  =  'B-52 Bomber' AND T1.age  <  35
SELECT count(*) FROM pilotskills WHERE plane_name  =  'B-52 Bomber' AND age  <  35
SELECT pilot_name FROM pilotskills WHERE plane_name  =  'Piper Cub' ORDER BY age LIMIT 1
SELECT pilot_name FROM pilot_skills WHERE plane_name  =  'Piper Cub' ORDER BY age LIMIT 1
SELECT plane_name FROM PilotSkills GROUP BY plane_name ORDER BY count(*) DESC LIMIT 1
SELECT plane_name FROM PilotSkills GROUP BY plane_name ORDER BY count(*) DESC LIMIT 1
SELECT plane_name FROM Hangar GROUP BY plane_name ORDER BY count(*) ASC LIMIT 1
SELECT plane_name FROM pilot_skills GROUP BY plane_name ORDER BY count(*) LIMIT 1
SELECT count(DISTINCT pilot_name) FROM pilotskills AS T1 JOIN hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T2.location  =  'Chicago'
SELECT count(*) FROM hangar WHERE LOCATION  =  'Chicago'
SELECT T2.plane_name FROM PilotSkills AS T1 JOIN Hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T1.pilot_name  =  "Smith" AND T1.age  =  41
SELECT plane_name FROM pilot_skills WHERE pilot_name  =  'Smith' AND age  =  41
SELECT count(DISTINCT plane_name) FROM PilotSkills
SELECT count(DISTINCT plane_name) FROM PilotSkills
SELECT count(*) FROM PilotSkills WHERE pilot_name  =  'Smith'
SELECT count(*) FROM PilotSkills WHERE pilot_name  =  'Smith'
SELECT count(*) FROM PilotSkills WHERE age  >  40
SELECT count(*) FROM PilotSkills WHERE age  >  40
SELECT pilot_name FROM pilotskills WHERE age BETWEEN 30 AND 40 ORDER BY age ASC
SELECT pilot_name FROM pilotskills WHERE age BETWEEN 30 AND 40 ORDER BY age ASC
SELECT pilot_name FROM PilotSkills ORDER BY age DESC
SELECT pilot_name FROM PilotSkills ORDER BY age DESC
SELECT location FROM Hangar ORDER BY plane_name
SELECT LOCATION FROM Hangar ORDER BY plane_name
SELECT DISTINCT plane_name FROM PilotSkills ORDER BY plane_name
SELECT DISTINCT plane_name FROM PilotSkills ORDER BY plane_name
SELECT count(*) FROM PilotSkills WHERE age  >  40 OR age  <  30
SELECT count(*) FROM PilotSkills WHERE age  >  40 OR age  <  30
SELECT pilot_name ,  age FROM PilotSkills WHERE plane_name  =  'Piper Cub' AND age  >  35 UNION SELECT pilot_name ,  age FROM PilotSkills WHERE plane_name  =  'F-14 Fighter' AND age  <  30
SELECT pilot_name ,  age FROM PilotSkills WHERE plane_name  =  'Piper Cub' AND age  >  35 UNION SELECT pilot_name ,  age FROM PilotSkills WHERE plane_name  =  'F-14 Fighter' AND age  <  30
SELECT pilot_name FROM pilotskills WHERE plane_name  =  'Piper Cub' EXCEPT SELECT pilot_name FROM pilotskills WHERE plane_name  =  'B-52 Bomber'
SELECT pilot_name FROM pilotskills WHERE plane_name  =  'Piper Cub' MINUS SELECT pilot_name FROM pilotskills WHERE plane_name  =  'B-52 Bomber'
SELECT pilot_name FROM pilotskills WHERE plane_name  =  'Piper Cub' INTERSECT SELECT pilot_name FROM pilotskills WHERE plane_name  =  'B-52 Bomber'
SELECT pilot_name FROM pilotskills WHERE plane_name  =  'B-52 Bomber' INTERSECT SELECT pilot_name FROM pilotskills WHERE plane_name  =  'Piper Cub'
SELECT avg(age) ,  min(age) FROM PilotSkills
SELECT avg(age) ,  min(age) FROM PilotSkills
SELECT T1.pilot_name FROM PilotSkills AS T1 JOIN Hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T2.location  =  'Austin' INTERSECT SELECT T1.pilot_name FROM PilotSkills AS T1 JOIN Hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T2.location  =  'Boston'
SELECT T1.pilot_name FROM PilotSkills AS T1 JOIN Hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T2.location  =  'Austin' INTERSECT SELECT T1.pilot_name FROM PilotSkills AS T1 JOIN Hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T2.location  =  'Boston'
SELECT pilot_name FROM pilotskills WHERE plane_name  =  'Piper Cub' INTERSECT SELECT pilot_name FROM pilotskills WHERE plane_name  =  'F-14 Fighter'
SELECT pilot_name FROM pilotskills WHERE plane_name  =  'Piper Cub' OR plane_name  =  'F-14 Fighter'
SELECT avg(age) ,  plane_name FROM PilotSkills GROUP BY plane_name
SELECT plane_name ,  avg(age) FROM PilotSkills GROUP BY plane_name
SELECT count(*) ,  plane_name FROM Hangar GROUP BY plane_name
SELECT plane_name ,  count(*) FROM PilotSkills GROUP BY plane_name
SELECT pilot_name ,  plane_name ,  max(age) FROM PilotSkills GROUP BY plane_name ORDER BY plane_name
SELECT max(age) ,  pilot_name ,  plane_name FROM PilotSkills GROUP BY plane_name ORDER BY plane_name
SELECT pilot_name ,  plane_name ,  max(age) FROM PilotSkills GROUP BY plane_name
SELECT max(age) ,  pilot_name ,  plane_name FROM PilotSkills GROUP BY plane_name
SELECT max(age) ,  pilot_name FROM PilotSkills GROUP BY pilot_name
SELECT pilot_name ,  max(age) FROM PilotSkills GROUP BY pilot_name
SELECT sum(t1.age) ,  avg(t1.age) ,  T2.location FROM pilotskills AS t1 JOIN hangar AS t2 ON t1.plane_name  =  t2.plane_name GROUP BY T2.location
SELECT sum(T1.age) ,  T2.location ,  count(*) FROM pilotskills AS T1 JOIN hangar AS T2 ON T1.plane_name  =  T2.plane_name GROUP BY T2.location
SELECT count(*) FROM PilotSkills WHERE age  <  35 GROUP BY plane_name
SELECT plane_name ,  count(*) FROM pilotskills WHERE age  <  35 GROUP BY plane_name
SELECT T3.location FROM PilotSkills AS T1 JOIN Hangar AS T2 ON T1.plane_name  =  T2.plane_name JOIN Hangar AS T3 ON T1.plane_name  =  T3.plane_name WHERE T1.age  =  (SELECT min(age) FROM PilotSkills)
SELECT t1.location FROM Hangar AS t1 JOIN PilotSkills AS t2 ON t1.plane_name  =  t2.plane_name ORDER BY t2.age LIMIT 1
SELECT T1.pilot_name ,  T1.age FROM PilotSkills AS T1 JOIN Hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T2.location  =  'Austin'
SELECT T1.pilot_name FROM pilotskills AS T1 JOIN hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T2.location  =  'Austin'
SELECT pilot_name FROM PilotSkills WHERE age  >  (SELECT min(age) FROM PilotSkills WHERE plane_name  =  'Piper Cub') ORDER BY pilot_name
SELECT pilot_name FROM PilotSkills WHERE age  >  (SELECT min(age) FROM pilotskills WHERE plane_name  =  'Piper Cub') ORDER BY pilot_name
SELECT count(*) FROM pilotskills WHERE age  <  (SELECT max(age) FROM pilotskills WHERE plane_name  =  'F-14 Fighter')
SELECT count(*) FROM pilotskills WHERE age  <  (SELECT max(age) FROM pilotskills WHERE plane_name  =  'F-14 Fighter')
SELECT DISTINCT plane_name FROM Hangar WHERE plane_name LIKE '%Bomber%'
SELECT DISTINCT plane_name FROM Hangar WHERE plane_name LIKE '%Bomber%'
SELECT count(*) FROM PilotSkills WHERE age  >  (SELECT min(age) FROM PilotSkills WHERE plane_name  =  'Piper Cub')
SELECT count(*) FROM pilotskills WHERE age  >  (SELECT min(age) FROM pilotskills WHERE plane_name  =  'Piper Cub')
SELECT name FROM district ORDER BY area_km DESC LIMIT 1
SELECT Area_km ,  government_website FROM district ORDER BY population LIMIT 1
SELECT name ,  population FROM district WHERE area_km  >  (SELECT avg(area_km) FROM district)
SELECT max(Area_km) ,  avg(Area_km) FROM district
SELECT sum(population) FROM district ORDER BY area_km DESC LIMIT 3
SELECT district_id ,  name ,  government_website FROM district ORDER BY population
SELECT name FROM district WHERE government_website LIKE '%gov%'
SELECT district_id ,  name FROM district WHERE population  >  4000 OR area_km  >  3000
SELECT Name ,  Speach_title FROM spokesman
SELECT avg(points) ,  avg(age) FROM spokesman WHERE rank_position  =  1
SELECT name ,  points FROM spokesman WHERE age  <  40
SELECT name FROM spokesman ORDER BY age DESC LIMIT 1
SELECT Name FROM spokesman WHERE Points  <  (SELECT avg(Points) FROM spokesman)
SELECT t1.name FROM district AS t1 JOIN spokesman_district AS t2 ON t1.district_id  =  t2.district_id GROUP BY t1.district_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.Name FROM spokesman AS T1 JOIN spokesman_district AS T2 ON T1.Spokesman_ID  =  T2.Spokesman_ID WHERE T2.Start_year  <  2004
SELECT T2.Name ,  count(*) FROM spokesman_district AS T1 JOIN district AS T2 ON T1.District_ID  =  T2.District_ID GROUP BY T1.District_ID
SELECT T3.Name FROM spokesman_district AS T1 JOIN district AS T2 ON T1.District_ID  =  T2.District_ID JOIN spokesman AS T4 ON T4.Spokesman_ID  =  T1.Spokesman_ID JOIN spokesman AS T5 ON T5.Spokesman_ID  =  T1.Spokesman_ID WHERE T4.Rank_position  =  1 INTERSECT SELECT T3.Name FROM spokesman_district AS T1 JOIN district AS T2 ON T1.District_ID  =  T2.District_ID JOIN spokesman AS T4 ON T4.Spokesman_ID  =  T1.Spokesman_ID JOIN spokesman AS T5 ON T5.Spokesman_ID  =  T1.Spokesman_ID WHERE T5.Rank_position  =  2
SELECT T2.Name FROM spokesman_district AS T1 JOIN district AS T2 ON T1.District_ID  =  T2.District_ID GROUP BY T1.District_ID HAVING count(*)  >  1
SELECT count(*) FROM district WHERE district_id NOT IN (SELECT district_id FROM spokesman_district)
SELECT Name FROM spokesman WHERE Spokesman_ID NOT IN (SELECT Spokesman_ID FROM spokesman_district)
SELECT sum(t1.population) ,  avg(t1.population) FROM district AS t1 JOIN spokesman_district AS t2 ON t1.district_id  =  t2.district_id
SELECT title FROM sculptures ORDER BY YEAR DESC LIMIT 1
SELECT title FROM sculptures ORDER BY YEAR DESC LIMIT 1
SELECT title ,  LOCATION FROM Paintings ORDER BY year ASC LIMIT 1
SELECT title ,  LOCATION FROM paintings ORDER BY year ASC LIMIT 1
SELECT title FROM sculptures WHERE LOCATION  =  226
SELECT title FROM sculptures WHERE LOCATION  =  226
SELECT title ,  LOCATION FROM Paintings
SELECT title ,  LOCATION FROM Paintings
SELECT title ,  LOCATION FROM sculptures
SELECT title ,  LOCATION FROM sculptures
SELECT medium FROM Paintings WHERE paintingID = 80
SELECT medium FROM Paintings WHERE paintingID  =  80
SELECT fname ,  lname FROM Artists WHERE birthyear  >  1850
SELECT fname ,  lname FROM Artists WHERE birthyear  >  1850
SELECT title ,  YEAR FROM Sculptures WHERE LOCATION != "gallery 226"
SELECT title ,  YEAR FROM Sculptures WHERE LOCATION != "gallery 226"
SELECT DISTINCT T1.fname ,  T1.lname FROM Artists AS T1 JOIN Sculptures AS T2 ON T1.artistid  =  T2.sculptorid WHERE T2.year  <  1900
SELECT DISTINCT T1.fname ,  T1.lname FROM Artists AS T1 JOIN Sculptures AS T2 ON T1.artistid  =  T2.sculptorid WHERE T2.year  <  1900
SELECT DISTINCT T1.birthyear FROM Artists AS T1 JOIN Sculptures AS T2 ON T1.artistid  =  T2.sculptorid WHERE T2.year  >  1920
SELECT DISTINCT T1.birthyear FROM Artists AS T1 JOIN Sculptures AS T2 ON T1.artistid  =  T2.sculptorid WHERE T2.year  >  1920
SELECT fname ,  lname FROM Artists ORDER BY deathYear - birthYear DESC LIMIT 1
SELECT fname ,  lname FROM Artists ORDER BY deathYear - birthYear DESC LIMIT 1
SELECT birthYear FROM Artists ORDER BY deathYear - birthYear LIMIT 1
SELECT birthYear FROM Artists ORDER BY deathYear - birthYear LIMIT 1
SELECT fname ,  birthYear FROM Artists ORDER BY deathYear - birthYear DESC LIMIT 1
SELECT fname ,  birthyear FROM Artists ORDER BY deathyear - birthyear DESC LIMIT 1
SELECT count(*) FROM paintings WHERE LOCATION  =  240
SELECT count(*) FROM paintings WHERE LOCATION  =  240
SELECT count(*) FROM paintings AS T1 JOIN artists AS T2 ON T1.painterid  =  T2.artistid WHERE T2.deathyear  -  T2.birthyear  =  (SELECT max(deathyear  -  birthyear) FROM artists)
SELECT count(*) FROM paintings AS T1 JOIN artists AS T2 ON T1.painterid  =  T2.artistid WHERE T2.birthyear  =  (SELECT max(birthyear) FROM artists)
SELECT T1.title ,  T1.year FROM Paintings AS T1 JOIN Artists AS T2 ON T1.painterid  =  T2.artistid WHERE T2.fname  =  "Martha"
SELECT T2.title ,  T2.year FROM Artists AS T1 JOIN Paintings AS T2 ON T1.artistid  =  T2.painterid WHERE T1.fname  =  "Mary"
SELECT T2.width_mm FROM Artists AS T1 JOIN Paintings AS T2 ON T1.artistid  =  T2.painterid WHERE T1.birthyear  <  1850
SELECT T2.width_mm FROM Artists AS T1 JOIN Paintings AS T2 ON T1.artistid  =  T2.painterid WHERE T1.birthyear  <  1850
SELECT T2.location ,  T1.medium FROM Artists AS T0 JOIN Paintings AS T1 ON T0.artistid  =  T1.painterid WHERE T0.fname  =  "Pablo"
SELECT T2.location ,  T1.medium FROM Artists AS T3 JOIN Paintings AS T1 ON T3.artistid  =  T1.painterid JOIN Paintings AS T2 ON T3.artistid  =  T2.painterid WHERE T3.fname  =  "Pablo"
SELECT T1.fname ,  T1.lname FROM Artists AS T1 JOIN Paintings AS T2 ON T1.artistid  =  T2.painterid JOIN Sculptures AS T3 ON T1.artistid  =  T3.sculptorid
SELECT T1.fname ,  T1.lname FROM Artists AS T1 JOIN Paintings AS T2 ON T1.artistid  =  T2.painterid JOIN Sculptures AS T3 ON T1.artistid  =  T3.sculptorid
SELECT T1.fname ,  T1.lname FROM Artists AS T1 JOIN Paintings AS T2 ON T1.artistid  =  T2.painterid WHERE T2.medium  =  'oil' INTERSECT SELECT T1.fname ,  T1.lname FROM Artists AS T1 JOIN Paintings AS T2 ON T1.artistid  =  T2.painterid WHERE T2.medium  =  'lithograph'
SELECT T1.fname ,  T1.lname FROM Artists AS T1 JOIN Paintings AS T2 ON T1.artistid  =  T2.painterid WHERE T2.medium  =  "oil" INTERSECT SELECT T1.fname ,  T1.lname FROM Artists AS T1 JOIN Paintings AS T2 ON T1.artistid  =  T2.painterid WHERE T2.medium  =  "lithographic"
SELECT T1.birthyear FROM Artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid WHERE T2.year  =  1884 AND T2.medium  =  'canvas'
SELECT T1.birthYear FROM Artists AS T1 JOIN Paintings AS T2 ON T1.artistID  =  T2.painterID WHERE T2.year  =  1884
SELECT DISTINCT T1.fname FROM Artists AS T1 JOIN Paintings AS T2 ON T1.artistid  =  T2.painterid WHERE T2.medium  =  "oil" AND T2.location  =  "Gallery 241"
SELECT T1.fname FROM Artists AS T1 JOIN Paintings AS T2 ON T1.artistid  =  T2.painterid WHERE T2.medium  =  "oil" AND T2.location  =  241
SELECT medium ,  COUNT(*) FROM paintings GROUP BY medium
SELECT medium ,  count(*) FROM paintings GROUP BY medium UNION SELECT medium ,  count(*) FROM sculptures GROUP BY medium
SELECT medium ,  avg(height_mm) FROM paintings GROUP BY medium
SELECT medium ,  avg(height_mm) FROM paintings GROUP BY medium
SELECT count(*) ,  LOCATION FROM paintings WHERE YEAR  <  1900 GROUP BY LOCATION
SELECT COUNT(*) ,  LOCATION FROM paintings WHERE YEAR  <  1900 GROUP BY LOCATION
SELECT title FROM paintings WHERE YEAR  >  1910 AND medium  =  "oil"
SELECT title FROM paintings WHERE medium  =  'oil' AND YEAR  >  1910
SELECT DISTINCT painterid FROM paintings WHERE medium  =  'oil' AND LOCATION  =  'Gallery 240'
SELECT DISTINCT painterid FROM paintings WHERE medium  =  "oil" AND LOCATION  =  240
SELECT DISTINCT title FROM paintings WHERE height_mm  >  (SELECT min(height_mm) FROM paintings WHERE medium  =  "canvas")
SELECT DISTINCT title FROM paintings WHERE height_mm  >  (SELECT min(height_mm) FROM paintings WHERE medium  =  "canvas")
SELECT DISTINCT paintingid FROM paintings WHERE YEAR  >  (SELECT min(YEAR) FROM paintings WHERE LOCATION  =  "gallery 240")
SELECT DISTINCT paintingid FROM paintings WHERE YEAR  >  (SELECT min(YEAR) FROM paintings WHERE LOCATION  =  '240')
SELECT paintingID FROM Paintings ORDER BY YEAR ASC LIMIT 1
SELECT paintingID FROM Paintings ORDER BY YEAR LIMIT 1
SELECT T1.fname ,  T1.lname FROM Artists AS T1 JOIN Sculptures AS T2 ON T1.artistid  =  T2.sculptorid WHERE T2.title LIKE "%female%"
SELECT T1.fname ,  T1.lname FROM Artists AS T1 JOIN Sculptures AS T2 ON T1.artistid  =  T2.sculptorid WHERE T2.title LIKE "%female%"
SELECT DISTINCT title FROM paintings ORDER BY title
SELECT DISTINCT title FROM paintings ORDER BY title
SELECT DISTINCT title FROM paintings ORDER BY width_mm
SELECT DISTINCT title FROM paintings ORDER BY height_mm ASC
SELECT title FROM paintings WHERE YEAR  >=  1900 AND YEAR  <=  1950 UNION SELECT title FROM sculptures WHERE YEAR  >=  1900 AND YEAR  <=  1950
SELECT title FROM paintings WHERE YEAR  >=  1900 AND YEAR  <=  1950 UNION SELECT title FROM sculptures WHERE YEAR  >=  1900 AND YEAR  <=  1950
SELECT T2.title FROM Artists AS T1 JOIN Paintings AS T2 ON T1.artistid  =  T2.painterid WHERE T1.artistid  =  222 UNION SELECT T2.title FROM Artists AS T1 JOIN Sculptures AS T2 ON T1.artistid  =  T2.sculptorid WHERE T1.artistid  =  222
SELECT title FROM paintings WHERE painterID  =  222 UNION SELECT title FROM sculptures WHERE sculptorID  =  222
SELECT T1.artistid FROM Artists AS T1 JOIN Paintings AS T2 ON T1.artistid  =  T2.painterid WHERE T2.year  <  1900 GROUP BY T1.artistid ORDER BY count(*) DESC LIMIT 1
SELECT T1.artistid FROM Artists AS T1 JOIN Paintings AS T2 ON T1.artistid  =  T2.painterid WHERE T2.year  <  1900 GROUP BY T1.artistid ORDER BY count(*) DESC LIMIT 1
SELECT T1.fname FROM Artists AS T1 JOIN Sculptures AS T2 ON T1.artistid  =  T2.sculptorid GROUP BY T1.artistid ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.fname FROM Artists AS T1 JOIN Sculptures AS T2 ON T1.artistID  =  T2.sculptorID GROUP BY T1.artistID ORDER BY COUNT(*) DESC LIMIT 1
SELECT title FROM paintings WHERE width_mm  <  600 OR height_mm  >  800
SELECT title FROM paintings WHERE width_mm  <  600 OR height_mm  >  800
SELECT DISTINCT LOCATION FROM paintings WHERE YEAR  <  1885 OR YEAR  >  1930
SELECT DISTINCT LOCATION FROM paintings WHERE YEAR  <  1885 OR YEAR  >  1930
SELECT paintingID FROM Paintings WHERE height_mm  >  500 AND height_mm  <  2000
SELECT paintingID FROM Paintings WHERE height_mm  >  500 AND height_mm  <  2000
SELECT DISTINCT LOCATION FROM paintings WHERE medium  =  "on panel" INTERSECT SELECT DISTINCT LOCATION FROM paintings WHERE medium  =  "on canvas"
SELECT DISTINCT LOCATION FROM PAINTINGS WHERE medium  =  "on panel" INTERSECT SELECT DISTINCT LOCATION FROM PAINTINGS WHERE medium  =  "on canvas"
SELECT DISTINCT LOCATION FROM paintings WHERE YEAR  <  1885 INTERSECT SELECT DISTINCT LOCATION FROM paintings WHERE YEAR  >  1930
SELECT DISTINCT LOCATION FROM paintings WHERE YEAR  <  1885 INTERSECT SELECT DISTINCT LOCATION FROM paintings WHERE YEAR  >  1930
SELECT avg(height_mm) ,  avg(width_mm) FROM paintings WHERE medium  =  "oil" AND LOCATION  =  241
SELECT avg(height_mm) ,  avg(width_mm) FROM paintings WHERE medium  =  "oil" AND LOCATION  =  241
SELECT max(height_mm) ,  paintingid FROM Paintings WHERE YEAR  <  1900 GROUP BY paintingid
SELECT height_mm ,  paintingID FROM Paintings WHERE YEAR  <  1900 ORDER BY height_mm DESC LIMIT 1
SELECT max(height_mm) ,  max(width_mm) ,  YEAR FROM paintings GROUP BY YEAR
SELECT year ,  max(height_mm) ,  max(width_mm) FROM Paintings GROUP BY year
SELECT avg(T1.height_mm) ,  avg(T1.width_mm) ,  T2.fname ,  T2.lname FROM paintings AS T1 JOIN artists AS T2 ON T1.painterid  =  T2.artistid GROUP BY T2.fname ,  T2.lname ORDER BY T2.fname ,  T2.lname
SELECT avg(T1.height_mm) ,  avg(T1.width_mm) ,  T2.fname ,  T2.lname FROM paintings AS T1 JOIN artists AS T2 ON T1.painterid  =  T2.artistid GROUP BY T2.fname ,  T2.lname ORDER BY T2.fname ,  T2.lname
SELECT T1.fname ,  count(*) FROM Artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid GROUP BY T1.artistid HAVING count(*)  >=  2
SELECT T1.fname ,  count(*) FROM Artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid GROUP BY T1.fname HAVING count(*)  >=  2
SELECT T1.deathyear FROM Artists AS T1 JOIN Paintings AS T2 ON T1.artistid  =  T2.painterid GROUP BY T1.artistid HAVING count(*)  <=  3
SELECT T1.deathyear FROM Artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid GROUP BY T1.artistid HAVING count(*)  <  4
SELECT T1.deathyear FROM Artists AS T1 JOIN Sculptures AS T2 ON T1.artistid  =  T2.sculptorid GROUP BY T1.deathyear ORDER BY count(*) ASC LIMIT 1
SELECT T1.deathyear FROM Artists AS T1 JOIN Sculptures AS T2 ON T1.artistid  =  T2.sculptorid GROUP BY T1.artistid ORDER BY count(*) ASC LIMIT 1
SELECT paintingid ,  height_mm FROM paintings WHERE width_mm  =  (SELECT MAX(width_mm) FROM paintings WHERE LOCATION  =  240) AND LOCATION  =  240
SELECT width_mm ,  paintingid FROM paintings WHERE LOCATION  =  240 ORDER BY width_mm DESC LIMIT 1
SELECT paintingID FROM Paintings EXCEPT SELECT paintingID FROM Paintings WHERE LOCATION  =  "240"
SELECT paintingID FROM Paintings WHERE YEAR  <  (SELECT max(YEAR) FROM Paintings WHERE LOCATION  =  240)
SELECT paintingID FROM Paintings WHERE height_mm  >  (SELECT max(height_mm) FROM Paintings WHERE year  >  1900)
SELECT paintingID FROM Paintings WHERE height_mm  >  (SELECT max(height_mm) FROM Paintings WHERE YEAR  >  1900)
SELECT T1.fname ,  T1.lname FROM Artists AS T1 JOIN Paintings AS T2 ON T1.artistid  =  T2.painterid WHERE T2.medium  =  'oil' GROUP BY T1.artistid ORDER BY COUNT(*) DESC LIMIT 3
SELECT T1.fname ,  T1.lname FROM Artists AS T1 JOIN Paintings AS T2 ON T1.artistid  =  T2.painterid WHERE T2.medium  =  "oil" GROUP BY T1.artistid ORDER BY COUNT(*) DESC LIMIT 1
SELECT paintingID ,  LOCATION ,  title FROM paintings WHERE medium  =  "oil" ORDER BY YEAR
SELECT paintingid ,  LOCATION ,  title FROM paintings WHERE medium  =  "oil" ORDER BY YEAR
SELECT title ,  location ,  YEAR FROM paintings WHERE height_mm  >  1000 ORDER BY title
SELECT T2.title ,  T2.location ,  T1.year FROM Paintings AS T1 JOIN Artists AS T2 ON T1.painterID  =  T2.artistID WHERE T1.height_mm  >  1000 ORDER BY T2.lname ,  T2.fname
SELECT T1.fname ,  T1.lname FROM Artists AS T1 JOIN Paintings AS T2 ON T1.artistid  =  T2.painterid EXCEPT SELECT T1.fname ,  T1.lname FROM Artists AS T1 JOIN Sculptures AS T2 ON T1.artistid  =  T2.sculptorid
SELECT fname ,  lname FROM Artists EXCEPT SELECT T1.fname ,  T1.lname FROM Artists AS T1 JOIN Sculptures AS T2 ON T1.artistid  =  T2.sculptorid
SELECT LOCATION FROM paintings WHERE YEAR  <  1885 EXCEPT SELECT location FROM paintings WHERE medium  =  "canvas"
SELECT LOCATION FROM paintings WHERE medium != 'canvas' AND YEAR  <  1885
SELECT count(*) FROM race
SELECT count(*) FROM race
SELECT Winning_driver ,  Winning_team FROM race ORDER BY Winning_team ASC
SELECT Winning_driver ,  Winning_team FROM race ORDER BY Winning_team
SELECT Winning_driver FROM race WHERE Pole_Position != 'Junior Strous'
SELECT Winning_driver FROM race WHERE Pole_Position != 'Junior Strous'
SELECT Constructor FROM driver ORDER BY Age ASC
SELECT DISTINCT Constructor FROM driver ORDER BY Age ASC
SELECT DISTINCT Entrant FROM driver WHERE Age  >=  20
SELECT DISTINCT Entrant FROM driver WHERE Age  >=  20
SELECT max(Age) ,  min(Age) FROM driver
SELECT max(Age) ,  min(Age) FROM driver
SELECT count(DISTINCT engine) FROM driver WHERE age  >  30 OR age  <  20
SELECT count(DISTINCT Engine) FROM driver WHERE Age  >  30 OR Age  <  20
SELECT driver_name FROM driver ORDER BY driver_name DESC
SELECT driver_name FROM driver ORDER BY driver_name DESC
SELECT T2.Driver_Name ,  T1.Race_Name FROM race AS T1 JOIN driver AS T2 ON T1.Driver_ID  =  T2.Driver_ID
SELECT T2.Driver_Name ,  T1.Race_Name FROM race AS T1 JOIN driver AS T2 ON T1.Driver_ID  =  T2.Driver_ID
SELECT T2.Driver_Name ,  COUNT(*) FROM race AS T1 JOIN driver AS T2 ON T1.Driver_ID  =  T2.Driver_ID GROUP BY T2.Driver_Name
SELECT count(*) FROM race AS T1 JOIN driver AS T2 ON T1.driver_id  =  T2.driver_id GROUP BY T1.driver_id
SELECT t1.age FROM driver AS t1 JOIN race AS t2 ON t1.driver_id  =  t2.driver_id GROUP BY t2.driver_id ORDER BY count(*) DESC LIMIT 1
SELECT t1.age FROM driver AS t1 JOIN race AS t2 ON t1.driver_id  =  t2.driver_id GROUP BY t2.driver_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.driver_name ,  T1.age FROM driver AS T1 JOIN race AS T2 ON T1.driver_id  =  T2.driver_id GROUP BY T1.driver_id HAVING count(*)  >=  2
SELECT T1.driver_name ,  T1.age FROM driver AS T1 JOIN race AS T2 ON T1.driver_id  =  T2.driver_id GROUP BY T1.driver_id HAVING count(*)  >=  2
SELECT T2.Race_Name FROM driver AS T1 JOIN race AS T2 ON T1.Driver_ID  =  T2.Driver_ID WHERE T1.Age  >=  26
SELECT T2.Race_Name FROM driver AS T1 JOIN race AS T2 ON T1.Driver_ID  =  T2.Driver_ID WHERE T1.Age  >=  26
SELECT driver_name FROM driver WHERE constructor != 'Bugatti'
SELECT driver_name FROM driver WHERE constructor != 'Bugatti'
SELECT Constructor ,  COUNT(*) FROM driver GROUP BY Constructor
SELECT constructor ,  count(*) FROM driver GROUP BY constructor
SELECT engine FROM driver GROUP BY engine ORDER BY count(*) DESC LIMIT 1
SELECT engine FROM driver GROUP BY engine ORDER BY count(*) DESC LIMIT 1
SELECT engine FROM driver GROUP BY engine HAVING count(*)  >=  2
SELECT engine FROM driver GROUP BY engine HAVING count(*)  >=  2
SELECT Driver_Name FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM race)
SELECT Driver_Name FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM race)
SELECT constructor FROM driver WHERE age  <  20 INTERSECT SELECT constructor FROM driver WHERE age  >  30
SELECT Constructor FROM driver WHERE age  <  20 INTERSECT SELECT Constructor FROM driver WHERE age  >  30
SELECT Winning_team FROM race GROUP BY Winning_team HAVING count(*)  >  1
SELECT Winning_team FROM race GROUP BY Winning_team HAVING count(*)  >  1
SELECT T1.driver_name FROM driver AS T1 JOIN race AS T2 ON T1.driver_id  =  T2.driver_id WHERE T2.pole_position  =  'James Hinchcliffe' INTERSECT SELECT T1.driver_name FROM driver AS T1 JOIN race AS T2 ON T1.driver_id  =  T2.driver_id WHERE T2.pole_position  =  'Carl Skerlong'
SELECT T1.driver_name FROM driver AS T1 JOIN race AS T2 ON T1.driver_id  =  T2.driver_id WHERE T2.pole_position  =  'James Hinchcliffe' INTERSECT SELECT T1.driver_name FROM driver AS T1 JOIN race AS T2 ON T1.driver_id  =  T2.driver_id WHERE T2.pole_position  =  'Carl Skerlong'
SELECT driver_name FROM driver EXCEPT SELECT T1.driver_name FROM driver AS T1 JOIN race AS T2 ON T1.driver_id  =  T2.driver_id WHERE T2.pole_position  =  'James Hinchcliffe'
SELECT driver_name FROM driver EXCEPT SELECT driver_name FROM driver WHERE driver_name  =  'James Hinchcliffe'
SELECT count(*) FROM languages
SELECT count(*) FROM languages
SELECT name FROM languages ORDER BY name ASC
SELECT name FROM languages ORDER BY name
SELECT name FROM languages WHERE name LIKE "%ish%"
SELECT name FROM languages WHERE name LIKE "%ish%"
SELECT name FROM countries ORDER BY overall_score DESC
SELECT name FROM countries ORDER BY overall_score DESC
SELECT avg(justice_score) FROM countries
SELECT avg(justice_score) FROM countries
SELECT max(health_score) ,  min(health_score) FROM countries WHERE name != "Norway"
SELECT max(health_score) ,  min(health_score) FROM countries WHERE name != "Norway"
SELECT count(DISTINCT name) FROM languages
SELECT count(DISTINCT name) FROM languages
SELECT name FROM countries ORDER BY education_score DESC
SELECT name FROM countries ORDER BY education_score DESC
SELECT name FROM countries ORDER BY politics_score DESC LIMIT 1
SELECT name FROM countries ORDER BY politics_score DESC LIMIT 1
SELECT T1.name ,  T3.name FROM countries AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.country_id JOIN languages AS T3 ON T2.language_id  =  T3.id
SELECT T1.name ,  T3.name FROM countries AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.country_id JOIN languages AS T3 ON T2.language_id  =  T3.id
SELECT T1.name ,  count(*) FROM languages AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.language_id GROUP BY T1.id
SELECT T1.name ,  count(*) FROM languages AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.language_id GROUP BY T1.id
SELECT t1.name FROM languages AS t1 JOIN official_languages AS t2 ON t1.id  =  t2.language_id GROUP BY t1.name ORDER BY count(*) DESC LIMIT 1
SELECT t1.name FROM languages AS t1 JOIN official_languages AS t2 ON t1.id  =  t2.language_id GROUP BY t2.language_id ORDER BY count(*) DESC LIMIT 1
SELECT t1.name FROM languages AS t1 JOIN official_languages AS t2 ON t1.id  =  t2.language_id GROUP BY t1.name HAVING count(*)  >=  2
SELECT T1.name FROM languages AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.language_id GROUP BY T1.id HAVING count(*)  >=  2
SELECT avg(T1.overall_score) FROM countries AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.country_id JOIN languages AS T3 ON T2.language_id  =  T3.id WHERE T3.name  =  "English"
SELECT avg(overall_score) FROM countries WHERE id IN (SELECT country_id FROM official_languages WHERE language_id  =  1)
SELECT t1.name FROM languages AS t1 JOIN official_languages AS t2 ON t1.id  =  t2.language_id GROUP BY t2.language_id ORDER BY count(*) DESC LIMIT 3
SELECT t1.name FROM languages AS t1 JOIN official_languages AS t2 ON t1.id  =  t2.language_id GROUP BY t2.language_id ORDER BY count(*) DESC LIMIT 3
SELECT T1.name FROM languages AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.language_id JOIN countries AS T3 ON T2.country_id  =  T3.id GROUP BY T1.id ORDER BY avg(T3.overall_score) DESC
SELECT t1.name FROM languages AS t1 JOIN official_languages AS t2 ON t1.id  =  t2.language_id JOIN countries AS t3 ON t2.country_id  =  t3.id GROUP BY t1.id ORDER BY avg(t3.overall_score) DESC
SELECT t1.name FROM countries AS t1 JOIN official_languages AS t2 ON t1.id  =  t2.country_id GROUP BY t1.id ORDER BY count(*) DESC LIMIT 1
SELECT t1.name FROM countries AS t1 JOIN official_languages AS t2 ON t1.id  =  t2.country_id GROUP BY t1.id ORDER BY count(*) DESC LIMIT 1
SELECT name FROM languages EXCEPT SELECT t1.name FROM official_languages AS t2 JOIN languages AS t1 ON t1.id  =  t2.language_id
SELECT name FROM languages EXCEPT SELECT t1.name FROM official_languages AS t2 JOIN languages AS t1 ON t1.id  =  t2.language_id
SELECT name FROM countries WHERE id NOT IN (SELECT country_id FROM official_languages)
SELECT name FROM countries WHERE id NOT IN (SELECT country_id FROM official_languages)
SELECT t1.name FROM languages AS t1 JOIN official_languages AS t2 ON t1.id  =  t2.language_id JOIN countries AS t3 ON t2.country_id  =  t3.id WHERE t3.overall_score  >  95 INTERSECT SELECT t1.name FROM languages AS t1 JOIN official_languages AS t2 ON t1.id  =  t2.language_id JOIN countries AS t3 ON t2.country_id  =  t3.id WHERE t3.overall_score  <  90
SELECT t1.name FROM languages AS t1 JOIN official_languages AS t2 ON t1.id  =  t2.language_id JOIN countries AS t3 ON t2.country_id  =  t3.id WHERE t3.overall_score  >  95 INTERSECT SELECT t1.name FROM languages AS t1 JOIN official_languages AS t2 ON t1.id  =  t2.language_id JOIN countries AS t3 ON t2.country_id  =  t3.id WHERE t3.overall_score  <  90
SELECT county_state_province ,  town_city FROM Addresses
SELECT county_state_province ,  town_city FROM Addresses
SELECT counties_state_province FROM Addresses GROUP BY counties_state_province
SELECT county_state_province FROM Addresses
SELECT feature_description FROM FEATURES WHERE feature_name  =  "rooftop"
SELECT feature_description FROM FEATURES WHERE feature_name  =  "rooftop"
SELECT T1.feature_name ,  T1.feature_description FROM FEATURES AS T1 JOIN Property_Features AS T2 ON T1.feature_id  =  T2.feature_id GROUP BY T2.feature_value ORDER BY count(*) DESC LIMIT 1
SELECT T1.feature_name ,  T1.feature_description FROM FEATURES AS T1 JOIN Property_Features AS T2 ON T1.feature_id  =  T2.feature_id GROUP BY T2.feature_value ORDER BY count(*) DESC LIMIT 1
SELECT min(room_size) FROM ROOMS
SELECT min(room_count) FROM Properties
SELECT count(*) FROM properties WHERE parking_lots  =  1 OR garage_yn  =  1
SELECT count(*) FROM properties WHERE parking_lots  =  1 OR garage_yn  =  1
SELECT T1.age_category_code FROM Users AS T1 JOIN Ref_Age_Categories AS T2 ON T1.age_category_code  =  T2.age_category_code WHERE T1.other_user_details LIKE '%Mother%'
SELECT age_category_code FROM USERS WHERE first_name LIKE "%Mother%"
SELECT T2.first_name FROM Properties AS T1 JOIN Users AS T2 ON T1.owner_user_id  =  T2.user_id GROUP BY T2.first_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.first_name FROM Properties AS T1 JOIN Users AS T2 ON T1.owner_user_id  =  T2.user_id GROUP BY T2.first_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT avg(room_count) FROM properties AS T1 JOIN roomss AS T2 ON T1.property_id  =  T2.property_id WHERE T1.garage_yn  =  "Y"
SELECT avg(room_size) FROM ROOMs AS T1 JOIN Properties AS T2 ON T1.property_id  =  T2.property_id JOIN Property_Features AS T3 ON T2.property_id  =  T3.property_id WHERE T3.feature_id  =  130
SELECT T1.town_city FROM addresses AS T1 JOIN properties AS T2 ON T1.address_id  =  T2.property_address_id JOIN property_features AS T3 ON T2.property_id  =  T3.property_id WHERE T3.feature_id  =  12 AND T3.feature_value  =  'Y' GROUP BY T1.town_city HAVING count(*)  >  1
SELECT T1.town_city FROM addresses AS T1 JOIN properties AS T2 ON T1.address_id  =  T2.property_address_id JOIN room_features AS T3 ON T2.property_id  =  T3.property_id WHERE T3.feature_id  =  12 ORDER BY T1.town_city
SELECT property_id ,  vendor_requested_price FROM Properties ORDER BY vendor_requested_price ASC LIMIT 1
SELECT property_id ,  vendor_requested_price FROM Properties ORDER BY vendor_requested_price ASC LIMIT 1
SELECT avg(room_size) FROM ROOMS
SELECT avg(room_size) FROM ROOMS
SELECT count(DISTINCT room_size) FROM ROOMS
SELECT count(DISTINCT room_size) FROM ROOMS
SELECT T1.user_id ,  T2.search_string FROM User_Searches AS T1 JOIN Users AS T2 ON T1.user_id  =  T2.user_id GROUP BY T1.user_id HAVING count(*)  >=  2
SELECT T1.user_id ,  T2.search_seq FROM User_Property_History AS T1 JOIN User_Searches AS T2 ON T1.user_id  =  T2.user_id GROUP BY T1.user_id HAVING count(*)  >=  2
SELECT search_datetime FROM User_Searches ORDER BY search_datetime DESC LIMIT 1
SELECT search_datetime FROM User_Searches ORDER BY search_seq DESC LIMIT 1
SELECT search_datetime ,  search_string FROM User_Searches ORDER BY search_string DESC
SELECT search_string ,  search_datetime FROM User_Searches ORDER BY search_string DESC
SELECT DISTINCT T2.zip_postcode FROM Properties AS T1 JOIN Addresses AS T2 ON T1.property_address_id  =  T2.address_id JOIN Users AS T3 ON T1.owner_user_id  =  T3.user_id GROUP BY T3.user_id HAVING count(*)  >  2
SELECT DISTINCT T1.zip_postcode FROM addresses AS T1 JOIN properties AS T2 ON T1.address_id  =  T2.property_address_id GROUP BY T2.owner_user_id HAVING count(*)  >  2
SELECT T1.user_category_code ,  T2.user_id FROM Users AS T1 JOIN User_Searches AS T2 ON T1.user_id  =  T2.user_id GROUP BY T2.user_id HAVING count(*)  =  1
SELECT T1.user_id ,  T1.age_category_code FROM Users AS T1 JOIN User_Searches AS T2 ON T1.user_id  =  T2.user_id GROUP BY T1.user_id HAVING count(*)  =  1
SELECT T2.age_category_code FROM User_Searches AS T1 JOIN Users AS T2 ON T1.user_id  =  T2.user_id ORDER BY T1.search_datetime LIMIT 1
SELECT T1.age_category_code FROM USERS AS T1 JOIN User_Searches AS T2 ON T1.user_id  =  T2.user_id ORDER BY T2.search_datetime ASC LIMIT 1
SELECT login_name FROM Users WHERE age_category_code  =  "Senior" ORDER BY first_name
SELECT login_name FROM Users WHERE age_category_code  =  "Senior" ORDER BY first_name
SELECT count(*) FROM USERS AS T1 JOIN User_Searches AS T2 ON T1.user_id  =  T2.user_id WHERE T1.is_buyer  =  1
SELECT count(*) FROM USERS AS T1 JOIN User_Searches AS T2 ON T1.user_id  =  T2.user_id WHERE T1.is_buyer  =  1
SELECT date_registered FROM Users WHERE login_name  =  "ratione"
SELECT date_registered FROM Users WHERE login_name  =  "ratione"
SELECT first_name ,  middle_name ,  last_name ,  login_name FROM USERS WHERE is_seller  =  1
SELECT first_name ,  middle_name ,  last_name ,  login_name FROM Users WHERE is_seller  =  'Y'
SELECT T1.line_1_number_building ,  T1.line_2_number_street ,  T1.town_city FROM Addresses AS T1 JOIN Users AS T2 ON T1.address_id  =  T2.user_address_id WHERE T2.age_category_code  =  "Senior Citizens"
SELECT T1.line_1_number_building ,  T1.line_2_number_street ,  T1.town_city FROM Addresses AS T1 JOIN Users AS T2 ON T1.address_id  =  T2.user_address_id WHERE T2.age_category_code  =  "Senior"
SELECT count(*) FROM properties AS t1 JOIN property_features AS t2 ON t1.property_id  =  t2.property_id GROUP BY t1.property_id HAVING count(*)  >=  2
SELECT count(*) FROM properties AS t1 JOIN property_features AS t2 ON t1.property_id  =  t2.property_id GROUP BY t1.property_id HAVING count(*)  >=  2
SELECT T2.property_id ,  count(*) FROM properties AS T1 JOIN property_photos AS T2 ON T1.property_id  =  T2.property_id GROUP BY T2.property_id
SELECT T2.property_id ,  count(*) FROM Property_Photos AS T1 JOIN Properties AS T2 ON T1.property_id  =  T2.property_id GROUP BY T2.property_id
SELECT T1.user_id ,  count(*) FROM USERS AS T1 JOIN property_photos AS T2 ON T1.user_id  =  T2.property_id GROUP BY T1.user_id
SELECT T1.user_id ,  count(*) FROM Properties AS T1 JOIN property_photos AS T2 ON T1.property_id  =  T2.property_id GROUP BY T1.user_id
SELECT sum(price_max) FROM Properties AS T1 JOIN USERS AS T2 ON T1.owner_user_id  =  T2.user_id WHERE T2.age_category_code  =  "Student" OR T2.user_category_code  =  "Single_Mother"
SELECT sum(price_max) FROM Properties AS T1 JOIN USERS AS T2 ON T1.owner_user_id  =  T2.user_id WHERE T2.age_category_code  =  "Student" OR T2.first_name  =  "Single"
SELECT T2.datestamp ,  T1.property_name FROM Properties AS T1 JOIN User_Property_History AS T2 ON T1.property_id  =  T2.property_id ORDER BY T2.datestamp
SELECT datestamp ,  property_name FROM Properties AS T1 JOIN User_Property_History AS T2 ON T1.property_id  =  T2.property_id ORDER BY datestamp
SELECT T2.property_type_description ,  T1.property_type_code FROM Properties AS T1 JOIN Ref_Property_Types AS T2 ON T1.property_type_code  =  T2.property_type_code GROUP BY T1.property_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.property_type_description ,  COUNT(*) FROM Properties AS T1 JOIN Ref_Property_Types AS T2 ON T1.property_type_code  =  T2.property_type_code GROUP BY T1.property_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT age_category_description FROM Ref_Age_Categories WHERE age_category_code  =  'Over 60'
SELECT age_category_description FROM Ref_Age_Categories WHERE age_category_code  =  'Over 60'
SELECT room_size ,  count(*) FROM ROOMS GROUP BY room_size
SELECT room_size ,  count(*) FROM ROOMS GROUP BY room_size
SELECT T1.country FROM Addresses AS T1 JOIN Users AS T2 ON T1.address_id  =  T2.user_address_id WHERE T2.first_name  =  "Robbie"
SELECT T2.country FROM Users AS T1 JOIN Addresses AS T2 ON T1.user_address_id  =  T2.address_id WHERE T1.first_name  =  "Robbie"
SELECT T2.first_name ,  T2.middle_name ,  T2.last_name FROM Properties AS T1 JOIN Users AS T2 ON T1.owner_user_id  =  T2.user_id WHERE T1.property_address_id  =  T2.user_address_id
SELECT T1.first_name ,  T1.last_name FROM Users AS T1 JOIN Properties AS T2 ON T1.user_id  =  T2.owner_user_id WHERE T1.user_address_id IN ( SELECT T3.address_id FROM Addresses AS T3 JOIN Properties AS T2 ON T3.address_id  =  T2.property_address_id WHERE T2.price_max  >  100 AND T2.price_min  <  100 UNION SELECT T3.address_id FROM Addresses AS T3 JOIN Properties AS T2 ON T3.address_id  =  T2.property_address_id WHERE T2.vendor_requested_price  >  100 AND T2.price_max  <  100)
SELECT T1.search_string FROM User_Searches AS T1 JOIN User_Property_History AS T2 ON T1.user_id  =  T2.user_id GROUP BY T1.user_id HAVING COUNT(*)  =  1
SELECT search_string FROM User_Searches WHERE user_id NOT IN (SELECT user_id FROM User_Property_History)
SELECT T2.last_name ,  T1.user_id FROM User_Property_History AS T1 JOIN Users AS T2 ON T1.user_id  =  T2.user_id GROUP BY T1.user_id HAVING count(*)  >=  2 INTERSECT SELECT T2.last_name ,  T1.user_id FROM User_Property_History AS T1 JOIN Users AS T2 ON T1.user_id  =  T2.user_id JOIN User_Searches AS T3 ON T1.user_id  =  T3.user_id GROUP BY T1.user_id HAVING count(*)  <=  2
SELECT T1.last_name ,  T1.user_id FROM Users AS T1 JOIN User_Property_History AS T2 ON T1.user_id  =  T2.user_id GROUP BY T1.user_id HAVING count(*)  <=  2 INTERSECT SELECT T1.last_name ,  T1.user_id FROM Users AS T1 JOIN User_Property_History AS T2 ON T1.user_id  =  T2.user_id GROUP BY T1.user_id HAVING count(*)  >=  2
SELECT count(*) FROM bike WHERE weight  >  780
SELECT product_name ,  weight FROM bike ORDER BY price
SELECT heat ,  name ,  nation FROM cyclist
SELECT max(weight) ,  min(weight) FROM bike
SELECT avg(price) FROM bike WHERE material  =  'Carbon CC'
SELECT name ,  result FROM cyclist WHERE nation != 'Russia'
SELECT DISTINCT T2.id ,  T1.product_name FROM bike AS T1 JOIN cyclists_own_bikes AS T2 ON T1.id  =  T2.bike_id WHERE T2.purchase_year  >  2015
SELECT T2.id ,  T2.product_name FROM cyclists_own_bikes AS T1 JOIN bike AS T2 ON T1.bike_id  =  T2.id WHERE T2.material  =  'racing' GROUP BY T1.bike_id HAVING count(*)  >=  4
SELECT T1.id ,  T1.name FROM cyclist AS T1 JOIN cyclists_own_bikes AS T2 ON T1.id  =  T2.cyclist_id GROUP BY T1.id ORDER BY count(*) DESC LIMIT 1
SELECT DISTINCT T2.product_name FROM cyclists_own_bikes AS T1 JOIN bike AS T2 ON T1.bike_id  =  T2.id JOIN cyclist AS T3 ON T1.cyclist_id  =  T3.id WHERE T3.nation  =  'Russia' OR T3.nation  =  'Great Britain'
SELECT count(DISTINCT heat) FROM cyclist
SELECT count(*) FROM cyclist WHERE id NOT IN (SELECT cyclist_id FROM cyclists_own_bikes WHERE purchase_year  >  2015)
SELECT DISTINCT T2.product_name FROM cyclists_own_bikes AS T1 JOIN bike AS T2 ON T1.bike_id  =  T2.id JOIN cyclist AS T3 ON T1.cyclist_id  =  T3.id WHERE T3.result  >  '4:21.558' AND T2.material  =  'carbon fiber'
SELECT T2.product_name ,  T2.price FROM cyclists_own_bikes AS T1 JOIN bike AS T2 ON T1.bike_id  =  T2.id JOIN cyclist AS T3 ON T1.cyclist_id  =  T3.id WHERE T3.name  =  'Bradley Wiggins' INTERSECT SELECT T2.product_name ,  T2.price FROM cyclists_own_bikes AS T1 JOIN bike AS T2 ON T1.bike_id  =  T2.id JOIN cyclist AS T3 ON T1.cyclist_id  =  T3.id WHERE T3.name  =  'Antonio Tauler'
SELECT name ,  nation ,  result FROM cyclist WHERE id NOT IN (SELECT cyclist_id FROM cyclists_own_bikes)
SELECT product_name FROM bike WHERE material LIKE '%fiber%'
SELECT count(*) FROM cyclists_own_bikes AS T1 JOIN cyclist AS T2 ON T1.cyclist_id  =  T2.id GROUP BY T1.cyclist_id ORDER BY T1.cyclist_id
SELECT item ,  price FROM goods ORDER BY price DESC LIMIT 1
SELECT item ,  price FROM goods WHERE food  =  'cake' ORDER BY price DESC LIMIT 1
SELECT item ,  price FROM goods ORDER BY price ASC LIMIT 1
SELECT id ,  flavor FROM goods ORDER BY price ASC LIMIT 1
SELECT id FROM goods WHERE flavor  =  "apple"
SELECT id FROM goods WHERE flavor  =  "apple"
SELECT id FROM goods WHERE price  <  3
SELECT id FROM goods WHERE price  <  3
SELECT DISTINCT T1.id FROM goods AS T1 JOIN items AS T2 ON T2.item  =  T1.id WHERE T1.food  =  'cake' AND T1.flavor  =  'lemon'
SELECT DISTINCT T1.id FROM goods AS T1 JOIN items AS T2 ON T1.id  =  T2.item WHERE T1.food  =  "cake" AND T1.flavor  =  "lemon"
SELECT T2.Food ,  count(DISTINCT T1.customerid) FROM receipts AS T1 JOIN items AS T2 ON T1.ReceiptNumber  =  T2.Receipt WHERE T2.item IN (SELECT id FROM goods GROUP BY food) GROUP BY T2.item
SELECT T2.food ,  count(*) FROM items AS T1 JOIN goods AS T2 ON T1.item  =  T2.id JOIN receipts AS T3 ON T3.ReceiptNumber  =  T1.Receipt GROUP BY T2.food
SELECT T1.id FROM customers AS T1 JOIN receipts AS T2 ON T1.id  =  T2.customerid JOIN items AS T3 ON T2.receiptnumber  =  T3.receipt WHERE T3.item  =  (SELECT T4.id FROM goods AS T4 WHERE T4.food  =  'bakery' GROUP BY T4.id HAVING count(*)  >=  15)
SELECT count(*) ,  T1.customerid FROM customers AS T1 JOIN receipts AS T2 ON T1.id  =  T2.customerid GROUP BY T1.id HAVING count(*)  >=  15
SELECT T3.LastName FROM items AS T1 JOIN goods AS T2 ON T1.Item  =  T2.Id JOIN customers AS T3 ON T4.CustomerId  =  T3.Id JOIN receipts AS T4 ON T4.ReceiptNumber  =  T1.Receipt WHERE T2.Food  =  "bakery" GROUP BY T3.LastName HAVING count(*)  >  10
SELECT T2.LastName FROM items AS T1 JOIN customers AS T2 ON T1.Receipt  =  T2.id GROUP BY T1.Receipt HAVING count(*)  >  10
SELECT count(DISTINCT food) FROM goods WHERE flavor  =  "Cake"
SELECT count(DISTINCT food) FROM goods
SELECT flavor FROM goods WHERE food  =  "Croissant"
SELECT flavor FROM goods WHERE food  =  "croissant"
SELECT DISTINCT T2.item FROM receipts AS T1 JOIN items AS T2 ON T1.ReceiptNumber  =  T2.Receipt WHERE T1.CustomerId  =  15
SELECT DISTINCT T2.item FROM receipts AS T1 JOIN items AS T2 ON T1.ReceiptNumber  =  T2.Receipt WHERE T1.CustomerId  =  15
SELECT avg(price) ,  max(price) ,  min(price) FROM goods GROUP BY food
SELECT food ,  avg(price) ,  min(price) ,  max(price) FROM goods GROUP BY food
SELECT T1.Receipt FROM items AS T1 JOIN goods AS T2 ON T1.Item  =  T2.Id WHERE T2.food  =  "Cake" INTERSECT SELECT T1.Receipt FROM items AS T1 JOIN goods AS T2 ON T1.Item  =  T2.Id WHERE T2.food  =  "Cookie"
SELECT T1.ReceiptNumber FROM items AS T1 JOIN goods AS T2 ON T1.Item  =  T2.Id WHERE T2.food  =  'cake' INTERSECT SELECT T1.ReceiptNumber FROM items AS T1 JOIN goods AS T2 ON T1.Item  =  T2.Id WHERE T2.food  =  'cookie'
SELECT T2.ReceiptNumber FROM goods AS T1 JOIN items AS T2 ON T1.Id  =  T2.Item JOIN receipts AS T3 ON T2.Receipt  =  T3.ReceiptNumber JOIN customers AS T4 ON T3.CustomerId  =  T4.Id WHERE T4.LastName  =  'LOGAN' AND T1.Food  =  'Croissant'
SELECT T1.ReceiptNumber FROM receipts AS T1 JOIN items AS T2 ON T1.ReceiptNumber  =  T2.Receipt WHERE T2.item  =  (SELECT T4.id FROM goods AS T4 WHERE T4.food  =  'croissant' AND T4.flavor  =  'Lemon' AND T3.last  =  'Logan' )
SELECT T2.ReceiptNumber ,  T2.date FROM goods AS T1 JOIN items AS T2 ON T1.id  =  T2.item ORDER BY T1.price DESC LIMIT 1
SELECT T2.receiptnumber ,  T2.date FROM goods AS T1 JOIN items AS T2 ON T1.id  =  T2.item ORDER BY T1.price DESC LIMIT 1
SELECT item FROM items GROUP BY item ORDER BY count(*) ASC LIMIT 1
SELECT item FROM items GROUP BY item ORDER BY count(*) ASC LIMIT 1
SELECT count(*) ,  food FROM goods GROUP BY food
SELECT food ,  count(*) FROM goods GROUP BY food
SELECT food ,  avg(price) FROM goods GROUP BY food
SELECT food ,  avg(price) FROM goods GROUP BY food
SELECT id FROM goods WHERE flavor  =  "Apricot" AND price  <  5
SELECT id FROM goods WHERE flavor  =  "Apricot" AND price  <  5
SELECT flavor FROM goods WHERE price  >  10
SELECT flavor FROM goods WHERE price  >  10
SELECT DISTINCT id ,  price FROM goods WHERE price  <  (SELECT avg(price) FROM goods)
SELECT DISTINCT id ,  price FROM goods WHERE price  <  (SELECT avg(price) FROM goods)
SELECT DISTINCT id FROM goods WHERE price  <  (SELECT min(price) FROM goods WHERE flavor  =  "Tart")
SELECT DISTINCT id FROM goods WHERE price  <  (SELECT min(price) FROM goods WHERE flavor  =  "Tart")
SELECT DISTINCT T2.Receipt FROM goods AS T1 JOIN items AS T2 ON T1.id  =  T2.item WHERE T1.price  >  13
SELECT DISTINCT T1.ReceiptNumber FROM items AS T1 JOIN goods AS T2 ON T1.Item  =  T2.Id WHERE T2.Price  >  13
SELECT T1.date FROM receipts AS T1 JOIN items AS T2 ON T1.ReceiptNumber  =  T2.Receipt WHERE T2.item  =  (SELECT T4.id FROM goods AS T4 WHERE T4.price  >  15)
SELECT T1.date FROM receipts AS T1 JOIN items AS T2 ON T1.ReceiptNumber  =  T2.Receipt WHERE T2.item  =  (SELECT T4.id FROM goods AS T4 WHERE T4.price  >  15)
SELECT id FROM goods WHERE id LIKE "%APP%"
SELECT id FROM goods WHERE id LIKE "%APP%"
SELECT price FROM goods WHERE id LIKE "%70%"
SELECT id ,  price FROM goods WHERE id LIKE "%70%"
SELECT lastname FROM customers ORDER BY lastname
SELECT lastname FROM customers ORDER BY lastname
SELECT item FROM items ORDER BY ordinal
SELECT DISTINCT item FROM items
SELECT T1.receiptnumber FROM receipts AS T1 JOIN items AS T2 ON T2.Receipt  =  T1.ReceiptNumber JOIN goods AS T3 ON T2.Item  =  T3.Id WHERE T3.Flavor  =  "Apple Flavor" AND T3.Food  =  "Pie" UNION SELECT T1.receiptnumber FROM receipts AS T1 JOIN items AS T2 ON T2.Receipt  =  T1.ReceiptNumber JOIN goods AS T3 ON T2.Item  =  T3.Id WHERE T1.customerid  =  12
SELECT T1.ReceiptNumber FROM items AS T1 JOIN goods AS T2 ON T1.Item  =  T2.Id WHERE T2.flavor  =  'apple' AND T2.food  =  'pie' UNION SELECT T1.ReceiptNumber FROM receipts AS T1 JOIN customers AS T2 ON T1.CustomerId  =  T2.Id WHERE T2.LastName  =  'Smith' AND T2.FirstName  =  'John'
SELECT receiptnumber ,  date FROM receipts ORDER BY date DESC LIMIT 1
SELECT receiptnumber ,  date FROM receipts ORDER BY date DESC LIMIT 1
SELECT T1.ReceiptNumber FROM receipts AS T1 JOIN items AS T2 ON T1.ReceiptNumber  =  T2.Receipt WHERE T2.item  >  10 OR T1.date  =  (SELECT min(date) FROM receipts)
SELECT T1.ReceiptNumber FROM receipts AS T1 JOIN items AS T2 ON T1.ReceiptNumber  =  T2.Receipt WHERE T2.item  =  (SELECT T4.id FROM goods AS T3 JOIN items AS T4 ON T3.id  =  T4.item WHERE T3.price  >  10 UNION SELECT T4.id FROM goods AS T3 JOIN items AS T4 ON T3.id  =  T4.item ORDER BY T3.price ASC LIMIT 1)
SELECT id FROM goods WHERE price BETWEEN 3 AND 7 AND food  =  "Cookie" UNION SELECT id FROM goods WHERE price BETWEEN 3 AND 7 AND food  =  "Cake"
SELECT id FROM goods WHERE price BETWEEN 3 AND 7 AND (flavor  =  "Cookies" OR food  =  "Cakes")
SELECT T2.FirstName ,  T2.LastName FROM receipts AS T1 JOIN customers AS T2 ON T1.CustomerId  =  T2.Id ORDER BY T1.date LIMIT 1
SELECT T2.FirstName , T2.LastName FROM receipts AS T1 JOIN customers AS T2 ON T1.CustomerId  =  T2.Id ORDER BY T1.Date LIMIT 1
SELECT avg(price) FROM goods WHERE flavor  =  "blackberry" OR flavor  =  "blueberry"
SELECT avg(price) FROM goods WHERE flavor LIKE '%blackberry%' OR flavor LIKE '%blueberry%'
SELECT min(price) FROM goods WHERE flavor  =  "cheese"
SELECT item FROM items AS T1 JOIN goods AS T2 ON T1.item  =  T2.id WHERE T2.flavor  =  "cheese" ORDER BY T2.price LIMIT 1
SELECT max(price) ,  min(price) ,  avg(price) FROM goods GROUP BY flavor ORDER BY flavor
SELECT max(price) ,  min(price) ,  avg(price) ,  flavor FROM goods GROUP BY flavor ORDER BY flavor
SELECT min(price) ,  max(price) FROM goods GROUP BY food ORDER BY food
SELECT min(price) ,  max(price) FROM goods ORDER BY food
SELECT Date FROM receipts GROUP BY Date ORDER BY count(*) DESC LIMIT 3
SELECT T1.Date FROM receipts AS T1 JOIN items AS T2 ON T1.ReceiptNumber  =  T2.Receipt WHERE T1.CustomerId  =  6 SELECT T1.Date FROM receipts AS T1 JOIN items AS T2 ON T1.ReceiptNumber  =  T2.Receipt GROUP BY T1.Date ORDER BY count(*) DESC LIMIT 3
SELECT count(*) FROM receipts AS T1 JOIN items AS T2 ON T1.ReceiptNumber  =  T2.Receipt WHERE T1.customerid  =  (SELECT T1.customerid FROM receipts AS T1 JOIN items AS T2 ON T1.ReceiptNumber  =  T2.Receipt GROUP BY T1.customerid ORDER BY count(*) DESC LIMIT 1)
SELECT customerid ,  count(*) FROM receipts GROUP BY customerid ORDER BY count(*) DESC LIMIT 1
SELECT count(DISTINCT customerid) ,  date FROM receipts GROUP BY date
SELECT count(*) ,  T2.date FROM receipts AS T1 JOIN customers AS T2 ON T1.customerid  =  T2.id GROUP BY T2.date
SELECT T3.firstname ,  T3.lastname FROM items AS T1 JOIN goods AS T2 ON T1.item  =  T2.id JOIN customers AS T3 ON T3.id  =  T1.Receipt WHERE T2.flavor  =  "apple flavor" AND T2.food  =  "Tart"
SELECT T3.FirstName ,  T3.LastName FROM items AS T1 JOIN goods AS T2 ON T1.Item  =  T2.Id JOIN customers AS T3 ON T3.Id  =  T1.CustomerId WHERE T2.Food  =  "Tarts" AND T2.Flavor  =  "Apple"
SELECT id FROM goods WHERE price  <  (SELECT min(price) FROM goods WHERE flavor  =  'Croissant')
SELECT id FROM goods WHERE price  <  (SELECT min(price) FROM goods WHERE food  =  'croissant')
SELECT id FROM goods WHERE price >= (SELECT avg(price) FROM goods WHERE flavor  =  "Tart")
SELECT id FROM goods WHERE price >= (SELECT avg(price) FROM goods WHERE flavor  =  "Tart")
SELECT id FROM goods WHERE price  >  2*(SELECT avg(price) FROM goods)
SELECT id FROM goods WHERE price  >  (SELECT avg(price) FROM goods) * 2
SELECT item ,  flavor ,  food FROM goods ORDER BY price
SELECT id ,  flavor ,  food FROM goods ORDER BY price
SELECT id ,  flavor FROM goods WHERE food  =  "Cake" ORDER BY flavor
SELECT id ,  flavor FROM goods ORDER BY flavor
SELECT item FROM items AS T1 JOIN goods AS T2 ON T1.item  =  T2.id WHERE T2.flavor  =  'chocolate' GROUP BY T1.item HAVING count(*)  >  10
SELECT item FROM items AS T1 JOIN goods AS T2 ON T1.item  =  T2.id WHERE T2.flavor  =  'chocolate' GROUP BY T1.item HAVING count(*)  <=  10
SELECT Flavor FROM goods WHERE Food  =  "Cake" EXCEPT SELECT Flavor FROM goods WHERE Food  =  "Tart"
SELECT Flavor FROM goods WHERE Food  =  "Cake" AND Flavor NOT IN ( SELECT Flavor FROM goods WHERE Food  =  "Tart" )
SELECT item FROM items GROUP BY item ORDER BY count(*) DESC LIMIT 3
SELECT item FROM items ORDER BY ordinal DESC LIMIT 3
SELECT T2.id FROM items AS T1 JOIN customers AS T2 ON T1.receipt  =  T2.id JOIN goods AS T3 ON T1.item  =  T3.id GROUP BY T2.id HAVING sum(T3.price)  >  150
SELECT T2.id FROM receipts AS T1 JOIN customers AS T2 ON T1.customerid  =  T2.id JOIN items AS T3 ON T1.ReceiptNumber  =  T3.Receipt WHERE T1.CustomerId  =  T2.id GROUP BY T1.CustomerId HAVING sum(T3.Price)  >  150
SELECT T2.id FROM goods AS T1 JOIN customers AS T2 ON T1.id  =  T2.id JOIN items AS T3 ON T1.id  =  T3.item GROUP BY T2.id HAVING avg(T1.price)  >  5
SELECT T1.id FROM goods AS T1 JOIN receipts AS T2 JOIN items AS T3 ON T1.id  =  T3.item AND T2.ReceiptNumber  =  T3.ReceiptNumber GROUP BY T1.id HAVING avg(T1.price)  >  5
SELECT date FROM receipts AS T1 JOIN items AS T2 ON T1.ReceiptNumber  =  T2.Receipt WHERE price  >  100
SELECT T2.date FROM items AS T1 JOIN receipts AS T2 ON T1.receipt  =  T2.receiptnumber JOIN goods AS T3 ON T1.item  =  T3.id WHERE T3.price  >  100
SELECT count(*) FROM driver
SELECT count(*) FROM driver
SELECT count(*) ,  make FROM driver WHERE points  >  150 GROUP BY make
SELECT Make ,  COUNT(*) FROM driver WHERE Points  >  150 GROUP BY Make
SELECT avg(Age) ,  Make FROM driver GROUP BY Make
SELECT avg(Age) ,  Make FROM driver GROUP BY Make
SELECT avg(Laps) FROM driver WHERE Age  <  20
SELECT avg(Laps) FROM driver WHERE Age  <  20
SELECT Manager ,  Sponsor FROM team ORDER BY Car_Owner
SELECT Manager ,  Sponsor FROM team ORDER BY Car_Owner
SELECT Make FROM team GROUP BY Make HAVING COUNT(*)  >  1
SELECT Make FROM team GROUP BY Make HAVING COUNT(*)  >  1
SELECT Make FROM team WHERE Car_Owner  =  "Buddy Arrington"
SELECT Make FROM team WHERE Car_Owner  =  "Buddy Arrington"
SELECT max(Points) ,  min(Points) FROM driver
SELECT max(Points) ,  min(Points) FROM driver
SELECT count(*) FROM driver WHERE Points  <  150
SELECT count(*) FROM driver WHERE Points  <  150
SELECT Driver FROM driver ORDER BY Age ASC
SELECT Driver FROM driver ORDER BY Age ASC
SELECT Driver FROM driver ORDER BY Points DESC
SELECT Driver FROM driver ORDER BY Points DESC
SELECT T2.Driver ,  T1.Country FROM country AS T1 JOIN driver AS T2 ON T1.Country_ID  =  T2.Country
SELECT Driver ,  Country FROM driver
SELECT max(T1.Points) FROM driver AS T1 JOIN country AS T2 ON T1.Country  =  T2.Country_ID WHERE T2.Capital  =  "Dublin"
SELECT max(T1.Points) FROM driver AS T1 JOIN country AS T2 ON T1.Country  =  T2.Country_ID WHERE T2.Capital  =  "Dublin"
SELECT avg(T1.Age) FROM driver AS T1 JOIN country AS T2 ON T1.Country  =  T2.Country_ID WHERE T2.Official_native_language  =  "English"
SELECT avg(T2.age) FROM country AS T1 JOIN driver AS T2 ON T1.country_id  =  T2.country WHERE T1.official_native_language  =  "English"
SELECT T1.country FROM country AS T1 JOIN driver AS T2 ON T1.country_id  =  T2.country WHERE T2.points  >  150
SELECT T1.country FROM country AS T1 JOIN driver AS T2 ON T1.country_id  =  T2.country WHERE T2.points  >  150 GROUP BY T1.country_id HAVING count(*)  >=  2
SELECT T1.Capital FROM country AS T1 JOIN driver AS T2 ON T1.Country_ID  =  T2.Country WHERE T2.Points  =  (SELECT T2.Points FROM country AS T1 JOIN driver AS T2 ON T1.Country_ID  =  T2.Country ORDER BY T2.Points DESC LIMIT 1)
SELECT T2.Capital FROM driver AS T1 JOIN country AS T2 ON T1.Country  =  T2.Country_ID ORDER BY T1.Points DESC LIMIT 1
SELECT Make ,  COUNT(*) FROM driver GROUP BY Make
SELECT Make ,  COUNT(*) FROM driver GROUP BY Make
SELECT Make FROM driver GROUP BY Make ORDER BY COUNT(*) DESC LIMIT 1
SELECT Make FROM driver GROUP BY Make ORDER BY COUNT(*) DESC LIMIT 1
SELECT Make FROM driver GROUP BY Make HAVING COUNT(*)  >=  3
SELECT Make FROM driver GROUP BY Make HAVING COUNT(*)  >=  3
SELECT Team FROM team WHERE Team_ID NOT IN (SELECT Team_ID FROM team_driver)
SELECT Team FROM team WHERE Team_ID NOT IN (SELECT Team_ID FROM team_driver)
SELECT T1.country FROM country AS T1 JOIN driver AS T2 ON T1.country_id  =  T2.country WHERE T2.make  =  'Dodge' INTERSECT SELECT T1.country FROM country AS T1 JOIN driver AS T2 ON T1.country_id  =  T2.country WHERE T2.make  =  'Chevrolet'
SELECT T1.country FROM country AS T1 JOIN driver AS T2 ON T1.country_id  =  T2.country WHERE T2.make  =  'Dodge' INTERSECT SELECT T1.country FROM country AS T1 JOIN driver AS T2 ON T1.country_id  =  T2.country WHERE T2.make  =  'Chevrolet'
SELECT sum(Points) ,  avg(Points) FROM driver
SELECT sum(Points) ,  avg(Points) FROM driver
SELECT Country FROM country WHERE Country_id NOT IN (SELECT Country FROM driver)
SELECT country FROM country WHERE country_id NOT IN (SELECT country FROM driver)
SELECT T1.Manager ,  T1.Sponsor FROM team AS T1 JOIN team_driver AS T2 ON T1.Team_ID  =  T2.Team_ID GROUP BY T1.Team_ID ORDER BY count(*) DESC LIMIT 1
SELECT T2.Manager ,  T2.Sponsor FROM team_driver AS T1 JOIN team AS T2 ON T1.Team_ID  =  T2.Team_ID GROUP BY T1.Team_ID ORDER BY count(*) DESC LIMIT 1
SELECT T1.Manager ,  T1.Car_Owner FROM team AS T1 JOIN team_driver AS T2 ON T1.Team_ID  =  T2.Team_ID GROUP BY T1.Team_ID HAVING count(*)  >=  2
SELECT T2.Manager ,  T2.Car_Owner FROM team_driver AS T1 JOIN team AS T2 ON T1.Team_ID  =  T2.Team_ID GROUP BY T1.Team_ID HAVING COUNT(*)  >=  2
SELECT count(*) FROM institution
SELECT count(*) FROM institution
SELECT name FROM institution ORDER BY name ASC
SELECT name FROM institution ORDER BY name
SELECT name FROM institution ORDER BY founded
SELECT name FROM institution ORDER BY founded
SELECT city ,  province FROM institution
SELECT city ,  province FROM institution
SELECT max(Enrollment) ,  min(Enrollment) FROM institution
SELECT max(Enrollment) ,  min(Enrollment) FROM institution
SELECT Affiliation FROM institution WHERE City != "Vancouver"
SELECT Affiliation FROM institution WHERE City != 'Vancouver'
SELECT stadium FROM institution ORDER BY capacity DESC
SELECT stadium FROM institution ORDER BY capacity DESC
SELECT stadium FROM institution ORDER BY enrollment DESC LIMIT 1
SELECT stadium FROM institution ORDER BY enrollment DESC LIMIT 1
SELECT T1.Name ,  T2.Nickname FROM institution AS T1 JOIN Championship AS T2 ON T1.Institution_ID  =  T2.Institution_ID
SELECT T1.Name ,  T2.Nickname FROM institution AS T1 JOIN Championship AS T2 ON T1.Institution_ID  =  T2.Institution_ID
SELECT Nickname FROM championship AS T1 JOIN institution AS T2 ON T1.Institution_ID  =  T2.Institution_ID ORDER BY enrollment LIMIT 1
SELECT Nickname FROM championship ORDER BY Enrollment LIMIT 1
SELECT T2.Name FROM Championship AS T1 JOIN institution AS T2 ON T1.Institution_ID  =  T2.Institution_ID ORDER BY T1.Number_of_Championships DESC
SELECT T2.Name FROM Championship AS T1 JOIN institution AS T2 ON T1.Institution_ID  =  T2.Institution_ID ORDER BY T1.Number_of_Championships DESC
SELECT T2.Name FROM Championship AS T1 JOIN institution AS T2 ON T1.Institution_ID  =  T2.Institution_ID
SELECT T2.Name FROM Championship AS T1 JOIN institution AS T2 ON T1.Institution_ID  =  T2.Institution_ID GROUP BY T1.Institution_ID HAVING COUNT(*)  >=  1
SELECT sum(T2.number_of_championships) FROM institution AS T1 JOIN championship AS T2 ON T1.institution_id  =  T2.institution_id WHERE T1.affiliation  =  'Public'
SELECT sum(T2.Number_of_Championships) FROM institution AS T1 JOIN Championship AS T2 ON T1.Institution_ID  =  T2.Institution_ID WHERE T1.Affiliation  =  'Public'
SELECT count(*) ,  Affiliation FROM institution GROUP BY Affiliation
SELECT count(*) ,  affiliation FROM institution GROUP BY affiliation
SELECT Affiliation FROM institution GROUP BY Affiliation ORDER BY COUNT(*) DESC LIMIT 1
SELECT affiliation FROM institution GROUP BY affiliation ORDER BY count(*) DESC LIMIT 1
SELECT founded FROM institution GROUP BY founded HAVING COUNT(*)  >  1
SELECT YEAR ,  count(*) FROM institution GROUP BY YEAR HAVING count(*)  >  1
SELECT Nickname FROM championship ORDER BY capacity DESC
SELECT Nickname FROM Championship ORDER BY institution_id DESC END END
SELECT sum(enrollment) FROM institution WHERE city  =  'Vancouver' OR city  =  'Calgary'
SELECT Enrollment FROM institution WHERE City  =  "Vancouver" OR City  =  "Calgary"
SELECT province FROM institution WHERE founded  <  1920 INTERSECT SELECT province FROM institution WHERE founded  >  1950
SELECT province FROM institution WHERE founded  <  1920 INTERSECT SELECT province FROM institution WHERE founded  >  1950
SELECT count(DISTINCT Province) FROM institution
SELECT count(DISTINCT province) FROM institution
SELECT * FROM Warehouses
SELECT * FROM Warehouses
SELECT DISTINCT T2.contents FROM warehouses AS T1 JOIN boxes AS T2 ON T1.code  =  T2.warehouse WHERE T1.location  =  'New York'
SELECT DISTINCT T1.contents FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T2.location  =  'New York'
SELECT contents FROM boxes WHERE value  >  150
SELECT contents FROM boxes WHERE value  >  150
SELECT warehouse ,  avg(VALUE) FROM boxes GROUP BY warehouse
SELECT avg(T1.value) ,  T2.location FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code GROUP BY T2.location
SELECT avg(value) ,  sum(value) FROM boxes
SELECT avg(value) ,  sum(value) FROM boxes
SELECT avg(capacity) ,  sum(capacity) FROM warehouses
SELECT avg(capacity) ,  sum(capacity) FROM warehouses
SELECT contents ,  avg(value) ,  max(value) FROM boxes GROUP BY contents
SELECT contents ,  avg(value) ,  max(value) FROM boxes GROUP BY contents
SELECT contents FROM boxes GROUP BY contents ORDER BY sum(value) DESC LIMIT 1
SELECT contents FROM boxes ORDER BY value DESC LIMIT 1
SELECT avg(value) FROM boxes
SELECT avg(value) FROM boxes
SELECT DISTINCT contents FROM boxes
SELECT DISTINCT contents FROM boxes
SELECT count(DISTINCT contents) FROM boxes
SELECT count(DISTINCT contents) FROM boxes
SELECT DISTINCT LOCATION FROM Warehouses
SELECT DISTINCT LOCATION FROM Warehouses
SELECT T1.code FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T2.location  =  'Chicago' OR T2.location  =  'New York'
SELECT T1.code FROM warehouses AS T1 JOIN boxes AS T2 ON T1.code  =  T2.warehouse WHERE T1.location  =  'Chicago' OR T1.location  =  'New York'
SELECT sum(T2.value) FROM warehouses AS T1 JOIN boxes AS T2 ON T1.code  =  T2.warehouse WHERE T1.location  =  'Chicago' OR T1.location  =  'New York'
SELECT sum(T2.value) FROM warehouses AS T1 JOIN boxes AS T2 ON T1.code  =  T2.warehouse WHERE T1.location  =  'Chicago' OR T1.location  =  'New York'
SELECT T2.contents FROM warehouses AS T1 JOIN boxes AS T2 ON T1.code  =  T2.warehouse WHERE T1.location  =  'Chicago' INTERSECT SELECT T2.contents FROM warehouses AS T1 JOIN boxes AS T2 ON T1.code  =  T2.warehouse WHERE T1.location  =  'New York'
SELECT T1.contents FROM warehouses AS T1 JOIN boxes AS T2 ON T1.code  =  T2.warehouse WHERE T1.location  =  'Chicago' INTERSECT SELECT T1.contents FROM warehouses AS T1 JOIN boxes AS T2 ON T1.code  =  T2.warehouse WHERE T1.location  =  'New York'
SELECT DISTINCT T1.contents FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T2.location != 'New York'
SELECT DISTINCT T1.contents FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T2.location != 'New York'
SELECT T1.location FROM Warehouses AS T1 JOIN Boxes AS T2 ON T1.code  =  T2.warehouse WHERE T2.contents  =  'Rocks' EXCEPT SELECT T1.location FROM Warehouses AS T1 JOIN Boxes AS T2 ON T1.code  =  T2.warehouse WHERE T2.contents  =  'Scissors'
SELECT T1.location FROM Warehouses AS T1 JOIN boxes AS T2 ON T1.code  =  T2.warehouse WHERE T2.contents  =  'Rocks' EXCEPT SELECT T1.location FROM Warehouses AS T1 JOIN boxes AS T2 ON T1.code  =  T2.warehouse WHERE T2.contents  =  'Scissors'
SELECT DISTINCT T1.location FROM warehouses AS T1 JOIN boxes AS T2 ON T1.code  =  T2.warehouse WHERE T2.contents  =  'Rocks' OR T2.contents  =  'Scissors'
SELECT DISTINCT T1.location FROM warehouses AS T1 JOIN boxes AS T2 ON T1.code  =  T2.warehouse WHERE T2.contents  =  'Rocks' OR T2.contents  =  'Scissors'
SELECT T1.location FROM warehouses AS T1 JOIN boxes AS T2 ON T1.code  =  T2.warehouse WHERE T2.contents  =  'Rocks' INTERSECT SELECT T1.location FROM warehouses AS T1 JOIN boxes AS T2 ON T1.code  =  T2.warehouse WHERE T2.contents  =  'Scissors'
SELECT T1.location FROM Warehouses AS T1 JOIN boxes AS T2 ON T1.code  =  T2.warehouse WHERE T2.contents  =  'Rocks and Scissors'
SELECT code ,  contents FROM boxes ORDER BY value
SELECT code ,  contents FROM boxes ORDER BY value
SELECT code ,  contents FROM boxes ORDER BY value LIMIT 1
SELECT code ,  contents FROM boxes ORDER BY value LIMIT 1
SELECT DISTINCT contents FROM boxes WHERE value  >  (SELECT avg(value) FROM boxes)
SELECT DISTINCT contents FROM boxes WHERE value  >  (SELECT avg(value) FROM boxes)
SELECT DISTINCT contents FROM boxes ORDER BY contents
SELECT DISTINCT contents FROM boxes ORDER BY contents
SELECT code FROM boxes WHERE value  >  (SELECT min(value) FROM boxes WHERE contents  =  'Rocks')
SELECT code FROM boxes WHERE value  >  (SELECT min(value) FROM boxes WHERE contents  =  'Rocks')
SELECT code ,  contents FROM boxes WHERE value  >  (SELECT max(value) FROM boxes WHERE contents  =  'Scissors')
SELECT code ,  contents FROM boxes WHERE value  >  (SELECT max(value) FROM boxes WHERE contents  =  'Scissors')
SELECT sum(T2.value) FROM warehouses AS T1 JOIN boxes AS T2 ON T1.code  =  T2.warehouse WHERE T1.capacity  =  (SELECT max(capacity) FROM warehouses)
SELECT sum(T2.value) FROM warehouses AS T1 JOIN boxes AS T2 ON T1.code  =  T2.warehouse WHERE T1.capacity  =  (SELECT max(capacity) FROM warehouses)
SELECT warehouse ,  avg(VALUE) FROM boxes GROUP BY warehouse HAVING avg(VALUE)  >  150
SELECT avg(T1.value) ,  T2.location FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code GROUP BY T1.warehouse HAVING avg(T1.value)  >  150
SELECT contents ,  sum(value) ,  count(*) FROM boxes GROUP BY contents
SELECT contents ,  sum(value) ,  count(*) FROM boxes GROUP BY contents
SELECT sum(capacity) ,  avg(capacity) ,  max(capacity) ,  LOCATION FROM Warehouses GROUP BY LOCATION
SELECT sum(capacity) ,  avg(capacity) ,  max(capacity) ,  LOCATION FROM Warehouses GROUP BY LOCATION
SELECT sum(capacity) FROM warehouses
SELECT sum(capacity) FROM warehouses
SELECT max(T1.value) ,  T2.location FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code GROUP BY T2.location
SELECT max(T1.value) ,  T2.location FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code GROUP BY T2.location
SELECT warehouse ,  count(*) FROM boxes GROUP BY warehouse
SELECT count(*) ,  T1.location FROM warehouses AS T1 JOIN boxes AS T2 ON T1.code  =  T2.warehouse GROUP BY T1.location
SELECT count(DISTINCT T2.location) FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T1.contents  =  'Rocks'
SELECT count(DISTINCT T1.location) FROM warehouses AS T1 JOIN boxes AS T2 ON T1.code  =  T2.warehouse WHERE t2.contents  =  'Rocks'
SELECT T1.code ,  T2.location FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code
SELECT T1.code ,  T2.location FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code
SELECT T1.code FROM warehouses AS T1 JOIN boxes AS T2 ON T1.code  =  T2.warehouse WHERE T1.location  =  'Chicago'
SELECT T1.code FROM warehouses AS T2 JOIN boxes AS T1 ON T1.warehouse  =  T2.code WHERE T2.location  =  'Chicago'
SELECT count(*) ,  T1.location FROM warehouses AS T1 JOIN boxes AS T2 ON T1.code  =  T2.warehouse GROUP BY T1.location
SELECT count(*) ,  T1.location FROM warehouses AS T1 JOIN boxes AS T2 ON T1.code  =  T2.warehouse GROUP BY T1.location
SELECT count(DISTINCT T1.contents) ,  T2.location FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code GROUP BY T2.location
SELECT count(DISTINCT T1.contents) ,  T2.location FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code GROUP BY T2.location
SELECT code FROM warehouses WHERE capacity  <  (SELECT max(capacity) FROM warehouses)
SELECT T1.code FROM warehouses AS T1 JOIN boxes AS T2 ON T1.code  =  T2.warehouse WHERE T1.capacity  <  (SELECT count(*) FROM boxes AS T2 WHERE T1.code  =  T2.warehouse)
SELECT sum(T1.value) FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T2.location != 'Chicago'
SELECT sum(T1.value) FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T2.location != 'Chicago'
SELECT university_name ,  city ,  state FROM university ORDER BY university_name
SELECT university_name ,  city ,  state FROM university ORDER BY university_name
SELECT count(*) FROM university WHERE state  =  'Illinois' OR state  =  'Ohio'
SELECT count(*) FROM university WHERE state  =  'Illinois' OR state  =  'Ohio'
SELECT max(enrollment) ,  avg(enrollment) ,  min(enrollment) FROM university
SELECT max(enrollment) ,  avg(enrollment) ,  min(enrollment) FROM university
SELECT university_name FROM university WHERE enrollment  >  (SELECT avg(enrollment) FROM university)
SELECT university_name FROM university WHERE enrollment  >  (SELECT avg(enrollment) FROM university)
SELECT DISTINCT home_conference FROM university
SELECT DISTINCT home_conference FROM university
SELECT home_conference ,  count(*) FROM university GROUP BY home_conference
SELECT count(*) ,  home_conference FROM university GROUP BY home_conference
SELECT state FROM university GROUP BY state ORDER BY count(*) DESC LIMIT 1
SELECT state FROM university GROUP BY state ORDER BY count(*) DESC LIMIT 1
SELECT city FROM university GROUP BY city HAVING avg(enrollment)  >=  2000
SELECT city FROM university GROUP BY city HAVING avg(enrollment)  >=  2000
SELECT city FROM university GROUP BY city ORDER BY sum(enrollment) LIMIT 1
SELECT city FROM university GROUP BY city ORDER BY count(*) ASC LIMIT 1
SELECT major_name ,  major_code FROM major ORDER BY major_code
SELECT major_name ,  major_code FROM major ORDER BY major_code
SELECT T3.major_name ,  T2.rank FROM university AS T1 JOIN major_ranking AS T2 ON T1.university_id  =  T2.university_id JOIN major AS T3 ON T2.major_id  =  T3.major_id WHERE T1.university_name  =  "Augustana College"
SELECT T1.major_name ,  T2.rank FROM major AS T1 JOIN major_ranking AS T2 ON T1.major_id  =  T2.major_id JOIN university AS T3 ON T2.university_id  =  T3.university_id WHERE T3.university_name  =  "Augustana College"
SELECT TU.university_name ,  TU.city ,  TU.state FROM university AS TU JOIN major_ranking AS TR ON TU.university_id  =  TR.university_id JOIN major AS TM ON TR.major_id  =  TM.major_id WHERE TR.Rank  =  1 AND TM.Major_Name  =  "Accounting"
SELECT TU.university_name ,  TU.city ,  TU.state FROM university AS TU JOIN major_ranking AS TR ON TU.university_id  =  TR.university_id JOIN major AS TM ON TR.major_id  =  TM.major_id WHERE TM.Major_Name  =  "Accounting" ORDER BY TR.Rank LIMIT 1
SELECT T1.university_name FROM university AS T1 JOIN major_ranking AS T2 ON T1.university_id  =  T2.university_id WHERE T2.rank  =  1 GROUP BY T1.university_name ORDER BY count(*) DESC LIMIT 1
SELECT T1.university_name FROM university AS T1 JOIN major_ranking AS T2 ON T1.university_id  =  T2.university_id WHERE T2.rank  =  1 GROUP BY T2.university_id ORDER BY count(*) DESC LIMIT 1
SELECT university_name FROM university EXCEPT SELECT T1.university_name FROM university AS T1 JOIN major_ranking AS T2 ON T1.university_id  =  T2.university_id WHERE T2.rank  =  1
SELECT University_Name FROM university EXCEPT SELECT T1.University_Name FROM university AS T1 JOIN major_ranking AS T2 ON T1.University_ID  =  T2.University_ID WHERE T2.Rank  =  1
SELECT T1.university_name FROM university AS T1 JOIN major_ranking AS T2 ON T1.university_id  =  T2.university_id JOIN major AS T3 ON T2.major_id  =  T3.major_id WHERE T3.Major_Name  =  "Accounting" INTERSECT SELECT T1.university_name FROM university AS T1 JOIN major_ranking AS T2 ON T1.university_id  =  T2.university_id JOIN major AS T3 ON T2.major_id  =  T3.major_id WHERE T3.Major_Name  =  "Urban Education"
SELECT T3.university_name FROM major_ranking AS T1 JOIN major AS T2 ON T1.major_id  =  T2.major_id JOIN university AS T3 ON T1.university_id  =  T3.university_id WHERE T2.major_name  =  'Accounting' INTERSECT SELECT T3.university_name FROM major_ranking AS T1 JOIN major AS T2 ON T1.major_id  =  T2.major_id JOIN university AS T3 ON T1.university_id  =  T3.university_id WHERE T2.major_name  =  'Urban Education'
SELECT university_name ,  T1.rank FROM overall_ranking AS T1 JOIN university AS T2 ON T1.university_id  =  T2.university_id WHERE state  =  "Wisconsin"
SELECT University_Name ,  rank FROM university WHERE state  =  "Wisconsin"
SELECT T1.university_name FROM university AS T1 JOIN overall_ranking AS T2 ON T1.university_id  =  T2.university_id ORDER BY T2.research_point DESC LIMIT 1
SELECT T1.university_name FROM university AS T1 JOIN overall_ranking AS T2 ON T1.university_id  =  T2.university_id ORDER BY T2.research_point DESC LIMIT 1
SELECT T3.university_name FROM overall_ranking AS T1 JOIN university AS T2 ON T1.university_id  =  T2.university_id JOIN university AS T3 ON T1.reputation_point  =  T3.reputation_point ORDER BY T1.reputation_point ASC
SELECT T2.university_name FROM overall_ranking AS T1 JOIN university AS T2 ON T1.university_id  =  T2.university_id ORDER BY T1.reputation_point
SELECT TU.university_name FROM university AS TU JOIN major_ranking AS TR ON TU.university_id  =  TR.university_id JOIN major AS TM ON TR.major_id  =  TM.major_id WHERE TM.Major_Name  =  "Accounting" AND TR.rank  >=  3
SELECT T3.university_name FROM major_ranking AS T1 JOIN major AS T2 ON T1.major_id  =  T2.major_id JOIN university AS T3 ON T1.university_id  =  T3.university_id WHERE T2.major_name  =  'Accounting' AND T1.rank  >=  3
SELECT sum(enrollment) FROM university WHERE university_id IN ( SELECT university_id FROM overall_ranking WHERE rank  <=  5 )
SELECT sum(enrollment) FROM university WHERE overall_ranking  <=  5
SELECT university_name ,  citation_point FROM overall_ranking WHERE reputation_point  >  290 ORDER BY reputation_point DESC LIMIT 3
SELECT University_Name ,  citation_point FROM overall_ranking ORDER BY reputation_point DESC LIMIT 3
SELECT state FROM university WHERE enrollment  <  3000 GROUP BY state HAVING count(*)  >  2
SELECT state FROM university WHERE enrollment  <  3000 GROUP BY state HAVING count(*)  >  2
SELECT title FROM movies WHERE rating  =  null
SELECT title FROM movies WHERE title NOT IN (SELECT title FROM movies WHERE rating != "");
SELECT title FROM movies WHERE rating  =  'G'
SELECT title FROM movies WHERE rating  =  'G'
SELECT T1.title FROM movies AS T1 JOIN MovieTheaters AS T2 ON T1.code  =  T2.movie WHERE T2.name  =  'Odeon'
SELECT T1.title FROM movies AS T1 JOIN MovieTheaters AS T2 ON T1.code  =  T2.movie WHERE T2.name  =  'Odeon'
SELECT T2.name ,  T1.title FROM movies AS T1 JOIN MovieTheaters AS T2 ON T1.code  =  T2.Movie
SELECT T2.name ,  T1.title FROM movies AS T1 JOIN MovieTheaters AS T2 ON T1.code  =  T2.Movie
SELECT count(*) FROM Movies WHERE Rating  =  "G"
SELECT count(*) FROM Movies WHERE Rating  =  'G'
SELECT count(DISTINCT Movie) FROM MovieTheaters
SELECT count(DISTINCT movie) FROM MovieTheaters
SELECT count(DISTINCT Movie) FROM MovieTheaters
SELECT count(DISTINCT title) FROM movies
SELECT count(DISTINCT name) FROM MovieTheaters
SELECT count(DISTINCT name) FROM MovieTheaters
SELECT rating FROM movies WHERE title LIKE '%Citizen%'
SELECT T1.rating FROM movies AS T1 JOIN MovieTheaters AS T2 ON T1.code  =  T2.Movie WHERE T2.name LIKE '%Citizen%'
SELECT T2.name FROM movies AS T1 JOIN MovieTheaters AS T2 ON T1.code  =  T2.Movie WHERE T1.rating  =  'G' OR T1.rating  =  'PG'
SELECT T2.name FROM movies AS T1 JOIN MovieTheaters AS T2 ON T1.code  =  T2.Movie WHERE T1.rating  =  'G' OR T1.rating  =  'PG'
SELECT T2.title FROM MovieTheaters AS T1 JOIN movies AS T2 ON T1.Movie  =  T2.code WHERE T1.name  =  'Odeon' OR T1.name  =  'Imperial'
SELECT T2.title FROM MovieTheaters AS T1 JOIN movies AS T2 ON T1.Movie  =  T2.code WHERE T1.name  =  'Odeon' OR T1.name  =  'Imperial'
SELECT T2.title FROM MovieTheaters AS T1 JOIN movies AS T2 ON T1.movie  =  T2.code WHERE T1.name  =  'Odeon' INTERSECT SELECT T2.title FROM MovieTheaters AS T1 JOIN movies AS T2 ON T1.movie  =  T2.code WHERE T1.name  =  'Imperial'
SELECT T2.title FROM MovieTheaters AS T1 JOIN movies AS T2 ON T1.movie  =  T2.code WHERE T1.name  =  'Odeon' INTERSECT SELECT T2.title FROM MovieTheaters AS T1 JOIN movies AS T2 ON T1.movie  =  T2.code WHERE T1.name  =  'Imperial'
SELECT DISTINCT title FROM movies EXCEPT SELECT DISTINCT T1.title FROM movies AS T1 JOIN MovieTheaters AS T2 ON T1.code  =  T2.movie WHERE T2.name  =  'Odeon'
SELECT title FROM movies EXCEPT SELECT T2.title FROM MovieTheaters AS T1 JOIN movies AS T2 ON T1.movie  =  T2.code WHERE T1.name  =  'Odeon'
SELECT title FROM movies ORDER BY title
SELECT title FROM movies ORDER BY title
SELECT title FROM movies ORDER BY rating
SELECT title FROM movies ORDER BY rating
SELECT name FROM MovieTheaters GROUP BY name ORDER BY count(*) DESC LIMIT 1
SELECT name FROM movietheaters GROUP BY name ORDER BY count(*) DESC LIMIT 1
SELECT T2.title ,  T1.name FROM MovieTheaters AS T1 JOIN movies AS T2 ON T1.movie  =  T2.code GROUP BY T1.name ORDER BY count(*) DESC LIMIT 1
SELECT T2.title ,  T1.name FROM MovieTheaters AS T1 JOIN movies AS T2 ON T1.movie  =  T2.code GROUP BY T1.name ORDER BY count(*) DESC LIMIT 1
SELECT count(*) ,  rating FROM movies GROUP BY rating
SELECT rating ,  count(*) FROM movies GROUP BY rating
SELECT count(*) FROM Movies WHERE rating NOT NULL
SELECT count(*) FROM Movies WHERE rating NOT NULL
SELECT DISTINCT name FROM MovieTheaters AS T1 JOIN movies AS T2 ON T1.movie  =  T2.code
SELECT DISTINCT name FROM movietheaters AS T1 JOIN movies AS T2 ON T1.movie  =  T2.code
SELECT name FROM MovieTheaters EXCEPT SELECT T1.name FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie  =  T2.code
SELECT Name FROM MovieTheaters WHERE Movie IS NULL
SELECT T2.name FROM movies AS T1 JOIN MovieTheaters AS T2 ON T1.code  =  T2.Movie WHERE T1.rating  =  ‘G’
SELECT T2.name FROM movies AS T1 JOIN MovieTheaters AS T2 ON T1.code  =  T2.movie WHERE T1.rating  =  'G'
SELECT title FROM movies
SELECT DISTINCT title FROM movies
SELECT DISTINCT rating FROM movies
SELECT DISTINCT rating FROM Movies
SELECT * FROM movies WHERE rating  =  "null"
SELECT * FROM movies WHERE Rating  =  "none"
SELECT title FROM movies EXCEPT SELECT T1.title FROM movies AS T1 JOIN MovieTheaters AS T2 ON T1.code  =  T2.movie
SELECT title FROM movies EXCEPT SELECT T2.title FROM MovieTheaters AS T1 JOIN movies AS T2 ON T1.Movie  =  T2.code
SELECT T2.Name FROM Package AS T1 JOIN Client AS T2 ON T1.Recipient  =  T2.AccountNumber ORDER BY T1.Weight DESC LIMIT 1
SELECT T2.name FROM package AS T1 JOIN client AS T2 ON T1.recipient = T2.accountnumber ORDER BY weight DESC LIMIT 1
SELECT sum(weight) FROM package AS T1 JOIN client AS T2 ON T1.sender  =  T2.accountnumber WHERE T2.name  =  'Leo Wong'
SELECT sum(weight) FROM package AS T1 JOIN client AS T2 ON T1.sender  =  T2.accountnumber WHERE T2.name  =  'Leo Wong'
SELECT position FROM Employee WHERE name  =  'Amy Wong'
SELECT POSITION FROM Employee WHERE Name  =  "Amy Wong"
SELECT Salary ,  POSITION FROM Employee WHERE Name  =  "Turanga Leela"
SELECT Salary ,  POSITION FROM Employee WHERE Name  =  "Turanga Leela"
SELECT avg(Salary) FROM Employee WHERE POSITION  =  "Intern"
SELECT avg(Salary) FROM Employee WHERE POSITION  =  "Intern"
SELECT Level FROM Has_Clearance WHERE POSITION  =  "Physician"
SELECT LEVEL FROM Has_Clearance WHERE POSITION  =  "physician"
SELECT PackageNumber FROM Package WHERE Sender  =  112
SELECT count(*) FROM package AS T1 JOIN client AS T2 ON T1.sender  =  T2.accountnumber WHERE T2.name  =  'Leo Wong'
SELECT packagenumber FROM client AS T1 JOIN package AS T2 ON T1.accountnumber  =  T2.recipient WHERE T1.name  =  "Leo Wong"
SELECT packageNumber FROM Package WHERE recipient = (SELECT accountnumber FROM Client WHERE Name  =  "Leo Wong")
SELECT T1.contents FROM package AS T1 JOIN client AS T2 ON T1.sender  =  T2.accountnumber WHERE T2.name  =  'Leo Wong' UNION SELECT T1.contents FROM package AS T1 JOIN client AS T2 ON T1.recipient  =  T2.accountnumber WHERE T2.name  =  'Leo Wong'
SELECT DISTINCT PackageNumber FROM Package WHERE Sender  =  (SELECT AccountNumber FROM Client WHERE Name  =  "Leo Wong") OR Recipient  =  (SELECT AccountNumber FROM Client WHERE Name  =  "Leo Wong")
SELECT count(*) FROM Package AS T1 JOIN Client AS T2 ON T1.Sender  =  T2.AccountNumber JOIN Client AS T3 ON T1.Recipient  =  T3.AccountNumber WHERE T2.Name  =  "Ogden Wernstrom" AND T3.Name  =  "Leo Wong"
SELECT count(*) FROM package AS T1 JOIN client AS T2 ON T1.sender  =  T2.accountnumber JOIN client AS T3 ON T1.recipient  =  T3.accountnumber WHERE T2.name  =  'Ogden Wernstrom' AND T3.name  =  'Leo Wong'
SELECT T1.Contents FROM Package AS T1 JOIN Client AS T2 ON T1.Sender = T2.AccountNumber WHERE T2.Name  =  "John Zoidfarb"
SELECT T1.contents FROM package AS T1 JOIN client AS T2 ON T1.sender = T2.accountnumber WHERE T2.name  =  "John Zoidfarb"
SELECT T1.packageNumber ,  T1.weight FROM Package AS T1 JOIN Client AS T2 ON T1.sender  =  T2.accountNumber WHERE T2.name LIKE "%John%" ORDER BY T1.weight DESC LIMIT 1
SELECT T1.packageNumber ,  T1.weight FROM Package AS T1 JOIN Client AS T2 ON T1.Sender  =  T2.AccountNumber WHERE T2.Name LIKE 'John%' ORDER BY T1.weight DESC LIMIT 1
SELECT PackageNumber ,  Weight FROM Package ORDER BY Weight ASC LIMIT 3
SELECT packageNumber ,  weight FROM Package ORDER BY weight ASC LIMIT 3
SELECT T2.name ,  count(*) FROM package AS T1 JOIN client AS T2 ON T1.sender = T2.accountnumber GROUP BY T1.sender ORDER BY count(*) DESC LIMIT 1
SELECT T1.name ,  count(*) FROM Client AS T1 JOIN Package AS T2 ON T1.accountnumber  =  T2.sender GROUP BY T1.accountnumber ORDER BY count(*) DESC LIMIT 1
SELECT T2.name ,  count(*) FROM package AS T1 JOIN client AS T2 ON T1.recipient  =  T2.accountnumber GROUP BY T2.accountnumber ORDER BY count(*) ASC LIMIT 1
SELECT count(*) ,  Recipient FROM Package GROUP BY Recipient ORDER BY count(*) ASC LIMIT 1
SELECT T2.name FROM package AS T1 JOIN client AS T2 ON T1.sender = T2.accountnumber GROUP BY T2.accountnumber HAVING count(*)  >  1
SELECT T1.name FROM client AS T1 JOIN package AS T2 ON T1.accountnumber  =  T2.sender GROUP BY T1.accountnumber HAVING count(*)  >  1
SELECT Coordinates FROM Planet WHERE Name  =  "Mars"
SELECT coordinates FROM planet WHERE name  =  'Mars'
SELECT name ,  coordinates FROM planet ORDER BY name
SELECT name ,  coordinates FROM planet ORDER BY name
SELECT shipmentid FROM shipment WHERE manager IN (SELECT employeeid FROM employee WHERE name  =  'Phillip J. Fry')
SELECT ShipmentID FROM Shipment WHERE Manager = (SELECT EmployeeID FROM Employee WHERE Name  =  "Phillip J Fry")
SELECT Date FROM Shipment
SELECT Date FROM Shipment
SELECT ShipmentID FROM Shipment WHERE Planet IN (SELECT PlanetID FROM Planet WHERE Name  =  "Mars")
SELECT shipmentid FROM shipment WHERE planet  =  "Marso"
SELECT ShipmentID FROM shipment WHERE manager  =  (SELECT employeeid FROM employee WHERE name  =  'Turanga Leela') AND planet  =  (SELECT planetid FROM planet WHERE name  =  'Mars')
SELECT shipmentid FROM shipment AS T1 JOIN employee AS T2 ON T1.manager  =  T2.employeeid WHERE T1.planet  =  "Marx" AND T2.name  =  "Turanga Leela"
SELECT shipmentid FROM shipment WHERE manager LIKE "Turanga Leela" OR planet LIKE "Mar%";
SELECT T2.shipmentid FROM Employee AS T1 JOIN Shipment AS T2 ON T1.employeeid  =  T2.manager JOIN planet AS T3 ON T2.planet  =  T3.planetid WHERE T3.name  =  "Marx" AND T1.name  =  "Turanga Leela"
SELECT T3.Name ,  COUNT(*) FROM shipment AS T1 JOIN planet AS T2 ON T1.planet  =  T2.planetid JOIN planet AS T3 ON T1.planet  =  T3.planetid GROUP BY T1.planet
SELECT T1.name ,  count(*) FROM planet AS T1 JOIN shipment AS T2 ON T1.planetid  =  T2.planet GROUP BY T1.name
SELECT T1.name FROM planet AS T1 JOIN shipment AS T2 ON T1.planetid  =  T2.planet WHERE T2.shipmentid  =  (SELECT T2.shipmentid FROM planet AS T1 JOIN shipment AS T2 ON T1.planetid  =  T2.planet GROUP BY T1.name ORDER BY count(*) DESC LIMIT 1)
SELECT T1.Name FROM planet AS T1 JOIN shipment AS T2 ON T1.PlanetId  =  T2.Planet WHERE T1.Name  =  (SELECT T1.Name FROM planet AS T1 JOIN shipment AS T2 ON T1.PlanetId  =  T2.Planet GROUP BY T1.Name ORDER BY COUNT(*) DESC LIMIT 1)
SELECT T2.Name ,  COUNT(*) FROM Shipment AS T1 JOIN Employee AS T2 ON T1.Manager  =  T2.EmployeeID GROUP BY T1.Manager
SELECT count(*) ,  T1.name FROM Employee AS T1 JOIN Shipment AS T2 ON T1.employeeid  =  T2.manager GROUP BY T1.name
SELECT sum(weight) FROM planet AS T1 JOIN shipment AS T2 ON T1.planetid  =  T2.planet WHERE T1.name  =  'Mars'
SELECT sum(weight) FROM planet AS T1 JOIN shipment AS T2 ON T1.planetid  =  T2.planet WHERE T1.name  =  'Mars'
SELECT T3.name ,  sum(T2.weight) FROM shipment AS T1 JOIN package AS T2 ON T1.shipmentid  =  T2.shipment JOIN planet AS T3 ON T1.planet  =  T3.planetid GROUP BY T1.planet
SELECT T3.Name ,  sum(T2.weight) FROM shipment AS T1 JOIN package AS T2 ON T1.shipmentid  =  T2.shipment JOIN planet AS T3 ON T1.planet  =  T3.planetid GROUP BY T3.planetid
SELECT T3.name FROM shipment AS T1 JOIN package AS T2 ON T1.shipmentid  =  T2.shipment JOIN planet AS T3 ON T1.planet  =  T3.planetid WHERE T2.weight  >  30
SELECT T3.Name FROM Shipment AS T1 JOIN Package AS T2 ON T1.ShipmentID  =  T2.Shipment JOIN Planet AS T3 ON T1.Planet  =  T3.PlanetID GROUP BY T1.PlanetID HAVING sum(T2.Weight)  >  30
SELECT T1.packageNumber FROM Package AS T1 JOIN Shipment AS T2 ON T1.shipment  =  T2.shipmentid JOIN planet AS T3 ON T2.planet  =  T3.planetid JOIN employee AS T4 ON T4.employeeid  =  T2.manager WHERE T3.Name  =  'Omicron Persei 8' AND T4.Name  =  'Zapp Brannigan'
SELECT count(*) FROM package AS T1 JOIN shipment AS T2 ON T1.shipment  =  T2.shipmentid JOIN planet AS T3 ON T2.planet  =  T3.planetid JOIN employee AS T4 ON T4.employeeid  =  T2.manager WHERE T1.Sender  =  111 AND T3.Name  =  'Omicron Persei 8' AND T4.Name  =  'Zapp Brannigan'
SELECT T1.packageNumber FROM Package AS T1 JOIN Shipment AS T2 ON T1.shipment  =  T2.shipmentid JOIN planet AS T3 ON T2.planet  =  T3.planetid JOIN employee AS T4 ON T4.employeeid  =  T2.manager WHERE T3.Name  =  'Omicron Persei 8' OR T4.Name  =  'Zapp Brannigan'
SELECT count(*) FROM shipment AS T1 JOIN package AS T2 ON T1.shipmentid  =  T2.shipment WHERE T1.planet  =  11 OR T2.sender  =  101
SELECT PackageNumber ,  Weight FROM Package WHERE Weight BETWEEN 10 AND 30
SELECT PackageNumber ,  Weight FROM Package WHERE Weight BETWEEN 10 AND 30
SELECT name FROM employee WHERE employeeid NOT IN (SELECT employee FROM Has_clearance WHERE planet  =  'Mars')
SELECT name FROM employee WHERE employeeid NOT IN (SELECT employee FROM Has_clearance WHERE planet  =  'Mars')
SELECT T1.name FROM Employee AS T1 JOIN Has_Clearance AS T2 ON T1.employeeid  =  T2.employee WHERE T2.planet  =  'Omega III'
SELECT T1.name FROM Employee AS T1 JOIN Has_Clearance AS T2 ON T1.employeeid  =  T2.employee WHERE T2.planet  =  'Omega III'
SELECT P.Name FROM Planet AS P JOIN Has_Clearance AS H ON P.PlanetID  =  H.Planet WHERE H.level  =  1 GROUP BY H.planet HAVING count(*)  =  1
SELECT T2.Name FROM Has_Clearance AS T1 JOIN Planet AS T2 ON T1.Planet  =  T2.PlanetID GROUP BY T1.planet HAVING COUNT(*)  =  1
SELECT Name FROM Employee WHERE Salary BETWEEN 5000 AND 10000
SELECT name FROM employee WHERE salary BETWEEN 5000 AND 10000
SELECT name FROM employee WHERE salary  >  (SELECT avg(salary) FROM employee) OR salary  >  5000
SELECT name FROM employee WHERE salary  >  (SELECT avg(salary) FROM employee) OR salary  >  5000
SELECT count(*) FROM employee WHERE employeeid NOT IN (SELECT employee FROM Has_clearance WHERE planet  =  "Mars")
SELECT count(*) FROM Employee WHERE employeeid NOT IN (SELECT employee FROM Has_clearance WHERE planet  =  'Mars')
SELECT count(*) FROM game
SELECT count(*) FROM game
SELECT Title ,  Developers FROM game ORDER BY Units_sold_Millions DESC
SELECT Title ,  Developers FROM game ORDER BY Units_sold_Millions DESC
SELECT avg(Units_sold_Millions) FROM game WHERE Developers != "Nintendo"
SELECT avg(Units_sold_Millions) FROM game WHERE Developers != "Nintendo"
SELECT Platform_name ,  Market_district FROM platform
SELECT platform_name ,  market_district FROM platform
SELECT Platform_name ,  Platform_ID FROM platform WHERE Download_rank  =  1
SELECT Platform_name ,  Platform_ID FROM platform WHERE Download_rank  =  1
SELECT max(Rank_of_the_year) ,  min(Rank_of_the_year) FROM player
SELECT max(Rank_of_the_year) ,  min(Rank_of_the_year) FROM player
SELECT count(*) FROM player WHERE Rank_of_the_year  <  3
SELECT count(*) FROM player WHERE Rank_of_the_year  <=  3
SELECT Player_name FROM player ORDER BY Player_name ASC
SELECT Player_name FROM player ORDER BY Player_name
SELECT Player_name ,  College FROM player ORDER BY Rank_of_the_year DESC
SELECT Player_name ,  College FROM player ORDER BY Rank_of_the_year DESC
SELECT T3.Player_name ,  T3.Rank_of_the_year FROM game AS T1 JOIN game_player AS T2 ON T1.Game_ID  =  T2.Game_ID JOIN player AS T3 ON T2.Player_ID  =  T3.Player_ID WHERE T1.Title  =  "Super Mario World"
SELECT T3.Player_name ,  T3.Rank_of_the_year FROM game AS T1 JOIN game_player AS T2 ON T1.Game_ID  =  T2.Game_ID JOIN player AS T3 ON T2.Player_ID  =  T3.Player_ID WHERE T1.Title  =  "Super Mario World"
SELECT DISTINCT T2.Developers FROM game_player AS T1 JOIN game AS T2 ON T1.Game_ID  =  T2.Game_ID JOIN player AS T3 ON T1.Player_ID  =  T3.Player_ID WHERE T3.College  =  "Auburn"
SELECT DISTINCT T2.Developers FROM game AS T1 JOIN platform AS T2 ON T1.Platform_ID  =  T2.Platform_ID JOIN game_player AS T3 JOIN player AS T4 ON T3.Player_ID  =  T4.Player_ID WHERE T4.College  =  "Auburn college"
SELECT avg(T2.Units_sold_Millions) FROM game AS T1 JOIN player AS T2 ON T1.Game_ID  =  T2.Game_ID WHERE T2.Position  =  "Guard"
SELECT avg(T2.Units_sold_Millions) FROM game AS T1 JOIN player AS T2 JOIN game_player AS T3 ON T1.Game_ID  =  T2.Game_ID AND T2.Player_ID  =  T3.Player_ID WHERE T2.Position  =  "Guard"
SELECT T1.title ,  T2.platform_name FROM game AS T1 JOIN platform AS T2 ON T1.platform_id  =  T2.platform_id
SELECT T1.Title ,  T2.Platform_name FROM game AS T1 JOIN platform AS T2 ON T1.Platform_ID  =  T2.Platform_ID
SELECT Title FROM game AS T1 JOIN platform AS T2 ON T1.Platform_ID  =  T2.Platform_ID WHERE T2.Market_district  =  "Asia" OR T2.Market_district  =  "USA"
SELECT Title FROM game AS T1 JOIN platform AS T2 ON T1.Platform_ID  =  T2.Platform_ID WHERE T2.Market_district  =  "Asia" OR T2.Market_district  =  "USA"
SELECT Franchise ,  COUNT(*) FROM game GROUP BY Franchise
SELECT Franchise ,  COUNT(*) FROM game GROUP BY Franchise
SELECT Franchise FROM game GROUP BY Franchise ORDER BY COUNT(*) DESC LIMIT 1
SELECT Franchise FROM game GROUP BY Franchise ORDER BY COUNT(*) DESC LIMIT 1
SELECT Franchise FROM game GROUP BY Franchise HAVING COUNT(*)  >=  2
SELECT Franchise FROM game GROUP BY Franchise HAVING COUNT(*)  >=  2
SELECT Player_name FROM player WHERE Player_ID NOT IN (SELECT Player_ID FROM game_player)
SELECT Player_name FROM player WHERE Player_ID NOT IN (SELECT Player_ID FROM game_player)
SELECT T3.Title FROM game_player AS T1 JOIN player AS T2 ON T1.Player_ID  =  T2.Player_ID JOIN game AS T3 ON T1.Game_ID  =  T3.Game_ID WHERE T2.College  =  "Oklahoma" INTERSECT SELECT T3.Title FROM game_player AS T1 JOIN player AS T2 ON T1.Player_ID  =  T2.Player_ID JOIN game AS T3 ON T1.Game_ID  =  T3.Game_ID WHERE T2.College  =  "Auburn"
SELECT T3.Title FROM game_player AS T1 JOIN player AS T2 ON T1.Player_ID  =  T2.Player_ID JOIN game AS T3 ON T1.Game_ID  =  T3.Game_ID WHERE T2.College  =  "Oklahoma" OR T2.College  =  "Auburn"
SELECT DISTINCT Franchise FROM game
SELECT DISTINCT Franchise FROM game
SELECT Title FROM game EXCEPT SELECT T1.Title FROM game AS T1 JOIN game_player AS T2 ON T1.Game_ID ,  T2.Game_ID WHERE T2.If_active  =  1 AND T2.Player_name  =  'Guard'
SELECT Title FROM game EXCEPT SELECT T1.Title FROM game AS T1 JOIN game_player AS T2 ON T1.Game_ID  =  T2.Game_ID JOIN player AS T3 ON T2.Player_ID  =  T3.Player_ID WHERE T3.Position  =  "Guard"
SELECT name FROM press ORDER BY Year_Profits_billion DESC
SELECT name FROM press ORDER BY Year_Profits_billion DESC
SELECT name FROM press WHERE month_profits_billion  >  15 OR year_profits_billion  >  15
SELECT name FROM press WHERE year_profits_billion  >  15 OR month_profits_billion  >  1
SELECT avg(Year_Profits_billion) ,  max(Year_Profits_billion) FROM press
SELECT avg(Year_Profits_billion) ,  max(Year_Profits_billion) FROM press
SELECT name FROM press ORDER BY month_profits_billion DESC LIMIT 1
SELECT name FROM press ORDER BY month_profits_billion DESC LIMIT 1
SELECT name FROM press ORDER BY month_profits_billion DESC LIMIT 1 UNION SELECT name FROM press ORDER BY month_profits_billion ASC LIMIT 1
SELECT name FROM press ORDER BY month_profits_billion DESC LIMIT 1 UNION SELECT name FROM press ORDER BY month_profits_billion ASC LIMIT 1
SELECT count(*) FROM author WHERE age  <  30
SELECT count(*) FROM author WHERE age  <  30
SELECT avg(age) ,  gender FROM author GROUP BY gender
SELECT gender ,  avg(age) FROM author GROUP BY gender
SELECT count(*) ,  gender FROM author WHERE age  >  30 GROUP BY gender
SELECT count(*) ,  gender FROM author WHERE age  >  30 GROUP BY gender
SELECT Title FROM book ORDER BY Release_date DESC
SELECT Title FROM book ORDER BY Release_date DESC
SELECT Book_Series ,  COUNT(*) FROM book GROUP BY Book_Series
SELECT Book_Series ,  COUNT(*) FROM book GROUP BY Book_Series
SELECT Title ,  Release_date FROM book ORDER BY Sale_Amount DESC LIMIT 5
SELECT Title ,  Release_date FROM book ORDER BY Sale_Amount DESC LIMIT 5
SELECT Book_Series FROM book WHERE Sale_Amount  >  1000 INTERSECT SELECT Book_Series FROM book WHERE Sale_Amount  <  500
SELECT Book_Series FROM book WHERE Sale_Amount  >  1000 INTERSECT SELECT Book_Series FROM book WHERE Sale_Amount  <  500
SELECT T1.name FROM author AS T1 JOIN book AS T2 ON T1.author_id  =  T2.author_id WHERE T2.Book_Series  =  "MM" INTERSECT SELECT T1.name FROM author AS T1 JOIN book AS T2 ON T1.author_id  =  T2.author_id WHERE T2.Book_Series  =  "LT"
SELECT T1.name FROM author AS T1 JOIN book AS T2 ON T1.author_id  =  T2.author_id WHERE T2.book_series  =  'MM' INTERSECT SELECT T1.name FROM author AS T1 JOIN book AS T2 ON T1.author_id  =  T2.author_id WHERE T2.book_series  =  'LT'
SELECT name ,  age FROM author WHERE author_id NOT IN (SELECT author_id FROM book)
SELECT name FROM author WHERE author_id NOT IN (SELECT author_id FROM book)
SELECT T1.name FROM author AS T1 JOIN book AS T2 ON T1.author_id  =  T2.author_id GROUP BY T1.author_id HAVING count(*)  >  1
SELECT T1.name FROM author AS T1 JOIN book AS T2 ON T1.author_id  =  T2.author_id GROUP BY T1.author_id HAVING count(*)  >  1
SELECT T1.title ,  T2.name ,  T3.name FROM book AS T1 JOIN author AS T2 ON T1.author_id  =  T2.author_id JOIN press AS T3 ON T1.press_id  =  T3.press_id ORDER BY T1.sale_amount DESC LIMIT 3
SELECT T1.title ,  T2.name ,  T3.name FROM book AS T1 JOIN author AS T2 ON T1.author_id  =  T2.author_id JOIN press AS T3 ON T1.press_id  =  T3.press_id ORDER BY T1.sale_amount DESC LIMIT 3
SELECT T2.name ,  sum(T1.sale_amount) FROM book AS T1 JOIN press AS T2 ON T1.press_id  =  T2.press_id GROUP BY T2.press_id
SELECT T2.name ,  sum(T1.sale_amount) FROM book AS T1 JOIN press AS T2 ON T1.press_id  =  T2.press_id GROUP BY T2.press_id
SELECT T2.Name ,  COUNT(*) FROM book AS T1 JOIN press AS T2 ON T1.Press_ID  =  T2.Press_ID WHERE T1.Sale_Amount  >  1000 GROUP BY T2.Name
SELECT T2.name ,  COUNT(*) FROM book AS T1 JOIN press AS T2 ON T1.press_id  =  T2.press_id WHERE T1.sale_amount  >  1000 GROUP BY T2.press_id
SELECT T1.Name FROM author AS T1 JOIN book AS T2 ON T1.Author_ID  =  T2.Author_ID ORDER BY T2.Sale_Amount DESC LIMIT 1
SELECT T1.name FROM author AS T1 JOIN book AS T2 ON T1.author_id  =  T2.author_id ORDER BY T2.sale_amount DESC LIMIT 1
SELECT T1.name ,  T1.gender FROM author AS T1 JOIN book AS T2 ON T1.author_id  =  T2.author_id GROUP BY T2.author_id ORDER BY count(*) DESC LIMIT 1
SELECT T2.name ,  T2.gender FROM book AS T1 JOIN author AS T2 ON T1.author_id  =  T2.author_id GROUP BY T2.author_id ORDER BY count(*) DESC LIMIT 1
SELECT name FROM author EXCEPT SELECT T1.name FROM author AS T1 JOIN book AS T2 ON T1.author_id  =  T2.author_id JOIN press AS T3 ON T3.press_id  =  T2.press_id WHERE T3.name  =  "Accor"
SELECT T1.Name FROM author AS T1 JOIN book AS T2 ON T1.Author_ID  =  T2.Author_ID JOIN press AS T3 ON T3.Press_ID  =  T2.Press_ID WHERE T3.Name != "Accor"
SELECT T1.name ,  T1.year_profits_billion FROM press AS T1 JOIN book AS T2 ON T1.press_id  =  T2.press_id GROUP BY T1.press_id HAVING count(*)  >  2
SELECT T1.name ,  T1.year_profits_billion FROM press AS T1 JOIN book AS T2 ON T1.press_id  =  T2.press_id GROUP BY T1.press_id HAVING count(*)  >  2
SELECT count(*) FROM AUTHORS
SELECT author_name FROM AUTHORS
SELECT author_name ,  other_details FROM Authors
SELECT other_details FROM Authors WHERE author_name  =  "Addison Denesik"
SELECT count(*) FROM Documents
SELECT author_name FROM Documents WHERE document_id = 4;
SELECT author_name FROM Documents WHERE document_name  =  "Travel to Brazil"
SELECT count(*) FROM Documents WHERE author_name  =  "Era Kerluke"
SELECT document_name ,  document_description FROM Documents
SELECT document_id ,  document_name FROM Documents WHERE author_name  =  "Bianka Cummings"
SELECT author_name ,  other_details FROM Documents WHERE document_name  =  "Travel to China"
SELECT author_name ,  count(*) FROM Documents GROUP BY author_name
SELECT author_name FROM documents GROUP BY author_name ORDER BY count(*) DESC LIMIT 1
SELECT T1.author_name FROM authors AS T1 JOIN documents AS T2 ON T1.author_name  =  T2.author_name GROUP BY T1.author_name HAVING count(*)  >=  2
SELECT count(*) FROM Business_Processes
SELECT next_process_id ,  process_name ,  process_description FROM Business_Processes WHERE process_id  =  9
SELECT process_name FROM Business_processes WHERE process_id  =  9
SELECT count(*) FROM process_outcomes
SELECT process_outcome_code ,  process_outcome_description FROM Process_Outcomes
SELECT process_outcome_description FROM Process_Outcomes WHERE process_outcome_code  =  "working"
SELECT count(*) FROM process_status
SELECT process_status_code ,  process_status_description FROM Process_Status
SELECT process_status_description FROM Process_Status WHERE process_status_code  =  "ct"
SELECT count(*) FROM staff
SELECT staff_id ,  staff_details FROM Staff
SELECT staff_details FROM Staff WHERE staff_id  =  100
SELECT count(*) FROM Ref_Staff_Roles
SELECT staff_role_code ,  staff_role_description FROM Ref_Staff_Roles
SELECT staff_role_description FROM Ref_Staff_Roles WHERE staff_role_code  =  "HR"
SELECT count(DISTINCT document_id) FROM Documents_processes
SELECT DISTINCT process_id FROM Documents_Processes
SELECT document_id FROM Documents EXCEPT SELECT document_id FROM Documents_processes
SELECT process_id FROM Documents_Processes EXCEPT SELECT process_id FROM Documents_Processes AS T1 JOIN Documents AS T2 ON T1.document_id  =  T2.document_id
SELECT T3.process_outcome_description ,  T4.process_status_description FROM Documents_processes AS T1 JOIN process_status AS T4 ON T1.process_status_code  =  T4.process_status_code JOIN process_outcomes AS T3 ON T1.process_outcome_code  =  T3.process_outcome_code WHERE T1.document_id  =  0
SELECT process_name FROM Business_Processes AS T1 JOIN Documents_Processes AS T2 ON T1.process_id  =  T2.process_id JOIN Documents AS T3 ON T3.document_id  =  T2.document_id WHERE T3.document_name  =  "Travel to Brazil"
SELECT process_id ,  count(*) FROM Documents_processes GROUP BY process_id
SELECT count(*) FROM staff_in_processes WHERE document_id = 0 AND process_id = 9
SELECT staff_id ,  count(*) FROM Staff_in_processes GROUP BY staff_id
SELECT T1.staff_role_code ,  count(*) FROM Staff_in_processes AS T1 JOIN Ref_Staff_Roles AS T2 ON T1.staff_role_code  =  T2.staff_role_code GROUP BY T1.staff_role_code
SELECT count(DISTINCT staff_role_code) FROM Staff_in_Processes WHERE staff_id  =  3
SELECT count(*) FROM Agencies
SELECT count(*) FROM Agencies
SELECT agency_id ,  agency_details FROM Agencies
SELECT agency_id ,  agency_details FROM Agencies
SELECT count(*) FROM clients
SELECT count(*) FROM CLIENTS
SELECT client_id ,  client_details FROM CLIENTS
SELECT client_id ,  client_details FROM CLIENTS
SELECT agency_id ,  count(*) FROM CLIENTS GROUP BY agency_id
SELECT count(*) ,  T1.agency_id FROM Agencies AS T1 JOIN Clients AS T2 ON T1.agency_id  =  T2.agency_id GROUP BY T1.agency_id
SELECT T1.agency_id ,  T1.agency_details FROM Agencies AS T1 JOIN CLIENTS AS T2 ON T1.agency_id  =  T2.agency_id GROUP BY T1.agency_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.agency_id ,  T1.agency_details FROM Agencies AS T1 JOIN CLIENTS AS T2 ON T1.agency_id  =  T2.agency_id GROUP BY T1.agency_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.agency_id ,  T1.agency_details FROM Agencies AS T1 JOIN CLIENTS AS T2 ON T1.agency_id  =  T2.agency_id GROUP BY T1.agency_id HAVING count(*)  >=  2
SELECT T1.agency_id ,  T1.agency_details FROM Agencies AS T1 JOIN CLIENTS AS T2 ON T1.agency_id  =  T2.agency_id GROUP BY T1.agency_id HAVING COUNT(*)  >=  2
SELECT T2.agency_details FROM clients AS T1 JOIN agencies AS T2 ON T1.agency_id  =  T2.agency_id WHERE T1.client_details  =  'Mac'
SELECT T2.agency_details FROM clients AS T1 JOIN agencies AS T2 ON T1.agency_id  =  T2.agency_id WHERE T1.client_details  =  "Mac"
SELECT client_details ,  agency_details FROM Agencies AS T1 JOIN Clients AS T2 ON T1.agency_id  =  T2.agency_id
SELECT client_details ,  agency_details FROM CLIENTS AS T1 JOIN Agencies AS T2 ON T1.agency_id  =  T2.agency_id
SELECT sic_code ,  COUNT(*) FROM CLIENTS GROUP BY sic_code
SELECT sic_code ,  COUNT(*) FROM CLIENTS GROUP BY sic_code
SELECT client_id ,  client_details FROM CLIENTS WHERE sic_code  =  "Bad"
SELECT client_details FROM CLIENTS WHERE sic_code  =  "Bad"
SELECT T2.agency_details FROM clients AS T1 JOIN agencies AS T2 ON T1.agency_id  =  T2.agency_id
SELECT T1.agency_id ,  T1.agency_details FROM Agencies AS T1 JOIN Clients AS T2 ON T1.agency_id  =  T2.agency_id
SELECT agency_id FROM Agencies EXCEPT SELECT agency_id FROM clients
SELECT agency_id FROM Agencies EXCEPT SELECT agency_id FROM clients
SELECT count(*) FROM Invoices
SELECT count(*) FROM Invoices
SELECT T1.invoice_id ,  T1.invoice_status ,  T1.invoice_details FROM Invoices AS T1 JOIN Clients AS T2 ON T1.client_id  =  T2.client_id
SELECT invoice_id ,  invoice_status ,  invoice_details FROM Invoices
SELECT client_id ,  count(*) FROM Invoices GROUP BY client_id
SELECT client_id ,  count(*) FROM Invoices GROUP BY client_id
SELECT client_id ,  client_details FROM clients WHERE client_id IN ( SELECT client_id FROM invoices GROUP BY client_id ORDER BY count(*) DESC LIMIT 1 )
SELECT T1.client_id ,  T1.client_details FROM clients AS T1 JOIN invoices AS T2 ON T1.client_id  =  T2.client_id GROUP BY T1.client_id ORDER BY count(*) DESC LIMIT 1
SELECT client_id FROM Invoices GROUP BY client_id HAVING count(*)  >=  2
SELECT client_id FROM Invoices GROUP BY client_id HAVING count(*)  >=  2
SELECT invoice_status ,  count(*) FROM Invoices GROUP BY invoice_status
SELECT invoice_status ,  count(*) FROM Invoices GROUP BY invoice_status
SELECT invoice_status FROM invoices GROUP BY invoice_status ORDER BY count(*) DESC LIMIT 1
SELECT invoice_status FROM invoices GROUP BY invoice_status ORDER BY count(*) DESC LIMIT 1
SELECT T2.invoice_status ,  T2.invoice_details ,  T1.client_id ,  T1.client_details ,  T1.agency_id ,  T1.agency_details FROM Clients AS T1 JOIN Invoices AS T2 ON T2.client_id  =  T1.client_id
SELECT T1.invoice_status ,  T1.invoice_details ,  T2.client_id ,  T2.client_details ,  T2.agency_id ,  T2.agency_details FROM Invoices AS T1 JOIN Clients AS T2 ON T1.client_id  =  T2.client_id
SELECT meeting_type ,  purpose_of_meeting FROM Meetings
SELECT meeting_type ,  other_details FROM Meetings
SELECT meeting_outcome ,  purpose_of_meeting FROM Meetings
SELECT meeting_outcome ,  purpose_of_meeting FROM Meetings
SELECT T1.payment_id ,  T1.payment_details FROM Payments AS T1 JOIN Invoices AS T2 ON T1.invoice_id  =  T2.invoice_id WHERE T2.invoice_status  =  'Working'
SELECT T1.payment_id ,  T1.payment_details FROM Payments AS T1 JOIN Invoices AS T2 ON T1.invoice_id  =  T2.invoice_id WHERE T2.invoice_status  =  'Working'
SELECT invoice_id ,  invoice_status FROM Invoices WHERE invoice_id NOT IN (SELECT invoice_id FROM Payments)
SELECT invoice_id ,  invoice_status FROM Invoices WHERE invoice_id NOT IN (SELECT invoice_id FROM Payments)
SELECT count(*) FROM payments
SELECT count(*) FROM payments
SELECT T1.payment_id ,  T2.invoice_id ,  T2.invoice_details FROM Payments AS T1 JOIN Invoices AS T2 ON T1.invoice_id  =  T2.invoice_id
SELECT payment_id ,  invoice_id ,  payment_details FROM Payments
SELECT DISTINCT invoice_id ,  invoice_status FROM payments
SELECT DISTINCT invoice_id ,  status FROM Invoices WHERE status LIKE 'paid'
SELECT invoice_id ,  count(*) FROM Payments GROUP BY invoice_id
SELECT T2.invoice_id ,  count(*) FROM payments AS T1 JOIN invoices AS T2 ON T1.invoice_id  =  T2.invoice_id GROUP BY T1.invoice_id
SELECT T1.invoice_id ,  T1.invoice_status ,  T1.invoice_details FROM Invoices AS T1 JOIN Payments AS T2 ON T1.invoice_id  =  T2.invoice_id GROUP BY T1.invoice_id ORDER BY count(*) DESC LIMIT 1
SELECT T2.invoice_id ,  T2.invoice_status ,  T2.invoice_details FROM Payments AS T1 JOIN Invoices AS T2 ON T1.invoice_id  =  T2.invoice_id GROUP BY T1.invoice_id ORDER BY count(*) DESC LIMIT 1
SELECT count(*) FROM staff
SELECT count(*) FROM staff
SELECT agency_id ,  count(*) FROM Staff GROUP BY agency_id
SELECT agency_id ,  count(*) FROM Staff GROUP BY agency_id
SELECT T1.agency_id ,  T1.agency_details FROM Agencies AS T1 JOIN Staff AS T2 ON T1.agency_id  =  T2.agency_id GROUP BY T1.agency_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.agency_id ,  T1.agency_details FROM Agencies AS T1 JOIN Staff AS T2 ON T1.agency_id  =  T2.agency_id GROUP BY T1.agency_id ORDER BY count(*) DESC LIMIT 1
SELECT meeting_outcome ,  count(*) FROM Meetings GROUP BY meeting_outcome
SELECT meeting_outcome ,  count(*) FROM Meetings GROUP BY meeting_outcome
SELECT client_id ,  count(*) FROM Meetings GROUP BY client_id
SELECT client_id ,  count(*) FROM Meetings GROUP BY client_id
SELECT count(*) ,  T1.meeting_type FROM Meetings AS T1 JOIN CLIENTS AS T2 ON T1.client_id  =  T2.client_id GROUP BY T1.meeting_type
SELECT meeting_type ,  count(*) FROM Meetings GROUP BY meeting_type
SELECT T2.meeting_id ,  T2.meeting_outcome ,  T2.meeting_type ,  T1.client_details FROM CLIENTS AS T1 JOIN MEETINGS AS T2 ON T1.client_id  =  T2.client_id
SELECT T2.meeting_id ,  T2.meeting_outcome ,  T2.meeting_type ,  T1.client_details FROM Meetings AS T2 JOIN Clients AS T1 ON T2.client_id  =  T1.client_id
SELECT meeting_id ,  count(*) FROM Staff_in_Meetings GROUP BY meeting_id
SELECT T1.meeting_id ,  count(*) FROM Meetings AS T1 JOIN Staff_in_Meetings AS T2 ON T1.meeting_id  =  T2.meeting_id GROUP BY T1.meeting_id
SELECT T1.staff_id ,  count(*) FROM Staff AS T1 JOIN Staff_in_Meetings AS T2 ON T1.staff_id  =  T2.staff_id GROUP BY T1.staff_id ORDER BY count(*) ASC LIMIT 1
SELECT staff_id FROM Staff_in_Meetings GROUP BY staff_id ORDER BY count(*) ASC LIMIT 1
SELECT count(DISTINCT staff_id) FROM Staff_in_Meetings
SELECT count(DISTINCT staff_id) FROM Staff_in_Meetings
SELECT count(*) FROM staff WHERE staff_id NOT IN ( SELECT staff_id FROM Staff_in_Meetings )
SELECT count(*) FROM staff WHERE staff_id NOT IN ( SELECT staff_id FROM Staff_in_Meetings )
SELECT client_id ,  client_details FROM CLIENTS UNION SELECT client_id ,  client_details FROM Meetings UNION SELECT client_id ,  client_details FROM Invoices
SELECT client_id ,  client_details FROM CLIENTS UNION SELECT client_id ,  client_details FROM Meetings UNION SELECT client_id ,  client_details FROM Invoices
SELECT T1.staff_id ,  T1.staff_details FROM Staff AS T1 JOIN Staff_in_Meetings AS T2 ON T1.staff_id  =  T2.staff_id GROUP BY T1.staff_id HAVING T1.staff_details LIKE '%s%'
SELECT T1.staff_id ,  T1.staff_details FROM Staff AS T1 JOIN Staff_in_Meetings AS T2 ON T1.staff_id  =  T2.staff_id WHERE T1.staff_details LIKE '%s%' GROUP BY T1.staff_id HAVING count(*)  >=  1
SELECT T1.client_id ,  T1.sic_code ,  T1.agency_id FROM CLIENTS AS T1 JOIN MEETINGS AS T2 ON T1.client_id  =  T2.client_id GROUP BY T1.client_id HAVING count(*)  =  1 INTERSECT SELECT T1.client_id ,  T1.sic_code ,  T1.agency_id FROM CLIENTS AS T1 JOIN INVOICES AS T2 ON T1.client_id  =  T2.client_id
SELECT T1.client_id ,  T1.sic_code ,  T1.agency_id FROM Clients AS T1 JOIN Invoices AS T2 ON T1.client_id  =  T2.client_id JOIN Meetings AS T3 ON T1.client_id  =  T3.client_id GROUP BY T1.client_id HAVING count(*)  =  1
SELECT T2.start_date_time ,  T2.end_date_time ,  T1.client_details ,  T3.staff_details FROM CLIENTS AS T1 JOIN MEETINGS AS T2 JOIN Staff AS T3 ON T1.client_id  =  T2.client_id AND T3.staff_id  =  T2.staff_id
SELECT T3.start_date_time ,  T3.end_date_time ,  T2.client_details ,  T4.staff_details FROM Meetings AS T3 JOIN Clients AS T2 ON T3.client_id  =  T2.client_id JOIN Staff_in_Meetings AS T1 ON T1.meeting_id  =  T3.meeting_id JOIN Staff AS T4 ON T1.staff_id  =  T4.staff_id
