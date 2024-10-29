SELECT count(*) FROM club
SELECT count(*) FROM club
SELECT Name FROM club ORDER BY Name ASC
SELECT Name FROM club ORDER BY Name ASC
SELECT Manager ,  Captain FROM club
SELECT Manager ,  Captain FROM club
SELECT name FROM club WHERE manufacturer != "Nike"
SELECT name FROM club WHERE manufacturer != 'Nike'
SELECT Name FROM player ORDER BY Wins_count ASC
SELECT T1.Name FROM player AS T1 JOIN club AS T2 ON T1.Club_ID  =  T2.Club_ID ORDER BY T1.Wins_count
SELECT Name FROM player ORDER BY Earnings DESC LIMIT 1
SELECT Name FROM player ORDER BY Earnings DESC LIMIT 1
SELECT DISTINCT Country FROM player WHERE Earnings  >  1200000
SELECT Country FROM player WHERE Earnings  >  1200000
SELECT Country FROM player WHERE Wins_count  >  2 ORDER BY Earnings DESC LIMIT 1
SELECT Country FROM player WHERE Wins_count  >  2 ORDER BY Earnings DESC LIMIT 1
SELECT T2.Name ,  T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID
SELECT T2.Name ,  T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID
SELECT T2.name FROM player AS T1 JOIN club AS T2 ON T1.club_id  =  T2.club_id GROUP BY T1.club_id HAVING sum(T1.wins_count)  >  2
SELECT T2.name FROM player AS T1 JOIN club AS T2 ON T1.club_id  =  T2.club_id WHERE T1.wins_count  >  2
SELECT T2.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID WHERE T1.Manager  =  "Sam Allardyce"
SELECT T2.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID WHERE T1.Manager  =  "Sam Allardyce"
SELECT T2.name FROM player AS T1 JOIN club AS T2 ON T1.club_id  =  T2.club_id GROUP BY T1.club_id ORDER BY avg(T1.Earnings) DESC
SELECT T2.name FROM player AS T1 JOIN club AS T2 ON T1.club_id  =  T2.club_id GROUP BY T1.club_id ORDER BY avg(T1.Earnings) DESC
SELECT Manufacturer ,  count(*) FROM club GROUP BY Manufacturer
SELECT Manufacturer ,  count(*) FROM club GROUP BY Manufacturer
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY count(*) DESC LIMIT 1
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY count(*) DESC LIMIT 1
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING count(*)  >  1
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING count(*)  >  1
SELECT Country FROM player GROUP BY Country HAVING count(*)  >  1
SELECT Country FROM player GROUP BY Country HAVING count(*)  >  1
SELECT Name FROM club WHERE Club_ID NOT IN (SELECT Club_ID FROM player)
SELECT Name FROM club WHERE Club_ID NOT IN (SELECT Club_ID FROM player)
SELECT Country FROM player WHERE Earnings  >  1400000 UNION SELECT Country FROM player WHERE Earnings  <  1100000
SELECT Country FROM player WHERE Earnings  >  1400000 INTERSECT SELECT Country FROM player WHERE Earnings  <  1100000
SELECT count(DISTINCT Country) FROM player
SELECT count(DISTINCT Country) FROM player
SELECT Earnings FROM player WHERE Country  =  "Australia" OR Country  =  "Zimbabwe"
SELECT Earnings FROM player WHERE Country  =  'Australia' OR Country  =  'Zimbabwe'
SELECT T1.customer_id ,  T2.customer_first_name ,  T2.customer_last_name FROM Orders AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id HAVING count(*)  >=  2 INTERSECT SELECT T1.customer_id ,  T2.customer_first_name ,  T2.customer_last_name FROM Order_items AS T1 JOIN Customers AS T2 ON T1.order_id IN (SELECT order_id FROM orders WHERE customer_id  =  T1.customer_id) GROUP BY T1.customer_id HAVING count(*)  >=  3
SELECT T2.customer_id ,  T1.customer_first_name ,  T1.customer_last_name FROM customers AS T1 JOIN orders AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T2.customer_id HAVING count(*)  >  2 INTERSECT SELECT T2.customer_id ,  T1.customer_first_name ,  T1.customer_last_name FROM customers AS T1 JOIN order_items AS T2 ON T1.customer_id  =  T2.order_id GROUP BY T2.customer_id HAVING count(*)  >  3
SELECT T1.order_id ,  T1.order_status_code ,  count(*) FROM orders AS T1 JOIN order_items AS T2 ON T1.order_id  =  T2.order_id GROUP BY T1.order_id
SELECT T2.order_status_code ,  T1.order_id ,  count(*) FROM orders AS T1 JOIN order_items AS T2 ON T1.order_id  =  T2.order_id GROUP BY T1.order_id
SELECT T2.date_order_placed FROM Order_Items AS T1 JOIN Orders AS T2 ON T1.order_id = T2.order_id GROUP BY T2.order_id HAVING count(*)  >  1 ORDER BY T2.date_order_placed ASC LIMIT 1 UNION SELECT date_order_placed FROM Orders ORDER BY date_order_placed ASC LIMIT 1
SELECT date_order_placed FROM orders WHERE order_id IN (SELECT order_id FROM order_items GROUP BY order_id HAVING count(*)  >  1) UNION SELECT date_order_placed FROM orders ORDER BY date_order_placed ASC LIMIT 1
SELECT customer_first_name ,  customer_middle_initial ,  customer_last_name FROM Customers EXCEPT SELECT T1.customer_first_name ,  T1.customer_middle_initial ,  T1.customer_last_name FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id  =  T2.customer_id
SELECT customer_first_name ,  customer_middle_initial ,  customer_last_name FROM customers WHERE customer_id NOT IN ( SELECT customer_id FROM orders )
SELECT product_id ,  product_name ,  product_price ,  product_color FROM products EXCEPT SELECT T1.product_id ,  T2.product_name ,  T2.product_price ,  T2.product_color FROM order_items AS T1 JOIN products AS T2 ON T1.product_id  =  T2.product_id GROUP BY T1.product_id HAVING count(*)  <  2
SELECT T1.product_id ,  T1.product_name ,  T1.product_price ,  T1.product_color FROM products AS T1 JOIN order_items AS T2 ON T1.product_id  =  T2.product_id GROUP BY T1.product_id HAVING count(*)  <  2
SELECT T1.order_id ,  T1.date_order_placed FROM orders AS T1 JOIN order_items AS T2 ON T1.order_id = T2.order_id GROUP BY T1.order_id HAVING count(*)  >=  2
SELECT T1.order_id ,  T1.date_order_placed FROM Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id  =  T2.order_id GROUP BY T1.order_id HAVING count(*)  >=  2
SELECT T1.product_id ,  T1.product_name ,  T1.product_price FROM products AS T1 JOIN order_items AS T2 ON T1.product_id  =  T2.product_id GROUP BY T1.product_id ORDER BY count(*) DESC LIMIT 1
SELECT T2.product_id ,  T2.product_name ,  T2.product_price FROM order_items AS T1 JOIN products AS T2 ON T1.product_id = T2.product_id GROUP BY T1.product_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.order_id ,  sum(T2.product_price) FROM orders AS T1 JOIN order_items AS T2 ON T1.order_id  =  T2.order_id GROUP BY T1.order_id ORDER BY sum(T2.product_price) LIMIT 1
SELECT sum(T2.product_price) ,  T1.order_id FROM orders AS T1 JOIN order_items AS T2 ON T1.order_id  =  T2.order_id GROUP BY T1.order_id ORDER BY sum(T2.product_price) ASC LIMIT 1
SELECT payment_method_code FROM customer_payment_methods GROUP BY payment_method_code ORDER BY count(*) DESC LIMIT 1
SELECT payment_method_code FROM customer_payment_methods GROUP BY payment_method_code ORDER BY count(*) DESC LIMIT 1
SELECT T2.gender_code ,  count(*) FROM customers AS T1 JOIN orders AS T2 ON T1.customer_id = T2.customer_id JOIN order_items AS T3 ON T2.order_id = T3.order_id JOIN products AS T4 ON T3.product_id = T4.product_id GROUP BY T2.customer_id
SELECT T2.gender_code ,  count(*) FROM customer_payment_methods AS T1 JOIN customers AS T2 ON T1.customer_id  =  T2.customer_id JOIN orders AS T3 ON T3.customer_id  =  T2.customer_id JOIN order_items AS T4 ON T4.order_id  =  T3.order_id GROUP BY T2.gender_code
SELECT T2.gender_code ,  count(*) FROM customers AS T1 JOIN orders AS T2 ON T1.customer_id = T2.customer_id GROUP BY T2.gender_code
SELECT T2.gender_code ,  count(*) FROM customers AS T1 JOIN orders AS T2 ON T1.customer_id = T2.customer_id GROUP BY T2.gender_code
SELECT T1.customer_first_name ,  T1.customer_middle_initial ,  T1.customer_last_name ,  T2.payment_method_code FROM customers AS T1 JOIN customer_payment_methods AS T2 ON T1.customer_id  =  T2.customer_id
SELECT T2.customer_first_name ,  T2.customer_middle_initial ,  T2.customer_last_name ,  T1.payment_method_code FROM customer_payment_methods AS T1 JOIN customers AS T2 ON T1.customer_id  =  T2.customer_id
SELECT T2.invoice_status_code ,  T2.invoice_date ,  T1.shipment_date FROM shipments AS T1 JOIN invoices AS T2 ON T1.invoice_number  =  T2.invoice_number
SELECT invoice_status_code ,  invoice_date ,  shipment_date FROM invoices JOIN shipments ON invoice_number = invoice_number
SELECT T3.product_name ,  T2.shipment_date FROM shipments AS T2 JOIN shipment_items AS T1 ON T2.shipment_id  =  T1.shipment_id JOIN order_items AS T4 ON T4.order_item_id  =  T1.order_item_id JOIN products AS T3 ON T4.product_id  =  T3.product_id
SELECT T2.product_name ,  T1.shipment_date FROM shipments AS T1 JOIN order_items AS T3 JOIN products AS T2 ON T1.order_id = T3.order_id AND T3.product_id = T2.product_id
SELECT T1.order_item_status_code ,  T2.shipment_tracking_number FROM Order_items AS T1 JOIN Shipments AS T2 ON T1.order_id  =  T2.order_id JOIN Shipment_items AS T3 ON T2.shipment_id  =  T3.shipment_id
SELECT T1.order_item_status_code ,  T2.shipment_tracking_number FROM Order_items AS T1 JOIN Shipments AS T2 ON T1.order_id = T2.order_id WHERE T1.order_item_status_code = "Ordered" AND T2.shipment_date != "null"
SELECT T3.product_name ,  T3.product_color FROM shipments AS T1 JOIN shipment_items AS T2 ON T1.shipment_id = T2.shipment_id JOIN order_items AS T3 ON T2.order_item_id = T3.order_item_id WHERE T1.shipment_date != "null"
SELECT T3.product_name ,  T3.product_color FROM shipments AS T1 JOIN shipment_items AS T2 ON T1.shipment_id  =  T2.shipment_id JOIN products AS T3 ON T2.order_item_id  =  T3.product_id
SELECT DISTINCT T3.product_name ,  T3.product_price ,  T3.product_description FROM customers AS T1 JOIN orders AS T2 ON T1.customer_id  =  T2.customer_id JOIN order_items AS T4 ON T2.order_id  =  T4.order_id JOIN products AS T3 ON T4.product_id  =  T3.product_id WHERE T1.gender_code  =  'F'
SELECT DISTINCT T3.product_name ,  T3.product_price ,  T3.product_description FROM customers AS T1 JOIN orders AS T2 ON T1.customer_id  =  T2.customer_id JOIN order_items AS T4 ON T2.order_id  =  T4.order_id JOIN products AS T3 ON T4.product_id  =  T3.product_id WHERE T1.gender_code  =  "F"
SELECT DISTINCT T2.invoice_status_code FROM orders AS T1 JOIN invoices AS T2 ON T1.order_id = T2.invoice_number WHERE T1.order_status_code != "Shipped"
SELECT DISTINCT invoice_status_code FROM invoices EXCEPT SELECT DISTINCT T1.invoice_status_code FROM invoices AS T1 JOIN shipments AS T2 ON T1.invoice_number  =  T2.invoice_number
SELECT T2.order_id ,  T2.date_order_placed ,  sum(T1.product_price) FROM products AS T1 JOIN orders AS T2 ON T1.product_id = T2.order_id GROUP BY T2.order_id
SELECT T2.order_id ,  T2.date_order_placed ,  sum(T1.product_price) FROM products AS T1 JOIN orders AS T2 ON T1.product_id  =  T2.order_item_id GROUP BY T2.order_id
SELECT count(DISTINCT customer_id) FROM orders
SELECT count(DISTINCT customer_id) FROM orders
SELECT count(DISTINCT order_item_status_code) FROM order_items
SELECT count(DISTINCT order_item_status_code) FROM order_items
SELECT count(DISTINCT payment_method_code) FROM customer_payment_methods
SELECT count(DISTINCT payment_method_code) FROM customer_payment_methods
SELECT login_name ,  login_password FROM customers WHERE phone_number LIKE '+12%'
SELECT login_name ,  login_password FROM customers WHERE phone_number LIKE '+12%'
SELECT product_size FROM products WHERE product_name LIKE "%Dell%"
SELECT product_size FROM products WHERE product_name LIKE "%Dell%"
SELECT product_price ,  product_size FROM products WHERE product_price  >  (SELECT avg(product_price) FROM products)
SELECT product_price ,  product_size FROM products WHERE product_price  >  (SELECT avg(product_price) FROM products)
SELECT count(*) FROM products WHERE product_id NOT IN ( SELECT product_id FROM order_items )
SELECT count(*) FROM products WHERE product_id NOT IN ( SELECT product_id FROM order_items )
SELECT count(*) FROM customers WHERE customer_id NOT IN ( SELECT customer_id FROM customer_payment_methods )
SELECT count(*) FROM customers WHERE customer_id NOT IN ( SELECT customer_id FROM customer_payment_methods )
SELECT order_status_code ,  date_order_placed FROM orders
SELECT order_status_code ,  date_order_placed FROM ORDERS
SELECT address_line_1 ,  town_city ,  county FROM customers WHERE country  =  'USA'
SELECT address_line_1 ,  town_city ,  county FROM customers WHERE country  =  'United States'
SELECT T3.customer_first_name ,  T2.product_name FROM orders AS T1 JOIN order_items AS T2 ON T1.order_id  =  T2.order_id JOIN customers AS T3 ON T1.customer_id  =  T3.customer_id
SELECT T3.customer_first_name ,  T5.product_name FROM orders AS T1 JOIN order_items AS T2 ON T1.order_id = T2.order_id JOIN customers AS T3 ON T1.customer_id = T3.customer_id JOIN shipments AS T4 ON T4.order_id = T1.order_id JOIN shipment_items AS T6 ON T6.shipment_id = T4.shipment_id JOIN products AS T5 ON T5.product_id = T2.product_id
SELECT count(*) FROM shipment_items
SELECT count(*) FROM shipments
SELECT avg(product_price) FROM products
SELECT avg(product_price) FROM products
SELECT avg(T1.product_price) FROM products AS T1 JOIN order_items AS T2 ON T1.product_id  =  T2.product_id
SELECT avg(T1.product_price) FROM products AS T1 JOIN order_items AS T2 ON T1.product_id  =  T2.product_id
SELECT email_address ,  town_city ,  county FROM customers GROUP BY gender_code ORDER BY count(*) ASC LIMIT 1
SELECT T1.email_address ,  T1.town_city ,  T1.county FROM customers AS T1 JOIN orders AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id HAVING count(*)  <  (SELECT count(*) FROM orders GROUP BY customer_id ORDER BY count(*) DESC LIMIT 1)
SELECT T1.date_order_placed FROM orders AS T1 JOIN customers AS T2 JOIN customer_payment_methods AS T3 ON T1.customer_id = T2.customer_id AND T1.customer_id = T3.customer_id GROUP BY T1.customer_id HAVING count(*)  >=  2
SELECT T3.date_order_placed FROM customers AS T1 JOIN customer_payment_methods AS T2 ON T1.customer_id  =  T2.customer_id JOIN orders AS T3 ON T3.customer_id  =  T1.customer_id GROUP BY T3.date_order_placed HAVING count(*)  >=  2
SELECT order_status_code FROM orders GROUP BY order_status_code ORDER BY count(*) ASC LIMIT 1
SELECT order_status_code FROM orders GROUP BY order_status_code ORDER BY count(*) ASC LIMIT 1
SELECT T2.product_id ,  T2.product_description FROM Order_items AS T1 JOIN products AS T2 ON T1.product_id = T2.product_id GROUP BY T2.product_id HAVING count(*)  >  3
SELECT T1.product_id ,  T1.product_description FROM products AS T1 JOIN order_items AS T2 ON T1.product_id  =  T2.product_id GROUP BY T1.product_id HAVING count(*)  >  3
SELECT T2.invoice_date ,  T2.invoice_number FROM shipments AS T1 JOIN invoices AS T2 ON T1.invoice_number  =  T2.invoice_number GROUP BY T2.invoice_number HAVING count(*)  >=  2
SELECT T1.invoice_date ,  T1.invoice_number FROM invoices AS T1 JOIN shipments AS T2 ON T1.invoice_number  =  T2.invoice_number GROUP BY T1.invoice_number HAVING count(*)  >=  2
SELECT shipment_tracking_number ,  shipment_date FROM shipments
SELECT shipment_tracking_number ,  shipment_date FROM Shipments
SELECT product_color ,  product_description ,  product_size FROM products WHERE product_price  <  (SELECT max(product_price) FROM products)
SELECT product_color ,  product_description ,  product_size FROM products WHERE product_price != (SELECT max(product_price) FROM products)
SELECT name FROM director WHERE age  >  (SELECT avg(age) FROM director)
SELECT name FROM director ORDER BY age DESC LIMIT 1
SELECT count(*) FROM channel WHERE internet LIKE "%bbc%"
SELECT count(DISTINCT Digital_terrestrial_channel) FROM channel
SELECT title FROM program ORDER BY start_year DESC
SELECT T2.name ,  T1.director_id FROM program AS T1 JOIN director AS T2 ON T1.director_id  =  T2.director_id GROUP BY T1.director_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.name ,  T1.age ,  T2.director_id FROM director AS T1 JOIN program AS T2 ON T1.director_id  =  T2.director_id GROUP BY T2.director_id ORDER BY count(*) DESC LIMIT 1
SELECT title FROM program ORDER BY start_year DESC LIMIT 1
SELECT t1.name ,  t1.Internet FROM channel AS t1 JOIN program AS t2 ON t1.Channel_ID  =  t2.Channel_ID GROUP BY t2.Channel_ID HAVING count(*)  >  1
SELECT count(*) ,  t1.name FROM channel AS t1 JOIN program AS t2 ON t1.channel_id  =  t2.channel_id GROUP BY t1.channel_id
SELECT count(*) FROM channel WHERE channel_id NOT IN (SELECT channel_id FROM program)
SELECT T2.name FROM program AS T1 JOIN director AS T2 ON T1.director_id  =  T2.director_id WHERE T1.title  =  'Dracula'
SELECT t1.name ,  t1.internet FROM channel AS t1 JOIN program AS t2 ON t1.channel_id  =  t2.channel_id JOIN director_admin AS t3 ON t1.channel_id  =  t3.channel_id GROUP BY t1.channel_id ORDER BY count(*) DESC LIMIT 1
SELECT name FROM director WHERE age BETWEEN 30 AND 60
SELECT t3.name FROM director_admin AS t1 JOIN channel AS t2 ON t1.channel_id  =  t2.channel_id JOIN director AS t4 ON t1.director_id  =  t4.director_id JOIN channel AS t3 ON t1.channel_id  =  t3.channel_id WHERE t4.age  <  40 INTERSECT SELECT t3.name FROM director_admin AS t1 JOIN channel AS t2 ON t1.channel_id  =  t2.channel_id JOIN director AS t4 ON t1.director_id  =  t4.director_id JOIN channel AS t3 ON t1.channel_id  =  t3.channel_id WHERE t4.age  >  60
SELECT t1.channel_id ,  t1.name FROM channel AS t1 JOIN program AS t2 ON t1.channel_id  =  t2.channel_id JOIN director AS t3 ON t2.director_id  =  t3.director_id WHERE t3.name != 'Hank Baskett'
SELECT count(*) FROM radio
SELECT Transmitter FROM radio ORDER BY ERP_kW ASC
SELECT tv_show_name ,  original_airdate FROM tv_show
SELECT station_name FROM city_channel WHERE affiliation != "ABC"
SELECT Transmitter FROM radio WHERE ERP_kW  >  150 OR ERP_kW  <  30
SELECT Transmitter FROM radio ORDER BY ERP_kW DESC LIMIT 1
SELECT avg(ERP_kW) FROM radio
SELECT affiliation ,  count(*) FROM city_channel GROUP BY affiliation
SELECT affiliation FROM city_channel GROUP BY affiliation ORDER BY count(*) DESC LIMIT 1
SELECT affiliation FROM city_channel GROUP BY affiliation HAVING count(*)  >  3
SELECT city ,  station_name FROM city_channel ORDER BY station_name
SELECT T1.Transmitter ,  T2.city FROM radio AS T1 JOIN city_channel AS T2 ON T1.radio_id  =  T2.id
SELECT T1.Transmitter ,  T2.Station_name FROM radio AS T1 JOIN city_channel AS T2 ON T1.radio_id  =  T2.id ORDER BY T1.ERP_kW DESC
SELECT T1.Transmitter ,  count(*) FROM radio AS T1 JOIN city_channel_radio AS T2 ON T1.Radio_ID  =  T2.Radio_ID GROUP BY T1.Transmitter
SELECT DISTINCT Transmitter FROM radio WHERE Radio_ID NOT IN (SELECT Radio_ID FROM city_channel_radio)
SELECT model FROM vehicle WHERE power  >  6000 ORDER BY top_speed DESC LIMIT 1
SELECT model FROM vehicle WHERE power  >  6000 ORDER BY top_speed DESC LIMIT 1
SELECT Name FROM driver WHERE Citizenship  =  'United States'
SELECT Name FROM driver WHERE Citizenship  =  "United States"
SELECT count(*) ,  T2.driver_id FROM vehicle_driver AS T1 JOIN driver AS T2 ON T1.driver_id  =  T2.driver_id GROUP BY T2.driver_id ORDER BY count(*) DESC LIMIT 1
SELECT T2.Driver_ID ,  count(*) FROM vehicle_driver AS T1 JOIN driver AS T2 ON T1.Driver_ID  =  T2.Driver_ID GROUP BY T2.Driver_ID ORDER BY count(*) DESC LIMIT 1
SELECT max(power) ,  avg(power) FROM vehicle WHERE builder  =  'Zhuzhou'
SELECT max(power) ,  avg(power) FROM vehicle WHERE builder  =  'Zhuzhou'
SELECT vehicle_id FROM vehicle_driver GROUP BY vehicle_id ORDER BY count(*) ASC LIMIT 1
SELECT T1.Vehicle_ID FROM vehicle_driver AS T1 JOIN driver AS T2 ON T1.Driver_ID  =  T2.Driver_ID GROUP BY T1.Vehicle_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT Top_Speed ,  Power FROM vehicle WHERE Build_Year  =  1996
SELECT Top_Speed ,  Power FROM vehicle WHERE Build_Year  =  1996
SELECT Build_Year ,  Model ,  Builder FROM vehicle
SELECT Build_Year ,  Model ,  Builder FROM vehicle
SELECT count(DISTINCT T1.Driver_ID) FROM vehicle_driver AS T1 JOIN vehicle AS T2 ON T1.Vehicle_ID  =  T2.Vehicle_ID WHERE T2.Build_Year  =  2012
SELECT count(DISTINCT T1.Driver_ID) FROM vehicle_driver AS T1 JOIN vehicle AS T2 ON T1.Vehicle_ID  =  T2.Vehicle_ID WHERE T2.Build_Year  =  2012
SELECT count(*) FROM driver WHERE Racing_Series  =  'NASCAR'
SELECT count(*) FROM driver WHERE Racing_Series  =  "NASCAR"
SELECT avg(Top_Speed) FROM vehicle
SELECT avg(top_speed) FROM vehicle
SELECT DISTINCT T3.Name FROM vehicle_driver AS T1 JOIN vehicle AS T2 ON T1.Vehicle_ID  =  T2.Vehicle_ID JOIN driver AS T3 ON T1.Driver_ID  =  T3.Driver_ID WHERE T2.Power  >  5000
SELECT T2.Name FROM vehicle_driver AS T1 JOIN driver AS T2 ON T1.Driver_ID  =  T2.Driver_ID JOIN vehicle AS T3 ON T1.Vehicle_ID  =  T3.Vehicle_ID WHERE T3.Power  >  5000
SELECT model FROM vehicle WHERE total_production  >  100 OR top_speed  >  150
SELECT Model FROM vehicle WHERE Total_Production  >  100 OR Top_Speed  >  150
SELECT model ,  build_year FROM vehicle WHERE model LIKE "%DJ%"
SELECT model ,  build_year FROM vehicle WHERE model LIKE "%DJ%"
SELECT Model FROM vehicle WHERE Vehicle_ID NOT IN (SELECT Vehicle_ID FROM vehicle_driver)
SELECT Model FROM vehicle WHERE Vehicle_ID NOT IN (SELECT Vehicle_ID FROM vehicle_driver)
SELECT T2.vehicle_id ,  T2.model FROM vehicle_driver AS T1 JOIN vehicle AS T2 ON T1.vehicle_id  =  T2.vehicle_id GROUP BY T2.vehicle_id HAVING count(*)  =  2 UNION SELECT vehicle_id ,  model FROM vehicle WHERE builder  =  'Ziyang'
SELECT T1.Vehicle_ID ,  T1.Model FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.Vehicle_ID  =  T2.Vehicle_ID WHERE T1.Builder  =  "Ziyang" GROUP BY T2.Vehicle_ID HAVING COUNT(*)  =  2 UNION SELECT T1.Vehicle_ID ,  T1.Model FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.Vehicle_ID  =  T2.Vehicle_ID GROUP BY T2.Vehicle_ID HAVING COUNT(*)  =  2
SELECT T2.Vehicle_ID ,  T2.Model FROM driver AS T1 JOIN vehicle_driver AS T3 ON T1.Driver_ID  =  T3.Driver_ID JOIN vehicle AS T2 ON T2.Vehicle_ID  =  T3.Vehicle_ID WHERE T1.Name  =  'Jeff Gordon' UNION SELECT T2.Vehicle_ID ,  T2.Model FROM driver AS T1 JOIN vehicle_driver AS T3 ON T1.Driver_ID  =  T3.Driver_ID JOIN vehicle AS T2 ON T2.Vehicle_ID  =  T3.Vehicle_ID GROUP BY T2.Vehicle_ID HAVING COUNT(*)  >  2
SELECT T2.Vehicle_ID ,  T2.Model FROM vehicle_driver AS T1 JOIN vehicle AS T2 ON T1.Vehicle_ID  =  T2.Vehicle_ID JOIN driver AS T3 ON T1.Driver_ID  =  T3.Driver_ID WHERE T3.Name  =  "Jeff Gordon" GROUP BY T2.Vehicle_ID HAVING COUNT(*)  >  2 UNION SELECT T2.Vehicle_ID ,  T2.Model FROM vehicle_driver AS T1 JOIN vehicle AS T2 ON T1.Vehicle_ID  =  T2.Vehicle_ID JOIN driver AS T3 ON T1.Driver_ID  =  T3.Driver_ID GROUP BY T2.Vehicle_ID HAVING COUNT(*)  >  2
SELECT count(*) FROM vehicle WHERE top_speed  =  (SELECT max(top_speed) FROM vehicle)
SELECT count(*) FROM vehicle WHERE Top_Speed  =  (SELECT max(Top_Speed) FROM vehicle)
SELECT Name FROM driver ORDER BY Name ASC
SELECT Name FROM driver ORDER BY Name ASC
SELECT Racing_Series ,  COUNT(*) FROM driver GROUP BY Racing_Series
SELECT COUNT(*) ,  Racing_Series FROM driver GROUP BY Racing_Series
SELECT T3.Name ,  T3.Citizenship FROM vehicle_driver AS T1 JOIN vehicle AS T2 ON T1.Vehicle_ID  =  T2.Vehicle_ID JOIN driver AS T3 ON T1.Driver_ID  =  T3.Driver_ID WHERE T2.Model  =  "DJ1"
SELECT T3.Name ,  T3.Citizenship FROM vehicle_driver AS T1 JOIN vehicle AS T2 ON T1.Vehicle_ID  =  T2.Vehicle_ID JOIN driver AS T3 ON T1.Driver_ID  =  T3.Driver_ID WHERE T2.Model  =  "DJ1"
SELECT count(*) FROM driver WHERE driver_id NOT IN ( SELECT driver_id FROM vehicle_driver )
SELECT count(*) FROM driver WHERE driver_id NOT IN (SELECT driver_id FROM vehicle_driver)
SELECT count(*) FROM EXAMS
SELECT count(*) FROM EXAMS
SELECT DISTINCT SUBJECT_CODE FROM Exams ORDER BY SUBJECT_CODE ASC
SELECT DISTINCT subject_code FROM exams ORDER BY subject_code
SELECT Exam_Name ,  Exam_Date FROM Exams WHERE Subject_Code != "Database"
SELECT Exam_Date ,  Exam_Name FROM Exams WHERE Subject_Code != "Database"
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE "%data%" ORDER BY Exam_Date DESC
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE "%data%" ORDER BY Exam_Date DESC
SELECT TYPE_OF_QUESTION_CODE ,  count(*) FROM Questions GROUP BY TYPE_OF_QUESTION_CODE
SELECT TYPE_OF_QUESTION_CODE ,  count(*) FROM QUESTIONS GROUP BY TYPE_OF_QUESTION_CODE
SELECT DISTINCT Student_Answer_Text FROM Student_Answers WHERE Comments  =  "Normal"
SELECT DISTINCT Student_Answer_Text FROM Student_Answers WHERE Comments  =  "Normal"
SELECT count(DISTINCT Comments) FROM student_answers
SELECT count(DISTINCT Comments) FROM Student_Answers
SELECT Student_Answer_Text FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY count(*) DESC
SELECT Student_Answer_Text FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY count(*) DESC
SELECT T2.First_Name ,  T1.Date_of_Answer FROM Student_Answers AS T1 JOIN STUDENTS AS T2 ON T1.Student_ID  =  T2.Student_ID
SELECT T1.First_Name ,  T2.Date_of_Answer FROM Students AS T1 JOIN Student_Answers AS T2 ON T1.Student_ID  =  T2.Student_ID
SELECT T3.Email_Adress ,  T2.Date_of_Answer FROM Questions_in_Exams AS T1 JOIN Exams AS T4 ON T1.Exam_ID  =  T4.Exam_ID JOIN Student_Answers AS T2 ON T2.Exam_ID  =  T4.Exam_ID JOIN Students AS T3 ON T2.Student_ID  =  T3.Student_ID ORDER BY T2.Date_of_Answer DESC
SELECT T2.Email_Adress ,  T1.Date_of_Answer FROM Student_Answers AS T1 JOIN Students AS T2 ON T1.Student_ID  =  T2.Student_ID ORDER BY T1.Date_of_Answer DESC
SELECT Assessment FROM Student_Assessments GROUP BY Assessment ORDER BY count(*) ASC LIMIT 1
SELECT Assessment FROM Student_Assessments GROUP BY Assessment ORDER BY count(*) ASC LIMIT 1
SELECT T1.First_Name FROM Students AS T1 JOIN Student_Answers AS T2 ON T1.Student_ID  =  T2.Student_ID GROUP BY T1.Student_ID HAVING COUNT(*)  >=  2
SELECT T1.First_Name FROM Students AS T1 JOIN Student_Answers AS T2 ON T1.Student_ID  =  T2.Student_ID GROUP BY T2.Student_ID HAVING count(*)  >=  2
SELECT T1.Valid_Answer_Text FROM Valid_Answers AS T1 JOIN Student_Assessments AS T2 ON T1.Valid_Answer_ID  =  T2.Valid_Answer_ID GROUP BY T1.Valid_Answer_Text ORDER BY COUNT(*) DESC LIMIT 1
SELECT Valid_Answer_Text FROM Valid_Answers GROUP BY Valid_Answer_Text ORDER BY COUNT(*) DESC LIMIT 1
SELECT Last_Name FROM Students WHERE Gender_MFU != "M"
SELECT Last_Name FROM Students WHERE Gender_MFU != "M"
SELECT Gender_MFU ,  count(*) FROM STUDENTS GROUP BY Gender_MFU
SELECT Gender_MFU ,  count(*) FROM STUDENTS GROUP BY Gender_MFU
SELECT Last_Name FROM STUDENTS WHERE Gender_MFU  =  "F" OR Gender_MFU  =  "M"
SELECT Last_Name FROM Students WHERE Gender_MFU  =  "F" OR Gender_MFU  =  "M"
SELECT First_Name FROM Students WHERE Student_ID NOT IN (SELECT Student_ID FROM Student_Answers)
SELECT First_Name FROM Students WHERE Student_ID NOT IN (SELECT Student_ID FROM Student_Answers)
SELECT T1.Student_Answer_Text FROM Student_Answers AS T1 JOIN Student_Assessments AS T2 ON T1.Student_Answer_ID  =  T2.Student_Answer_ID WHERE T2.Assessment  =  "Normal" INTERSECT SELECT T1.Student_Answer_Text FROM Student_Answers AS T1 JOIN Student_Assessments AS T2 ON T1.Student_Answer_ID  =  T2.Student_Answer_ID WHERE T2.Assessment  =  "Absent"
SELECT T1.Student_Answer_Text FROM Student_Answers AS T1 JOIN Student_Assessments AS T2 ON T1.Student_Answer_ID  =  T2.Student_Answer_ID WHERE T2.Assessment  =  "Normal" INTERSECT SELECT T1.Student_Answer_Text FROM Student_Answers AS T1 JOIN Student_Assessments AS T2 ON T1.Student_Answer_ID  =  T2.Student_Answer_ID WHERE T2.Assessment  =  "Absent"
SELECT TYPE_OF_QUESTION_CODE FROM QUESTIONS GROUP BY TYPE_OF_QUESTION_CODE HAVING count(*)  >=  3
SELECT TYPE_OF_QUESTION_CODE FROM QUESTIONS GROUP BY TYPE_OF_QUESTION_CODE HAVING count(*)  >=  3
SELECT * FROM STUDENTS
SELECT * FROM Students
SELECT count(*) FROM addresses
SELECT count(*) FROM addresses
SELECT address_id ,  address_details FROM addresses
SELECT address_id ,  address_details FROM addresses
SELECT count(*) FROM products
SELECT count(*) FROM products
SELECT product_id ,  product_type_code ,  product_name FROM products
SELECT product_id ,  product_type_code ,  product_name FROM products
SELECT product_price FROM products WHERE product_name  =  'Monitor'
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
SELECT product_name FROM products WHERE product_type_code  =  'Clothes' ORDER BY product_price DESC LIMIT 1
SELECT product_name FROM products WHERE product_type_code  =  'Clothes' ORDER BY product_price DESC LIMIT 1
SELECT product_id ,  product_name FROM products WHERE product_type_code  =  'Hardware' ORDER BY product_price LIMIT 1
SELECT product_id ,  product_name FROM products WHERE product_type_code  =  'Hardware' ORDER BY product_price LIMIT 1
SELECT product_name FROM products ORDER BY product_price DESC
SELECT product_name FROM products ORDER BY product_price DESC
SELECT product_name FROM products WHERE product_type_code  =  'Hardware' ORDER BY product_price ASC
SELECT product_name FROM products WHERE product_type_code  =  'Hardware' ORDER BY product_price ASC
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
SELECT customer_id ,  customer_name FROM Customers
SELECT customer_id ,  customer_name FROM customers
SELECT customer_address ,  customer_phone ,  customer_email FROM Customers WHERE customer_name  =  "Jeromy"
SELECT customer_address ,  customer_phone ,  customer_email FROM customers WHERE customer_name  =  'Jeromy'
SELECT payment_method_code ,  count(*) FROM customers GROUP BY payment_method_code
SELECT payment_method_code ,  count(*) FROM customers GROUP BY payment_method_code
SELECT payment_method_code FROM customers GROUP BY payment_method_code ORDER BY count(*) DESC LIMIT 1
SELECT payment_method_code FROM customers GROUP BY payment_method_code ORDER BY count(*) DESC LIMIT 1
SELECT T2.payment_method_code ,  T1.customer_name FROM customers AS T1 JOIN customers AS T2 ON T1.payment_method_code  =  T2.payment_method_code GROUP BY T2.payment_method_code ORDER BY count(*) ASC LIMIT 1
SELECT DISTINCT T1.customer_name FROM customers AS T1 JOIN customer_orders AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.payment_method_code ORDER BY count(*) DESC LIMIT 1
SELECT payment_method_code ,  customer_number FROM customers WHERE customer_name  =  'Jeromy'
SELECT payment_method_code ,  customer_number FROM customers WHERE customer_name  =  "Jeromy"
SELECT DISTINCT payment_method_code FROM customers
SELECT DISTINCT payment_method_code FROM customers
SELECT product_id ,  product_type_code FROM products ORDER BY product_name
SELECT product_id ,  product_type_code FROM products ORDER BY product_name
SELECT product_type_code FROM products GROUP BY product_type_code ORDER BY count(*) ASC LIMIT 1
SELECT product_type_code FROM products GROUP BY product_type_code ORDER BY count(*) ASC LIMIT 1
SELECT count(*) FROM customer_orders
SELECT count(*) FROM customer_orders
SELECT T1.order_id ,  T1.order_date ,  T1.order_status_code FROM customer_orders AS T1 JOIN customers AS T2 ON T1.customer_id  =  T2.customer_id WHERE T2.customer_name  =  'Jeromy'
SELECT T1.order_id ,  T1.order_date ,  T1.order_status_code FROM customer_orders AS T1 JOIN customers AS T2 ON T1.customer_id  =  T2.customer_id WHERE T2.customer_name  =  'Jeromy'
SELECT T2.customer_name ,  T2.customer_id ,  count(*) FROM customer_orders AS T1 JOIN customers AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T2.customer_id
SELECT T2.customer_name ,  T1.customer_id ,  count(*) FROM customer_orders AS T1 JOIN customers AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id
SELECT T1.customer_id ,  T1.customer_name ,  T1.customer_phone ,  T1.customer_email FROM customers AS T1 JOIN customer_orders AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id ORDER BY count(*) DESC LIMIT 1
SELECT T2.customer_id ,  T2.customer_name ,  T2.customer_phone ,  T2.customer_email FROM customer_orders AS T1 JOIN customers AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T2.customer_id ORDER BY count(*) DESC LIMIT 1
SELECT order_status_code ,  count(*) FROM customer_orders GROUP BY order_status_code
SELECT order_status_code ,  count(*) FROM customer_orders GROUP BY order_status_code
SELECT order_status_code FROM customer_orders GROUP BY order_status_code ORDER BY count(*) DESC LIMIT 1
SELECT order_status_code FROM customer_orders GROUP BY order_status_code ORDER BY count(*) DESC LIMIT 1
SELECT count(*) FROM customers WHERE customer_id NOT IN ( SELECT customer_id FROM customer_orders )
SELECT count(*) FROM customers WHERE customer_id NOT IN ( SELECT customer_id FROM customer_orders )
SELECT product_name FROM products EXCEPT SELECT t1.product_name FROM products AS t1 JOIN order_items AS t2 ON t1.product_id  =  t2.product_id
SELECT product_name FROM products WHERE product_id NOT IN (SELECT product_id FROM order_items)
SELECT sum(T1.order_quantity) FROM order_items AS T1 JOIN products AS T2 ON T1.product_id  =  T2.product_id WHERE T2.product_name  =  "Monitor"
SELECT sum(t1.order_quantity) FROM order_items AS t1 JOIN products AS t2 ON t1.product_id  =  t2.product_id WHERE t2.product_name  =  'Monitor'
SELECT count(DISTINCT T1.customer_id) FROM customer_orders AS T1 JOIN order_items AS T2 ON T1.order_id  =  T2.order_id JOIN products AS T3 ON T2.product_id  =  T3.product_id WHERE T3.product_name  =  'Monitor'
SELECT count(DISTINCT T1.customer_id) FROM customer_orders AS T1 JOIN order_items AS T2 ON T1.order_id  =  T2.order_id JOIN products AS T3 ON T2.product_id  =  T3.product_id WHERE T3.product_name  =  'Monitor'
SELECT count(DISTINCT customer_id) FROM customer_orders
SELECT count(DISTINCT customer_id) FROM customer_orders
SELECT customer_id FROM customers EXCEPT SELECT customer_id FROM customer_orders
SELECT customer_id FROM customers EXCEPT SELECT customer_id FROM customer_orders
SELECT T1.order_date ,  T1.order_id FROM customer_orders AS T1 JOIN order_items AS T2 ON T1.order_id  =  T2.order_id WHERE T2.order_quantity  >  6 GROUP BY T1.order_id UNION SELECT T1.order_date ,  T1.order_id FROM customer_orders AS T1 JOIN order_items AS T2 ON T1.order_id  =  T2.order_id GROUP BY T1.order_id HAVING count(*)  >  3
SELECT T2.order_id ,  T2.order_date FROM order_items AS T1 JOIN customer_orders AS T2 ON T1.order_id  =  T2.order_id WHERE T1.order_quantity  >  6 UNION SELECT T2.order_id ,  T2.order_date FROM order_items AS T1 JOIN customer_orders AS T2 ON T1.order_id  =  T2.order_id GROUP BY T2.order_id HAVING count(*)  >  3
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
SELECT T1.Name ,  T2.Name FROM building AS T1 JOIN region AS T2 ON T1.Region_ID  =  T2.Region_ID
SELECT T1.Name ,  T2.Name FROM building AS T1 JOIN region AS T2 ON T1.Region_ID  =  T2.Region_ID
SELECT T2.name FROM building AS T1 JOIN region AS T2 ON T1.region_id  =  T2.region_id GROUP BY T1.region_id HAVING count(*)  >  1
SELECT T2.Name FROM building AS T1 JOIN region AS T2 ON T1.Region_ID  =  T2.Region_ID GROUP BY T1.Region_ID HAVING COUNT(*)  >  1
SELECT T2.Capital FROM building AS T1 JOIN region AS T2 ON T1.Region_ID  =  T2.Region_ID GROUP BY T1.Region_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.Capital FROM building AS T1 JOIN region AS T2 ON T1.Region_ID  =  T2.Region_ID GROUP BY T1.Region_ID ORDER BY count(*) DESC LIMIT 1
SELECT T1.Address ,  T2.Capital FROM building AS T1 JOIN region AS T2 ON T1.Region_ID  =  T2.Region_ID
SELECT T1.Address ,  T2.Name FROM building AS T1 JOIN region AS T2 ON T1.Region_ID  =  T2.Region_ID
SELECT T2.Number_of_Stories FROM region AS T1 JOIN building AS T2 ON T1.Region_ID  =  T2.Region_ID WHERE T1.Name  =  "Abruzzo"
SELECT T1.Number_of_Stories FROM building AS T1 JOIN region AS T2 ON T1.Region_ID  =  T2.Region_ID WHERE T2.Name  =  "Abruzzo"
SELECT Completed_Year ,  COUNT(*) FROM building GROUP BY Completed_Year
SELECT Completed_Year ,  COUNT(*) FROM building GROUP BY Completed_Year
SELECT Completed_Year FROM building GROUP BY Completed_Year ORDER BY COUNT(*) DESC LIMIT 1
SELECT Completed_Year FROM building GROUP BY Completed_Year ORDER BY COUNT(*) DESC LIMIT 1
SELECT Name FROM region WHERE region_id NOT IN (SELECT region_id FROM building)
SELECT Name FROM region WHERE region_id NOT IN (SELECT region_id FROM building)
SELECT Completed_Year FROM building WHERE Number_of_Stories  >  20 INTERSECT SELECT Completed_Year FROM building WHERE Number_of_Stories  <  15
SELECT Completed_Year FROM building WHERE Number_of_Stories  >  20 INTERSECT SELECT Completed_Year FROM building WHERE Number_of_Stories  <  15
SELECT DISTINCT Address FROM building
SELECT DISTINCT Address FROM building
SELECT Completed_Year FROM building ORDER BY Number_of_Stories DESC
SELECT Completed_Year FROM building ORDER BY Number_of_Stories DESC
SELECT Channel_Details FROM Channels ORDER BY Channel_Details
SELECT Channel_Details FROM Channels ORDER BY Channel_Details
SELECT count(*) FROM services
SELECT count(*) FROM services
SELECT Analytical_Layer_Type_Code FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code ORDER BY count(*) DESC LIMIT 1
SELECT Analytical_Layer_Type_Code FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code ORDER BY COUNT(*) DESC LIMIT 1
SELECT T3.Service_Details FROM Customers_and_services AS T1 JOIN Customers AS T2 ON T1.Customer_ID  =  T2.Customer_ID JOIN Services AS T3 ON T1.Service_ID  =  T3.Service_ID WHERE T2.Customer_Details  =  "Hardy Kutch"
SELECT T3.Service_Details FROM Customers_and_Services AS T1 JOIN Customers AS T2 ON T1.Customer_ID  =  T2.Customer_ID JOIN Services AS T3 ON T1.Service_ID  =  T3.Service_ID WHERE T2.Customer_Details  =  "Hardy Kutch"
SELECT T2.service_details FROM customer_interactions AS T1 JOIN services AS T2 ON T1.service_id  =  T2.service_id GROUP BY T1.service_id HAVING count(*)  >  3
SELECT T2.service_details FROM Customers_and_services AS T1 JOIN services AS T2 ON T1.service_id  =  T2.service_id GROUP BY T1.service_id HAVING count(*)  >  3
SELECT T2.Customer_Details FROM Customers_and_Services AS T1 JOIN Customers AS T2 ON T1.Customer_ID  =  T2.Customer_ID GROUP BY T2.Customer_Details ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.customer_details FROM Customers_and_services AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T2.customer_details ORDER BY count(*) DESC LIMIT 1
SELECT T1.Customer_Details FROM Customers AS T1 JOIN Customers_and_services AS T2 ON T1.Customer_id  =  T2.Customer_id GROUP BY T1.Customer_id ORDER BY count(*) DESC LIMIT 1
SELECT T2.Customer_Details FROM Customers_and_services AS T1 JOIN Customers AS T2 ON T1.Customer_ID  =  T2.Customer_ID GROUP BY T2.Customer_Details ORDER BY COUNT(*) DESC LIMIT 1
SELECT customer_details FROM customers EXCEPT SELECT t1.customer_details FROM customers AS t1 JOIN customers_and_services AS t2 ON t1.customer_id  =  t2.customer_id JOIN services AS t3 ON t2.service_id  =  t3.service_id
SELECT customer_details FROM customers EXCEPT SELECT t1.customer_details FROM customers AS t1 JOIN customers_and_services AS t2 ON t1.customer_id  =  t2.customer_id JOIN services AS t3 ON t2.service_id  =  t3.service_id
SELECT T1.customer_details FROM customers AS T1 JOIN customers_and_services AS T2 ON T1.customer_id  =  T2.customer_id JOIN services AS T3 ON T2.service_id  =  T3.service_id GROUP BY T1.customer_id ORDER BY count(*) ASC LIMIT 1
SELECT DISTINCT T1.customer_details FROM customers AS T1 JOIN customers_and_services AS T2 ON T1.customer_id  =  T2.customer_id JOIN services AS T3 ON T2.service_id  =  T3.service_id GROUP BY T1.customer_details ORDER BY count(*) ASC LIMIT 1
SELECT count(DISTINCT customers_and_services_details) FROM customers_and_services
SELECT count(*) FROM services UNION SELECT count(*) FROM customers
SELECT customer_details FROM customers WHERE customer_details LIKE "%Kutch%"
SELECT customer_details FROM customers WHERE customer_details LIKE "%Kutch%"
SELECT T3.Service_Details FROM Customers_and_Services AS T1 JOIN Services AS T3 ON T1.Service_ID  =  T3.Service_ID JOIN Customers_and_Services AS T2 ON T2.Service_ID  =  T3.Service_ID JOIN Customer_Interactions AS T4 ON T4.Service_ID  =  T3.Service_ID JOIN Customers AS T5 ON T5.Customer_ID  =  T4.Customer_ID WHERE T5.Customer_Details  =  "Hardy Kutch" AND T4.Status_Code  =  "good" UNION SELECT T3.Service_Details FROM Customers_and_Services AS T1 JOIN Services AS T3 ON T1.Service_ID  =  T3.Service_ID JOIN Customers_and_Services AS T2 ON T2.Service_ID  =  T3.Service_ID JOIN Customer_Interactions AS T4 ON T4.Service_ID  =  T3.Service_ID JOIN Customers AS T5 ON T5.Customer_ID  =  T4.Customer_ID WHERE T4.Status_Code  =  "good"
SELECT T3.Service_Details FROM Customers_and_Services AS T1 JOIN Services AS T3 ON T1.Service_ID  =  T3.Service_ID JOIN Customers AS T2 ON T1.Customer_ID  =  T2.Customer_ID JOIN Customer_Interactions AS T4 ON T4.Customer_ID  =  T2.Customer_ID AND T4.Service_ID  =  T1.Service_ID WHERE T2.Customer_Details  =  "Hardy Kutch" AND T4.Status_Code  =  "good"
SELECT T3.Service_Details FROM Customers_and_Services AS T1 JOIN Services AS T3 ON T1.Service_ID  =  T3.Service_ID JOIN Customers AS T2 ON T1.Customer_ID  =  T2.Customer_ID JOIN Customer_Interactions AS T4 ON T2.Customer_ID  =  T4.Customer_ID WHERE T2.Customer_Details  =  "Hardy Kutch" AND T4.Status_Code  =  "bad" GROUP BY T3.Service_Details HAVING count(*)  >=  2
SELECT T3.Service_Details FROM Customers_and_Services AS T1 JOIN Customers AS T2 ON T1.Customer_ID  =  T2.Customer_ID JOIN Services AS T3 ON T1.Service_ID  =  T3.Service_ID JOIN Customer_Interactions AS T4 ON T1.Customer_ID  =  T4.Customer_ID AND T1.Service_ID  =  T4.Service_ID WHERE T2.Customer_Details  =  "Hardy Kutch" AND T4.Status_Code  =  "bad"
SELECT DISTINCT T1.service_details FROM services AS T1 JOIN customers_and_services AS T2 ON T1.service_id  =  T2.service_id JOIN customer_interactions AS T3 ON T2.customer_id  =  T3.customer_id AND T2.service_id  =  T3.service_id WHERE T3.channel_details  =  '15 ij'
SELECT T3.service_details FROM customer_interactions AS T1 JOIN channels AS T2 ON T1.channel_id  =  T2.channel_id JOIN services AS T3 ON T1.service_id  =  T3.service_id WHERE T2.channel_details  =  "15 ij"
SELECT DISTINCT T1.customer_details FROM customers AS T1 JOIN customer_interactions AS T2 ON T1.customer_id  =  T2.customer_id JOIN channels AS T3 ON T2.channel_id  =  T3.channel_id WHERE T2.Status_Code  =  "Stuck" AND T3.Channel_Details  =  "bad"
SELECT DISTINCT T1.Customer_Details FROM Customers AS T1 JOIN Customer_Interactions AS T2 ON T1.Customer_ID  =  T2.Customer_ID JOIN Channels AS T3 ON T2.Channel_ID  =  T3.Channel_ID JOIN Services AS T4 ON T2.Service_ID  =  T4.Service_ID WHERE T2.Status_Code  =  "Stuck" AND T3.Channel_Details  =  "bad" AND T4.Service_Details  =  "bad"
SELECT count(*) FROM integration_platform WHERE integration_platform_details  =  "Success"
SELECT count(*) FROM integration_platform WHERE integration_platform_details  =  "Success"
SELECT DISTINCT T1.Customer_Details FROM Customers AS T1 JOIN Customer_Interactions AS T2 ON T1.Customer_ID  =  T2.Customer_ID JOIN Integration_Platform AS T3 ON T2.Customer_Interaction_ID  =  T3.Customer_Interaction_ID WHERE T3.Status_Code  =  "failed"
SELECT T1.Customer_Details FROM Customers AS T1 JOIN Customer_Interactions AS T2 ON T1.Customer_ID  =  T2.Customer_ID JOIN Integration_Platform AS T3 ON T2.Customer_Interaction_ID  =  T3.Customer_Interaction_ID WHERE T3.Integration_Platform_Details  =  "Fail"
SELECT service_details FROM services EXCEPT SELECT t2.service_details FROM customers_and_services AS t1 JOIN services AS t2 ON t1.service_id  =  t2.service_id GROUP BY t1.service_id HAVING count(*)  >  0
SELECT Service_Details FROM Services EXCEPT SELECT T1.Service_Details FROM Services AS T1 JOIN Customers_and_services AS T2 ON T1.Service_id  =  T2.Service_id
SELECT Analytical_Layer_Type_Code ,  count(*) FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code
SELECT Analytical_Layer_Type_Code ,  COUNT(*) FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code
SELECT T1.Service_Details FROM Services AS T1 JOIN Customers_and_Services AS T2 ON T1.Service_ID  =  T2.Service_ID WHERE T2.Customers_and_Services_Details  =  "unsatisfied"
SELECT T1.service_details FROM services AS T1 JOIN customers_and_services AS T2 ON T1.service_id  =  T2.service_id WHERE T2.customers_and_services_details  =  "unsatisfied"
SELECT count(*) FROM Vehicles
SELECT count(*) FROM Vehicles
SELECT name FROM Vehicles ORDER BY Model_year DESC
SELECT name FROM Vehicles ORDER BY Model_year DESC
SELECT DISTINCT TYPE_OF_POWERtrain FROM Vehicles
SELECT DISTINCT Type_of_powertrain FROM Vehicles
SELECT name ,  type_of_powertrain ,  annual_fuel_cost FROM Vehicles WHERE Model_year  =  2013 OR Model_year  =  2014
SELECT name ,  type_of_powertrain ,  Annual_fuel_cost FROM Vehicles WHERE Model_year  =  2013 OR Model_year  =  2014
SELECT TYPE_of_powertrain FROM Vehicles WHERE Model_year  =  2014 INTERSECT SELECT TYPE_of_powertrain FROM Vehicles WHERE Model_year  =  2013
SELECT TYPE_of_powertrain FROM Vehicles WHERE Model_year  =  2013 INTERSECT SELECT TYPE_of_powertrain FROM Vehicles WHERE Model_year  =  2014
SELECT TYPE_of_powertrain ,  count(*) FROM Vehicles GROUP BY TYPE_of_powertrain
SELECT TYPE_of_powertrain ,  count(*) FROM Vehicles GROUP BY TYPE_of_powertrain
SELECT TYPE_of_powertrain FROM Vehicles GROUP BY TYPE_of_powertrain ORDER BY count(*) DESC LIMIT 1
SELECT TYPE_of_powertrain FROM Vehicles GROUP BY TYPE_of_powertrain ORDER BY count(*) DESC LIMIT 1
SELECT min(Annual_fuel_cost) ,  max(Annual_fuel_cost) ,  avg(Annual_fuel_cost) FROM Vehicles
SELECT min(Annual_fuel_cost) ,  max(Annual_fuel_cost) ,  avg(Annual_fuel_cost) FROM Vehicles
SELECT name ,  model_year FROM vehicles WHERE city_fuel_economy_rate  <=  highway_fuel_economy_rate
SELECT name ,  model_year FROM vehicles WHERE city_fuel_economy_rate  <=  highway_fuel_economy_rate
SELECT TYPE_of_powertrain ,  avg(Annual_fuel_cost) FROM Vehicles GROUP BY TYPE_of_powertrain HAVING count(*)  >=  2
SELECT TYPE_of_powertrain ,  avg(Annual_fuel_cost) FROM Vehicles GROUP BY TYPE_of_powertrain HAVING count(*)  >=  2
SELECT name ,  age ,  membership_credit FROM Customers
SELECT name ,  age ,  membership_credit FROM CUSTOMERS
SELECT name ,  age FROM Customers ORDER BY membership_credit DESC LIMIT 1
SELECT name ,  age FROM Customers ORDER BY membership_credit DESC LIMIT 1
SELECT avg(age) FROM customers WHERE membership_credit  >  (SELECT avg(membership_credit) FROM customers)
SELECT avg(age) FROM customers WHERE membership_credit  >  (SELECT avg(membership_credit) FROM customers)
SELECT * FROM Discount
SELECT * FROM Discount
SELECT T2.name ,  T1.total_hours FROM Renting_history AS T1 JOIN Vehicles AS T2 ON T1.vehicles_id  =  T2.id
SELECT T2.name ,  sum(T1.total_hours) FROM Renting_history AS T1 JOIN vehicles AS T2 ON T1.vehicles_id  =  T2.id GROUP BY T1.vehicles_id
SELECT name FROM vehicles WHERE id NOT IN (SELECT vehicles_id FROM renting_history)
SELECT name FROM Vehicles WHERE id NOT IN (SELECT vehicles_id FROM Renting_history)
SELECT T1.name FROM customers AS T1 JOIN renting_history AS T2 ON T1.id  =  T2.customer_id GROUP BY T1.id HAVING count(*)  >=  2
SELECT T1.name FROM customers AS T1 JOIN renting_history AS T2 ON T1.id  =  T2.customer_id GROUP BY T1.id HAVING count(*)  >=  2
SELECT T2.name ,  T2.model_year FROM renting_history AS T1 JOIN vehicles AS T2 ON T1.vehicles_id  =  T2.id GROUP BY T1.vehicles_id ORDER BY count(*) DESC LIMIT 1
SELECT T2.name ,  T2.model_year FROM Renting_history AS T1 JOIN Vehicles AS T2 ON T1.vehicles_id  =  T2.id GROUP BY T1.vehicles_id ORDER BY sum(T1.total_hours) DESC LIMIT 1
SELECT T2.name FROM renting_history AS T1 JOIN vehicles AS T2 ON T1.vehicles_id  =  T2.id ORDER BY T1.total_hours DESC
SELECT T2.name FROM renting_history AS T1 JOIN vehicles AS T2 ON T1.vehicles_id  =  T2.id ORDER BY T1.total_hours DESC
SELECT T2.name FROM renting_history AS T1 JOIN discount AS T2 ON T1.discount_id  =  T2.id GROUP BY T1.discount_id ORDER BY count(*) DESC LIMIT 1
SELECT T2.name FROM renting_history AS T1 JOIN discount AS T2 ON T1.discount_id  =  T2.id JOIN customers AS T3 ON T1.customer_id  =  T3.id GROUP BY T2.id ORDER BY count(*) DESC LIMIT 1
SELECT T2.name ,  T2.Type_of_powertrain FROM Renting_history AS T1 JOIN Vehicles AS T2 ON T1.vehicles_id  =  T2.id WHERE T1.total_hours  >  30
SELECT T1.name ,  T1.Type_of_powertrain FROM Vehicles AS T1 JOIN Renting_history AS T2 ON T1.id  =  T2.vehicles_id GROUP BY T2.vehicles_id HAVING sum(T2.total_hours)  >  30
SELECT TYPE_of_powertrain ,  avg(City_fuel_economy_rate) ,  avg(Highway_fuel_economy_rate) FROM Vehicles WHERE TYPE_of_powertrain  =  'Electric' GROUP BY TYPE_of_powertrain UNION SELECT TYPE_of_powertrain ,  avg(City_fuel_economy_rate) ,  avg(Highway_fuel_economy_rate) FROM Vehicles WHERE TYPE_of_powertrain != 'Electric' GROUP BY TYPE_of_powertrain
SELECT TYPE_of_powertrain ,  avg(City_fuel_economy_rate) ,  avg(Highway_fuel_economy_rate) FROM Vehicles GROUP BY TYPE_of_powertrain
SELECT avg(amount_of_loan) FROM Student_Loans
SELECT avg(amount_of_loan) FROM Student_Loans
SELECT T1.bio_data ,  T1.student_id FROM STUDENTS AS T1 JOIN CLASSES AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING count(*)  >=  2 INTERSECT SELECT T1.bio_data ,  T1.student_id FROM STUDENTS AS T1 JOIN DETENTION AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING count(*)  <  2
SELECT T1.bio_data ,  T1.student_id FROM STUDENTS AS T1 JOIN CLASSES AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING count(*)  <=  2 UNION SELECT T1.bio_data ,  T1.student_id FROM STUDENTS AS T1 JOIN DETENTION AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING count(*)  >  2
SELECT T1.teacher_details FROM TEACHERS AS T1 JOIN CLASSES AS T2 ON T1.teacher_id  =  T2.teacher_id WHERE T2.class_details LIKE '%data%' EXCEPT SELECT T1.teacher_details FROM TEACHERS AS T1 JOIN CLASSES AS T2 ON T1.teacher_id  =  T2.teacher_id WHERE T2.class_details LIKE 'net%'
SELECT T1.teacher_details FROM TEACHERS AS T1 JOIN CLASSES AS T2 ON T1.teacher_id  =  T2.teacher_id WHERE T2.class_details LIKE '%data%' EXCEPT SELECT T1.teacher_details FROM TEACHERS AS T1 JOIN CLASSES AS T2 ON T1.teacher_id  =  T2.teacher_id WHERE T2.class_details LIKE 'net%'
SELECT bio_data FROM STUDENTS EXCEPT SELECT T1.bio_data FROM STUDENTS AS T1 JOIN Detention AS T2 ON T1.student_id  =  T2.student_id JOIN Student_Loans AS T3 ON T1.student_id  =  T3.student_id
SELECT bio_data FROM STUDENTS WHERE student_id NOT IN ( SELECT student_id FROM Detention UNION SELECT student_id FROM Student_Loans )
SELECT T1.amount_of_loan ,  T1.date_of_loan FROM Student_Loans AS T1 JOIN Achievements AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING count(*)  >=  2
SELECT T1.amount_of_loan ,  T1.date_of_loan FROM Student_Loans AS T1 JOIN Achievements AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING count(*)  >=  2
SELECT T2.teacher_details ,  T1.teacher_id FROM CLASSES AS T1 JOIN TEACHERS AS T2 ON T1.teacher_id  =  T2.teacher_id GROUP BY T1.teacher_id ORDER BY count(*) DESC LIMIT 1
SELECT T2.teacher_details ,  T1.teacher_id FROM CLASSES AS T1 JOIN TEACHERS AS T2 ON T1.teacher_id  =  T2.teacher_id GROUP BY T1.teacher_id ORDER BY count(*) DESC LIMIT 1
SELECT DISTINCT T1.detention_summary FROM Detention AS T1 JOIN Ref_Detention_Type AS T2 ON T1.detention_type_code  =  T2.detention_type_code
SELECT DISTINCT T1.detention_summary FROM Detention AS T1 JOIN Ref_Detention_Type AS T2 ON T1.detention_type_code  =  T2.detention_type_code
SELECT T3.address_type_description ,  T4.student_details FROM STUDENTS_ADDRESSES AS T1 JOIN Ref_Address_Types AS T3 ON T1.address_type_code  =  T3.address_type_code JOIN ADDRESSES AS T2 ON T1.address_id  =  T2.address_id JOIN STUDENTS AS T4 ON T1.student_id  =  T4.student_id
SELECT T1.student_details ,  T4.address_type_description FROM STUDENTS AS T1 JOIN STUDENTS_ADDRESSES AS T2 ON T1.student_id  =  T2.student_id JOIN Ref_Address_Types AS T4 ON T2.address_type_code  =  T4.address_type_code JOIN Addresses AS T3 ON T2.address_id  =  T3.address_id
SELECT T3.address_details ,  T2.bio_data FROM STUDENTS_ADDRESSES AS T1 JOIN ADDRESSES AS T3 ON T1.address_id  =  T3.address_id JOIN STUDENTS AS T2 ON T1.student_id  =  T2.student_id
SELECT T1.address_details ,  T2.bio_data FROM ADDRESSES AS T1 JOIN STUDENTS AS T2 ON T1.address_id  =  T2.student_id
SELECT T1.bio_data ,  T2.date_of_transcript FROM STUDENTS AS T1 JOIN TRANSCRIPTS AS T2 ON T1.student_id  =  T2.student_id
SELECT T1.bio_data ,  T2.date_of_transcript FROM STUDENTS AS T1 JOIN TRANSCRIPTS AS T2 ON T1.student_id  =  T2.student_id
SELECT T1.behaviour_monitoring_details ,  count(*) FROM Behaviour_Monitoring AS T1 JOIN Behaviour_Monitoring AS T2 ON T1.behaviour_monitoring_details  =  T2.behaviour_monitoring_details GROUP BY T1.behaviour_monitoring_details ORDER BY count(*) DESC LIMIT 1
SELECT count(*) ,  T1.behaviour_monitoring_details FROM Behaviour_Monitoring AS T1 JOIN Behaviour_Monitoring AS T2 ON T1.behaviour_monitoring_details  =  T2.behaviour_monitoring_details GROUP BY T1.behaviour_monitoring_details ORDER BY count(*) DESC LIMIT 1
SELECT T1.bio_data ,  T2.behaviour_monitoring_details FROM STUDENTS AS T1 JOIN Behaviour_Monitoring AS T2 ON T1.student_id  =  T2.student_id GROUP BY T2.behaviour_monitoring_details ORDER BY count(*) DESC LIMIT 1 INTERSECT SELECT T1.bio_data ,  T2.behaviour_monitoring_details FROM STUDENTS AS T1 JOIN Behaviour_Monitoring AS T2 ON T1.student_id  =  T2.student_id GROUP BY T2.behaviour_monitoring_details ORDER BY count(*) DESC LIMIT 3
SELECT T1.bio_data ,  T1.student_details FROM STUDENTS AS T1 JOIN Behaviour_Monitoring AS T2 ON T1.student_id  =  T2.student_id WHERE T2.behaviour_monitoring_details  =  (SELECT T3.behaviour_monitoring_details FROM Behaviour_Monitoring AS T3 GROUP BY T3.behaviour_monitoring_details ORDER BY count(*) DESC LIMIT 1) INTERSECT SELECT T1.bio_data ,  T1.student_details FROM STUDENTS AS T1 JOIN Behaviour_Monitoring AS T2 ON T1.student_id  =  T2.student_id WHERE T2.behaviour_monitoring_details  =  (SELECT T3.behaviour_monitoring_details FROM Behaviour_Monitoring AS T3 GROUP BY T3.behaviour_monitoring_details ORDER BY count(*) DESC LIMIT 1 OFFSET 2)
SELECT T1.bio_data FROM Students AS T1 JOIN Behaviour_Monitoring AS T2 ON T1.student_id  =  T2.student_id GROUP BY T2.student_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.bio_data FROM STUDENTS AS T1 JOIN Behaviour_Monitoring AS T2 ON T1.student_id  =  T2.student_id GROUP BY T2.behaviour_monitoring_details ORDER BY count(*) DESC LIMIT 1
SELECT T1.bio_data ,  T2.event_date FROM STUDENTS AS T1 JOIN STUDENT_EVENTS AS T2 ON T1.student_id  =  T2.student_id
SELECT T1.bio_data ,  T2.event_date FROM STUDENTS AS T1 JOIN STUDENT_EVENTS AS T2 ON T1.student_id  =  T2.student_id
SELECT T1.event_type_code ,  T2.event_type_description ,  count(*) FROM Student_Events AS T1 JOIN Ref_Event_Types AS T2 ON T1.event_type_code  =  T2.event_type_code GROUP BY T1.event_type_code ORDER BY count(*) DESC LIMIT 1
SELECT T1.event_type_code ,  T2.event_type_description ,  count(*) FROM Student_Events AS T1 JOIN Ref_Event_Types AS T2 ON T1.event_type_code  =  T2.event_type_code GROUP BY T1.event_type_code ORDER BY count(*) DESC LIMIT 1
SELECT T1.achievement_details ,  T2.achievement_type_description FROM Achievements AS T1 JOIN Ref_Achievement_Type AS T2 ON T1.achievement_type_code  =  T2.achievement_type_code
SELECT T1.achievement_details ,  T2.achievement_type_description FROM ACHIEVEMENTS AS T1 JOIN Ref_Achievement_Type AS T2 ON T1.achievement_type_code  =  T2.achievement_type_code
SELECT count(DISTINCT T1.teacher_id) FROM CLASSES AS T1 JOIN STUDENTS AS T2 ON T1.student_id  =  T2.student_id LEFT JOIN ACHIEVEMENTS AS T3 ON T2.student_id  =  T3.student_id WHERE T3.achievement_id  =  "null"
SELECT count(DISTINCT T1.teacher_id) FROM CLASSES AS T1 JOIN TEACHERS AS T2 ON T1.teacher_id  =  T2.teacher_id EXCEPT SELECT count(DISTINCT T1.teacher_id) FROM CLASSES AS T1 JOIN TEACHERS AS T2 ON T1.teacher_id  =  T2.teacher_id JOIN Achievements AS T3 ON T1.student_id  =  T3.student_id
SELECT date_of_transcript ,  transcript_details FROM TRANSCRIPTS
SELECT date_of_transcript ,  transcript_details FROM TRANSCRIPTS
SELECT achievement_type_code ,  achievement_details ,  date_achievement FROM Achievements
SELECT achievement_type_code ,  achievement_details ,  date_achievement FROM Achievements
SELECT datetime_detention_start ,  datetime_detention_end FROM DETENTION
SELECT datetime_detention_start ,  datetime_detention_end FROM DETENTION
SELECT bio_data FROM STUDENTS WHERE student_details LIKE '%Suite%'
SELECT T1.bio_data FROM STUDENTS AS T1 JOIN Transcripts AS T2 ON T1.student_id  =  T2.student_id WHERE T2.transcript_details LIKE '%Suite%'
SELECT T1.teacher_details ,  T2.student_details FROM TEACHERS AS T1 JOIN STUDENTS AS T2 ON T1.teacher_id  =  T2.class_id
SELECT T1.teacher_details ,  T2.student_details FROM TEACHERS AS T1 JOIN STUDENTS AS T2 ON T1.teacher_id  =  T2.class_id
SELECT count(*) ,  T2.teacher_id FROM CLASSES AS T1 JOIN TEACHERS AS T2 ON T1.teacher_id  =  T2.teacher_id GROUP BY T2.teacher_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.teacher_id ,  count(*) FROM CLASSES AS T1 JOIN TEACHERS AS T2 ON T1.teacher_id  =  T2.teacher_id GROUP BY T1.teacher_id ORDER BY count(*) DESC LIMIT 1
SELECT count(*) ,  T1.student_id FROM CLASSES AS T1 JOIN STUDENTS AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.student_id ,  count(*) FROM CLASSES AS T1 JOIN STUDENTS AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.student_id ,  T1.student_details FROM STUDENTS AS T1 JOIN CLASSES AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING count(*)  =  2
SELECT T1.student_id ,  T1.class_details FROM CLASSES AS T1 JOIN classes AS T2 ON T1.student_id  =  T2.student_id WHERE T1.class_details  =  "Maths" INTERSECT SELECT T1.student_id ,  T1.class_details FROM CLASSES AS T1 JOIN classes AS T2 ON T1.student_id  =  T2.student_id WHERE T1.class_details  =  "Science"
SELECT T1.detention_type_code ,  T2.detention_type_description FROM Detention AS T1 JOIN Ref_Detention_Type AS T2 ON T1.detention_type_code  =  T2.detention_type_code GROUP BY T1.detention_type_code ORDER BY count(*) ASC LIMIT 1
SELECT T1.detention_type_code ,  T2.detention_type_description FROM Detention AS T1 JOIN Ref_Detention_Type AS T2 ON T1.detention_type_code  =  T2.detention_type_code GROUP BY T1.detention_type_code ORDER BY count(*) ASC LIMIT 1
SELECT T1.bio_data ,  T2.other_details FROM STUDENTS AS T1 JOIN STUDENT_LOANS AS T2 ON T1.student_id  =  T2.student_id WHERE amount_of_loan  >  (SELECT avg(amount_of_loan) FROM STUDENT_LOANS)
SELECT T1.bio_data ,  T1.student_details FROM STUDENTS AS T1 JOIN STUDENT_LOANS AS T2 ON T1.student_id  =  T2.student_id WHERE T2.amount_of_loan  >  (SELECT avg(amount_of_loan) FROM STUDENT_LOANS)
SELECT date_of_loan FROM STUDENT_LOANS ORDER BY date_of_loan ASC LIMIT 1
SELECT min(date_of_loan) FROM STUDENT_LOANS
SELECT T1.bio_data FROM STUDENTS AS T1 JOIN STUDENT_LOANS AS T2 ON T1.student_id  =  T2.student_id ORDER BY T2.amount_of_loan LIMIT 1
SELECT T1.bio_data FROM STUDENTS AS T1 JOIN STUDENT_LOANS AS T2 ON T1.student_id  =  T2.student_id ORDER BY T2.amount_of_loan ASC LIMIT 1
SELECT T1.date_of_transcript FROM TRANSCRIPTS AS T1 JOIN STUDENT_LOANS AS T2 ON T1.student_id  =  T2.student_id WHERE T2.amount_of_loan  =  (SELECT max(amount_of_loan) FROM STUDENT_LOANS)
SELECT T1.date_of_transcript FROM Transcripts AS T1 JOIN Student_Loans AS T2 ON T1.student_id  =  T2.student_id ORDER BY T2.amount_of_loan DESC LIMIT 1
SELECT T2.teacher_details FROM Classes AS T1 JOIN Teachers AS T2 ON T1.teacher_id  =  T2.teacher_id JOIN Transcripts AS T3 ON T3.student_id  =  T1.student_id ORDER BY T3.date_of_transcript LIMIT 1
SELECT T1.teacher_details FROM TEACHERS AS T1 JOIN CLASSES AS T2 ON T1.teacher_id  =  T2.teacher_id ORDER BY T2.class_details LIMIT 1
SELECT student_id ,  sum(amount_of_loan) FROM STUDENT_LOANS GROUP BY student_id
SELECT T1.student_id ,  sum(T2.amount_of_loan) FROM STUDENTS AS T1 JOIN Student_Loans AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id
SELECT T1.student_id ,  T1.bio_data ,  count(*) FROM Students AS T1 JOIN Classes AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id
SELECT T1.student_id ,  T1.bio_data ,  count(*) FROM STUDENTS AS T1 JOIN CLASSES AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id
SELECT count(DISTINCT student_id) FROM Detention
SELECT count(DISTINCT student_id) FROM Detention
SELECT T1.address_type_code ,  T2.address_type_description FROM STUDENTS_ADDRESSES AS T1 JOIN Ref_Address_Types AS T2 ON T1.address_type_code  =  T2.address_type_code GROUP BY T1.address_type_code ORDER BY count(*) DESC LIMIT 1
SELECT T1.address_type_code ,  T2.address_type_description FROM Ref_Address_Types AS T1 JOIN Addresses AS T2 ON T1.address_type_code  =  T2.address_type_code GROUP BY T1.address_type_code ORDER BY count(*) DESC LIMIT 1
SELECT T1.bio_data FROM STUDENTS AS T1 JOIN STUDENT_EVENTS AS T2 ON T1.student_id  =  T2.student_id EXCEPT SELECT T1.bio_data FROM STUDENTS AS T1 JOIN STUDENT_LOANS AS T2 ON T1.student_id  =  T2.student_id
SELECT T1.bio_data FROM STUDENTS AS T1 JOIN STUDENT_EVENTS AS T2 ON T1.student_id  =  T2.student_id EXCEPT SELECT T1.bio_data FROM STUDENTS AS T1 JOIN STUDENT_LOANS AS T2 ON T1.student_id  =  T2.student_id
SELECT T1.datetime_detention_start ,  T1.datetime_detention_end FROM Detention AS T1 JOIN Transcripts AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING count(*)  =  2
SELECT T1.datetime_detention_start ,  T1.datetime_detention_end FROM Detention AS T1 JOIN Transcripts AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING count(*)  =  2
SELECT datetime_detention_start FROM Detention
SELECT datetime_detention_start FROM Detention
SELECT name FROM Author
SELECT name FROM Author
SELECT name ,  address FROM CLIENT
SELECT name ,  address FROM CLIENT
SELECT title ,  isbn ,  saleprice FROM Book
SELECT title ,  ISBN ,  saleprice FROM Book
SELECT count(*) FROM Book
SELECT count(*) FROM BOOK
SELECT count(*) FROM Author
SELECT count(*) FROM Author
SELECT count(*) FROM CLIENT
SELECT count(*) FROM CLIENT
SELECT name ,  address FROM client ORDER BY name
SELECT name ,  address FROM client ORDER BY name
SELECT T2.title ,  T2.author FROM Author_Book AS T1 JOIN Book AS T2 ON T1.author  =  T2.author
SELECT T1.title ,  T2.name FROM Book AS T1 JOIN Author_Book AS T2 ON T1.isbn  =  T2.isbn
SELECT T2.idorder ,  T1.name FROM client AS T1 JOIN orders AS T2 ON T1.idclient  =  T2.idclient
SELECT T2.idorder ,  T1.name FROM client AS T1 JOIN orders AS T2 ON T1.idclient  =  T2.idclient
SELECT T2.name ,  count(*) FROM Author_book AS T1 JOIN Author AS T2 ON T1.author  =  T2.idAuthor GROUP BY T2.name
SELECT T1.name ,  count(*) FROM Author AS T1 JOIN Author_book AS T2 ON T1.idauthor  =  T2.author GROUP BY T1.name
SELECT T2.isbn ,  count(*) FROM books_order AS T1 JOIN book AS T2 ON T1.isbn  =  T2.isbn GROUP BY T1.isbn
SELECT T1.isbn ,  sum(T2.amount) FROM book AS T1 JOIN books_order AS T2 ON T1.isbn  =  T2.isbn GROUP BY T1.isbn
SELECT T1.isbn ,  sum(T2.amount) FROM book AS T1 JOIN books_order AS T2 ON T1.isbn  =  T2.isbn GROUP BY T1.isbn
SELECT T1.isbn ,  sum(T2.amount) FROM Book AS T1 JOIN Books_order AS T2 ON T1.isbn  =  T2.isbn GROUP BY T1.isbn
SELECT T2.title FROM books_order AS T1 JOIN book AS T2 ON T1.isbn  =  T2.isbn GROUP BY T1.isbn ORDER BY sum(T1.amount) DESC LIMIT 1
SELECT T2.title FROM books_order AS T1 JOIN book AS T2 ON T1.isbn  =  T2.isbn GROUP BY T1.isbn ORDER BY sum(T1.amount) DESC LIMIT 1
SELECT T2.title ,  T2.purchaseprice FROM Books_order AS T1 JOIN book AS T2 ON T1.isbn  =  T2.isbn GROUP BY T1.isbn ORDER BY sum(T1.amount) DESC LIMIT 1
SELECT T2.title ,  T2.purchaseprice FROM Books_order AS T1 JOIN book AS T2 ON T1.isbn  =  T2.isbn GROUP BY T1.isbn ORDER BY sum(T1.amount) DESC LIMIT 1
SELECT T2.title FROM books_order AS T1 JOIN book AS T2 ON T1.isbn  =  T2.isbn
SELECT DISTINCT T1.title FROM book AS T1 JOIN books_order AS T2 ON T1.isbn  =  T2.isbn JOIN orders AS T3 ON T2.idorder  =  T3.idorder WHERE T3.dateorder  <=  T3.dateexped
SELECT DISTINCT T1.name FROM CLIENT AS T1 JOIN orders AS T2 ON T1.idclient  =  T2.idclient
SELECT DISTINCT T1.name FROM CLIENT AS T1 JOIN ORDERS AS T2 ON T1.idclient  =  T2.idclient
SELECT T2.name ,  count(*) FROM books_order AS T1 JOIN client AS T2 ON T1.idorder  =  T2.idclient GROUP BY T2.name
SELECT T2.name ,  count(*) FROM books_order AS T1 JOIN client AS T2 ON T1.idorder  =  T2.idclient GROUP BY T2.name
SELECT T2.name FROM books_order AS T1 JOIN client AS T2 ON T1.idorder  =  T2.idclient GROUP BY T2.idclient ORDER BY count(*) DESC LIMIT 1
SELECT T2.name FROM orders AS T1 JOIN client AS T2 ON T1.idclient  =  T2.idclient GROUP BY T2.name ORDER BY sum(T1.dateexped  -  T1.dateorder) DESC LIMIT 1
SELECT T1.name ,  sum(T2.amount) FROM CLIENT AS T1 JOIN books_order AS T2 ON T1.idclient  =  T2.idorder GROUP BY T1.idclient
SELECT T1.name ,  sum(T2.amount) FROM CLIENT AS T1 JOIN books_order AS T2 ON T1.idclient  =  T2.idorder GROUP BY T1.idclient
SELECT T2.name FROM books_order AS T1 JOIN client AS T2 ON T1.idorder  =  T2.idclient JOIN orders AS T3 ON T2.idclient  =  T3.idclient GROUP BY T2.idclient ORDER BY sum(T1.amount) DESC LIMIT 1
SELECT T1.name FROM client AS T1 JOIN orders AS T2 ON T1.idclient  =  T2.idclient JOIN books_order AS T3 ON T2.idorder  =  T3.idorder GROUP BY T1.name ORDER BY sum(T3.amount) DESC LIMIT 1
SELECT title FROM book WHERE isbn NOT IN (SELECT isbn FROM books_order)
SELECT title FROM book WHERE isbn NOT IN (SELECT isbn FROM books_order)
SELECT name FROM client WHERE idclient NOT IN (SELECT idclient FROM orders)
SELECT name FROM CLIENT WHERE idclient NOT IN (SELECT idclient FROM orders)
SELECT max(saleprice) ,  min(saleprice) FROM BOOK
SELECT max(saleprice) ,  min(saleprice) FROM BOOK
SELECT avg(purchaseprice) ,  avg(saleprice) FROM BOOK
SELECT avg(purchaseprice) ,  avg(saleprice) FROM BOOK
SELECT max(saleprice - purchaseprice) FROM book
SELECT max(saleprice - purchaseprice) FROM book
SELECT title FROM book WHERE saleprice  >  (SELECT avg(saleprice) FROM book)
SELECT title FROM book WHERE saleprice  >  (SELECT avg(saleprice) FROM book)
SELECT title FROM book ORDER BY saleprice LIMIT 1
SELECT title FROM book ORDER BY saleprice LIMIT 1
SELECT title FROM book ORDER BY purchaseprice DESC LIMIT 1
SELECT title FROM book ORDER BY purchaseprice DESC LIMIT 1
SELECT avg(T1.saleprice) FROM Book AS T1 JOIN Author_Book AS T2 ON T1.isbn  =  T2.isbn JOIN AUTHOR AS T3 ON T2.author  =  T3.id WHERE T3.name  =  "George Orwell"
SELECT avg(T2.saleprice) FROM Author_Book AS T1 JOIN book AS T2 ON T1.isbn  =  T2.isbn WHERE T1.author  =  "George Orwell"
SELECT T2.saleprice FROM Author_Book AS T1 JOIN Book AS T2 ON T1.Author  =  T2.Author WHERE T1.name  =  "Plato"
SELECT T2.saleprice FROM Author_book AS T1 JOIN book AS T2 ON T1.author  =  T2.author WHERE T1.name  =  "Plato"
SELECT T1.title FROM Book AS T1 JOIN Author_Book AS T2 ON T1.ISBN  =  T2.ISBN JOIN Author AS T3 ON T2.Author  =  T3.idAuthor WHERE T3.name  =  "George Orwell" ORDER BY T1.saleprice LIMIT 1
SELECT T2.title FROM Author_Book AS T1 JOIN Book AS T2 ON T1.ISBN  =  T2.ISBN WHERE T1.Author  =  "George Orwell" ORDER BY T2.saleprice LIMIT 1
SELECT title FROM book WHERE author  =  "Plato" AND purchaseprice  <  (SELECT avg(saleprice) FROM book)
SELECT T2.title FROM Author_Book AS T1 JOIN Book AS T2 ON T1.ISBN  =  T2.ISBN WHERE T1.Author  =  "Plato" INTERSECT SELECT title FROM Book WHERE saleprice  <  (SELECT avg(saleprice) FROM book)
SELECT T2.name FROM book AS T1 JOIN author AS T2 ON T1.author  =  T2.id JOIN author_book AS T3 ON T1.isbn  =  T3.isbn WHERE T1.title  =  "Pride and Prejudice"
SELECT T2.name FROM Book AS T1 JOIN Author AS T2 ON T1.author  =  T2.idAuthor WHERE T1.title  =  "Pride and Prejudice"
SELECT T2.title FROM Author_Book AS T1 JOIN Book AS T2 ON T1.ISBN  =  T2.ISBN JOIN Author AS T3 ON T1.Author  =  T3.idAuthor WHERE T3.name LIKE '%Plato%'
SELECT T2.title FROM Author_Book AS T1 JOIN Book AS T2 ON T1.ISBN  =  T2.ISBN JOIN Author AS T3 ON T1.Author  =  T3.idAuthor WHERE T3.name LIKE "%Plato%"
SELECT sum(T3.amount) FROM Books_order AS T3 JOIN orders AS T1 ON T3.idorder  =  T1.idorder JOIN book AS T2 ON T2.isbn  =  T3.isbn WHERE T2.title  =  'Pride and Prejudice'
SELECT sum(T1.amount) FROM BOOKS_ORDER AS T1 JOIN Orders AS T2 ON T1.idorder  =  T2.idorder JOIN Book AS T3 ON T3.ISBN  =  T1.ISBN WHERE T3.Title  =  "Pride and Prejudice"
SELECT T1.idorder FROM books_order AS T1 JOIN orders AS T2 ON T1.idorder  =  T2.idorder JOIN book AS T3 ON T3.isbn  =  T1.isbn WHERE T3.title  =  'Pride and Prejudice' INTERSECT SELECT T1.idorder FROM books_order AS T1 JOIN orders AS T2 ON T1.idorder  =  T2.idorder JOIN book AS T3 ON T3.isbn  =  T1.isbn WHERE T3.title  =  'The Little Prince'
SELECT T2.idorder FROM author_book AS T1 JOIN book AS T3 ON T1.author  =  T3.author JOIN books_order AS T2 ON T2.isbn  =  T3.isbn WHERE T3.title  =  'Pride and Prejudice' INTERSECT SELECT T2.idorder FROM author_book AS T1 JOIN book AS T3 ON T1.author  =  T3.author JOIN books_order AS T2 ON T2.isbn  =  T3.isbn WHERE T3.title  =  'The Little Prince'
SELECT T1.isbn FROM books_order AS T1 JOIN orders AS T2 ON T1.idorder  =  T2.idorder WHERE T2.idclient  =  (SELECT idclient FROM client WHERE name  =  "Peter Doe") INTERSECT SELECT T1.isbn FROM books_order AS T1 JOIN orders AS T2 ON T1.idorder  =  T2.idorder WHERE T2.idclient  =  (SELECT idclient FROM client WHERE name  =  "James Smith")
SELECT T3.isbn FROM books_order AS T1 JOIN orders AS T2 ON T1.idorder  =  T2.idorder JOIN book AS T3 ON T3.isbn  =  T1.isbn JOIN client AS T4 ON T4.idclient  =  T2.idclient WHERE T4.name  =  'Peter Doe' INTERSECT SELECT T3.isbn FROM books_order AS T1 JOIN orders AS T2 ON T1.idorder  =  T2.idorder JOIN book AS T3 ON T3.isbn  =  T1.isbn JOIN client AS T4 ON T4.idclient  =  T2.idclient WHERE T4.name  =  'James Smith'
SELECT T3.title FROM books_order AS T1 JOIN orders AS T2 ON T1.idorder  =  T2.idorder JOIN book AS T3 ON T1.isbn  =  T3.isbn WHERE T2.idclient IN (SELECT idclient FROM orders WHERE dateorder  =  (SELECT max(dateorder) FROM orders WHERE idclient  =  "Peter Doe")) EXCEPT SELECT T3.title FROM books_order AS T1 JOIN orders AS T2 ON T1.idorder  =  T2.idorder JOIN book AS T3 ON T1.isbn  =  T3.isbn WHERE T2.idclient IN (SELECT idclient FROM orders WHERE dateorder  =  (SELECT max(dateorder) FROM orders WHERE idclient  =  "James Smith"))
SELECT T3.title FROM books_order AS T1 JOIN orders AS T2 ON T1.idorder  =  T2.idorder JOIN book AS T3 ON T3.isbn  =  T1.isbn WHERE T2.idclient  =  (SELECT idclient FROM orders WHERE dateexped  >  "2020-01-01" EXCEPT SELECT idclient FROM orders WHERE dateexped  <  "2020-01-01") AND T2.dateexped  >  "2020-01-01"
SELECT DISTINCT T1.name FROM CLIENT AS T1 JOIN orders AS T2 ON T1.idclient  =  T2.idclient JOIN books_order AS T3 ON T2.idorder  =  T3.idorder JOIN book AS T4 ON T3.isbn  =  T4.isbn WHERE T4.title  =  'Pride and Prejudice'
SELECT DISTINCT T1.name FROM client AS T1 JOIN orders AS T2 ON T1.idclient  =  T2.idclient JOIN books_order AS T3 ON T2.idorder  =  T3.idorder JOIN book AS T4 ON T3.isbn  =  T4.isbn WHERE T4.title  =  'Pride and Prejudice'
SELECT count(*) FROM book
SELECT Title FROM book ORDER BY Title ASC
SELECT Title FROM book ORDER BY Pages DESC
SELECT TYPE ,  Release FROM book
SELECT max(Chapters) ,  min(Chapters) ,  Title FROM book GROUP BY Title
SELECT Title FROM book WHERE TYPE != "Poet"
SELECT avg(Rating) FROM review
SELECT T2.Title ,  T1.Rating FROM review AS T1 JOIN book AS T2 ON T1.Book_ID  =  T2.Book_ID
SELECT T2.Rating FROM book AS T1 JOIN review AS T2 ON T1.Book_ID  =  T2.Book_ID ORDER BY T1.Chapters DESC LIMIT 1
SELECT Rank FROM book ORDER BY Pages ASC LIMIT 1
SELECT T2.title FROM review AS T1 JOIN book AS T2 ON T1.book_id  =  T2.book_id ORDER BY T1.rank LIMIT 1
SELECT avg(T2.Readers_in_Million) FROM book AS T1 JOIN review AS T2 ON T1.Book_ID  =  T2.Book_ID WHERE T1.Type  =  "Novel"
SELECT TYPE ,  COUNT(*) FROM book GROUP BY TYPE
SELECT TYPE FROM book GROUP BY TYPE ORDER BY COUNT(*) DESC LIMIT 1
SELECT TYPE FROM book GROUP BY TYPE HAVING count(*)  >=  3
SELECT T2.title FROM review AS T1 JOIN book AS T2 ON T1.Book_ID  =  T2.Book_ID ORDER BY T1.Rating
SELECT T2.title ,  T2.Audio FROM review AS T1 JOIN book AS T2 ON T1.Book_ID  =  T2.Book_ID ORDER BY T1.Readers_in_Million DESC
SELECT count(*) FROM book WHERE book_id NOT IN (SELECT book_id FROM review)
SELECT TYPE FROM book WHERE Chapters  >  75 INTERSECT SELECT TYPE FROM book WHERE Chapters  <  50
SELECT count(DISTINCT TYPE) FROM book
SELECT TYPE ,  title FROM book WHERE book_id NOT IN (SELECT Book_ID FROM review)
SELECT count(*) FROM customer
SELECT count(*) FROM customer
SELECT name FROM customer ORDER BY LEVEL_of_Membership ASC
SELECT name FROM customer ORDER BY LEVEL_of_Membership ASC
SELECT Nationality ,  Card_Credit FROM customer
SELECT Nationality ,  Card_Credit FROM customer
SELECT name FROM customer WHERE nationality  =  "England" OR nationality  =  "Australia"
SELECT name FROM customer WHERE nationality  =  "England" OR nationality  =  "Australia"
SELECT avg(card_credit) FROM customer WHERE level_of_membership  >  1
SELECT avg(card_credit) FROM customer WHERE level_of_membership  >  1
SELECT card_credit FROM customer ORDER BY LEVEL_OF_MEMBERSHIP DESC LIMIT 1
SELECT card_credit FROM customer ORDER BY LEVEL_of_membership DESC LIMIT 1
SELECT Nationality ,  COUNT(*) FROM customer GROUP BY Nationality
SELECT Nationality ,  count(*) FROM customer GROUP BY Nationality
SELECT Nationality FROM customer GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT Nationality FROM customer GROUP BY Nationality ORDER BY count(*) DESC LIMIT 1
SELECT Nationality FROM customer WHERE Card_Credit  <  50 INTERSECT SELECT Nationality FROM customer WHERE Card_Credit  >  75
SELECT Nationality FROM customer WHERE Card_Credit  >  50 INTERSECT SELECT Nationality FROM customer WHERE Card_Credit  <  75
SELECT T2.name ,  T1.Dish_Name FROM customer_order AS T1 JOIN customer AS T2 ON T1.Customer_ID  =  T2.Customer_ID
SELECT T3.Name ,  T2.Dish_Name FROM customer_order AS T1 JOIN dish AS T2 ON T1.Dish_Name  =  T2.Dish_Name JOIN customer AS T3 ON T1.Customer_ID  =  T3.Customer_ID
SELECT T1.name ,  T2.Dish_Name FROM customer AS T1 JOIN customer_order AS T2 ON T1.Customer_ID  =  T2.Customer_ID ORDER BY T2.Quantity DESC
SELECT T3.name ,  T2.Dish_Name FROM customer_order AS T1 JOIN customer AS T3 ON T1.Customer_ID  =  T3.Customer_ID JOIN customer_order AS T2 ON T1.Dish_Name  =  T2.Dish_Name ORDER BY T1.Quantity DESC
SELECT T2.name ,  sum(T1.quantity) FROM customer_order AS T1 JOIN customer AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id
SELECT T2.name ,  sum(T1.quantity) FROM customer_order AS T1 JOIN customer AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id
SELECT T2.name ,  sum(T1.quantity) FROM customer_order AS T1 JOIN customer AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T2.name HAVING sum(T1.quantity)  >  1
SELECT T1.name FROM customer AS T1 JOIN customer_order AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T2.customer_id HAVING sum(T2.quantity)  >  1
SELECT DISTINCT manager FROM branch
SELECT DISTINCT manager FROM branch
SELECT name FROM customer WHERE customer_id NOT IN (SELECT customer_id FROM customer_order)
SELECT name FROM customer WHERE customer_id NOT IN (SELECT customer_id FROM customer_order)
SELECT count(*) FROM member
SELECT Name FROM member ORDER BY Age ASC
SELECT Name ,  Nationality FROM member
SELECT Name FROM member WHERE Nationality != "England"
SELECT Name FROM member WHERE Age  =  19 OR Age  =  20
SELECT Name FROM member ORDER BY Age DESC LIMIT 1
SELECT Nationality ,  COUNT(*) FROM member GROUP BY Nationality
SELECT Nationality FROM member GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT Nationality FROM member GROUP BY Nationality HAVING COUNT(*)  >=  2
SELECT T2.Team_Leader ,  T1.Club_Name FROM club AS T1 JOIN club AS T2 ON T1.Club_ID  =  T2.Club_ID
SELECT Team_Leader FROM club WHERE Overall_Ranking  >  100
SELECT T2.Team_Leader FROM club_leader AS T1 JOIN club AS T2 ON T1.Club_ID  =  T2.Club_ID WHERE T1.Year_Join  <  2018
SELECT Team_Leader FROM club WHERE Club_Name  =  "Houston"
SELECT Name FROM member EXCEPT SELECT T2.Name FROM club_leader AS T1 JOIN member AS T2 ON T1.Member_ID  =  T2.Member_ID
SELECT Nationality FROM member WHERE Age  >  22 INTERSECT SELECT Nationality FROM member WHERE Age  <  19
SELECT avg(T2.Age) FROM club AS T1 JOIN member AS T2 ON T1.Team_Leader  =  T2.Member_ID
SELECT Club_Name FROM club WHERE Club_Name LIKE "%state%"
SELECT Collection_Subset_Name FROM Collection_Subsets
SELECT Collection_Subset_Name FROM Collection_Subsets
SELECT Collection_Subset_Details FROM Collection_Subsets WHERE Collection_Subset_Name  =  'Top collection'
SELECT T1.Collection_Subset_Details FROM Collection_Subsets AS T1 JOIN Document_Subsets AS T2 ON T1.Collection_Subset_ID  =  T2.Document_Subset_ID WHERE T2.Document_Subset_Name  =  'Top collection'
SELECT document_subset_name FROM Document_Subsets
SELECT Document_Subset_Name FROM Document_Subsets
SELECT Document_Subset_Details FROM Document_Subsets WHERE Document_Subset_Name  =  'Best for 2000'
SELECT Document_Subset_Details FROM Document_Subsets WHERE Document_Subset_Name  =  'Best for 2000'
SELECT Document_Object_ID FROM Document_Objects
SELECT Document_Object_ID FROM Document_Objects
SELECT Parent_Document_Object_ID FROM Document_Objects WHERE Owner  =  "Marlin"
SELECT Document_Object_ID FROM Document_Objects WHERE OWNER  =  "Marlin"
SELECT OWNER FROM Document_Objects WHERE Description  =  'Braeden Collection'
SELECT T3.Owner FROM Collections AS T1 JOIN Documents_in_Collections AS T2 ON T1.Collection_ID  =  T2.Collection_ID JOIN Document_Objects AS T3 ON T2.Document_Object_ID  =  T3.Document_Object_ID WHERE T1.Collection_Name  =  "Braeden Collection"
SELECT OWNER FROM Document_Objects WHERE Description  =  "Parent"
SELECT T2.Owner FROM Document_Objects AS T1 JOIN Document_Objects AS T2 ON T1.Document_Object_ID  =  T2.Parent_Document_Object_ID WHERE T1.Owner  =  "Marlin"
SELECT DISTINCT Description FROM Document_Objects WHERE Parent_Document_Object_ID  =  "null"
SELECT DISTINCT Other_Details FROM Document_Objects WHERE Parent_Document_Object_ID  =  0
SELECT count(*) FROM Document_Objects WHERE OWNER  =  "Marlin"
SELECT count(*) FROM Document_Objects WHERE OWNER  =  "Marlin"
SELECT document_object_id FROM Document_objects EXCEPT SELECT parent_document_object_id FROM Document_objects
SELECT Document_Object_ID FROM Document_Objects WHERE Parent_Document_Object_ID != "null"
SELECT parent_document_object_id ,  count(*) FROM Document_objects WHERE parent_document_object_id != "null" GROUP BY parent_document_object_id
SELECT count(*) ,  parent_document_object_id FROM Document_objects GROUP BY parent_document_object_id
SELECT Collection_Name FROM Collections
SELECT Collection_Name FROM Collections
SELECT Collection_Description FROM Collections WHERE Collection_Name  =  "Best"
SELECT Collection_Description FROM Collections WHERE Collection_Name  =  'Best'
SELECT Collection_Name FROM Collections WHERE Collection_ID  =  (SELECT Parent_Collection_ID FROM Collections WHERE Collection_Name  =  "Nice")
SELECT T2.Collection_Name FROM Collections AS T1 JOIN Collections AS T2 ON T1.Collection_ID  =  T2.Parent_Collection_ID WHERE T1.Collection_Name  =  "Nice"
SELECT Collection_Name FROM Collections WHERE Collection_ID NOT IN (SELECT Parent_Collection_ID FROM Collections)
SELECT Collection_Name FROM Collections WHERE Collection_ID NOT IN (SELECT DISTINCT Parent_Collection_ID FROM Collections)
SELECT Parent_Document_Object_ID FROM Document_Objects GROUP BY Parent_Document_Object_ID HAVING count(*)  >  1
SELECT T1.document_object_id FROM Document_Objects AS T1 JOIN Document_Objects AS T2 ON T1.document_object_id  =  T2.parent_document_object_id GROUP BY T1.document_object_id HAVING count(*)  >  1
SELECT count(*) FROM Collections WHERE Parent_Collection_ID  =  (SELECT Collection_ID FROM Collections WHERE Collection_Name  =  "Best")
SELECT count(*) FROM Collections AS T1 JOIN Documents_in_Collections AS T2 ON T1.collection_id  =  T2.collection_id WHERE T1.collection_name  =  "Best"
SELECT T2.Document_Object_ID FROM Document_Subset_Members AS T1 JOIN Document_Objects AS T2 ON T1.Related_Document_Object_ID  =  T2.Document_Object_ID WHERE T2.Owner  =  "Ransom"
SELECT T2.Related_Document_Object_ID FROM Document_Objects AS T1 JOIN Document_Subset_Members AS T2 ON T1.Document_Object_ID  =  T2.Document_Object_ID WHERE T1.Owner  =  "Ransom"
SELECT T1.Collection_Subset_ID ,  T2.Collection_Subset_Name ,  COUNT(*) FROM Collection_Subset_Members AS T1 JOIN Collection_Subsets AS T2 ON T1.Collection_Subset_ID  =  T2.Collection_Subset_ID GROUP BY T1.Collection_Subset_ID
SELECT T1.Collection_Subset_ID ,  T2.Collection_Subset_Name ,  COUNT(*) FROM Collection_Subset_Members AS T1 JOIN Collection_Subsets AS T2 ON T1.Collection_Subset_ID  =  T2.Collection_Subset_ID GROUP BY T1.Collection_Subset_ID
SELECT T2.Document_Object_ID ,  count(*) FROM Document_Objects AS T1 JOIN Documents_in_Collections AS T2 ON T1.Document_Object_ID  =  T2.Document_Object_ID GROUP BY T2.Document_Object_ID ORDER BY count(*) DESC LIMIT 1
SELECT count(*) ,  T1.document_object_id FROM Document_Objects AS T1 JOIN Document_Objects AS T2 ON T1.document_object_id  =  T2.parent_document_object_id GROUP BY T1.document_object_id
SELECT T1.Document_Object_ID ,  COUNT(*) FROM Document_Objects AS T1 JOIN Document_Subset_Members AS T2 ON T1.Document_Object_ID  =  T2.Related_Document_Object_ID GROUP BY T1.Document_Object_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT T1.Document_Object_ID FROM Document_Objects AS T1 JOIN Documents_in_Collections AS T2 ON T1.Document_Object_ID  =  T2.Document_Object_ID GROUP BY T1.Document_Object_ID ORDER BY count(*) ASC LIMIT 1
SELECT T1.Document_Object_ID ,  count(*) FROM Document_Objects AS T1 JOIN Documents_in_Collections AS T2 ON T1.Document_Object_ID  =  T2.Document_Object_ID GROUP BY T1.Document_Object_ID HAVING count(*) BETWEEN 2 AND 4
SELECT T1.Document_Object_ID ,  count(*) FROM Document_Subset_Members AS T1 JOIN Document_Subset_Members AS T2 ON T1.Related_Document_Object_ID  =  T2.Document_Object_ID WHERE T1.Document_Object_ID != T2.Document_Object_ID GROUP BY T1.Document_Object_ID HAVING count(*) BETWEEN 2 AND 4
SELECT T1.Owner FROM Document_Objects AS T1 JOIN Document_Subset_Members AS T2 ON T1.Document_Object_ID  =  T2.Related_Document_Object_ID WHERE T1.Owner  =  "Braeden"
SELECT DISTINCT T1.Owner FROM Document_Objects AS T1 JOIN Document_Subset_Members AS T2 ON T1.Document_Object_ID  =  T2.Related_Document_Object_ID WHERE T1.Owner  =  "Braeden"
SELECT T1.Document_Subset_Name FROM Document_Subsets AS T1 JOIN Document_Subset_Members AS T2 ON T1.Document_Subset_ID  =  T2.Document_Subset_ID JOIN Document_Objects AS T3 ON T2.Related_Document_Object_ID  =  T3.Document_Object_ID WHERE T3.Owner  =  "Braeden"
SELECT DISTINCT T3.Document_Subset_Name FROM Document_Subsets AS T1 JOIN Document_Subset_Members AS T2 ON T1.Document_Subset_ID  =  T2.Document_Subset_ID JOIN Document_Objects AS T3 ON T2.Related_Document_Object_ID  =  T3.Document_Object_ID WHERE T3.Owner  =  "Braeden"
SELECT T1.Document_Subset_ID ,  T1.Document_Subset_Name ,  COUNT(*) FROM Document_Subsets AS T1 JOIN Document_Subset_Members AS T2 ON T1.Document_Subset_ID  =  T2.Document_Subset_ID GROUP BY T1.Document_Subset_ID
SELECT T1.Document_Subset_ID ,  T1.Document_Subset_Name ,  COUNT(*) FROM Document_Subsets AS T1 JOIN Document_Subset_Members AS T2 ON T1.Document_Subset_ID  =  T2.Document_Subset_ID GROUP BY T1.Document_Subset_ID
SELECT T2.Document_Subset_ID ,  T2.Document_Subset_Name ,  COUNT(*) FROM Document_Subset_Members AS T1 JOIN Document_Subsets AS T2 ON T1.Document_Subset_ID  =  T2.Document_Subset_ID GROUP BY T2.Document_Subset_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.document_subset_id ,  T1.document_subset_name ,  count(*) FROM Document_Subsets AS T1 JOIN Document_Subset_Members AS T2 ON T1.document_subset_id  =  T2.document_subset_id GROUP BY T1.document_subset_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.Document_Object_ID FROM Document_Objects AS T1 JOIN Document_Subset_Members AS T2 ON T1.Document_Object_ID  =  T2.Document_Object_ID JOIN Document_Subsets AS T3 ON T2.Document_Subset_ID  =  T3.Document_Subset_ID WHERE T3.Document_Subset_Name  =  'Best for 2000'
SELECT T1.Document_Object_ID FROM Document_Objects AS T1 JOIN Document_Subset_Members AS T2 ON T1.Document_Object_ID  =  T2.Related_Document_Object_ID JOIN Document_Subsets AS T3 ON T2.Document_Subset_ID  =  T3.Document_Subset_ID WHERE T3.Document_Subset_Name  =  'Best for 2000'
SELECT T1.Document_Subset_Name ,  T3.Document_Object_ID FROM Document_Subsets AS T1 JOIN Document_Subset_Members AS T2 ON T1.Document_Subset_ID  =  T2.Document_Subset_ID JOIN Document_Objects AS T3 ON T2.Related_Document_Object_ID  =  T3.Document_Object_ID
SELECT T1.Document_Subset_Name ,  T2.Document_Object_ID FROM Document_Subsets AS T1 JOIN Document_Subset_Members AS T2 ON T1.Document_Subset_ID  =  T2.Document_Subset_ID
SELECT T3.Collection_Name FROM Document_Objects AS T1 JOIN Documents_in_Collections AS T2 ON T1.Document_Object_ID  =  T2.Document_Object_ID JOIN Collections AS T3 ON T2.Collection_ID  =  T3.Collection_ID WHERE T1.Owner  =  "Ransom"
SELECT T1.Collection_Name FROM Collections AS T1 JOIN Documents_in_Collections AS T2 ON T1.Collection_ID  =  T2.Collection_ID JOIN Document_Objects AS T3 ON T2.Document_Object_ID  =  T3.Document_Object_ID WHERE T3.Owner  =  "Ransom"
SELECT count(*) ,  T1.document_object_id FROM Documents_in_Collections AS T1 JOIN Collections AS T2 ON T1.collection_id  =  T2.collection_id GROUP BY T1.document_object_id
SELECT count(*) ,  T1.document_object_id FROM Documents_in_Collections AS T1 JOIN Collections AS T2 ON T1.collection_id  =  T2.collection_id GROUP BY T1.document_object_id
SELECT count(*) FROM Collections AS T1 JOIN Documents_in_Collections AS T2 ON T1.collection_id  =  T2.collection_id WHERE T1.collection_name  =  'Best'
SELECT count(*) FROM Collections AS T1 JOIN Documents_in_Collections AS T2 ON T1.Collection_ID  =  T2.Collection_ID WHERE T1.Collection_Name  =  'Best'
SELECT T2.Document_Object_ID FROM Collections AS T1 JOIN Documents_in_Collections AS T2 ON T1.Collection_ID  =  T2.Collection_ID WHERE T1.Collection_Name  =  "Best"
SELECT count(*) FROM Documents_in_collections AS T1 JOIN Collections AS T2 ON T1.Collection_ID  =  T2.Collection_ID WHERE T2.Collection_Name  =  "Best"
SELECT T1.collection_name ,  T1.collection_id ,  count(*) FROM Collections AS T1 JOIN Documents_in_Collections AS T2 ON T1.collection_id  =  T2.collection_id GROUP BY T1.collection_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.collection_name ,  T1.collection_id ,  count(*) FROM Collections AS T1 JOIN Documents_in_Collections AS T2 ON T1.collection_id  =  T2.collection_id WHERE T1.collection_name  =  'Best' GROUP BY T1.collection_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.Document_Object_ID FROM Document_Subset_Members AS T1 JOIN Document_Objects AS T2 ON T1.Related_Document_Object_ID  =  T2.Document_Object_ID JOIN Document_Subsets AS T3 ON T1.Document_Subset_ID  =  T3.Document_Subset_ID JOIN Collections AS T4 ON T2.Document_Object_ID  =  T4.Collection_ID WHERE T3.Document_Subset_Name  =  "Best" AND T3.Document_Subset_Details  =  2000 AND T4.Collection_Name  =  "Best"
SELECT T1.Document_Object_ID FROM Document_Subset_Members AS T1 JOIN Document_Subsets AS T2 ON T1.Document_Subset_ID  =  T2.Document_Subset_ID WHERE T2.Document_Subset_Name  =  'Best for 2000' INTERSECT SELECT T1.Document_Object_ID FROM Documents_in_Collections AS T1 JOIN Collections AS T2 ON T1.Collection_ID  =  T2.Collection_ID WHERE T2.Collection_Name  =  'Best'
SELECT T1.Document_Object_ID FROM Document_Objects AS T1 JOIN Documents_in_Collections AS T2 ON T1.Document_Object_ID  =  T2.Document_Object_ID JOIN Collections AS T3 ON T2.Collection_ID  =  T3.Collection_ID WHERE T3.Collection_Name  =  "Best" EXCEPT SELECT T1.Document_Object_ID FROM Document_Objects AS T1 JOIN Document_Subset_Members AS T2 ON T1.Document_Object_ID  =  T2.Document_Object_ID JOIN Document_Subsets AS T3 ON T2.Document_Subset_ID  =  T3.Document_Subset_ID WHERE T3.Document_Subset_Name  =  "Best" AND T3.Document_Subset_Details  =  2000
SELECT T1.Document_Object_ID FROM Document_Objects AS T1 JOIN Documents_in_Collections AS T2 ON T1.Document_Object_ID  =  T2.Document_Object_ID JOIN Collections AS T3 ON T2.Collection_ID  =  T3.Collection_ID WHERE T3.Collection_Name  =  'Best' EXCEPT SELECT T1.Document_Object_ID FROM Document_Objects AS T1 JOIN Document_Subset_Members AS T2 ON T1.Document_Object_ID  =  T2.Document_Object_ID JOIN Document_Subsets AS T3 ON T2.Document_Subset_ID  =  T3.Document_Subset_ID WHERE T3.Document_Subset_Name  =  'Best for 2000'
SELECT T1.Document_Object_ID FROM Document_Subset_Members AS T1 JOIN Document_Objects AS T2 ON T1.Related_Document_Object_ID  =  T2.Document_Object_ID JOIN Document_Subsets AS T3 ON T1.Document_Subset_ID  =  T3.Document_Subset_ID WHERE T3.Document_Subset_Name  =  "Best" AND T2.Description  =  2000 UNION SELECT T1.Document_Object_ID FROM Documents_in_Collections AS T1 JOIN Collections AS T2 ON T1.Collection_ID  =  T2.Collection_ID WHERE T2.Collection_Name  =  "Best"
SELECT DISTINCT T3.Document_Object_ID FROM Document_Subsets AS T1 JOIN Document_Subset_Members AS T2 ON T1.Document_Subset_ID  =  T2.Document_Subset_ID JOIN Document_Objects AS T3 ON T2.Related_Document_Object_ID  =  T3.Document_Object_ID WHERE T1.Document_Subset_Name  =  'Best for 2000' OR T1.Document_Subset_Name  =  'Best'
SELECT T1.Collection_Name FROM Collections AS T1 JOIN Documents_in_Collections AS T2 ON T1.Collection_ID  =  T2.Collection_ID JOIN Collections AS T3 ON T3.Collection_ID  =  T2.Collection_ID WHERE T1.Collection_Name  =  "Best"
SELECT T1.Collection_Name FROM Collections AS T1 JOIN Documents_in_Collections AS T2 ON T1.Collection_ID  =  T2.Collection_ID WHERE T1.Collection_Name  =  "Best"
SELECT count(*) FROM Collections AS T1 JOIN Collection_Subset_Members AS T2 ON T1.Collection_ID  =  T2.Related_Collection_ID JOIN Collection_Subsets AS T3 ON T2.Collection_Subset_ID  =  T3.Collection_Subset_ID WHERE T3.Collection_Subset_Name  =  "Best"
SELECT count(*) FROM Collections AS T1 JOIN Documents_in_Collections AS T2 ON T1.collection_id  =  T2.collection_id WHERE T1.collection_name  =  'Best'
SELECT T2.Collection_Subset_Name FROM Collections AS T1 JOIN Collection_Subsets AS T2 ON T1.Collection_Subset_ID  =  T2.Collection_Subset_ID WHERE T1.Collection_Name  =  "Best"
SELECT T2.Collection_Subset_Name FROM Collections AS T1 JOIN Collection_Subsets AS T2 ON T1.Collection_Subset_ID  =  T2.Collection_Subset_ID WHERE T1.Collection_Name  =  "Best"
SELECT count(*) FROM songs WHERE name LIKE "%Love%"
SELECT name FROM songs ORDER BY name
SELECT name ,  language FROM songs
SELECT max(voice_sound_quality) ,  min(voice_sound_quality) FROM performance_score
SELECT T2.voice_sound_quality ,  T2.rhythm_tempo ,  T2.stage_presence FROM participants AS T1 JOIN performance_score AS T2 ON T1.id  =  T2.participant_id WHERE T1.name  =  'Freeway'
SELECT id ,  language ,  original_artist FROM songs WHERE name != 'Love'
SELECT name ,  original_artist FROM songs WHERE english_translation  =  'All the streets of love'
SELECT DISTINCT T2.stage_presence FROM songs AS T1 JOIN performance_score AS T2 ON T1.id  =  T2.songs_id WHERE T1.language  =  'English'
SELECT T1.id ,  T1.name FROM participants AS T1 JOIN performance_score AS T2 ON T1.id  =  T2.participant_id GROUP BY T1.id HAVING count(*)  >=  2
SELECT T2.id ,  T2.name ,  T2.popularity FROM performance_score AS T1 JOIN participants AS T2 ON T1.participant_id  =  T2.id GROUP BY T1.participant_id ORDER BY count(*) DESC
SELECT T2.id ,  T2.name FROM performance_score AS T1 JOIN participants AS T2 ON T1.participant_id  =  T2.id WHERE T1.voice_sound_quality  =  5 OR T1.rhythm_tempo  =  5
SELECT T1.voice_sound_quality FROM performance_score AS T1 JOIN songs AS T2 ON T1.songs_id  =  T2.id WHERE T2.english_translation  =  'The Balkan Girls'
SELECT T1.id ,  T1.name FROM songs AS T1 JOIN performance_score AS T2 ON T1.id  =  T2.songs_id GROUP BY T2.songs_id ORDER BY count(*) DESC LIMIT 1
SELECT count(*) FROM performance_score WHERE stage_presence  <  7 OR stage_presence  >  9
SELECT count(*) FROM songs WHERE id NOT IN (SELECT songs_id FROM performance_score)
SELECT avg(rhythm_tempo) ,  language FROM songs GROUP BY language
SELECT DISTINCT T1.name FROM participants AS T1 JOIN performance_score AS T2 ON T1.id  =  T2.participant_id JOIN songs AS T3 ON T2.songs_id  =  T3.id WHERE T3.language  =  'English'
SELECT T1.name ,  T1.popularity FROM participants AS T1 JOIN performance_score AS T2 ON T1.id  =  T2.participant_id JOIN songs AS T3 ON T2.songs_id  =  T3.id WHERE T3.language  =  'Croatian' INTERSECT SELECT T1.name ,  T1.popularity FROM participants AS T1 JOIN performance_score AS T2 ON T1.id  =  T2.participant_id JOIN songs AS T3 ON T2.songs_id  =  T3.id WHERE T3.language  =  'English'
SELECT name FROM songs WHERE name LIKE "%Is%"
SELECT T2.original_artist FROM performance_score AS T1 JOIN songs AS T2 ON T1.songs_id  =  T2.id WHERE T1.rhythm_tempo  >  5 ORDER BY T1.voice_sound_quality DESC
SELECT count(*) FROM City
SELECT count(*) FROM City
SELECT DISTINCT state FROM City
SELECT DISTINCT state FROM City
SELECT count(DISTINCT country) FROM City
SELECT count(DISTINCT country) FROM City
SELECT city_name ,  city_code ,  state ,  country FROM City
SELECT city_name ,  city_code ,  state ,  country FROM City
SELECT latitude ,  longitude FROM City WHERE city_name  =  "Baltimore"
SELECT latitude ,  longitude FROM City WHERE city_name  =  "Baltimore"
SELECT city_name FROM City WHERE state  =  "PA"
SELECT city_name FROM City WHERE state  =  "PA"
SELECT count(*) FROM City WHERE country  =  'Canada'
SELECT count(*) FROM CITY WHERE country  =  'Canada'
SELECT city_name FROM City WHERE country  =  'USA' ORDER BY latitude
SELECT city_name FROM City WHERE country  =  'USA' ORDER BY latitude
SELECT state ,  count(*) FROM City GROUP BY state
SELECT count(*) ,  state FROM City GROUP BY state
SELECT country ,  count(*) FROM City GROUP BY country
SELECT country ,  count(*) FROM City GROUP BY country
SELECT state FROM city GROUP BY state HAVING count(*)  >=  2
SELECT state FROM city GROUP BY state HAVING count(*)  >=  2
SELECT state FROM city GROUP BY state ORDER BY count(*) DESC LIMIT 1
SELECT state FROM city GROUP BY state ORDER BY count(*) DESC LIMIT 1
SELECT country FROM city GROUP BY country ORDER BY count(*) ASC LIMIT 1
SELECT country FROM city GROUP BY country ORDER BY count(*) ASC LIMIT 1
SELECT T2.fname ,  T2.lname FROM city AS T1 JOIN student AS T2 ON T1.city_code  =  T2.city_code WHERE T1.state  =  "MD"
SELECT T2.fname ,  T2.lname FROM city AS T1 JOIN student AS T2 ON T1.city_code  =  T2.city_code WHERE T1.state  =  "MD"
SELECT count(*) FROM city AS T1 JOIN student AS T2 ON T1.city_code  =  T2.city_code WHERE T1.country  =  'China'
SELECT count(*) FROM city AS T1 JOIN student AS T2 ON T1.city_code  =  T2.city_code WHERE T1.country  =  'China'
SELECT fname ,  major FROM Student AS T1 JOIN CITY AS T2 ON T1.city_code  =  T2.city_code WHERE city_name  =  "Baltimore"
SELECT fname ,  major FROM Student AS T1 JOIN CITY AS T2 ON T1.city_code  =  T2.city_code WHERE city_name  =  "Baltimore"
SELECT count(*) ,  T2.country FROM City AS T1 JOIN Student AS T2 ON T1.city_code  =  T2.city_code GROUP BY T2.country
SELECT count(*) ,  country FROM City GROUP BY country
SELECT count(*) ,  T1.city_name FROM city AS T1 JOIN student AS T2 ON T1.city_code  =  T2.city_code GROUP BY T1.city_name
SELECT count(*) ,  city_name FROM city AS T1 JOIN student AS T2 ON T1.city_code  =  T2.city_code GROUP BY city_name
SELECT T2.state ,  count(*) FROM city AS T1 JOIN student AS T2 ON T1.city_code  =  T2.city_code GROUP BY T2.city_code ORDER BY count(*) DESC LIMIT 1
SELECT T2.state ,  count(*) FROM student AS T1 JOIN city AS T2 ON T1.city_code  =  T2.city_code GROUP BY T2.state ORDER BY count(*) DESC LIMIT 1
SELECT T2.country ,  count(*) FROM city AS T1 JOIN student AS T2 ON T1.city_code  =  T2.city_code GROUP BY T2.country ORDER BY count(*) ASC LIMIT 1
SELECT T2.country FROM student AS T1 JOIN city AS T2 ON T1.city_code  =  T2.city_code GROUP BY T2.country ORDER BY count(*) ASC LIMIT 1
SELECT T2.city_name FROM Student AS T1 JOIN City AS T2 ON T1.city_code  =  T2.city_code GROUP BY T1.city_code HAVING count(*)  >=  3
SELECT T3.city_name FROM Student AS T1 JOIN city AS T2 JOIN city AS T3 ON T1.city_code  =  T2.city_code AND T2.city_code  =  T3.city_code GROUP BY T2.city_name HAVING count(*)  >=  3
SELECT T2.state ,  count(*) FROM city AS T1 JOIN student AS T2 ON T1.city_code  =  T2.city_code GROUP BY T2.state HAVING count(*)  >  5
SELECT T2.state FROM Student AS T1 JOIN City AS T2 ON T1.city_code  =  T2.city_code GROUP BY T2.state HAVING count(*)  >  5
SELECT city_code FROM CITY EXCEPT SELECT city_code FROM STUDENT
SELECT StuID FROM STUDENT WHERE city_code NOT IN (SELECT city_code FROM CITY WHERE country  =  'USA')
SELECT StuID FROM Student WHERE sex  =  'F' AND city_code IN (SELECT city_code FROM City WHERE state  =  'PA')
SELECT StuID FROM Student WHERE sex  =  'F' AND city_code IN (SELECT city_code FROM City WHERE state  =  "PA")
SELECT StuID FROM Student WHERE sex  =  'M' AND country != "usa"
SELECT StuID FROM Student WHERE sex  =  'M' AND country != "USA"
SELECT distance FROM Direct_distance WHERE city1_code  =  "BAL" AND city2_code  =  "CHI"
SELECT distance FROM Direct_distance WHERE city1_code  =  "BAL" AND city2_code  =  "CHI"
SELECT distance FROM Direct_distance WHERE city1_code  =  "Boston" AND city2_code  =  "Newark"
SELECT distance FROM Direct_distance WHERE city1_code  =  "Boston" AND city2_code  =  "Newark"
SELECT avg(distance) ,  min(distance) ,  max(distance) FROM Direct_distance
SELECT avg(distance) ,  min(distance) ,  max(distance) FROM Direct_distance
SELECT city1_code ,  city2_code FROM Direct_distance ORDER BY distance DESC LIMIT 1
SELECT city1_code FROM Direct_distance ORDER BY distance DESC LIMIT 1
SELECT city1_code ,  city2_code FROM Direct_distance WHERE distance  >  (SELECT avg(distance) FROM Direct_distance)
SELECT city2_code FROM Direct_distance WHERE distance  >  (SELECT avg(distance) FROM Direct_distance)
SELECT city1_code ,  city2_code FROM Direct_distance WHERE distance  <  1000
SELECT city1_code FROM Direct_distance WHERE distance  <  1000 UNION SELECT city2_code FROM Direct_distance WHERE distance  <  1000
SELECT sum(distance) FROM Direct_distance WHERE city1_code  =  "BAL"
SELECT sum(distance) FROM direct_distance WHERE city1_code  =  "BAL"
SELECT avg(distance) FROM direct_distance WHERE city1_code  =  "Boston"
SELECT avg(distance) FROM direct_distance WHERE city1_code  =  "Boston"
SELECT t2.city_name FROM direct_distance AS t1 JOIN city AS t2 ON t1.city2_code  =  t2.city_code WHERE t1.distance  =  (SELECT min(distance) FROM direct_distance WHERE city1_code  =  "Chicago")
SELECT city_name FROM City WHERE city_code  =  (SELECT city2_code FROM Direct_distance WHERE city1_code  =  (SELECT city_code FROM City WHERE city_name  =  "Chicago") ORDER BY distance LIMIT 1)
SELECT t2.city_name FROM direct_distance AS t1 JOIN city AS t2 ON t1.city2_code  =  t2.city_code WHERE t1.city1_code  =  "BOS" ORDER BY t1.distance DESC LIMIT 1
SELECT t2.city_name FROM direct_distance AS t1 JOIN city AS t2 ON t1.city2_code  =  t2.city_code WHERE t1.city1_code  =  "BOS" ORDER BY t1.distance DESC LIMIT 1
SELECT city_code ,  sum(distance) FROM Direct_distance GROUP BY city_code
SELECT city2_code ,  sum(distance) FROM Direct_distance GROUP BY city2_code
SELECT T1.city_name ,  avg(T2.distance) FROM City AS T1 JOIN Direct_distance AS T2 ON T1.city_code  =  T2.city2_code GROUP BY T1.city_name
SELECT T1.city_name ,  avg(T2.distance) FROM City AS T1 JOIN Direct_distance AS T2 ON T1.city_code  =  T2.city2_code GROUP BY T2.city1_code
SELECT T1.distance FROM direct_distance AS T1 JOIN student AS T2 ON T1.city1_code  =  T2.city_code WHERE T2.fname  =  "Linda" AND T2.lname  =  "Smith" INTERSECT SELECT T1.distance FROM direct_distance AS T1 JOIN student AS T2 ON T1.city1_code  =  T2.city_code WHERE T2.fname  =  "Tracy" AND T2.lname  =  "Kim"
SELECT T2.distance FROM student AS T1 JOIN direct_distance AS T2 ON T1.city_code  =  T2.city1_code JOIN student AS T3 ON T1.city_code  =  T3.city_code WHERE T1.fname  =  'Linda' AND T1.lname  =  'Smith' AND T3.fname  =  'Tracy' AND T3.lname  =  'Kim'
SELECT T2.fname ,  T2.lname FROM direct_distance AS T1 JOIN student AS T2 ON T1.city2_code  =  T2.city_code JOIN student AS T3 ON T1.city1_code  =  T3.city_code WHERE T3.fname  =  "Linda" AND T3.lname  =  "Smith" ORDER BY T1.distance DESC LIMIT 1
SELECT T2.fname ,  T2.lname FROM direct_distance AS T1 JOIN student AS T2 ON T1.city1_code  =  T2.city_code JOIN student AS T3 ON T1.city2_code  =  T3.city_code WHERE T3.fname  =  "Linda" AND T3.lname  =  "Smith" ORDER BY T1.distance DESC LIMIT 1
SELECT T2.state FROM student AS T1 JOIN city AS T2 ON T1.city_code  =  T2.city_code WHERE T1.fname  =  "Linda"
SELECT T2.state FROM student AS T1 JOIN city AS T2 ON T1.city_code  =  T2.city_code WHERE T1.fname  =  "Linda"
SELECT * FROM Sailors WHERE age  >  30
SELECT name FROM sailors WHERE age  >  30
SELECT name ,  age FROM Sailors WHERE age  <  30
SELECT name ,  age FROM SAILORS WHERE age  <  30
SELECT T2.name FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid WHERE T1.sid  =  1
SELECT DISTINCT bid FROM Reserves AS T1 JOIN Sailors AS T2 ON T1.sid  =  T2.sid WHERE T2.sid  =  1
SELECT T1.name FROM sailors AS T1 JOIN reserves AS T2 ON T1.sid  =  T2.sid WHERE T2.bid  =  102
SELECT T3.name FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid JOIN Sailors AS T3 ON T1.sid  =  T3.sid WHERE T2.bid  =  102
SELECT DISTINCT bid FROM Reserves
SELECT bid FROM Reserves
SELECT name FROM sailors WHERE name LIKE '%e%'
SELECT name FROM SAILORS WHERE name LIKE '%e%'
SELECT sid FROM Reserves EXCEPT SELECT sid FROM Reserves WHERE day  >  (SELECT max(day) FROM Reserves)
SELECT DISTINCT sid FROM Sailors WHERE age != (SELECT min(age) FROM sailors)
SELECT DISTINCT name FROM sailors WHERE age  >  (SELECT max(age) FROM sailors WHERE rating  >  7)
SELECT DISTINCT name FROM sailors WHERE age  >  (SELECT max(age) FROM sailors WHERE rating  >  7)
SELECT T2.name ,  T1.sid FROM Reserves AS T1 JOIN Sailors AS T2 ON T1.sid  =  T2.sid
SELECT T2.name ,  T1.sid FROM Reserves AS T1 JOIN Sailors AS T2 ON T1.sid  =  T2.sid
SELECT T1.sid ,  T2.name FROM Reserves AS T1 JOIN Sailors AS T2 ON T1.sid  =  T2.sid GROUP BY T1.sid HAVING count(*)  >  1
SELECT T1.name FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid  =  T2.sid GROUP BY T1.name HAVING count(*)  >=  2
SELECT T2.sid FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid WHERE T2.color  =  'red' OR T2.color  =  'blue'
SELECT T2.sid FROM boats AS T1 JOIN reserves AS T2 ON T1.bid  =  T2.bid WHERE T1.color  =  'red' OR T1.color  =  'blue'
SELECT T3.name ,  T1.sid FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid JOIN Sailors AS T3 ON T1.sid  =  T3.sid WHERE T2.color  =  'red' OR T2.color  =  'blue'
SELECT T3.name ,  T1.sid FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid JOIN Sailors AS T3 ON T1.sid  =  T3.sid WHERE T2.color  =  'red' OR T2.color  =  'blue'
SELECT T1.sid FROM Reserves AS T2 JOIN Boats AS T1 ON T1.bid  =  T2.bid WHERE T1.color  =  'red' INTERSECT SELECT T1.sid FROM Reserves AS T2 JOIN Boats AS T1 ON T1.bid  =  T2.bid WHERE T1.color  =  'blue'
SELECT T1.sid FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid WHERE T2.color  =  'red' INTERSECT SELECT T1.sid FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid WHERE T2.color  =  'blue'
SELECT T3.name ,  T1.sid FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid JOIN Sailors AS T3 ON T1.sid  =  T3.sid WHERE T2.color  =  'red' INTERSECT SELECT T3.name ,  T1.sid FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid JOIN Sailors AS T3 ON T1.sid  =  T3.sid WHERE T2.color  =  'blue'
SELECT T3.name ,  T1.sid FROM Reserves AS T1 JOIN boats AS T2 ON T1.bid  =  T2.bid JOIN Sailors AS T3 ON T1.sid  =  T3.sid WHERE T2.color  =  'red' INTERSECT SELECT T3.name ,  T1.sid FROM Reserves AS T1 JOIN boats AS T2 ON T1.bid  =  T2.bid JOIN Sailors AS T3 ON T1.sid  =  T3.sid WHERE T2.color  =  'blue'
SELECT sid FROM sailors EXCEPT SELECT sid FROM Reserves
SELECT sid FROM sailors EXCEPT SELECT sid FROM reserves
SELECT name ,  sid FROM sailors EXCEPT SELECT T2.name ,  T2.sid FROM reserves AS T1 JOIN sailors AS T2 ON T1.sid  =  T2.sid JOIN boats AS T3 ON T1.bid  =  T3.bid
SELECT name ,  sid FROM SAILORS EXCEPT SELECT T2.name ,  T1.sid FROM Reserves AS T1 JOIN SAILORS AS T2 ON T1.sid  =  T2.sid
SELECT sid FROM sailors EXCEPT SELECT sid FROM reserves
SELECT sid FROM sailors EXCEPT SELECT sid FROM reserves
SELECT T2.name FROM Reserves AS T1 JOIN Sailors AS T2 ON T1.sid  =  T2.sid WHERE T1.bid  =  103
SELECT T2.name FROM Reserves AS T1 JOIN Sailors AS T2 ON T1.sid  =  T2.sid WHERE T1.bid  =  103
SELECT name FROM sailors WHERE rating  >  (SELECT max(rating) FROM sailors WHERE name  =  'Luis')
SELECT name FROM sailors WHERE rating  >  (SELECT max(rating) FROM sailors WHERE name  =  'Luis')
SELECT name FROM sailors WHERE rating  >  (SELECT max(rating) FROM sailors WHERE name  =  'Luis')
SELECT name FROM sailors EXCEPT SELECT name FROM sailors WHERE rating  <  (SELECT min(rating) FROM sailors WHERE name  =  'Luis')
SELECT T3.name ,  T1.sid FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid JOIN Sailors AS T3 ON T1.sid  =  T3.sid WHERE T3.rating  >  2
SELECT T3.name ,  T1.sid FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid JOIN Sailors AS T3 ON T1.sid  =  T3.sid WHERE T3.rating  >=  3
SELECT name ,  age FROM sailors ORDER BY age DESC LIMIT 1
SELECT name ,  age FROM sailors ORDER BY age DESC LIMIT 1
SELECT count(*) FROM Sailors
SELECT count(*) FROM Sailors
SELECT avg(age) FROM sailors WHERE rating  =  7
SELECT avg(age) FROM sailors WHERE rating  =  7
SELECT count(*) FROM sailors WHERE name LIKE 'D%'
SELECT count(*) FROM Sailors WHERE name LIKE 'D%'
SELECT avg(rating) ,  max(age) FROM SAILORS
SELECT avg(rating) ,  max(age) FROM sailors
SELECT count(*) ,  T2.name FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid GROUP BY T2.name
SELECT T2.name ,  count(*) FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid GROUP BY T1.bid
SELECT count(*) ,  T1.name FROM boats AS T1 JOIN reserves AS T2 ON T1.bid  =  T2.bid WHERE T1.bid  >  50 GROUP BY T1.name
SELECT count(*) ,  T2.name FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid WHERE T2.bid  >  50 GROUP BY T2.name
SELECT count(*) ,  T2.name FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid GROUP BY T1.bid HAVING count(*)  >  1
SELECT T2.name ,  count(*) FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid GROUP BY T1.bid HAVING count(*)  >  1
SELECT count(*) ,  T2.name FROM Reserves AS T1 JOIN boats AS T2 ON T1.bid  =  T2.bid JOIN sailors AS T3 ON T1.sid  =  T3.sid WHERE T3.sid  >  1 GROUP BY T2.name
SELECT T2.name ,  count(*) FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid JOIN Sailors AS T3 ON T1.sid  =  T3.sid WHERE T3.sid  >  1 GROUP BY T2.name
SELECT T3.rating ,  avg(T3.age) FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid JOIN Sailors AS T3 ON T1.sid  =  T3.sid WHERE T2.color  =  'red' GROUP BY T3.rating
SELECT T3.rating ,  avg(T1.age) FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid JOIN Sailors AS T3 ON T1.sid  =  T3.sid WHERE T2.color  =  'red' GROUP BY T3.rating
SELECT name ,  rating ,  age FROM Sailors ORDER BY rating ,  age
SELECT name ,  rating ,  age FROM Sailors ORDER BY rating ,  age
SELECT count(*) FROM Boats
SELECT count(*) FROM Boats
SELECT count(*) FROM Boats WHERE color  =  'red'
SELECT count(*) FROM Boats WHERE color  =  'red'
SELECT T3.name FROM Reserves AS T1 JOIN Sailors AS T2 ON T1.sid  =  T2.sid JOIN Boats AS T3 ON T1.bid  =  T3.bid WHERE T2.age BETWEEN 20 AND 30
SELECT T3.name FROM Reserves AS T1 JOIN Sailors AS T2 ON T1.sid  =  T2.sid JOIN Boats AS T3 ON T1.bid  =  T3.bid WHERE T2.age BETWEEN 20 AND 30
SELECT T2.name FROM Reserves AS T1 JOIN Sailors AS T2 ON T1.sid  =  T2.sid JOIN Boats AS T3 ON T1.bid  =  T3.bid WHERE T3.color  =  'red' EXCEPT SELECT T2.name FROM Reserves AS T1 JOIN Sailors AS T2 ON T1.sid  =  T2.sid JOIN Boats AS T3 ON T1.bid  =  T3.bid WHERE T2.rating  <=  ( SELECT max(T4.rating) FROM Reserves AS T1 JOIN Sailors AS T4 ON T1.sid  =  T4.sid JOIN Boats AS T3 ON T1.bid  =  T3.bid WHERE T3.color  =  'red' )
SELECT T3.name FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid JOIN Sailors AS T3 ON T1.sid  =  T3.sid WHERE T2.color  =  'red' EXCEPT SELECT T3.name FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid JOIN Sailors AS T3 ON T1.sid  =  T3.sid WHERE T3.rating  >  T2.rating
SELECT max(rating) FROM sailors
SELECT max(rating) FROM sailors
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
SELECT count(*) ,  CLASS FROM headphone WHERE price  >  200 GROUP BY CLASS
SELECT count(DISTINCT Earpads) FROM headphone
SELECT count(DISTINCT Earpads) FROM headphone
SELECT Earpads FROM headphone GROUP BY Earpads ORDER BY sum(Quantity) DESC LIMIT 2
SELECT Earpads FROM headphone GROUP BY Earpads ORDER BY count(*) DESC LIMIT 2
SELECT model ,  CLASS ,  construction FROM headphone ORDER BY price LIMIT 1
SELECT model ,  CLASS ,  construction FROM headphone ORDER BY price LIMIT 1
SELECT construction ,  avg(price) FROM headphone GROUP BY construction
SELECT avg(Price) ,  Construction FROM headphone GROUP BY Construction
SELECT CLASS FROM headphone WHERE Earpads  =  "Bowls" INTERSECT SELECT CLASS FROM headphone WHERE Earpads  =  "Comfort Pads"
SELECT Class FROM headphone WHERE Earpads  =  "Bowls" INTERSECT SELECT Class FROM headphone WHERE Earpads  =  "Comfort Pads"
SELECT Earpads FROM headphone WHERE Construction != 'Plastic'
SELECT Earpads FROM headphone WHERE Construction != "Plastic"
SELECT Model FROM headphone WHERE Price  <  (SELECT avg(Price) FROM headphone)
SELECT model FROM headphone WHERE price  <  (SELECT avg(price) FROM headphone)
SELECT Name FROM store ORDER BY Date_Opened
SELECT Name FROM store ORDER BY Date_Opened
SELECT name ,  parking FROM store WHERE neighborhood  =  'Tarzana'
SELECT name ,  parking FROM store WHERE neighborhood  =  "Tarzana"
SELECT count(DISTINCT Neighborhood) FROM store
SELECT count(DISTINCT Neighborhood) FROM store
SELECT count(*) ,  neighborhood FROM store GROUP BY neighborhood
SELECT Neighborhood ,  COUNT(*) FROM store GROUP BY Neighborhood
SELECT T2.name ,  sum(T1.quantity) FROM stock AS T1 JOIN store AS T2 ON T1.store_id  =  T2.store_id GROUP BY T1.store_id ORDER BY sum(T1.quantity) DESC LIMIT 1
SELECT T2.Name ,  sum(T1.quantity) FROM stock AS T1 JOIN store AS T2 ON T1.Store_ID  =  T2.Store_ID GROUP BY T1.Store_ID
SELECT Name FROM store WHERE Store_ID NOT IN (SELECT Store_ID FROM stock)
SELECT name FROM store WHERE store_id NOT IN (SELECT store_id FROM stock)
SELECT Model FROM headphone WHERE Headphone_ID NOT IN (SELECT Headphone_ID FROM stock)
SELECT Model FROM headphone WHERE headphone_id NOT IN (SELECT headphone_id FROM stock)
SELECT T2.Model FROM stock AS T1 JOIN headphone AS T2 ON T1.Headphone_ID  =  T2.Headphone_ID GROUP BY T1.Headphone_ID ORDER BY sum(T1.quantity) DESC LIMIT 1
SELECT T2.Model FROM stock AS T1 JOIN headphone AS T2 ON T1.Headphone_ID  =  T2.Headphone_ID GROUP BY T1.Headphone_ID ORDER BY sum(T1.quantity) DESC LIMIT 1
SELECT sum(T2.quantity) FROM stock AS T1 JOIN headphone AS T2 ON T1.headphone_id  =  T2.headphone_id JOIN store AS T3 ON T1.store_id  =  T3.store_id WHERE T3.name  =  'Woodman'
SELECT sum(T2.quantity) FROM stock AS T1 JOIN store AS T2 ON T1.store_id  =  T2.store_id WHERE T2.name  =  'Woodman'
SELECT Neighborhood FROM store EXCEPT SELECT T1.Neighborhood FROM store AS T1 JOIN stock AS T2 ON T1.Store_ID  =  T2.Store_ID
SELECT Neighborhood FROM store EXCEPT SELECT T1.Neighborhood FROM store AS T1 JOIN stock AS T2 ON T1.Store_ID  =  T2.Store_ID
SELECT count(*) FROM author;
SELECT count(*) FROM author;
SELECT count(*) FROM paper;
SELECT count(*) FROM paper;
SELECT count(*) FROM affiliation;
SELECT count(*) FROM affiliation;
SELECT COUNT ( DISTINCT paper_id ) FROM paper WHERE venue  =  "NAACL" AND YEAR  =  2000;
SELECT COUNT ( DISTINCT paper_id ) FROM paper WHERE venue  =  "NAACL" AND YEAR  =  2000;
SELECT DISTINCT COUNT ( t3.paper_id ) FROM affiliation AS t1 JOIN author_list AS t2 ON t1.affiliation_id  =  t2.affiliation_id JOIN paper AS t3 ON t2.paper_id  =  t3.paper_id WHERE t1.name  =  "Columbia University" AND t3.year  =  2009;
SELECT COUNT ( DISTINCT t3.paper_id ) FROM affiliation AS t1 JOIN author_list AS t2 ON t1.affiliation_id  =  t2.affiliation_id JOIN paper AS t3 ON t2.paper_id  =  t3.paper_id WHERE t1.name  =  "Columbia University" AND t3.year  =  2009;
SELECT name ,  address FROM affiliation
SELECT name ,  address FROM affiliation
SELECT venue ,  YEAR FROM paper ORDER BY YEAR
SELECT DISTINCT venue FROM paper ORDER BY YEAR
SELECT DISTINCT t3.title ,  t3.paper_id FROM affiliation AS t1 JOIN author_list AS t2 ON t1.affiliation_id  =  t2.affiliation_id JOIN paper AS t3 ON t2.paper_id  =  t3.paper_id WHERE t1.name  =  "Harvard University";
SELECT DISTINCT t3.title ,  t3.paper_id FROM affiliation AS t1 JOIN author_list AS t2 ON t1.affiliation_id  =  t2.affiliation_id JOIN paper AS t3 ON t2.paper_id  =  t3.paper_id WHERE t1.name  =  "Harvard University";
SELECT DISTINCT t3.title ,  t1.paper_id FROM author_list AS t2 JOIN author AS t1 ON t2.author_id  =  t1.author_id JOIN paper AS t3 ON t2.paper_id  =  t3.paper_id WHERE t1.name  =  "Mckeown";
SELECT DISTINCT t3.title ,  t3.paper_id FROM author AS t1 JOIN author_list AS t2 ON t1.author_id  =  t2.author_id JOIN paper AS t3 ON t2.paper_id  =  t3.paper_id WHERE t1.name  =  "Mckeown"
SELECT DISTINCT t3.title FROM affiliation AS t1 JOIN author_list AS t2 ON t1.affiliation_id  =  t2.affiliation_id JOIN paper AS t3 ON t2.paper_id  =  t3.paper_id WHERE t1.name  =  "Stanford University" INTERSECT SELECT DISTINCT t3.title FROM affiliation AS t1 JOIN author_list AS t2 ON t1.affiliation_id  =  t2.affiliation_id JOIN paper AS t3 ON t2.paper_id  =  t3.paper_id WHERE t1.name  =  "Columbia University"
SELECT DISTINCT t3.title ,  t3.paper_id FROM affiliation AS t1 JOIN author_list AS t2 ON t1.affiliation_id  =  t2.affiliation_id JOIN paper AS t3 ON t2.paper_id  =  t3.paper_id WHERE t1.name  =  "Stanford University" INTERSECT SELECT DISTINCT t3.title ,  t3.paper_id FROM affiliation AS t1 JOIN author_list AS t2 ON t1.affiliation_id  =  t2.affiliation_id JOIN paper AS t3 ON t2.paper_id  =  t3.paper_id WHERE t1.name  =  "Columbia University"
SELECT DISTINCT t3.title ,  t1.paper_id FROM author AS t2 JOIN author_list AS t1 ON t2.author_id  =  t1.author_id JOIN paper AS t3 ON t3.paper_id  =  t1.paper_id WHERE t2.name  =  "Mckeown ,  Kathleen" INTERSECT SELECT DISTINCT t3.title ,  t1.paper_id FROM author AS t2 JOIN author_list AS t1 ON t2.author_id  =  t1.author_id JOIN paper AS t3 ON t3.paper_id  =  t1.paper_id WHERE t2.name  =  "Rambow ,  Owen"
SELECT DISTINCT t3.title ,  t1.paper_id FROM author_list AS t2 JOIN author AS t4 ON t2.author_id  =  t4.author_id JOIN paper AS t3 ON t2.paper_id  =  t3.paper_id JOIN author_list AS t1 ON t1.paper_id  =  t3.paper_id JOIN author AS t5 ON t1.author_id  =  t5.author_id WHERE t4.name  =  "Mckeown ,  Kathleen" AND t5.name  =  "Rambow ,  Owen";
SELECT DISTINCT t3.title ,  t1.paper_id FROM author AS t2 JOIN author_list AS t1 ON t2.author_id  =  t1.author_id JOIN paper AS t3 ON t3.paper_id  =  t1.paper_id WHERE t2.name  =  "Mckeown" EXCEPT SELECT DISTINCT t3.title ,  t1.paper_id FROM author AS t2 JOIN author_list AS t1 ON t2.author_id  =  t1.author_id JOIN paper AS t3 ON t3.paper_id  =  t1.paper_id WHERE t2.name  =  "Rambow"
SELECT DISTINCT t3.title ,  t1.paper_id FROM author AS t2 JOIN author_list AS t1 ON t2.author_id  =  t1.author_id JOIN paper AS t3 ON t3.paper_id  =  t1.paper_id WHERE t2.name  =  "Mckeown" EXCEPT SELECT DISTINCT t3.title ,  t1.paper_id FROM author AS t2 JOIN author_list AS t1 ON t2.author_id  =  t1.author_id JOIN paper AS t3 ON t3.paper_id  =  t1.paper_id WHERE t2.name  =  "Rambow"
SELECT DISTINCT t3.title ,  t1.paper_id FROM author AS t2 JOIN author_list AS t1 ON t2.author_id  =  t1.author_id JOIN paper AS t3 ON t3.paper_id  =  t1.paper_id WHERE t2.name  =  "Mckeown ,  Kathleen" OR t2.name  =  "Rambow ,  Owen"
SELECT DISTINCT t3.title ,  t1.paper_id FROM author_list AS t1 JOIN author AS t2 ON t1.author_id  =  t2.author_id JOIN paper AS t3 ON t1.paper_id  =  t3.paper_id WHERE t2.name  =  "Mckeown ,  Kathleen" OR t2.name  =  "Rambow ,  Owen"
SELECT t1.name ,  COUNT(*) FROM author AS t1 JOIN author_list AS t2 ON t1.author_id  =  t2.author_id GROUP BY t1.author_id ORDER BY COUNT(*) DESC
SELECT DISTINCT COUNT ( DISTINCT t2.paper_id )  ,  t1.author_id FROM author_list AS t2 JOIN author AS t1 ON t2.author_id  =  t1.author_id GROUP BY t1.author_id ORDER BY COUNT ( DISTINCT t2.paper_id ) ASC;
SELECT T1.name FROM affiliation AS T1 JOIN author_list AS T2 ON T1.affiliation_id  =  T2.affiliation_id JOIN paper AS T3 ON T2.paper_id  =  T3.paper_id GROUP BY T1.affiliation_id ORDER BY COUNT ( DISTINCT T3.paper_id ) ASC
SELECT T2.name FROM author_list AS T1 JOIN affiliation AS T2 ON T1.affiliation_id  =  T2.affiliation_id JOIN paper AS T3 ON T1.paper_id  =  T3.paper_id GROUP BY T2.affiliation_id ORDER BY count(*) ASC
SELECT DISTINCT t1.name FROM author AS t1 JOIN author_list AS t2 ON t1.author_id  =  t2.author_id GROUP BY t1.name HAVING COUNT ( DISTINCT t2.paper_id )  >  50;
SELECT DISTINCT t1.name FROM author AS t1 JOIN author_list AS t2 ON t1.author_id  =  t2.author_id GROUP BY t1.name HAVING COUNT ( DISTINCT t2.paper_id )  >  50;
SELECT DISTINCT t1.name FROM author AS t1 JOIN author_list AS t2 ON t1.author_id  =  t2.author_id JOIN paper AS t3 ON t2.paper_id  =  t3.paper_id GROUP BY t1.name HAVING count(DISTINCT t3.title)  =  1
SELECT DISTINCT t1.name FROM author AS t1 JOIN author_list AS t2 ON t1.author_id  =  t2.author_id JOIN paper AS t3 ON t2.paper_id  =  t3.paper_id GROUP BY t1.name HAVING count(t3.title)  =  1
SELECT venue ,  YEAR FROM paper GROUP BY venue ,  YEAR ORDER BY count(*) DESC LIMIT 1
SELECT venue ,  YEAR FROM paper GROUP BY venue ,  YEAR ORDER BY count(*) DESC LIMIT 1
SELECT venue FROM paper GROUP BY venue ORDER BY count(*) ASC LIMIT 1;
SELECT venue FROM paper GROUP BY venue ORDER BY count(*) ASC LIMIT 1;
SELECT COUNT ( DISTINCT t2.paper_id ) FROM citation AS t2 JOIN paper AS t1 ON t2.cited_paper_id  =  t1.paper_id WHERE t1.paper_id  =  "A00-1002"
SELECT COUNT ( DISTINCT t2.paper_id ) FROM citation AS t2 JOIN paper AS t1 ON t2.cited_paper_id  =  t1.paper_id WHERE t1.paper_id  =  "A00-1002"
SELECT COUNT ( DISTINCT t2.cited_paper_id ) FROM citation AS t2 JOIN paper AS t1 ON t2.paper_id  =  t1.paper_id WHERE t1.paper_id  =  "D12-1027";
SELECT COUNT ( DISTINCT t1.cited_paper_id ) FROM citation AS t1 JOIN paper AS t2 ON t1.paper_id  =  t2.paper_id WHERE t2.title  =  "D12-1027";
SELECT t2.cited_paper_id  ,  COUNT(*) FROM citation AS t2 JOIN paper AS t1 ON t2.cited_paper_id  =  t1.paper_id GROUP BY t2.cited_paper_id ORDER BY COUNT (*) DESC LIMIT 1;
SELECT t2.cited_paper_id  ,  COUNT(*) FROM citation AS t1 JOIN paper AS t2 ON t1.cited_paper_id  =  t2.paper_id GROUP BY t2.paper_id ORDER BY COUNT(*) DESC LIMIT 1;
SELECT DISTINCT t3.title FROM citation AS t1 JOIN paper AS t3 ON t1.paper_id  =  t3.paper_id JOIN paper AS t4 ON t1.cited_paper_id  =  t4.paper_id ORDER BY COUNT ( DISTINCT t4.title ) DESC LIMIT 1
SELECT t3.title FROM citation AS t1 JOIN paper AS t3 ON t1.paper_id  =  t3.paper_id GROUP BY t1.paper_id ORDER BY COUNT ( DISTINCT t1.cited_paper_id ) DESC LIMIT 1;
SELECT t2.title ,  COUNT ( DISTINCT t1.cited_paper_id ) FROM citation AS t1 JOIN paper AS t2 ON t1.cited_paper_id  =  t2.paper_id GROUP BY t1.cited_paper_id ORDER BY COUNT ( DISTINCT t1.cited_paper_id ) DESC LIMIT 10;
SELECT t2.paper_id  ,  COUNT(*) FROM citation AS t1 JOIN paper AS t2 ON t1.cited_paper_id  =  t2.paper_id GROUP BY t1.cited_paper_id ORDER BY COUNT(*) DESC LIMIT 10;
SELECT DISTINCT COUNT ( t3.paper_id ) FROM author_list AS t2 JOIN author AS t1 ON t2.author_id  =  t1.author_id JOIN citation AS t3 ON t2.paper_id  =  t3.paper_id WHERE t1.name  =  "Mckeown , Kathleen";
SELECT DISTINCT COUNT ( t3.cited_paper_id ) FROM author_list AS t2 JOIN author AS t1 ON t2.author_id  =  t1.author_id JOIN citation AS t3 ON t2.paper_id  =  t3.paper_id WHERE t1.name  =  "Mckeown , Kathleen";
SELECT DISTINCT COUNT ( t3.cited_paper_id ) FROM author_list AS t2 JOIN author AS t1 ON t2.author_id  =  t1.author_id JOIN citation AS t3 ON t2.paper_id  =  t3.paper_id WHERE t1.name  =  "Mckeown , Kathleen";
SELECT COUNT ( DISTINCT t3.cited_paper_id ) FROM author AS t1 JOIN author_list AS t2 ON t1.author_id  =  t2.author_id JOIN citation AS t3 ON t2.paper_id  =  t3.paper_id WHERE t1.name  =  "Mckeown , Kathleen";
SELECT DISTINCT t3.name  ,  COUNT ( DISTINCT t2.cited_paper_id ) FROM author_list AS t1 JOIN citation AS t2 ON t1.paper_id  =  t2.paper_id JOIN author AS t3 ON t1.author_id  =  t3.author_id GROUP BY t3.name ORDER BY COUNT ( DISTINCT t2.cited_paper_id ) DESC LIMIT 1;
SELECT DISTINCT t3.name  ,  COUNT ( DISTINCT t2.cited_paper_id ) FROM author_list AS t1 JOIN citation AS t2 ON t1.paper_id  =  t2.paper_id JOIN author AS t3 ON t1.author_id  =  t3.author_id GROUP BY t3.name ORDER BY COUNT ( DISTINCT t2.cited_paper_id ) DESC LIMIT 1;
SELECT DISTINCT t3.venue ,  t3.year FROM author AS t1 JOIN author_list AS t2 ON t1.author_id  =  t2.author_id JOIN paper AS t3 ON t2.paper_id  =  t3.paper_id WHERE t1.name  =  "Mckeown , Kathleen" ORDER BY t3.year;
SELECT DISTINCT t3.venue ,  t3.year FROM author AS t1 JOIN author_list AS t2 ON t1.author_id  =  t2.author_id JOIN paper AS t3 ON t2.paper_id  =  t3.paper_id WHERE t1.name  =  "Mckeown , Kathleen" ORDER BY t3.year;
SELECT DISTINCT t3.venue ,  t3.year FROM affiliation AS t1 JOIN author_list AS t2 ON t1.affiliation_id  =  t2.affiliation_id JOIN paper AS t3 ON t2.paper_id  =  t3.paper_id WHERE t1.name  =  "Columbia University";
SELECT DISTINCT t3.venue ,  t3.year FROM affiliation AS t1 JOIN author_list AS t2 ON t1.affiliation_id  =  t2.affiliation_id JOIN paper AS t3 ON t2.paper_id  =  t3.paper_id WHERE t1.name  =  "Columbia University";
SELECT t1.name FROM author AS t1 JOIN author_list AS t2 ON t1.author_id  =  t2.author_id JOIN paper AS t3 ON t2.paper_id  =  t3.paper_id WHERE t3.year  =  2009 GROUP BY t1.name ORDER BY COUNT ( DISTINCT t3.title ) DESC LIMIT 1;
SELECT t1.name FROM author AS t1 JOIN author_list AS t2 ON t1.author_id  =  t2.author_id JOIN paper AS t3 ON t2.paper_id  =  t3.paper_id WHERE t3.year  =  2009 GROUP BY t1.name ORDER BY count(*) DESC LIMIT 1
SELECT DISTINCT t3.name FROM paper AS t1 JOIN author_list AS t2 ON t1.paper_id  =  t2.paper_id JOIN affiliation AS t3 ON t2.affiliation_id  =  t3.affiliation_id WHERE t1.year  =  2009 GROUP BY t3.affiliation_id ORDER BY COUNT ( DISTINCT t1.paper_id ) DESC LIMIT 3;
SELECT DISTINCT t3.name FROM paper AS t1 JOIN author_list AS t2 ON t1.paper_id  =  t2.paper_id JOIN affiliation AS t3 ON t2.affiliation_id  =  t3.affiliation_id WHERE t1.year  =  2009 GROUP BY t3.name ORDER BY COUNT ( DISTINCT t1.paper_id ) DESC LIMIT 3;
SELECT DISTINCT COUNT ( DISTINCT t3.paper_id ) FROM affiliation AS t1 JOIN author_list AS t2 ON t1.affiliation_id  =  t2.affiliation_id JOIN paper AS t3 ON t2.paper_id  =  t3.paper_id WHERE t1.name  =  "Columbia University" AND t3.year  <=  2009;
SELECT DISTINCT COUNT ( DISTINCT t3.paper_id ) FROM affiliation AS t1 JOIN author_list AS t2 ON t1.affiliation_id  =  t2.affiliation_id JOIN paper AS t3 ON t2.paper_id  =  t3.paper_id WHERE t1.name  =  "Columbia University" AND t3.year  <=  2009;
SELECT DISTINCT COUNT ( t3.paper_id ) FROM affiliation AS t1 JOIN author_list AS t2 ON t1.affiliation_id  =  t2.affiliation_id JOIN paper AS t3 ON t2.paper_id  =  t3.paper_id WHERE t1.name  =  "Stanford University" AND t3.year  >=  2000 AND t3.year  <=  2009;
SELECT COUNT ( DISTINCT t3.paper_id ) FROM affiliation AS t1 JOIN author_list AS t2 ON t1.affiliation_id  =  t2.affiliation_id JOIN paper AS t3 ON t2.paper_id  =  t3.paper_id WHERE t1.name  =  "Stanford University" AND t3.year  >=  2000 AND t3.year  <=  2009;
SELECT DISTINCT t3.title FROM author_list AS t2 JOIN author AS t1 ON t2.author_id  =  t1.author_id JOIN paper AS t3 ON t2.paper_id  =  t3.paper_id GROUP BY t2.paper_id ORDER BY COUNT ( DISTINCT t1.name ) DESC LIMIT 1;
SELECT DISTINCT t3.title FROM author_list AS t2 JOIN author AS t1 ON t2.author_id  =  t1.author_id JOIN paper AS t3 ON t2.paper_id  =  t3.paper_id GROUP BY t2.paper_id ORDER BY COUNT ( DISTINCT t1.name ) DESC LIMIT 1;
SELECT DISTINCT COUNT ( DISTINCT t2.author_id ) FROM author_list AS t3 JOIN author AS t1 ON t3.author_id  =  t1.author_id JOIN paper AS t4 ON t4.paper_id  =  t3.paper_id JOIN citation AS t2 ON t4.paper_id  =  t2.cited_paper_id WHERE t1.name  =  "Mckeown , Kathleen";
SELECT COUNT ( DISTINCT t1.author_id ) FROM author_list AS t2 JOIN author AS t1 ON t2.author_id  =  t1.author_id WHERE t1.name  =  "Mckeown , Kathleen" AND t2.paper_id IN ( SELECT t2.paper_id FROM author_list AS t3 JOIN author AS t4 ON t3.author_id  =  t4.author_id WHERE t4.name != "Mckeown , Kathleen" AND t3.paper_id = t2.paper_id );
SELECT DISTINCT t1.author_id FROM author_list AS t2 JOIN author AS t1 ON t2.author_id  =  t1.author_id JOIN author_list AS t3 ON t3.paper_id  =  t2.paper_id JOIN author AS t4 ON t3.author_id  =  t4.author_id WHERE t4.name  =  "Mckeown , Kathleen" ORDER BY COUNT ( DISTINCT t2.paper_id ) DESC LIMIT 1;
SELECT t1.name FROM author AS t1 JOIN author_list AS t2 ON t1.author_id  =  t2.author_id JOIN paper AS t3 ON t2.paper_id  =  t3.paper_id JOIN author AS t4 ON t2.author_id  =  t4.author_id WHERE t4.name  =  "Mckeown , Kathleen" GROUP BY t1.name ORDER BY COUNT ( DISTINCT t3.title ) DESC LIMIT 1;
SELECT paper_id FROM paper WHERE title LIKE "%translation%"
SELECT paper_id FROM paper WHERE title LIKE "%translation%"
SELECT paper_id ,  title FROM paper WHERE paper_id NOT IN (SELECT paper_id FROM citation)
SELECT paper_id ,  title FROM paper WHERE paper_id NOT IN (SELECT paper_id FROM citation)
SELECT t1.name FROM affiliation AS t1 JOIN author_list AS t2 ON t1.affiliation_id  =  t2.affiliation_id JOIN paper AS t3 ON t2.paper_id  =  t3.paper_id WHERE t1.address LIKE "%China%" GROUP BY t1.affiliation_id ORDER BY COUNT ( DISTINCT t3.paper_id ) DESC LIMIT 1;
SELECT DISTINCT t1.name FROM affiliation AS t1 JOIN author_list AS t2 ON t1.affiliation_id  =  t2.affiliation_id JOIN paper AS t3 ON t2.paper_id  =  t3.paper_id WHERE t1.address LIKE "%China%" GROUP BY t1.name ORDER BY count(*) DESC LIMIT 1;
SELECT COUNT ( DISTINCT paper_id )  ,  YEAR FROM paper GROUP BY YEAR;
SELECT count(*) ,  venue ,  YEAR FROM paper GROUP BY venue ,  YEAR
SELECT T1.name ,  count(*) FROM affiliation AS T1 JOIN author_list AS T2 ON T1.affiliation_id  =  T2.affiliation_id GROUP BY T1.affiliation_id
SELECT T1.name ,  count(*) FROM affiliation AS T1 JOIN author_list AS T2 ON T1.affiliation_id  =  T2.affiliation_id JOIN paper AS T3 ON T2.paper_id  =  T3.paper_id GROUP BY T1.affiliation_id
SELECT DISTINCT t3.title FROM citation AS t1 JOIN paper AS t3 ON t1.cited_paper_id  =  t3.paper_id JOIN citation AS t2 ON t1.paper_id  =  t2.cited_paper_id GROUP BY t3.title HAVING COUNT ( DISTINCT t1.cited_paper_id )  >  50;
SELECT DISTINCT t3.title FROM citation AS t1 JOIN paper AS t3 ON t1.paper_id  =  t3.paper_id JOIN citation AS t2 ON t1.paper_id  =  t2.cited_paper_id GROUP BY t1.paper_id HAVING COUNT ( DISTINCT t2.paper_id )  >  50;
SELECT COUNT ( DISTINCT t1.author_id ) FROM author_list AS t1 JOIN paper AS t2 ON t1.paper_id  =  t2.paper_id JOIN citation AS t3 ON t2.paper_id  =  t3.paper_id WHERE t3.cited_paper_id NOT IN ( SELECT t3.cited_paper_id FROM citation AS t3 GROUP BY t3.cited_paper_id HAVING COUNT ( DISTINCT t3.paper_id )  >  50 )
SELECT DISTINCT COUNT ( t3.paper_id ) FROM citation AS t1 JOIN paper AS t3 ON t1.cited_paper_id  =  t3.paper_id JOIN author_list AS t2 ON t2.paper_id  =  t3.paper_id WHERE t1.paper_id IN ( SELECT t1.paper_id FROM citation AS t1 JOIN paper AS t3 ON t1.cited_paper_id  =  t3.paper_id JOIN author_list AS t2 ON t2.paper_id  =  t3.paper_id GROUP BY t1.paper_id HAVING COUNT ( DISTINCT t2.author_id )  >  50 )
SELECT DISTINCT t1.name FROM author AS t1 JOIN author_list AS t2 ON t1.author_id  =  t2.author_id JOIN paper AS t3 ON t2.paper_id  =  t3.paper_id WHERE t3.year  =  2009 AND t3.venue  =  "NAACL" OR t3.venue  =  "ACL"
SELECT DISTINCT t3.name FROM paper AS t4 JOIN author_list AS t2 ON t4.paper_id  =  t2.paper_id JOIN author AS t3 ON t2.author_id  =  t3.author_id JOIN paper AS t5 ON t4.title  =  "NAACL" AND t5.title  =  "ACL" AND t4.year  =  2009 AND t5.year  =  2009;
SELECT DISTINCT t1.name FROM author AS t1 JOIN author_list AS t2 ON t1.author_id  =  t2.author_id JOIN paper AS t3 ON t2.paper_id  =  t3.paper_id WHERE t3.venue  !=  "ACL"
SELECT DISTINCT t1.name FROM author AS t1 JOIN author_list AS t2 ON t1.author_id  =  t2.author_id JOIN paper AS t3 ON t2.paper_id  =  t3.paper_id WHERE t3.venue  !=  "ACL"
SELECT count(*) FROM conference
SELECT count(*) FROM conference
SELECT DISTINCT Conference_Name FROM conference
SELECT DISTINCT Conference_Name FROM conference
SELECT conference_name ,  YEAR ,  LOCATION FROM conference
SELECT conference_name ,  YEAR ,  LOCATION FROM conference
SELECT Conference_Name ,  COUNT(*) FROM conference GROUP BY Conference_Name
SELECT Conference_Name ,  count(*) FROM conference GROUP BY Conference_Name
SELECT YEAR ,  count(*) FROM conference GROUP BY YEAR
SELECT count(*) ,  YEAR FROM conference GROUP BY YEAR
SELECT YEAR FROM conference GROUP BY YEAR ORDER BY count(*) ASC LIMIT 1
SELECT YEAR FROM conference GROUP BY YEAR ORDER BY count(*) ASC LIMIT 1
SELECT LOCATION FROM conference GROUP BY LOCATION HAVING count(*)  >=  2
SELECT LOCATION FROM conference GROUP BY LOCATION HAVING count(*)  >=  2
SELECT institution_name ,  LOCATION ,  founded FROM institution
SELECT institution_name ,  LOCATION ,  founded FROM institution
SELECT count(*) FROM institution WHERE Founded BETWEEN 1850 AND 1900
SELECT count(*) FROM institution WHERE Founded BETWEEN 1850 AND 1900
SELECT institution_name ,  LOCATION FROM institution ORDER BY founded DESC LIMIT 1
SELECT institution_name ,  LOCATION FROM institution ORDER BY Founded DESC LIMIT 1
SELECT T2.institution_name ,  count(*) FROM staff AS T1 JOIN institution AS T2 ON T1.institution_id  =  T2.institution_id WHERE T2.founded  >  1800 GROUP BY T1.institution_id
SELECT T1.institution_name ,  T2.staff_id FROM institution AS T1 JOIN staff AS T2 ON T1.institution_id  =  T2.institution_id WHERE T1.founded  >  1800 GROUP BY T2.staff_id
SELECT institution_name FROM institution WHERE institution_id NOT IN (SELECT institution_id FROM staff)
SELECT institution_name FROM institution WHERE institution_id NOT IN (SELECT institution_id FROM staff)
SELECT name FROM staff WHERE age  >  (SELECT avg(age) FROM staff)
SELECT name FROM staff WHERE age  >  (SELECT avg(age) FROM staff)
SELECT max(Age) ,  min(Age) FROM staff WHERE Nationality  =  "United States"
SELECT max(Age) ,  min(Age) FROM staff
SELECT T3.conference_name FROM conference_participation AS T1 JOIN staff AS T2 ON T1.staff_id  =  T2.staff_id JOIN conference AS T3 ON T1.conference_id  =  T3.conference_id WHERE T2.nationality  =  'Canada'
SELECT T3.conference_name FROM conference_participation AS T1 JOIN staff AS T2 ON T1.staff_id  =  T2.staff_id JOIN conference AS T3 ON T1.conference_id  =  T3.conference_id WHERE T2.nationality  =  'Canada'
SELECT T1.name FROM staff AS T1 JOIN conference_participation AS T2 ON T1.staff_id  =  T2.staff_id WHERE T2.role  =  'sponsor' INTERSECT SELECT T1.name FROM staff AS T1 JOIN conference_participation AS T2 ON T1.staff_id  =  T2.staff_id WHERE T2.role  =  'speaker'
SELECT T2.name FROM conference_participation AS T1 JOIN staff AS T2 ON T1.staff_ID  =  T2.staff_ID WHERE T1.role  =  'Sponsor' INTERSECT SELECT T2.name FROM conference_participation AS T1 JOIN staff AS T2 ON T1.staff_ID  =  T2.staff_ID WHERE T1.role  =  'Speaker'
SELECT T1.name FROM staff AS T1 JOIN conference_participation AS T2 ON T1.staff_id  =  T2.staff_id WHERE T2.conference_id  =  'ACL' INTERSECT SELECT T1.name FROM staff AS T1 JOIN conference_participation AS T2 ON T1.staff_id  =  T2.staff_id WHERE T2.conference_id  =  'Naccl'
SELECT T2.name FROM conference_participation AS T1 JOIN staff AS T2 ON T1.staff_ID  =  T2.staff_ID JOIN conference AS T3 ON T3.Conference_ID  =  T1.Conference_ID WHERE T3.Conference_Name  =  'ACL' INTERSECT SELECT T2.name FROM conference_participation AS T1 JOIN staff AS T2 ON T1.staff_ID  =  T2.staff_ID JOIN conference AS T3 ON T3.Conference_ID  =  T1.Conference_ID WHERE T3.Conference_Name  =  'NACCL'
SELECT T2.name FROM conference_participation AS T1 JOIN staff AS T2 ON T1.staff_ID  =  T2.staff_ID JOIN conference AS T3 ON T1.Conference_ID  =  T3.Conference_ID WHERE T3.Year  =  2003 OR T3.Year  =  2004
SELECT DISTINCT T2.name FROM conference_participation AS T1 JOIN staff AS T2 ON T1.staff_ID  =  T2.staff_ID JOIN conference AS T3 ON T1.Conference_ID  =  T3.Conference_ID WHERE T3.Year  =  2003 OR T3.Year  =  2004
SELECT T2.conference_name ,  T2.year ,  COUNT(*) FROM conference_participation AS T1 JOIN conference AS T2 ON T1.conference_id  =  T2.conference_id GROUP BY T1.conference_id
SELECT T2.conference_name ,  T2.year ,  count(*) FROM conference_participation AS T1 JOIN conference AS T2 ON T1.conference_id  =  T2.conference_id GROUP BY T1.conference_id
SELECT T2.Conference_Name FROM conference_participation AS T1 JOIN conference AS T2 ON T1.Conference_ID  =  T2.Conference_ID GROUP BY T1.Conference_ID ORDER BY COUNT(*) DESC LIMIT 2
SELECT T2.conference_name FROM conference_participation AS T1 JOIN conference AS T2 ON T1.conference_id  =  T2.conference_id GROUP BY T1.conference_id ORDER BY count(*) DESC LIMIT 2
SELECT name ,  nationality FROM staff WHERE staff_id NOT IN (SELECT staff_id FROM conference_participation WHERE role  =  'ACL')
SELECT name ,  nationality FROM staff WHERE staff_id NOT IN (SELECT staff_id FROM conference_participation WHERE role  =  'ACL')
SELECT institution_name ,  LOCATION FROM institution WHERE institution_id NOT IN (SELECT institution_id FROM conference_participation AS T1 JOIN conference AS T2 ON T1.conference_id  =  T2.conference_id WHERE T2.Year  =  2004)
SELECT institution_name ,  LOCATION FROM institution EXCEPT SELECT T2.institution_name ,  T2.LOCATION FROM conference_participation AS T1 JOIN staff AS T2 ON T1.staff_ID  =  T2.staff_ID JOIN conference AS T3 ON T1.conference_ID  =  T3.conference_ID WHERE T3.year  =  2004
SELECT pilot_name FROM PilotSkills ORDER BY age DESC LIMIT 1
SELECT pilot_name FROM PilotSkills ORDER BY age DESC LIMIT 1
SELECT pilot_name FROM PilotSkills WHERE age  <  (SELECT avg(age) FROM PilotSkills) ORDER BY age
SELECT pilot_name FROM PilotSkills WHERE age  <  (SELECT avg(age) FROM PilotSkills) ORDER BY age
SELECT * FROM PilotSkills WHERE age  <  30
SELECT * FROM PilotSkills WHERE age  <  30
SELECT pilot_name FROM PilotSkills WHERE plane_name  =  "Piper Cub" AND age  <  35
SELECT pilot_name FROM PilotSkills WHERE age  <  35 INTERSECT SELECT pilot_name FROM PilotSkills WHERE plane_name  =  "Piper Cub"
SELECT location FROM Hangar WHERE plane_name  =  'F-14 Fighter'
SELECT T2.location FROM PilotSkills AS T1 JOIN Hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T1.plane_name  =  "F-14 Fighter"
SELECT count(DISTINCT location) FROM Hangar
SELECT count(DISTINCT location) FROM Hangar
SELECT plane_name FROM PilotSkills WHERE pilot_name  =  "Jones" AND age  =  32
SELECT plane_name FROM PilotSkills WHERE pilot_name  =  "Jones" AND age  =  32
SELECT count(*) FROM PilotSkills WHERE age  >  40
SELECT count(*) FROM PilotSkills WHERE age  >  40
SELECT count(*) FROM PilotSkills WHERE plane_name  =  "B-52 Bomber" AND age  <  35
SELECT count(*) FROM PilotSkills WHERE plane_name  =  "B-52 Bomber" AND age  <  35
SELECT pilot_name FROM PilotSkills WHERE plane_name  =  "Piper Cub" ORDER BY age LIMIT 1
SELECT pilot_name FROM PilotSkills WHERE plane_name  =  "Piper Cub" ORDER BY age ASC LIMIT 1
SELECT plane_name FROM PilotSkills GROUP BY plane_name ORDER BY count(*) DESC LIMIT 1
SELECT plane_name FROM PilotSkills GROUP BY plane_name ORDER BY count(*) DESC LIMIT 1
SELECT plane_name FROM PilotSkills GROUP BY plane_name ORDER BY count(*) ASC LIMIT 1
SELECT plane_name FROM PilotSkills GROUP BY plane_name ORDER BY count(*) ASC LIMIT 1
SELECT count(*) FROM hangar WHERE LOCATION  =  'Chicago'
SELECT count(*) FROM Hangar WHERE LOCATION  =  'Chicago'
SELECT T2.plane_name FROM PilotSkills AS T1 JOIN Hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T1.pilot_name  =  "Smith" AND T1.age  =  41
SELECT T2.plane_name FROM PilotSkills AS T1 JOIN Hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T1.pilot_name  =  'Smith' AND T1.age  =  41
SELECT count(DISTINCT plane_name) FROM PilotSkills
SELECT count(DISTINCT plane_name) FROM PilotSkills
SELECT count(*) FROM PilotSkills WHERE pilot_name  =  'Smith'
SELECT count(*) FROM PilotSkills WHERE pilot_name  =  'Smith'
SELECT count(*) FROM PilotSkills WHERE age  >  40
SELECT count(*) FROM PilotSkills WHERE age  >  40
SELECT pilot_name FROM PilotSkills WHERE age BETWEEN 30 AND 40 ORDER BY age
SELECT pilot_name FROM PilotSkills WHERE age BETWEEN 30 AND 40 ORDER BY age ASC
SELECT pilot_name FROM PilotSkills ORDER BY age DESC
SELECT pilot_name FROM PilotSkills ORDER BY age DESC
SELECT DISTINCT location FROM Hangar ORDER BY plane_name
SELECT location FROM Hangar ORDER BY plane_name
SELECT DISTINCT plane_name FROM PilotSkills ORDER BY plane_name
SELECT DISTINCT plane_name FROM Hangar ORDER BY plane_name
SELECT count(*) FROM PilotSkills WHERE age  >  40 OR age  <  30
SELECT count(*) FROM PilotSkills WHERE age  >  40 OR age  <  30
SELECT T1.pilot_name ,  T1.age FROM PilotSkills AS T1 JOIN Hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T1.age  >  35 AND T1.plane_name  =  'Piper Cub' UNION SELECT T1.pilot_name ,  T1.age FROM PilotSkills AS T1 JOIN Hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T1.age  <  30 AND T1.plane_name  =  'F-14 Fighter'
SELECT pilot_name ,  age FROM PilotSkills WHERE plane_name  =  'Piper Cub' AND age  >  35 UNION SELECT pilot_name ,  age FROM PilotSkills WHERE plane_name  =  'F-14 Fighter' AND age  <  30
SELECT pilot_name FROM PilotSkills WHERE plane_name  =  'Piper Cub' EXCEPT SELECT pilot_name FROM PilotSkills WHERE plane_name  =  'B-52 Bomber'
SELECT pilot_name FROM PilotSkills WHERE plane_name  =  "Piper Cub" EXCEPT SELECT pilot_name FROM PilotSkills WHERE plane_name  =  "B-52 Bomber"
SELECT DISTINCT T1.pilot_name FROM PilotSkills AS T1 JOIN Hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T1.plane_name  =  'Piper Cub' INTERSECT SELECT DISTINCT T1.pilot_name FROM PilotSkills AS T1 JOIN Hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T1.plane_name  =  'B-52 Bomber'
SELECT pilot_name FROM PilotSkills WHERE plane_name  =  'Piper Cub' INTERSECT SELECT pilot_name FROM PilotSkills WHERE plane_name  =  'B-52 Bomber'
SELECT avg(age) ,  min(age) FROM PilotSkills
SELECT avg(age) ,  min(age) FROM PilotSkills
SELECT T1.pilot_name FROM PilotSkills AS T1 JOIN Hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T2.location  =  'Austin' INTERSECT SELECT T1.pilot_name FROM PilotSkills AS T1 JOIN Hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T2.location  =  'Boston'
SELECT T1.pilot_name FROM PilotSkills AS T1 JOIN Hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T2.location  =  'Austin' INTERSECT SELECT T1.pilot_name FROM PilotSkills AS T1 JOIN Hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T2.location  =  'Boston'
SELECT pilot_name FROM PilotSkills WHERE plane_name  =  'Piper Cub' INTERSECT SELECT pilot_name FROM PilotSkills WHERE plane_name  =  'F-14 Fighter'
SELECT pilot_name FROM PilotSkills WHERE plane_name  =  "Piper Cub" OR plane_name  =  "F-14 Fighter"
SELECT plane_name ,  avg(age) FROM PilotSkills GROUP BY plane_name
SELECT plane_name ,  avg(age) FROM PilotSkills GROUP BY plane_name
SELECT count(*) ,  plane_name FROM Hangar GROUP BY plane_name
SELECT count(*) ,  plane_name FROM PilotSkills GROUP BY plane_name
SELECT plane_name ,  age FROM PilotSkills ORDER BY age DESC GROUP BY plane_name
SELECT T1.plane_name ,  T2.pilot_name FROM Hangar AS T1 JOIN PilotSkills AS T2 ON T1.plane_name  =  T2.plane_name ORDER BY T1.plane_name WHERE T2.age  =  (SELECT max(age) FROM PilotSkills)
SELECT pilot_name ,  plane_name FROM PilotSkills ORDER BY age DESC GROUP BY plane_name
SELECT plane_name ,  age ,  pilot_name FROM PilotSkills WHERE age  =  (SELECT max(age) FROM PilotSkills)
SELECT max(age) ,  pilot_name FROM PilotSkills GROUP BY pilot_name
SELECT pilot_name ,  max(age) FROM PilotSkills GROUP BY pilot_name
SELECT avg(t1.age) ,  count(*) ,  T3.location FROM PilotSkills AS t1 JOIN Hangar AS t2 ON t1.plane_name  =  t2.plane_name JOIN hangar AS T3 ON t2.plane_name  =  T3.plane_name GROUP BY T3.location
SELECT T2.location ,  avg(T1.age) FROM PilotSkills AS T1 JOIN Hangar AS T2 ON T1.plane_name  =  T2.plane_name GROUP BY T2.location
SELECT count(*) ,  avg(age) FROM PilotSkills WHERE age  <  35 GROUP BY plane_name
SELECT plane_name ,  count(*) FROM PilotSkills WHERE age  <  35 GROUP BY plane_name
SELECT T2.location FROM PilotSkills AS T1 JOIN Hangar AS T2 ON T1.plane_name  =  T2.plane_name ORDER BY T1.age LIMIT 1
SELECT T3.location FROM PilotSkills AS T1 JOIN Hangar AS T3 ON T1.plane_name  =  T3.plane_name ORDER BY T1.age LIMIT 1
SELECT T1.pilot_name ,  T1.age FROM PilotSkills AS T1 JOIN Hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T2.location  =  'Austin'
SELECT T3.pilot_name ,  T3.age FROM Hangar AS T1 JOIN PilotSkills AS T3 ON T1.plane_name  =  T3.plane_name WHERE LOCATION  =  'Austin'
SELECT pilot_name FROM PilotSkills WHERE age  >  (SELECT max(age) FROM PilotSkills WHERE plane_name  =  "Piper Cub") ORDER BY pilot_name
SELECT pilot_name FROM PilotSkills WHERE age  >  (SELECT max(age) FROM PilotSkills WHERE plane_name  =  'Piper Cub') ORDER BY pilot_name
SELECT count(*) FROM PilotSkills WHERE age  <  (SELECT min(age) FROM PilotSkills WHERE plane_name  =  "F-14 Fighter")
SELECT count(*) FROM PilotSkills WHERE age  <  (SELECT min(age) FROM PilotSkills WHERE plane_name  =  "F-14 Fighter")
SELECT DISTINCT plane_name FROM Hangar WHERE plane_name LIKE '%Bomber%'
SELECT DISTINCT plane_name FROM Hangar WHERE plane_name LIKE "%Bomber%"
SELECT count(*) FROM PilotSkills WHERE age  >  (SELECT min(age) FROM PilotSkills WHERE plane_name  =  "Piper Cub")
SELECT count(*) FROM PilotSkills WHERE age  >  (SELECT min(age) FROM PilotSkills WHERE plane_name  =  "Piper Cub")
SELECT name FROM district ORDER BY area_km DESC LIMIT 1
SELECT area_km ,  government_website FROM district ORDER BY population LIMIT 1
SELECT name ,  population FROM district WHERE area_km  >  (SELECT avg(area_km) FROM district)
SELECT max(area_km) ,  avg(area_km) FROM district
SELECT sum(population) FROM district ORDER BY area_km DESC LIMIT 3
SELECT district_id ,  name ,  government_website FROM district ORDER BY Population
SELECT name FROM district WHERE government_website LIKE "%gov%"
SELECT district_id ,  name FROM district WHERE population  >  4000 OR area_km  >  3000
SELECT name ,  speach_title FROM spokesman
SELECT avg(Points) ,  avg(Age) FROM spokesman WHERE Rank_position  =  1
SELECT name ,  points FROM spokesman WHERE age  <  40
SELECT name FROM spokesman ORDER BY age DESC LIMIT 1
SELECT name FROM spokesman WHERE points  <  (SELECT avg(points) FROM spokesman)
SELECT T2.name FROM spokesman_district AS T1 JOIN district AS T2 ON T1.district_id  =  T2.district_id GROUP BY T1.district_id ORDER BY count(*) DESC LIMIT 1
SELECT T2.Name FROM spokesman_district AS T1 JOIN spokesman AS T2 ON T1.Spokesman_ID  =  T2.Spokesman_ID WHERE T1.Start_year  <  2004
SELECT count(*) ,  T1.name FROM district AS T1 JOIN spokesman_district AS T2 ON T1.district_id  =  T2.district_id GROUP BY T1.district_id
SELECT T2.name FROM spokesman_district AS T1 JOIN district AS T2 ON T1.district_id  =  T2.district_id JOIN spokesman AS T3 ON T1.spokesman_id  =  T3.spokesman_id WHERE T3.Rank_position  =  1 INTERSECT SELECT T2.name FROM spokesman_district AS T1 JOIN district AS T2 ON T1.district_id  =  T2.district_id JOIN spokesman AS T3 ON T1.spokesman_id  =  T3.spokesman_id WHERE T3.Rank_position  =  2
SELECT T2.name FROM spokesman_district AS T1 JOIN district AS T2 ON T1.district_id  =  T2.district_id GROUP BY T1.district_id HAVING count(*)  >  1
SELECT count(*) FROM district WHERE district_id NOT IN (SELECT district_id FROM spokesman_district)
SELECT name FROM spokesman WHERE Spokesman_ID NOT IN (SELECT Spokesman_ID FROM spokesman_district)
SELECT sum(T1.population) ,  avg(T1.population) FROM district AS T1 JOIN spokesman_district AS T2 ON T1.district_id  =  T2.district_id
SELECT title FROM Sculptures ORDER BY YEAR DESC LIMIT 1
SELECT title FROM sculptures ORDER BY YEAR DESC LIMIT 1
SELECT title ,  LOCATION FROM Paintings ORDER BY YEAR ASC LIMIT 1
SELECT title ,  LOCATION FROM Paintings ORDER BY YEAR ASC LIMIT 1
SELECT title FROM SCULPTURES WHERE LOCATION  =  226
SELECT title FROM SCULPTURES WHERE LOCATION  =  226
SELECT title ,  LOCATION FROM PAINTINGS
SELECT title ,  LOCATION FROM PAINTINGS
SELECT title ,  LOCATION FROM Sculptures
SELECT title ,  LOCATION FROM Sculptures
SELECT medium FROM paintings WHERE paintingID  =  80
SELECT medium FROM paintings WHERE paintingID  =  80
SELECT fname ,  lname FROM Artists WHERE birthyear  >  1850
SELECT fname ,  lname FROM Artists WHERE birthyear  >  1850
SELECT title ,  YEAR FROM Sculptures WHERE LOCATION != "gallery 226"
SELECT title ,  YEAR FROM Sculptures WHERE LOCATION != "gallery 226"
SELECT DISTINCT T1.fname ,  T1.lname FROM Artists AS T1 JOIN Sculptures AS T2 ON T1.artistID  =  T2.sculptorID WHERE T2.year  <  1900
SELECT DISTINCT T1.fname ,  T1.lname FROM artists AS T1 JOIN sculptures AS T2 ON T1.artistid  =  T2.sculptorid WHERE T2.year  <  1900
SELECT DISTINCT T1.birthYear FROM Artists AS T1 JOIN Sculptures AS T2 ON T1.artistID  =  T2.sculptorID WHERE T2.year  >  1920
SELECT DISTINCT T1.birthyear FROM artists AS T1 JOIN sculptures AS T2 ON T1.artistid  =  T2.sculptorid WHERE T2.year  >  1920
SELECT fname ,  lname FROM Artists ORDER BY deathYear - birthYear DESC LIMIT 1
SELECT fname ,  lname FROM Artists WHERE deathYear  -  birthYear  =  (SELECT max(deathYear  -  birthYear) FROM Artists)
SELECT birthYear - deathYear FROM artists ORDER BY birthYear - deathYear ASC LIMIT 1
SELECT birthYear FROM artists ORDER BY deathYear - birthYear LIMIT 1
SELECT fname ,  birthYear FROM Artists ORDER BY deathYear - birthYear DESC LIMIT 1
SELECT fname ,  birthYear FROM Artists ORDER BY deathYear - birthYear DESC LIMIT 1
SELECT count(*) FROM paintings WHERE LOCATION  =  "gallery 240"
SELECT count(*) FROM paintings WHERE LOCATION  =  "Gallery 240"
SELECT count(*) FROM Paintings AS T1 JOIN Artists AS T2 ON T1.painterID  =  T2.artistID JOIN Artists AS T3 ON T3.artistID  =  T2.artistID JOIN Artists AS T4 ON T4.artistID  =  T3.artistID JOIN Artists AS T5 ON T5.artistID  =  T4.artistID WHERE T2.birthYear  =  (SELECT min(birthYear) FROM Artists) AND T3.birthYear  =  (SELECT min(birthYear) FROM Artists WHERE birthYear  =  T2.birthYear) AND T4.birthYear  =  (SELECT min(birthYear) FROM Artists WHERE birthYear  =  T3.birthYear) AND T5.birthYear  =  (SELECT min(birthYear) FROM Artists WHERE birthYear  =  T4.birthYear) AND T2.deathYear  =  (SELECT max(deathYear) FROM Artists WHERE birthYear  =  T2.birthYear) AND T3.deathYear  =  (SELECT max(deathYear) FROM Artists WHERE birthYear  =  T3.birthYear) AND T4.deathYear  =  (SELECT max(deathYear) FROM Artists WHERE birthYear  =  T4.birthYear) AND T5.deathYear  =  (SELECT max(deathYear) FROM Artists WHERE birthYear  =  T5.birthYear)
SELECT count(*) FROM paintings AS T1 JOIN artists AS T2 ON T1.painterID  =  T2.artistID WHERE T2.birthyear  =  (SELECT min(birthyear) FROM artists)
SELECT T2.title ,  T2.year FROM Artists AS T1 JOIN Paintings AS T2 ON T1.artistID  =  T2.painterID WHERE T1.fname  =  "Mary"
SELECT T1.title ,  T1.year FROM Paintings AS T1 JOIN Artists AS T2 ON T1.painterID  =  T2.artistID WHERE T2.fname  =  "Mary"
SELECT T1.width_mm FROM paintings AS T1 JOIN artists AS T2 ON T1.painterID  =  T2.artistID WHERE T2.birthYear  <  1850
SELECT T2.width_mm FROM Artists AS T1 JOIN Paintings AS T2 ON T1.artistID  =  T2.painterID WHERE T1.birthYear  <  1850
SELECT T2.location ,  T2.medium FROM Artists AS T1 JOIN paintings AS T2 ON T1.artistID  =  T2.painterID WHERE T1.fname  =  "Pablo"
SELECT T2.location ,  T2.medium FROM Artists AS T1 JOIN paintings AS T2 ON T1.artistID  =  T2.painterID WHERE T1.fname  =  "Pablo"
SELECT T1.fname ,  T1.lname FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid JOIN sculptures AS T3 ON T1.artistid  =  T3.sculptorid WHERE T2.title IN (SELECT title FROM paintings GROUP BY title HAVING count(*)  >  1) INTERSECT SELECT T1.fname ,  T1.lname FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid JOIN sculptures AS T3 ON T1.artistid  =  T3.sculptorid WHERE T3.title IN (SELECT title FROM sculptures GROUP BY title HAVING count(*)  >  1)
SELECT T1.fname ,  T1.lname FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid JOIN sculptures AS T3 ON T1.artistid  =  T3.sculptorid
SELECT T1.fname ,  T1.lname FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.artistid WHERE T2.medium  =  'oil' INTERSECT SELECT T1.fname ,  T1.lname FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.artistid WHERE T2.medium  =  'lithographic'
SELECT T1.fname ,  T1.lname FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid WHERE T2.medium  =  'oil' INTERSECT SELECT T1.fname ,  T1.lname FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid WHERE T2.medium  =  'lithographic'
SELECT T1.birthYear FROM artists AS T1 JOIN paintings AS T2 ON T1.artistID  =  T2.painterID WHERE T2.year  =  1884 AND T2.medium  =  "canvas"
SELECT T1.birthYear FROM artists AS T1 JOIN paintings AS T2 ON T1.artistID  =  T2.artistID WHERE T2.year  =  1884
SELECT DISTINCT T1.fname FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid WHERE T2.medium  =  'oil' AND T2.location  =  241
SELECT T1.fname FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid WHERE T2.medium  =  'oil' AND T2.mediumon  =  'gallery' AND T2.location  =  241
SELECT count(*) ,  medium FROM paintings GROUP BY medium UNION SELECT count(*) ,  medium FROM sculptures GROUP BY medium
SELECT medium ,  count(*) FROM paintings GROUP BY medium UNION SELECT medium ,  count(*) FROM sculptures GROUP BY medium
SELECT medium ,  avg(height_mm) FROM paintings GROUP BY medium
SELECT medium ,  avg(height_mm) FROM paintings GROUP BY medium
SELECT count(*) ,  LOCATION FROM PAINTINGS WHERE YEAR  <  1900 GROUP BY LOCATION
SELECT count(*) ,  LOCATION FROM PAINTINGS WHERE YEAR  <  1900 GROUP BY LOCATION
SELECT title FROM paintings WHERE YEAR  >  1910 AND medium  =  "oil"
SELECT title FROM paintings WHERE medium  =  'oil' AND YEAR  >  1910
SELECT DISTINCT painterID FROM paintings WHERE medium  =  "oil" AND LOCATION  =  240
SELECT DISTINCT painterID FROM paintings WHERE medium  =  "oil" AND LOCATION  =  240
SELECT DISTINCT title FROM paintings WHERE height_mm  >  (SELECT max(height_mm) FROM paintings WHERE medium  =  "Canvas")
SELECT DISTINCT title FROM Paintings WHERE height_mm  >  (SELECT max(height_mm) FROM Paintings WHERE medium  =  "Canvas")
SELECT DISTINCT paintingID FROM Paintings WHERE YEAR  <  (SELECT min(YEAR) FROM Paintings WHERE LOCATION  =  'gallery 240')
SELECT DISTINCT paintingid FROM paintings WHERE YEAR  <  (SELECT min(YEAR) FROM galleries AS T1 JOIN paintings AS T2 ON T1.paintingid  =  T2.paintingid WHERE T1.galleryid  =  240)
SELECT paintingID FROM paintings ORDER BY YEAR ASC LIMIT 1
SELECT paintingID FROM paintings ORDER BY YEAR ASC LIMIT 1
SELECT T1.fname ,  T1.lname FROM Artists AS T1 JOIN Sculptures AS T2 ON T1.artistID  =  T2.sculptorID WHERE title LIKE "%female%"
SELECT T1.fname ,  T1.lname FROM artists AS T1 JOIN sculptures AS T2 ON T1.artistid  =  T2.sculptorid WHERE T2.title LIKE "%female%"
SELECT DISTINCT title FROM paintings ORDER BY title
SELECT DISTINCT title FROM paintings ORDER BY title
SELECT DISTINCT title FROM paintings ORDER BY LENGTH(title)
SELECT title FROM paintings ORDER BY height_mm ASC
SELECT title FROM paintings WHERE YEAR  >=  1900 INTERSECT SELECT title FROM sculptures WHERE YEAR  >=  1900
SELECT title FROM paintings WHERE YEAR  >=  1900 INTERSECT SELECT title FROM sculptures WHERE YEAR  >=  1900
SELECT T2.title FROM Artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid JOIN sculptures AS T3 ON T1.artistid  =  T3.sculptorid WHERE T1.artistid  =  222
SELECT T2.title FROM Artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid JOIN sculptures AS T3 ON T1.artistid  =  T3.sculptorid WHERE T1.artistid  =  222
SELECT T1.artistid FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid WHERE T2.year  <  1900 GROUP BY T1.artistid ORDER BY count(*) DESC LIMIT 1
SELECT T1.artistid FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid WHERE T1.deathyear  <  1900 GROUP BY T1.artistid ORDER BY count(*) DESC LIMIT 1
SELECT T1.fname FROM artists AS T1 JOIN sculptures AS T2 ON T1.artistid  =  T2.sculptorid GROUP BY T1.artistid ORDER BY count(*) DESC LIMIT 1
SELECT T1.fname FROM artists AS T1 JOIN sculptures AS T2 ON T1.artistid  =  T2.sculptorid GROUP BY T2.sculptorid ORDER BY count(*) DESC LIMIT 1
SELECT title FROM paintings WHERE width_mm  <  600 OR height_mm  >  800
SELECT title FROM paintings WHERE width_mm  <  600 OR height_mm  >  800
SELECT DISTINCT LOCATION FROM PAINTINGS WHERE YEAR  <  1885 OR YEAR  >  1930
SELECT DISTINCT LOCATION FROM paintings WHERE YEAR  <  1885 OR YEAR  >  1930
SELECT paintingID FROM Paintings WHERE height_mm  >  500 INTERSECT SELECT paintingID FROM Paintings WHERE height_mm  <  2000
SELECT paintingID FROM Paintings WHERE height_mm  >  500 INTERSECT SELECT paintingID FROM Paintings WHERE height_mm  <  2000
SELECT DISTINCT T1.location FROM paintings AS T1 JOIN mediums AS T2 ON T1.medium  =  T2.medium WHERE T2.mediumtype  =  'on panel' INTERSECT SELECT DISTINCT T1.location FROM paintings AS T1 JOIN mediums AS T2 ON T1.medium  =  T2.medium WHERE T2.mediumtype  =  'on canvas'
SELECT DISTINCT LOCATION FROM PAINTINGS WHERE medium  =  "on panel" INTERSECT SELECT DISTINCT LOCATION FROM PAINTINGS WHERE medium  =  "on canvas"
SELECT DISTINCT LOCATION FROM PAINTINGS WHERE YEAR  <  1885 INTERSECT SELECT DISTINCT LOCATION FROM PAINTINGS WHERE YEAR  >  1930
SELECT DISTINCT LOCATION FROM PAINTINGS WHERE YEAR  <  1885 INTERSECT SELECT DISTINCT LOCATION FROM PAINTINGS WHERE YEAR  >  1930
SELECT avg(height_mm) ,  avg(width_mm) FROM paintings WHERE medium  =  'oil' AND LOCATION  =  'gallery 241'
SELECT avg(height_mm) ,  avg(width_mm) FROM paintings WHERE medium  =  'oil' AND LOCATION  =  241
SELECT max(height_mm) ,  max(paintingID) FROM Paintings WHERE YEAR  <  1900
SELECT height_mm ,  paintingID FROM paintings WHERE YEAR  <  1900 ORDER BY height_mm DESC LIMIT 1
SELECT max(height_mm) ,  max(width_mm) ,  YEAR FROM paintings GROUP BY YEAR
SELECT max(height_mm) ,  max(width_mm) ,  YEAR FROM paintings GROUP BY YEAR
SELECT T1.painterID ,  avg(T1.height_mm) ,  avg(T1.width_mm) FROM paintings AS T1 JOIN artists AS T2 ON T1.painterID  =  T2.artistID GROUP BY T1.painterID ORDER BY T2.fname
SELECT T1.painterID ,  avg(T1.height_mm) ,  avg(T1.width_mm) FROM Paintings AS T1 JOIN Artists AS T2 ON T1.painterID  =  T2.artistID GROUP BY T1.painterID ORDER BY T2.fname
SELECT T1.fname ,  count(*) FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid GROUP BY T1.artistid HAVING count(*)  >=  2
SELECT T1.fname ,  count(*) FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.artistid GROUP BY T1.artistid HAVING count(*)  >=  2
SELECT T1.deathyear FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.artistid GROUP BY T1.artistid HAVING count(*)  <=  3
SELECT T2.deathYear FROM Paintings AS T1 JOIN Artists AS T2 ON T1.painterID  =  T2.artistID GROUP BY T1.painterID HAVING count(*)  <  4
SELECT T1.deathYear FROM Artists AS T1 JOIN Sculptures AS T2 ON T1.artistID  =  T2.sculptorID GROUP BY T1.artistID ORDER BY count(*) ASC LIMIT 1
SELECT T1.deathYear FROM Artists AS T1 JOIN Sculptures AS T2 ON T1.artistID  =  T2.sculptorID GROUP BY T1.artistID ORDER BY count(*) ASC LIMIT 1
SELECT paintingID ,  height_mm FROM paintings WHERE width_mm  =  (SELECT max(width_mm) FROM paintings WHERE location  =  240) AND LOCATION  =  240
SELECT width_mm ,  paintingID FROM Paintings WHERE LOCATION  =  240 ORDER BY width_mm DESC LIMIT 1
SELECT paintingID FROM paintings WHERE MEDIUM  =  "Oil" EXCEPT SELECT paintingID FROM paintings WHERE LOCATION  =  240
SELECT paintingID FROM paintings WHERE YEAR  <  (SELECT max(YEAR) FROM paintings WHERE LOCATION  =  240)
SELECT paintingID FROM paintings WHERE height_mm  >  (SELECT max(height_mm) FROM paintings WHERE YEAR  >  1900)
SELECT paintingID FROM paintings WHERE height_mm  >  (SELECT max(height_mm) FROM paintings WHERE YEAR  >  1900)
SELECT T1.fname ,  T1.lname FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.artistid WHERE T2.medium  =  "oil" GROUP BY T1.fname ,  T1.lname ORDER BY count(*) DESC LIMIT 3
SELECT T1.fname ,  T1.lname FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.artistid WHERE T2.medium  =  'oil' GROUP BY T1.artistid ORDER BY count(*) DESC LIMIT 1
SELECT paintingID ,  LOCATION ,  title FROM Paintings WHERE medium  =  "oil" ORDER BY YEAR
SELECT title ,  LOCATION ,  YEAR FROM Paintings WHERE medium  =  "Oil" ORDER BY YEAR
SELECT title ,  YEAR ,  LOCATION FROM Paintings WHERE height_mm  >  1000 ORDER BY title
SELECT title ,  YEAR ,  LOCATION FROM paintings WHERE height_mm  >  1000 ORDER BY title
SELECT T1.fname ,  T1.lname FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid EXCEPT SELECT T1.fname ,  T1.lname FROM artists AS T1 JOIN sculptures AS T2 ON T1.artistid  =  T2.sculptorid
SELECT T1.fname ,  T1.lname FROM Artists AS T1 JOIN Paintings AS T2 ON T1.artistID  =  T2.painterID EXCEPT SELECT T1.fname ,  T1.lname FROM Artists AS T1 JOIN Sculptures AS T2 ON T1.artistID  =  T2.sculptorID
SELECT LOCATION FROM PAINTINGS WHERE YEAR  <  1885 INTERSECT SELECT LOCATION FROM PAINTINGS WHERE mediumOn  =  "canvas" EXCEPT SELECT LOCATION FROM PAINTINGS WHERE mediumOn  =  "canvas"
SELECT LOCATION FROM PAINTINGS WHERE YEAR  <  1885 EXCEPT SELECT mediumOn FROM PAINTINGS WHERE mediumOn  =  "canvas"
SELECT count(*) FROM race
SELECT count(*) FROM race
SELECT Winning_driver ,  Winning_team FROM race ORDER BY Winning_team ASC
SELECT Winning_driver ,  Winning_team FROM race ORDER BY Winning_team
SELECT Winning_driver FROM race WHERE Pole_Position != "Junior Strous"
SELECT Winning_driver FROM race WHERE Winning_driver != "Junior Strous"
SELECT Constructor FROM driver ORDER BY Age ASC
SELECT DISTINCT Constructor FROM driver ORDER BY Age ASC
SELECT DISTINCT Entrant FROM driver WHERE Age  >=  20
SELECT Entrant FROM driver WHERE Age  >=  20
SELECT max(Age) ,  min(Age) FROM driver
SELECT max(age) ,  min(age) FROM driver
SELECT count(DISTINCT Engine) FROM driver WHERE Age  >  30 OR Age  <  20
SELECT count(DISTINCT engine) FROM driver WHERE age  >  30 OR age  <  20
SELECT Driver_Name FROM driver ORDER BY Driver_Name DESC
SELECT Driver_Name FROM driver ORDER BY Driver_Name DESC
SELECT T1.Driver_Name ,  T2.Race_Name FROM driver AS T1 JOIN race AS T2 ON T1.Driver_ID  =  T2.Driver_ID
SELECT T2.driver_name ,  T1.race_name FROM race AS T1 JOIN driver AS T2 ON T1.driver_id  =  T2.driver_id
SELECT T2.Driver_Name ,  COUNT(*) FROM race AS T1 JOIN driver AS T2 ON T1.Driver_ID  =  T2.Driver_ID GROUP BY T1.Driver_ID
SELECT count(*) ,  T1.driver_id FROM race AS T1 JOIN driver AS T2 ON T1.driver_id  =  T2.driver_id GROUP BY T1.driver_id
SELECT T1.Age FROM driver AS T1 JOIN race AS T2 ON T1.Driver_ID  =  T2.Driver_ID GROUP BY T1.Age ORDER BY count(*) DESC LIMIT 1
SELECT T1.Age FROM driver AS T1 JOIN race AS T2 ON T1.Driver_ID  =  T2.Driver_ID GROUP BY T1.Age ORDER BY count(*) DESC LIMIT 1
SELECT T1.driver_name ,  T1.age FROM driver AS T1 JOIN race AS T2 ON T1.driver_id  =  T2.driver_id GROUP BY T1.driver_id HAVING count(*)  >=  2
SELECT T2.Driver_Name ,  T2.Age FROM race AS T1 JOIN driver AS T2 ON T1.Driver_ID  =  T2.Driver_ID GROUP BY T1.Driver_ID HAVING count(*)  >=  2
SELECT T2.race_name FROM driver AS T1 JOIN race AS T2 ON T1.driver_id  =  T2.driver_id WHERE T1.age  >=  26
SELECT T2.race_name FROM driver AS T1 JOIN race AS T2 ON T1.driver_id  =  T2.driver_id WHERE T1.age  >=  26
SELECT driver_name FROM driver WHERE constructor != "Bugatti"
SELECT driver_name FROM driver WHERE constructor != 'Bugatti'
SELECT Constructor ,  COUNT(*) FROM driver GROUP BY Constructor
SELECT Constructor ,  count(*) FROM driver GROUP BY Constructor
SELECT engine FROM driver GROUP BY engine ORDER BY count(*) DESC LIMIT 1
SELECT Engine FROM driver GROUP BY Engine ORDER BY COUNT(*) DESC LIMIT 1
SELECT Engine FROM driver GROUP BY Engine HAVING COUNT(*)  >=  2
SELECT Engine FROM driver GROUP BY Engine HAVING count(*)  >=  2
SELECT Driver_Name FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM race)
SELECT Driver_Name FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM race)
SELECT Constructor FROM driver WHERE Age  <  20 INTERSECT SELECT Constructor FROM driver WHERE Age  >  30
SELECT Constructor FROM driver WHERE Age  <  20 INTERSECT SELECT Constructor FROM driver WHERE Age  >  30
SELECT Winning_team FROM race GROUP BY Winning_team HAVING count(*)  >  1
SELECT count(*) ,  Winning_team FROM race GROUP BY Winning_team HAVING count(*)  >  1
SELECT T1.driver_name FROM driver AS T1 JOIN race AS T2 ON T1.driver_id  =  T2.driver_id WHERE T2.pole_position  =  1 INTERSECT SELECT T1.driver_name FROM driver AS T1 JOIN race AS T2 ON T1.driver_id  =  T2.driver_id WHERE T2.pole_position  =  2
SELECT T1.Driver_name FROM driver AS T1 JOIN race AS T2 ON T1.driver_id  =  T2.driver_id WHERE T2.Pole_Position  =  'James Hinchcliffe' INTERSECT SELECT T1.Driver_name FROM driver AS T1 JOIN race AS T2 ON T1.driver_id  =  T2.driver_id WHERE T2.Pole_Position  =  'Carl Skerlong'
SELECT driver_name FROM driver EXCEPT SELECT driver_name FROM driver WHERE driver_name  =  "James Hinchcliffe"
SELECT driver_name FROM driver EXCEPT SELECT driver_name FROM driver WHERE driver_name  =  "James Hinchcliffe"
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
SELECT max(health_score) ,  min(health_score) FROM countries WHERE name != 'Norway'
SELECT count(DISTINCT language_id) FROM official_languages
SELECT count(DISTINCT language_id) FROM official_languages
SELECT name FROM countries ORDER BY education_score DESC
SELECT name FROM countries ORDER BY education_score DESC
SELECT name FROM countries WHERE politics_score  =  (SELECT max(politics_score) FROM countries)
SELECT name FROM countries ORDER BY politics_score DESC LIMIT 1
SELECT T2.name ,  T3.name FROM official_languages AS T1 JOIN countries AS T2 ON T1.country_id  =  T2.id JOIN languages AS T3 ON T1.language_id  =  T3.id
SELECT T2.name ,  T3.name FROM official_languages AS T1 JOIN countries AS T2 ON T1.country_id  =  T2.id JOIN languages AS T3 ON T1.language_id  =  T3.id
SELECT T1.name ,  T2.country_id FROM languages AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.language_id GROUP BY T1.id
SELECT T2.name ,  COUNT(*) FROM official_languages AS T1 JOIN languages AS T2 ON T1.language_id  =  T2.id GROUP BY T1.language_id
SELECT T1.name FROM languages AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.language_id GROUP BY T1.id ORDER BY count(*) DESC LIMIT 1
SELECT T2.name FROM official_languages AS T1 JOIN languages AS T2 ON T1.language_id  =  T2.id GROUP BY T1.language_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.name FROM languages AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.language_id GROUP BY T2.language_id HAVING COUNT(*)  >=  2
SELECT T1.name FROM languages AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.language_id GROUP BY T2.language_id HAVING COUNT(*)  >=  2
SELECT avg(T1.overall_score) FROM countries AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.country_id JOIN languages AS T3 ON T2.language_id  =  T3.id WHERE T3.name  =  "English"
SELECT avg(T1.overall_score) FROM countries AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.country_id JOIN languages AS T3 ON T2.language_id  =  T3.id WHERE T3.name  =  'English'
SELECT T1.name FROM languages AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.language_id GROUP BY T2.language_id ORDER BY COUNT(*) DESC LIMIT 3
SELECT T1.name FROM languages AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.language_id JOIN countries AS T3 ON T2.country_id  =  T3.id GROUP BY T1.id ORDER BY count(*) DESC LIMIT 3
SELECT T2.name FROM countries AS T1 JOIN languages AS T2 ON T1.overall_score  =  ( SELECT avg(overall_score) FROM countries AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.country_id GROUP BY T2.language_id ORDER BY avg(overall_score) DESC LIMIT 1 ) JOIN official_languages AS T3 ON T1.id  =  T3.country_id WHERE T2.id  =  T3.language_id
SELECT T2.name FROM official_languages AS T1 JOIN languages AS T2 ON T1.language_id  =  T2.id JOIN countries AS T3 ON T1.country_id  =  T3.id GROUP BY T2.id ORDER BY avg(T3.overall_score) DESC
SELECT T2.name FROM official_languages AS T1 JOIN countries AS T2 ON T1.country_id  =  T2.id GROUP BY T1.country_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.name FROM countries AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.country_id GROUP BY T1.id ORDER BY count(*) DESC LIMIT 1
SELECT name FROM languages WHERE id NOT IN (SELECT language_id FROM official_languages)
SELECT name FROM languages WHERE id NOT IN (SELECT language_id FROM official_languages)
SELECT name FROM countries WHERE id NOT IN (SELECT country_id FROM official_languages)
SELECT name FROM countries WHERE id NOT IN (SELECT country_id FROM official_languages)
SELECT T1.name FROM languages AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.language_id JOIN countries AS T3 ON T2.country_id  =  T3.id WHERE T3.overall_score  >  95 INTERSECT SELECT T1.name FROM languages AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.language_id JOIN countries AS T3 ON T2.country_id  =  T3.id WHERE T3.overall_score  <  90
SELECT DISTINCT T2.name FROM official_languages AS T1 JOIN languages AS T2 ON T1.language_id  =  T2.id JOIN countries AS T3 ON T1.country_id  =  T3.id WHERE T3.overall_score  >  95 INTERSECT SELECT DISTINCT T2.name FROM official_languages AS T1 JOIN languages AS T2 ON T1.language_id  =  T2.id JOIN countries AS T3 ON T1.country_id  =  T3.id WHERE T3.overall_score  <  90
SELECT country ,  town_city FROM addresses
SELECT county_state_province ,  town_city FROM Addresses
SELECT county_state_province FROM Addresses GROUP BY county_state_province
SELECT county_state_province FROM Addresses
SELECT feature_description FROM FEATURES WHERE feature_name  =  "rooftop"
SELECT feature_description FROM FEATURES WHERE feature_name  =  'rooftop'
SELECT T1.feature_name ,  T1.feature_description FROM Features AS T1 JOIN Property_Features AS T2 ON T1.feature_id  =  T2.feature_id GROUP BY T1.feature_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.feature_name ,  T1.feature_description FROM FEATURES AS T1 JOIN Property_Features AS T2 ON T1.feature_id  =  T2.feature_id GROUP BY T1.feature_id ORDER BY count(*) DESC LIMIT 1
SELECT min(room_count) FROM Properties;
SELECT min(room_count) FROM ROOMS
SELECT count(*) FROM Properties WHERE parking_lots  =  1 OR garage_yn  =  'Y'
SELECT count(*) FROM Properties WHERE parking_lots  =  1 OR garage_yn  =  'Y'
SELECT T1.age_category_code FROM Ref_User_Categories AS T1 JOIN Users AS T2 ON T1.user_category_code  =  T2.user_category_code WHERE T2.first_name LIKE "%Mother%"
SELECT T1.age_category_code FROM Ref_User_Categories AS T1 JOIN Users AS T2 ON T1.user_category_code  =  T2.user_category_code WHERE T2.first_name LIKE "%Mother%"
SELECT T2.first_name FROM Properties AS T1 JOIN Users AS T2 ON T1.owner_user_id  =  T2.user_id GROUP BY T2.first_name ORDER BY count(*) DESC LIMIT 1
SELECT T1.first_name FROM Users AS T1 JOIN Properties AS T2 ON T1.user_id  =  T2.owner_user_id GROUP BY T1.user_id ORDER BY count(*) DESC LIMIT 1
SELECT avg(room_count) FROM properties WHERE garage_yn  =  'Y'
SELECT avg(T2.room_count) FROM Property_Features AS T1 JOIN Properties AS T2 ON T1.property_id  =  T2.property_id JOIN Features AS T3 ON T1.feature_id  =  T3.feature_id WHERE T3.feature_name  =  "garden"
SELECT T1.town_city FROM Addresses AS T1 JOIN Properties AS T2 ON T1.address_id  =  T2.property_address_id JOIN Property_Features AS T3 ON T2.property_id  =  T3.property_id JOIN Features AS T4 ON T3.feature_id  =  T4.feature_id WHERE T4.feature_name  =  "swimming pool"
SELECT T1.town_city FROM Addresses AS T1 JOIN Properties AS T2 ON T1.address_id  =  T2.property_address_id JOIN Property_Features AS T3 ON T2.property_id  =  T3.property_id JOIN Features AS T4 ON T3.feature_id  =  T4.feature_id WHERE T4.feature_name  =  "swimming pool"
SELECT property_id ,  vendor_requested_price FROM Properties ORDER BY vendor_requested_price ASC LIMIT 1
SELECT property_id ,  vendor_requested_price FROM Properties ORDER BY vendor_requested_price ASC LIMIT 1
SELECT avg(room_count) FROM Properties
SELECT avg(room_count) FROM Properties
SELECT count(DISTINCT room_size) FROM ROOMS
SELECT count(DISTINCT room_size) FROM ROOMS
SELECT user_id ,  search_string FROM User_Searches GROUP BY user_id HAVING count(*)  >=  2
SELECT T1.user_id ,  T2.search_seq FROM USERS AS T1 JOIN User_Searches AS T2 ON T1.user_id  =  T2.user_id GROUP BY T1.user_id HAVING count(*)  >=  2
SELECT search_datetime FROM User_Searches ORDER BY search_datetime DESC LIMIT 1
SELECT search_datetime FROM User_Searches ORDER BY search_datetime DESC LIMIT 1
SELECT search_datetime ,  search_string FROM User_Searches ORDER BY search_string DESC
SELECT search_string ,  search_datetime FROM User_Searches ORDER BY search_string DESC
SELECT T3.zip_postcode FROM Properties AS T1 JOIN Addresses AS T3 ON T1.property_address_id = T3.address_id JOIN Users AS T2 ON T1.owner_user_id = T2.user_id GROUP BY T2.user_id HAVING count(*)  >  2
SELECT T2.zip_postcode FROM Properties AS T1 JOIN Addresses AS T2 ON T1.property_address_id  =  T2.address_id EXCEPT SELECT T2.zip_postcode FROM Properties AS T1 JOIN Addresses AS T2 ON T1.property_address_id  =  T2.address_id JOIN Users AS T3 ON T1.owner_user_id  =  T3.user_id GROUP BY T3.user_id HAVING count(*)  <=  2
SELECT T1.user_category_code ,  T1.user_id FROM Users AS T1 JOIN User_Searches AS T2 ON T1.user_id  =  T2.user_id GROUP BY T1.user_id HAVING count(*)  =  1
SELECT user_id ,  user_category_code FROM Users WHERE user_id IN (SELECT user_id FROM User_Searches GROUP BY user_id HAVING count(*)  =  1)
SELECT T1.age_category_code FROM Users AS T1 JOIN User_Searches AS T2 ON T1.user_id  =  T2.user_id ORDER BY T2.search_datetime ASC LIMIT 1
SELECT T1.age_category_code FROM Users AS T1 JOIN User_Searches AS T2 ON T1.user_id  =  T2.user_id ORDER BY T2.search_datetime LIMIT 1
SELECT login_name FROM Users WHERE age_category_code  =  "Senior" ORDER BY first_name
SELECT login_name FROM Users WHERE age_category_code  =  "Senior" ORDER BY first_name
SELECT count(*) FROM User_Searches WHERE search_string  =  'buy'
SELECT count(*) FROM User_Searches AS T1 JOIN Users AS T2 ON T1.user_id  =  T2.user_id WHERE T2.is_buyer  =  1
SELECT date_registered FROM Users WHERE login_name  =  "ratione"
SELECT date_registered FROM Users WHERE login_name  =  "ratione"
SELECT first_name ,  middle_name ,  last_name ,  login_name FROM USERS WHERE is_seller  =  1
SELECT first_name ,  middle_name ,  last_name ,  login_name FROM Users WHERE is_seller  =  1
SELECT T2.line_1_number_building ,  T2.line_2_number_street ,  T2.town_city FROM USERS AS T1 JOIN ADDRESSES AS T2 ON T1.user_address_id  =  T2.address_id WHERE T1.age_category_code  =  "Senior"
SELECT T3.line_1_number_building ,  T3.line_2_number_street ,  T3.town_city FROM Users AS T1 JOIN Addresses AS T3 ON T1.user_address_id  =  T3.address_id JOIN Ref_User_Categories AS T2 ON T1.user_category_code  =  T2.user_category_code WHERE T2.user_category_description  =  "Senior"
SELECT count(*) FROM PROPERTY_FEATURES GROUP BY property_id HAVING count(*)  >=  2
SELECT count(*) FROM Property_Features GROUP BY property_id HAVING count(*)  >=  2
SELECT T1.property_id ,  count(*) FROM Properties AS T1 JOIN Property_Photos AS T2 ON T1.property_id  =  T2.property_id GROUP BY T1.property_id
SELECT property_id ,  count(*) FROM Property_Photos GROUP BY property_id
SELECT T1.owner_user_id ,  count(*) FROM Properties AS T1 JOIN Property_Photos AS T2 ON T1.property_id  =  T2.property_id GROUP BY T1.owner_user_id
SELECT T1.owner_user_id ,  count(*) FROM Properties AS T1 JOIN Property_Photos AS T2 ON T1.property_id  =  T2.property_id GROUP BY T1.owner_user_id
SELECT sum(price_max) FROM Properties AS T1 JOIN Users AS T2 ON T1.owner_user_id  =  T2.user_id WHERE T2.age_category_code  =  "Single mother" OR T2.age_category_code  =  "Student"
SELECT sum(price_max) FROM Properties AS T1 JOIN Users AS T2 ON T1.owner_user_id  =  T2.user_id WHERE T2.user_category_code  =  "single_mother" OR T2.user_category_code  =  "student"
SELECT T1.datestamp ,  T2.property_name FROM User_Property_History AS T1 JOIN Properties AS T2 ON T1.property_id  =  T2.property_id ORDER BY T1.datestamp
SELECT T1.datestamp ,  T2.property_name FROM User_Property_History AS T1 JOIN Properties AS T2 ON T1.property_id  =  T2.property_id ORDER BY T1.datestamp
SELECT T1.property_type_description , T1.property_type_code FROM Ref_Property_Types AS T1 JOIN Properties AS T2 ON T1.property_type_code  =  T2.property_type_code GROUP BY T1.property_type_code ORDER BY count(*) DESC LIMIT 1
SELECT T1.property_type_description ,  T2.property_type_code FROM Ref_Property_Types AS T1 JOIN Properties AS T2 ON T1.property_type_code  =  T2.property_type_code GROUP BY T2.property_type_code ORDER BY count(*) DESC LIMIT 1
SELECT age_category_description FROM Ref_Age_Categories WHERE age_category_code  =  'Over 60'
SELECT age_category_description FROM Ref_Age_Categories WHERE age_category_code  =  'Over 60'
SELECT room_size ,  count(*) FROM ROOMS GROUP BY room_size
SELECT room_size ,  count(*) FROM Rooms GROUP BY room_size
SELECT T2.country FROM Users AS T1 JOIN Addresses AS T2 ON T1.user_address_id = T2.address_id WHERE T1.first_name = "Robbie"
SELECT T2.country FROM Users AS T1 JOIN Addresses AS T2 ON T1.user_address_id = T2.address_id WHERE T1.first_name = "Robbie"
SELECT T2.first_name ,  T2.middle_name ,  T2.last_name FROM Users AS T2 JOIN Properties AS T1 ON T1.owner_user_id  =  T2.user_id WHERE T1.property_address_id IN (SELECT T1.address_id FROM Addresses AS T1 JOIN Properties AS T2 ON T1.address_id  =  T2.property_address_id WHERE T2.owner_user_id  =  T2.user_id)
SELECT T2.first_name ,  T2.last_name FROM Properties AS T1 JOIN Users AS T2 ON T1.owner_user_id = T2.user_id JOIN Addresses AS T3 ON T1.property_address_id = T3.address_id WHERE T3.line_1_number_building IN (SELECT T4.line_1_number_building FROM Addresses AS T4 JOIN Properties AS T5 ON T5.property_address_id = T4.address_id WHERE T5.owner_user_id = T2.user_id)
SELECT search_string FROM User_Searches WHERE user_id NOT IN ( SELECT owner_user_id FROM Properties )
SELECT T1.search_string FROM User_Searches AS T1 JOIN Users AS T2 ON T1.user_id  =  T2.user_id WHERE T2.user_id NOT IN (SELECT T3.owner_user_id FROM Properties AS T3 JOIN Users AS T2 ON T3.owner_user_id  =  T2.user_id INTERSECT SELECT T3.owner_user_id FROM Properties AS T3 JOIN Users AS T2 ON T3.owner_user_id  =  T2.user_id)
SELECT T1.last_name ,  T1.user_id FROM USERS AS T1 JOIN user_property_history AS T2 ON T1.user_id  =  T2.user_id GROUP BY T1.user_id HAVING count(*)  >=  2 INTERSECT SELECT T1.last_name ,  T1.user_id FROM USERS AS T1 JOIN user_searches AS T2 ON T1.user_id  =  T2.user_id GROUP BY T1.user_id HAVING count(*)  <=  2
SELECT T1.last_name ,  T1.user_id FROM Users AS T1 JOIN User_Searches AS T2 ON T1.user_id  =  T2.user_id GROUP BY T1.user_id HAVING count(*)  <=  2 INTERSECT SELECT T1.last_name ,  T1.user_id FROM Users AS T1 JOIN User_Property_History AS T2 ON T1.user_id  =  T2.user_id GROUP BY T1.user_id HAVING count(*)  >=  2
SELECT count(*) FROM bike WHERE weight  >  780
SELECT product_name ,  weight FROM bike ORDER BY price ASC
SELECT heat ,  name ,  nation FROM cyclist
SELECT max(weight) ,  min(weight) FROM bike
SELECT avg(price) FROM bike WHERE material  =  'Carbon CC'
SELECT name ,  result FROM cyclist WHERE nation != 'Russia'
SELECT DISTINCT T1.id ,  T1.product_name FROM bike AS T1 JOIN cyclists_own_bikes AS T2 ON T1.id  =  T2.bike_id WHERE T2.purchase_year  >  2015
SELECT T2.id ,  T2.product_name FROM cyclists_own_bikes AS T1 JOIN bike AS T2 ON T1.bike_id  =  T2.id GROUP BY T2.id HAVING count(*)  >=  4
SELECT T1.id ,  T1.name FROM cyclist AS T1 JOIN cyclists_own_bikes AS T2 ON T1.id  =  T2.cyclist_id GROUP BY T1.id ORDER BY count(*) DESC LIMIT 1
SELECT DISTINCT T1.product_name FROM bike AS T1 JOIN cyclists_own_bikes AS T2 ON T1.id  =  T2.bike_id JOIN cyclist AS T3 ON T2.cyclist_id  =  T3.id WHERE T3.nation  =  'Russia' OR T3.nation  =  'Great Britain'
SELECT count(DISTINCT heat) FROM cyclist
SELECT count(*) FROM cyclist WHERE id NOT IN ( SELECT cyclist_id FROM cyclists_own_bikes WHERE purchase_year  >  2015 )
SELECT DISTINCT T1.product_name FROM bike AS T1 JOIN cyclists_own_bikes AS T2 ON T1.id  =  T2.bike_id JOIN cyclist AS T3 ON T2.cyclist_id  =  T3.id WHERE T3.result  >  '4:21.558'
SELECT T3.product_name ,  T3.price FROM cyclists_own_bikes AS T1 JOIN cyclist AS T2 ON T1.cyclist_id  =  T2.id JOIN bike AS T3 ON T1.bike_id  =  T3.id WHERE T2.name  =  'Bradley Wiggins' INTERSECT SELECT T3.product_name ,  T3.price FROM cyclists_own_bikes AS T1 JOIN cyclist AS T2 ON T1.cyclist_id  =  T2.id JOIN bike AS T3 ON T1.bike_id  =  T3.id WHERE T2.name  =  'Antonio Tauler'
SELECT name ,  nation ,  result FROM cyclist WHERE id NOT IN (SELECT cyclist_id FROM cyclists_own_bikes)
SELECT product_name FROM bike WHERE material LIKE "%fiber%"
SELECT count(*) ,  T1.id FROM cyclist AS T1 JOIN cyclists_own_bikes AS T2 ON T1.id  =  T2.cyclist_id GROUP BY T1.id ORDER BY T1.id
SELECT Food ,  Flavor FROM goods WHERE Price  =  (SELECT max(Price) FROM goods WHERE Food  =  'Cake')
SELECT id ,  flavor FROM goods WHERE food  =  'cake' ORDER BY price DESC LIMIT 1
SELECT flavor ,  min(price) FROM goods WHERE food  =  'cookie' GROUP BY flavor
SELECT id ,  flavor FROM goods WHERE food  =  'cookie' ORDER BY price LIMIT 1
SELECT id FROM goods WHERE flavor  =  "apple"
SELECT id FROM goods WHERE flavor  =  "apple"
SELECT Id FROM goods WHERE Price  <  3
SELECT Id FROM goods WHERE Price  <  3
SELECT DISTINCT T3.CustomerId FROM goods AS T1 JOIN items AS T2 ON T1.Id  =  T2.Item JOIN receipts AS T3 ON T2.Receipt  =  T3.ReceiptNumber WHERE T1.Flavor  =  "Lemon" AND T1.Food  =  "Cake"
SELECT DISTINCT T1.id FROM customers AS T1 JOIN receipts AS T2 ON T1.id  =  T2.customerid JOIN items AS T3 ON T2.receiptnumber  =  T3.receipt JOIN goods AS T4 ON T3.item  =  T4.id WHERE T4.flavor  =  'Lemon' AND T4.food  =  'Cake'
SELECT T2.Food ,  count(DISTINCT T1.CustomerId) FROM receipts AS T1 JOIN goods AS T2 ON T1.Item  =  T2.Id GROUP BY T2.Food
SELECT T2.Food ,  count(*) FROM items AS T1 JOIN goods AS T2 ON T1.item  =  T2.id JOIN receipts AS T3 ON T3.ReceiptNumber  =  T1.Receipt GROUP BY T2.Food
SELECT T2.CustomerId FROM receipts AS T1 JOIN customers AS T2 ON T1.CustomerId  =  T2.Id GROUP BY T2.CustomerId HAVING count(*)  >=  15
SELECT T2.CustomerId FROM receipts AS T1 JOIN customers AS T2 ON T1.CustomerId  =  T2.Id GROUP BY T2.CustomerId HAVING count(*)  >=  15
SELECT T2.LastName FROM receipts AS T1 JOIN customers AS T2 ON T1.CustomerId  =  T2.Id GROUP BY T2.LastName HAVING count(*)  >  10
SELECT T2.LastName FROM receipts AS T1 JOIN customers AS T2 ON T1.CustomerId  =  T2.Id GROUP BY T2.LastName HAVING count(*)  >  10
SELECT count(*) FROM goods WHERE food  =  'Cake'
SELECT count(DISTINCT Food) FROM goods WHERE Food  =  'cake'
SELECT Flavor FROM goods WHERE Food  =  "Croissant"
SELECT Flavor FROM goods WHERE Food  =  "Croissant"
SELECT DISTINCT T1.Item FROM items AS T1 JOIN receipts AS T2 ON T1.Receipt  =  T2.ReceiptNumber WHERE T2.CustomerId  =  15
SELECT DISTINCT T1.Item FROM items AS T1 JOIN receipts AS T2 ON T1.Receipt  =  T2.ReceiptNumber WHERE T2.CustomerId  =  15
SELECT Food ,  avg(Price) ,  max(Price) ,  min(Price) FROM goods GROUP BY Food
SELECT Food ,  avg(Price) ,  min(Price) ,  max(Price) FROM goods GROUP BY Food
SELECT T2.ReceiptNumber FROM items AS T1 JOIN receipts AS T2 ON T1.Receipt  =  T2.ReceiptNumber JOIN goods AS T3 ON T1.Item  =  T3.Id WHERE T3.Flavor  =  'Cake' INTERSECT SELECT T2.ReceiptNumber FROM items AS T1 JOIN receipts AS T2 ON T1.Receipt  =  T2.ReceiptNumber JOIN goods AS T3 ON T1.Item  =  T3.Id WHERE T3.Flavor  =  'Cookie'
SELECT T1.Receiptnumber FROM receipts AS T1 JOIN items AS T2 ON T1.Receiptnumber  =  T2.Receipt WHERE T2.Item  =  'Cakes' INTERSECT SELECT T1.Receiptnumber FROM receipts AS T1 JOIN items AS T2 ON T1.Receiptnumber  =  T2.Receipt WHERE T2.Item  =  'Cookies'
SELECT T3.ReceiptNumber FROM customers AS T1 JOIN receipts AS T2 ON T1.CustomerId  =  T2.CustomerId JOIN items AS T3 ON T2.ReceiptNumber  =  T3.Receipt WHERE T1.LastName  =  "LOGAN" AND T3.Item  =  "Croissant"
SELECT T3.ReceiptNumber FROM customers AS T1 JOIN receipts AS T2 ON T1.CustomerId  =  T2.CustomerId JOIN items AS T3 ON T2.ReceiptNumber  =  T3.Receipt WHERE T1.LastName  =  "Logan" AND T3.Item  =  (SELECT T4.Id FROM goods AS T4 WHERE T4.Food  =  "croissant")
SELECT T2.ReceiptNumber ,  T2.Date FROM items AS T1 JOIN receipts AS T2 ON T1.Receipt  =  T2.ReceiptNumber JOIN goods AS T3 ON T1.Item  =  T3.Id WHERE T3.Price  =  (SELECT max(Price) FROM goods)
SELECT T1.Receiptnumber ,  T1.Date FROM receipts AS T1 JOIN items AS T2 ON T1.ReceiptNumber  =  T2.Receipt WHERE T2.Item  =  (SELECT T3.Id FROM goods AS T3 ORDER BY T3.Price DESC LIMIT 1) ORDER BY T1.Date DESC LIMIT 1
SELECT T2.Food FROM items AS T1 JOIN goods AS T2 ON T1.Item  =  T2.Id GROUP BY T1.Item ORDER BY count(*) ASC LIMIT 1
SELECT T2.Item FROM items AS T1 JOIN goods AS T2 ON T1.Item  =  T2.Id GROUP BY T1.Item ORDER BY count(*) ASC LIMIT 1
SELECT count(*) ,  Food FROM goods GROUP BY Food
SELECT count(*) ,  Food FROM goods GROUP BY Food
SELECT Food ,  avg(Price) FROM goods GROUP BY Food
SELECT Food ,  avg(Price) FROM goods GROUP BY Food
SELECT id FROM goods WHERE flavor  =  'Apricot' AND price  <  5
SELECT id FROM goods WHERE flavor  =  "Apricot" AND price  <  5
SELECT Flavor FROM goods WHERE Price  >  10
SELECT Flavor FROM goods WHERE Price  >  10
SELECT DISTINCT id ,  price FROM goods WHERE price  <  (SELECT avg(price) FROM goods)
SELECT DISTINCT id ,  price FROM goods WHERE price  <  (SELECT avg(price) FROM goods)
SELECT DISTINCT id FROM goods WHERE price  <  (SELECT max(price) FROM goods WHERE food  =  'Tart')
SELECT DISTINCT id FROM goods WHERE price  <  (SELECT min(price) FROM goods WHERE food  =  'Tart')
SELECT DISTINCT T3.ReceiptNumber FROM goods AS T1 JOIN items AS T2 ON T1.Id  =  T2.Item JOIN receipts AS T3 ON T3.CustomerId  =  T3.CustomerId WHERE T1.Price  >  13
SELECT DISTINCT T3.ReceiptNumber FROM goods AS T1 JOIN items AS T2 ON T1.Id  =  T2.Item JOIN receipts AS T3 ON T3.CustomerId  =  T3.CustomerId WHERE T1.Price  >  13
SELECT T2.Date FROM items AS T1 JOIN receipts AS T2 ON T1.Receipt  =  T2.ReceiptNumber JOIN goods AS T3 ON T1.Item  =  T3.Id WHERE T3.Price  >  15
SELECT T3.Date FROM goods AS T1 JOIN items AS T2 ON T1.Id  =  T2.Item JOIN receipts AS T3 ON T3.ReceiptNumber  =  T2.Receipt WHERE T1.Price  >  15
SELECT id FROM goods WHERE id LIKE "%APP%"
SELECT id FROM goods WHERE id LIKE "%APP%"
SELECT Price FROM goods WHERE id  =  "70"
SELECT id ,  price FROM goods WHERE id LIKE "%70%"
SELECT LastName FROM customers ORDER BY LastName
SELECT LastName FROM customers ORDER BY LastName ASC
SELECT Id FROM goods ORDER BY Id ASC
SELECT DISTINCT id FROM goods ORDER BY id
SELECT T1.ReceiptNumber FROM receipts AS T1 JOIN items AS T2 ON T1.ReceiptNumber  =  T2.Receipt WHERE T2.Item  =  (SELECT Id FROM goods WHERE Flavor  =  "apple" AND Food  =  "pie") UNION SELECT ReceiptNumber FROM receipts WHERE CustomerId  =  12
SELECT T3.ReceiptNumber FROM goods AS T1 JOIN items AS T2 ON T1.id  =  T2.item JOIN receipts AS T3 ON T3.CustomerId  =  T1.id WHERE T1.flavor  =  'apple' AND T1.food  =  'pie' UNION SELECT ReceiptNumber FROM receipts AS T3 WHERE T3.CustomerId  =  12
SELECT Date ,  max(Date) FROM receipts GROUP BY Date UNION SELECT Date FROM receipts WHERE Date  =  (SELECT max(Date) FROM receipts)
SELECT ReceiptNumber ,  Date FROM receipts ORDER BY Date DESC LIMIT 1
SELECT T2.ReceiptNumber FROM items AS T1 JOIN goods AS T3 ON T1.Item  =  T3.Id JOIN receipts AS T2 ON T2.CustomerId  =  T2.CustomerId WHERE T3.Price  >  10 UNION SELECT T2.ReceiptNumber FROM receipts AS T2 JOIN items AS T1 ON T2.ReceiptNumber  =  T1.Receipt ORDER BY T2.Date ASC LIMIT 1
SELECT T1.ReceiptNumber FROM receipts AS T1 JOIN items AS T2 ON T1.ReceiptNumber  =  T2.Receipt UNION SELECT T1.ReceiptNumber FROM receipts AS T1 JOIN goods AS T2 ON T2.Id  =  T1.Item WHERE T2.Price  >  10 ORDER BY T1.Date ASC
SELECT id FROM goods WHERE price BETWEEN 3 AND 7 AND food IN ("cookie" ,  "cake")
SELECT Id FROM goods WHERE Food  =  'Cookie' OR Food  =  'Cake' AND Price BETWEEN 3 AND 7
SELECT T2.FirstName , T2.LastName FROM receipts AS T1 JOIN customers AS T2 ON T1.CustomerId  =  T2.Id ORDER BY T1.Date LIMIT 1
SELECT T2.FirstName , T2.LastName FROM receipts AS T1 JOIN customers AS T2 ON T1.CustomerId  =  T2.Id ORDER BY T1.Date LIMIT 1
SELECT avg(Price) FROM goods WHERE Flavor  =  "Blackberry" OR Flavor  =  "Blueberry"
SELECT avg(Price) FROM goods WHERE Flavor  =  "Blackberry" OR Flavor  =  "Blueberry"
SELECT min(Price) FROM goods WHERE Flavor  =  "Cheese"
SELECT min(price) ,  flavor FROM goods WHERE flavor  =  'cheese'
SELECT max(price) ,  min(price) ,  avg(price) FROM goods GROUP BY Flavor ORDER BY avg(price) DESC
SELECT max(T1.price) ,  min(T1.price) ,  avg(T1.price) ,  T1.flavor FROM goods AS T1 GROUP BY T1.flavor ORDER BY T1.flavor
SELECT min(price) ,  max(price) ,  food FROM goods GROUP BY food ORDER BY food
SELECT min(Price) ,  max(Price) ,  Food FROM goods ORDER BY Food
SELECT Date FROM receipts GROUP BY Date ORDER BY count(*) DESC LIMIT 3
SELECT Date FROM receipts GROUP BY Date ORDER BY count(*) DESC LIMIT 3
SELECT T2.LastName ,  T2.FirstName ,  COUNT(*) FROM receipts AS T1 JOIN customers AS T2 ON T1.CustomerId  =  T2.Id GROUP BY T2.LastName ,  T2.FirstName ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.CustomerId ,  COUNT(*) FROM items AS T1 JOIN receipts AS T2 ON T1.Receipt  =  T2.ReceiptNumber GROUP BY T2.CustomerId ORDER BY COUNT(*) DESC LIMIT 1
SELECT count(DISTINCT T1.customerid) ,  T1.date FROM receipts AS T1 JOIN items AS T2 ON T1.ReceiptNumber  =  T2.Receipt GROUP BY T1.Date
SELECT T2.Date ,  COUNT(*) FROM items AS T1 JOIN receipts AS T2 ON T1.Receipt  =  T2.ReceiptNumber GROUP BY T2.Date
SELECT T3.FirstName ,  T3.LastName FROM items AS T1 JOIN goods AS T2 ON T1.Item  =  T2.Id JOIN customers AS T3 ON T3.Id  =  T4.CustomerId WHERE T2.Flavor  =  "Apple" AND T2.Food  =  "Tart"
SELECT T3.FirstName ,  T3.LastName FROM items AS T1 JOIN receipts AS T2 ON T1.Receipt  =  T2.ReceiptNumber JOIN customers AS T3 ON T2.CustomerId  =  T3.Id JOIN goods AS T4 ON T1.Item  =  T4.Id WHERE T4.Flavor  =  "apple" AND T4.Food  =  "Tarts"
SELECT id FROM goods WHERE food  =  'Cookie' AND price  <  (SELECT min(price) FROM goods WHERE food  =  'Croissant')
SELECT id FROM goods WHERE price  <  (SELECT min(price) FROM goods WHERE food  =  'croissant')
SELECT id FROM goods WHERE price  >=  (SELECT avg(price) FROM goods WHERE food  =  'Tart') AND food  =  'Cake'
SELECT id FROM goods WHERE price  >=  (SELECT avg(price) FROM goods WHERE food  =  'Tart') AND food  =  'Cake'
SELECT id FROM goods WHERE price  >  (SELECT avg(price) FROM goods)
SELECT Id FROM goods WHERE Price  >  (SELECT avg(Price) FROM goods)
SELECT id ,  flavor ,  food FROM goods ORDER BY price
SELECT id ,  flavor ,  food FROM goods ORDER BY price
SELECT id ,  flavor FROM goods WHERE food  =  'cake' ORDER BY flavor
SELECT id ,  flavor FROM goods WHERE food  =  'cake' ORDER BY flavor
SELECT T2.Item FROM items AS T1 JOIN goods AS T2 ON T1.Item  =  T2.Id WHERE T2.Flavor  =  'Chocolate' GROUP BY T2.Id HAVING count(*)  <=  10
SELECT T2.Item FROM items AS T1 JOIN goods AS T2 ON T1.Item  =  T2.Id JOIN receipts AS T3 ON T3.CustomerId  =  T3.CustomerId GROUP BY T2.Item HAVING count(*)  <=  10 INTERSECT SELECT T2.Item FROM items AS T1 JOIN goods AS T2 ON T1.Item  =  T2.Id JOIN receipts AS T3 ON T3.CustomerId  =  T3.CustomerId WHERE T2.Flavor  =  "Chocolate"
SELECT Flavor FROM goods WHERE Food  =  'Cake' EXCEPT SELECT Flavor FROM goods WHERE Food  =  'Tart'
SELECT Flavor FROM goods WHERE Food  =  'Cake' EXCEPT SELECT Flavor FROM goods WHERE Food  =  'Tart'
SELECT Flavor FROM goods ORDER BY Price DESC LIMIT 3
SELECT T2.Food FROM items AS T1 JOIN goods AS T2 ON T1.Item  =  T2.Id JOIN receipts AS T3 ON T2.Id  =  T3.CustomerId GROUP BY T2.Food ORDER BY count(*) DESC LIMIT 3
SELECT T2.CustomerId FROM receipts AS T1 JOIN customers AS T2 ON T1.CustomerId  =  T2.Id GROUP BY T2.CustomerId HAVING sum(T1.Date)  >  150
SELECT T2.CustomerId FROM items AS T1 JOIN receipts AS T2 ON T1.Receipt  =  T2.ReceiptNumber JOIN goods AS T3 ON T1.Item  =  T3.Id GROUP BY T2.CustomerId HAVING sum(T3.Price)  >  150
SELECT T2.customerid ,  avg(T2.price) FROM goods AS T1 JOIN receipts AS T2 ON T1.id  =  T2.item GROUP BY T2.customerid HAVING avg(T2.price)  >  5
SELECT T1.id FROM customers AS T1 JOIN receipts AS T2 ON T1.customerid  =  T2.customerid JOIN items AS T3 ON T2.receiptnumber  =  T3.receipt WHERE T3.item  =  (SELECT T4.id FROM goods AS T4 JOIN receipts AS T5 ON T5.customerid  =  T4.customerid JOIN items AS T6 ON T5.receiptnumber  =  T6.receipt WHERE T6.item  =  T4.id GROUP BY T6.item HAVING avg(T4.price)  >  5)
SELECT Date FROM receipts WHERE ReceiptNumber IN (SELECT T1.ReceiptNumber FROM items AS T1 JOIN goods AS T2 ON T1.Item  =  T2.Id GROUP BY T1.ReceiptNumber HAVING SUM(T2.Price)  >  100)
SELECT Date FROM receipts WHERE ReceiptNumber IN (SELECT T1.ReceiptNumber FROM items AS T1 JOIN goods AS T2 ON T1.Item  =  T2.Id GROUP BY T1.ReceiptNumber HAVING sum(T2.Price)  >  100)
SELECT count(*) FROM driver
SELECT count(*) FROM driver
SELECT count(*) ,  make FROM driver WHERE points  >  150 GROUP BY make
SELECT make ,  count(*) FROM driver WHERE points  >  150 GROUP BY make
SELECT avg(Age) ,  Make FROM driver GROUP BY Make
SELECT avg(Age) ,  Make FROM driver GROUP BY Make
SELECT avg(Laps) FROM driver WHERE Age  <  20
SELECT avg(Laps) FROM driver WHERE Age  <  20
SELECT Manager ,  Sponsor FROM team ORDER BY Car_Owner
SELECT manager ,  sponsor FROM team ORDER BY car_owner
SELECT Make FROM team GROUP BY Make HAVING count(*)  >  1
SELECT Make FROM team GROUP BY Make HAVING count(*)  >  1
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
SELECT Driver ,  Country FROM driver
SELECT Driver ,  Country FROM driver
SELECT max(T2.Points) FROM country AS T1 JOIN driver AS T2 ON T1.Country  =  T2.Country WHERE T1.Capital  =  "Dublin"
SELECT max(T1.Points) FROM driver AS T1 JOIN country AS T2 ON T1.Country  =  T2.Country WHERE T2.Capital  =  "Dublin"
SELECT avg(T1.Age) FROM driver AS T1 JOIN country AS T2 ON T1.Country  =  T2.Country WHERE T2.Official_native_language  =  "English"
SELECT avg(T2.Age) FROM country AS T1 JOIN driver AS T2 ON T1.Country = T2.Country WHERE T1.Official_native_language  =  "English"
SELECT T1.Country FROM country AS T1 JOIN driver AS T2 ON T1.Country  =  T2.Country WHERE T2.Points  >  150
SELECT T1.Country FROM country AS T1 JOIN driver AS T2 ON T1.Country  =  T2.Country WHERE T2.Points  >  150
SELECT T2.Capital FROM driver AS T1 JOIN country AS T2 ON T1.Country  =  T2.Country_id ORDER BY T1.Points DESC LIMIT 1
SELECT T1.Capital FROM country AS T1 JOIN driver AS T2 ON T1.Country  =  T2.Country ORDER BY T2.Points DESC LIMIT 1
SELECT Make ,  count(*) FROM driver GROUP BY Make
SELECT Make ,  count(*) FROM driver GROUP BY Make
SELECT Make FROM driver GROUP BY Make ORDER BY COUNT(*) DESC LIMIT 1
SELECT Make FROM driver GROUP BY Make ORDER BY count(*) DESC LIMIT 1
SELECT Make FROM driver GROUP BY Make HAVING count(*)  >=  3
SELECT Make FROM driver GROUP BY Make HAVING count(*)  >=  3
SELECT Team FROM team WHERE Team_ID NOT IN (SELECT Team_ID FROM team_driver)
SELECT Team FROM team WHERE Team_ID NOT IN (SELECT Team_ID FROM team_driver)
SELECT T1.country FROM driver AS T1 JOIN driver AS T2 ON T1.country  =  T2.country WHERE T1.make  =  "Dodge" INTERSECT SELECT T1.country FROM driver AS T1 JOIN driver AS T2 ON T1.country  =  T2.country WHERE T1.make  =  "Chevrolet"
SELECT country FROM driver WHERE make  =  'Dodge' INTERSECT SELECT country FROM driver WHERE make  =  'Chevrolet'
SELECT sum(Points) ,  avg(Points) FROM driver
SELECT sum(Points) ,  avg(Points) FROM driver
SELECT Country FROM country WHERE Country NOT IN (SELECT Country FROM driver)
SELECT Country FROM country WHERE Country_id NOT IN (SELECT Country_id FROM driver)
SELECT T1.Manager ,  T1.Sponsor FROM team AS T1 JOIN team_driver AS T2 ON T1.Team_ID  =  T2.Team_ID GROUP BY T1.Team_ID ORDER BY count(*) DESC LIMIT 1
SELECT T1.manager ,  T1.sponsor FROM team AS T1 JOIN team_driver AS T2 ON T1.team_id  =  T2.team_id GROUP BY T1.team_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.Manager ,  T1.Car_owner FROM team AS T1 JOIN team_driver AS T2 ON T1.Team_ID  =  T2.Team_ID GROUP BY T1.Team_ID HAVING count(*)  >=  2
SELECT T1.Manager ,  T1.car_owner FROM team AS T1 JOIN team_driver AS T2 ON T1.team_id  =  T2.team_id GROUP BY T1.team_id HAVING count(*)  >=  2
SELECT count(*) FROM institution
SELECT count(*) FROM institution
SELECT name FROM institution ORDER BY name ASC
SELECT name FROM institution ORDER BY name
SELECT name FROM institution ORDER BY Founded
SELECT name FROM institution ORDER BY Founded
SELECT city ,  province FROM institution
SELECT city ,  province FROM institution
SELECT max(Enrollment) ,  min(Enrollment) FROM institution
SELECT max(Enrollment) ,  min(Enrollment) FROM institution
SELECT Affiliation FROM institution WHERE City != "Vancouver"
SELECT Affiliation FROM institution WHERE City != 'Vancouver'
SELECT Stadium FROM institution ORDER BY Capacity DESC
SELECT Stadium FROM institution ORDER BY Capacity DESC
SELECT Stadium FROM institution ORDER BY Enrollment DESC LIMIT 1
SELECT Stadium FROM institution ORDER BY Enrollment DESC LIMIT 1
SELECT T1.name ,  T2.nickname FROM institution AS T1 JOIN championship AS T2 ON T1.institution_id  =  T2.institution_id
SELECT T2.name ,  T1.Nickname FROM Championship AS T1 JOIN institution AS T2 ON T1.institution_ID  =  T2.institution_ID
SELECT T1.Nickname FROM championship AS T1 JOIN institution AS T2 ON T1.Institution_ID  =  T2.Institution_ID ORDER BY T2.Enrollment LIMIT 1
SELECT T2.Nickname FROM institution AS T1 JOIN Championship AS T2 ON T1.Institution_ID  =  T2.Institution_ID ORDER BY T1.Enrollment LIMIT 1
SELECT T2.name FROM championship AS T1 JOIN institution AS T2 ON T1.institution_id  =  T2.institution_id ORDER BY T1.number_of_championships DESC
SELECT T2.Name FROM Championship AS T1 JOIN institution AS T2 ON T1.Institution_ID  =  T2.Institution_ID ORDER BY T1.Number_of_Championships DESC
SELECT T2.name FROM championship AS T1 JOIN institution AS T2 ON T1.institution_id  =  T2.institution_id GROUP BY T1.institution_id HAVING count(*)  >=  1
SELECT T2.name FROM championship AS T1 JOIN institution AS T2 ON T1.institution_id  =  T2.institution_id GROUP BY T1.institution_id HAVING count(*)  >=  1
SELECT sum(T2.Number_of_Championships) FROM institution AS T1 JOIN Championship AS T2 ON T1.Institution_ID  =  T2.Institution_ID WHERE T1.Affiliation  =  'Public'
SELECT sum(T2.Number_of_Championships) FROM institution AS T1 JOIN Championship AS T2 ON T1.Institution_ID  =  T2.Institution_ID WHERE T1.Affiliation  =  'Public'
SELECT affiliation ,  count(*) FROM institution GROUP BY affiliation
SELECT count(*) ,  affiliation FROM institution GROUP BY affiliation
SELECT affiliation FROM institution GROUP BY affiliation ORDER BY count(*) DESC LIMIT 1
SELECT affiliation FROM institution GROUP BY affiliation ORDER BY count(*) DESC LIMIT 1
SELECT founded FROM institution GROUP BY founded HAVING count(*)  >  1
SELECT count(*) ,  YEAR FROM institution GROUP BY YEAR HAVING count(*)  >  1
SELECT T2.Nickname FROM institution AS T1 JOIN championship AS T2 ON T1.Institution_ID  =  T2.Institution_ID ORDER BY T1.Capacity DESC
SELECT Nickname FROM Championship ORDER BY T1.capacity DESC
SELECT sum(enrollment) FROM institution WHERE city  =  "Vancouver" OR city  =  "Calgary"
SELECT Enrollment FROM institution WHERE City  =  "Vancouver" OR City  =  "Calgary"
SELECT Province FROM institution WHERE Founded  <  1920 INTERSECT SELECT Province FROM institution WHERE Founded  >  1950
SELECT province FROM institution WHERE founded  >  1950 INTERSECT SELECT province FROM institution WHERE founded  <  1920
SELECT count(DISTINCT province) FROM institution
SELECT count(DISTINCT province) FROM institution
SELECT * FROM Warehouses
SELECT * FROM Warehouses
SELECT DISTINCT T1.Contents FROM Boxes AS T1 JOIN Warehouses AS T2 ON T1.Warehouse  =  T2.Code WHERE T2.Location  =  'New York'
SELECT DISTINCT T2.Contents FROM Warehouses AS T1 JOIN Boxes AS T2 ON T1.Code  =  T2.Warehouse WHERE T1.Location  =  'New York'
SELECT contents FROM boxes WHERE value  >  150
SELECT Contents FROM Boxes WHERE Value  >  150
SELECT T2.warehouse ,  avg(T2.value) FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code GROUP BY T2.code
SELECT avg(Value) ,  Warehouse FROM Boxes GROUP BY Warehouse
SELECT avg(value) ,  sum(value) FROM boxes
SELECT avg(value) ,  sum(value) FROM boxes
SELECT avg(capacity) ,  sum(capacity) FROM Warehouses
SELECT avg(capacity) ,  sum(capacity) FROM warehouses
SELECT avg(value) ,  max(value) ,  contents FROM BOXES GROUP BY contents
SELECT avg(value) ,  max(value) ,  contents FROM BOXES GROUP BY contents
SELECT Contents FROM Boxes GROUP BY Contents ORDER BY sum(Value) DESC LIMIT 1
SELECT Contents FROM Boxes ORDER BY Value DESC LIMIT 1
SELECT avg(Value) FROM Boxes
SELECT avg(value) FROM boxes
SELECT DISTINCT Contents FROM Boxes
SELECT DISTINCT Contents FROM Boxes
SELECT count(DISTINCT Contents) FROM Boxes
SELECT count(DISTINCT Contents) FROM Boxes
SELECT DISTINCT LOCATION FROM Warehouses
SELECT DISTINCT LOCATION FROM Warehouses
SELECT T1.code FROM boxes AS T1 JOIN warehouses AS T2 ON T1.Warehouse  =  T2.code WHERE T2.location  =  'Chicago' OR T2.location  =  'New York'
SELECT T1.code FROM boxes AS T1 JOIN warehouses AS T2 ON T1.Warehouse  =  T2.code WHERE T2.location  =  'Chicago' OR T2.location  =  'New York'
SELECT sum(T2.Value) FROM Warehouses AS T1 JOIN Boxes AS T2 ON T1.Code  =  T2.Warehouse WHERE T1.Location  =  'Chicago' OR T1.Location  =  'New York'
SELECT sum(t2.value) FROM warehouses AS t1 JOIN boxes AS t2 ON t1.code  =  t2.warehouse WHERE t1.location  =  'Chicago' OR t1.location  =  'New York'
SELECT T1.Contents FROM Boxes AS T1 JOIN Warehouses AS T2 ON T1.Warehouse  =  T2.Code WHERE T2.Location  =  'Chicago' INTERSECT SELECT T1.Contents FROM Boxes AS T1 JOIN Warehouses AS T2 ON T1.Warehouse  =  T2.Code WHERE T2.Location  =  'New York'
SELECT T1.Contents FROM Boxes AS T1 JOIN Warehouses AS T2 ON T1.Warehouse  =  T2.Code WHERE T2.Location  =  'Chicago' INTERSECT SELECT T1.Contents FROM Boxes AS T1 JOIN Warehouses AS T2 ON T1.Warehouse  =  T2.Code WHERE T2.Location  =  'New York'
SELECT T1.Contents FROM BOXES AS T1 JOIN WAREHOUSES AS T2 ON T1.Warehouse  =  T2.Code WHERE T2.Location !=  'New York'
SELECT Contents FROM BOXES EXCEPT SELECT T1.Contents FROM BOXES AS T1 JOIN WAREHOUSES AS T2 ON T1.Warehouse  =  T2.Code WHERE T2.Location  =  'New York'
SELECT T1.location FROM Warehouses AS T1 JOIN Boxes AS T2 ON T1.code  =  T2.Warehouse WHERE T2.Contents  =  'Rocks' EXCEPT SELECT T1.location FROM Warehouses AS T1 JOIN Boxes AS T2 ON T1.code  =  T2.Warehouse WHERE T2.Contents  =  'Scissors'
SELECT T2.Location FROM Boxes AS T1 JOIN Warehouses AS T2 ON T1.Warehouse  =  T2.Code WHERE T1.Contents  =  'Rocks' EXCEPT SELECT T2.Location FROM Boxes AS T1 JOIN Warehouses AS T2 ON T1.Warehouse  =  T2.Code WHERE T1.Contents  =  'Scissors'
SELECT DISTINCT T1.location FROM warehouses AS T1 JOIN boxes AS T2 ON T1.code  =  T2.warehouse WHERE T2.contents  =  'Rocks' OR T2.contents  =  'Scissors'
SELECT DISTINCT T1.location FROM warehouses AS T1 JOIN boxes AS T2 ON T1.code  =  T2.warehouse WHERE T2.contents  =  'Rocks' OR T2.contents  =  'Scissors'
SELECT T2.Location FROM Boxes AS T1 JOIN Warehouses AS T2 ON T1.Warehouse  =  T2.Code WHERE T1.Contents  =  'Rocks' INTERSECT SELECT T2.Location FROM Boxes AS T1 JOIN Warehouses AS T2 ON T1.Warehouse  =  T2.Code WHERE T1.Contents  =  'Scissors'
SELECT T1.location FROM warehouses AS T1 JOIN boxes AS T2 ON T1.code  =  T2.warehouse WHERE T2.contents  =  'Rocks' INTERSECT SELECT T1.location FROM warehouses AS T1 JOIN boxes AS T2 ON T1.code  =  T2.warehouse WHERE T2.contents  =  'Scissors'
SELECT code ,  contents FROM boxes ORDER BY Value
SELECT code ,  contents FROM Boxes ORDER BY Value
SELECT code ,  contents FROM boxes ORDER BY value LIMIT 1
SELECT code ,  contents FROM Boxes ORDER BY value LIMIT 1
SELECT DISTINCT Contents FROM Boxes WHERE Value  >  (SELECT avg(Value) FROM Boxes)
SELECT Contents FROM Boxes WHERE Value  >  (SELECT avg(Value) FROM Boxes)
SELECT DISTINCT Contents FROM Boxes ORDER BY Contents
SELECT DISTINCT Contents FROM Boxes ORDER BY Contents
SELECT code FROM boxes WHERE value  >  (SELECT max(value) FROM boxes WHERE contents  =  'Rocks')
SELECT code FROM boxes WHERE value  >  (SELECT max(value) FROM boxes WHERE contents  =  'Rocks')
SELECT code ,  contents FROM boxes WHERE value  >  (SELECT max(value) FROM boxes WHERE contents  =  'Scissors')
SELECT code ,  contents FROM boxes WHERE value  >  (SELECT max(value) FROM boxes WHERE contents  =  'Scissors')
SELECT sum(T2.value) FROM warehouses AS T1 JOIN boxes AS T2 ON T1.code  =  T2.warehouse WHERE T1.capacity  =  (SELECT max(capacity) FROM warehouses)
SELECT sum(T2.value) FROM warehouses AS T1 JOIN boxes AS T2 ON T1.code  =  T2.warehouse WHERE T1.capacity  =  (SELECT max(capacity) FROM warehouses)
SELECT T2.warehouse ,  avg(T2.value) FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code GROUP BY T2.code HAVING avg(T2.value)  >  150
SELECT avg(Value) ,  Warehouse FROM BOXES GROUP BY Warehouse HAVING avg(Value)  >  150
SELECT Contents ,  sum(Value) ,  count(*) FROM BOXES GROUP BY Contents
SELECT Contents ,  sum(Value) ,  count(*) FROM BOXES GROUP BY Contents
SELECT sum(capacity) ,  avg(capacity) ,  max(capacity) ,  LOCATION FROM Warehouses GROUP BY LOCATION
SELECT LOCATION ,  sum(capacity) ,  avg(capacity) ,  max(capacity) FROM warehouses GROUP BY LOCATION
SELECT sum(capacity) FROM warehouses
SELECT sum(capacity) FROM Warehouses
SELECT max(T2.Value) ,  T1.Location FROM Warehouses AS T1 JOIN Boxes AS T2 ON T1.Code  =  T2.Warehouse GROUP BY T1.Location
SELECT max(T1.Value) ,  T2.Location FROM BOXES AS T1 JOIN WAREHOUSES AS T2 ON T1.Warehouse  =  T2.Code GROUP BY T2.Location
SELECT T2.code ,  count(*) FROM boxes AS T1 JOIN warehouses AS T2 ON T1.Warehouse  =  T2.code GROUP BY T2.code
SELECT count(*) ,  T1.code FROM warehouses AS T1 JOIN boxes AS T2 ON T1.code  =  T2.warehouse GROUP BY T1.code
SELECT count(DISTINCT T1.location) FROM warehouses AS T1 JOIN boxes AS T2 ON T1.code  =  T2.warehouse WHERE T2.contents  =  'Rocks'
SELECT count(DISTINCT T1.warehouse) FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T1.contents  =  'Rocks'
SELECT T2.code ,  T1.location FROM Warehouses AS T1 JOIN Boxes AS T2 ON T1.code  =  T2.Warehouse
SELECT T2.code ,  T1.location FROM Warehouses AS T1 JOIN Boxes AS T2 ON T1.code  =  T2.Warehouse
SELECT T2.code FROM warehouses AS T1 JOIN boxes AS T2 ON T1.code  =  T2.warehouse WHERE T1.location  =  'Chicago'
SELECT T2.code FROM warehouses AS T1 JOIN boxes AS T2 ON T1.code  =  T2.warehouse WHERE T1.location  =  'Chicago'
SELECT count(*) ,  T1.code FROM warehouses AS T1 JOIN boxes AS T2 ON T1.code  =  T2.warehouse GROUP BY T1.code
SELECT count(*) ,  T2.location FROM boxes AS T1 JOIN warehouses AS T2 ON T1.Warehouse  =  T2.Code GROUP BY T2.code
SELECT count(DISTINCT Contents) ,  LOCATION FROM Warehouses AS T1 JOIN Boxes AS T2 ON T1.Code  =  T2.Warehouse GROUP BY T1.Location
SELECT count(DISTINCT Contents) ,  LOCATION FROM warehouses AS T1 JOIN boxes AS T2 ON T1.Code  =  T2.Warehouse GROUP BY T1.Location
SELECT code FROM warehouses WHERE capacity  <  (SELECT sum(value) FROM boxes WHERE warehouse  =  (SELECT code FROM warehouses WHERE capacity  <  (SELECT sum(value) FROM boxes WHERE warehouse  =  (SELECT code FROM warehouses WHERE capacity  <  (SELECT sum(value) FROM boxes WHERE warehouse  =  (SELECT code FROM warehouses WHERE capacity  <  (SELECT sum(value) FROM boxes WHERE warehouse  =  (SELECT code FROM warehouses WHERE capacity  <  (SELECT sum(value) FROM boxes WHERE warehouse  =  (SELECT code FROM warehouses WHERE capacity  <  (SELECT sum(value) FROM boxes WHERE warehouse  =  (SELECT code FROM warehouses WHERE capacity  <  (SELECT sum(value) FROM boxes WHERE warehouse  =  (SELECT code FROM warehouses WHERE capacity  <  (SELECT sum(value) FROM boxes WHERE warehouse  =  (SELECT code FROM warehouses WHERE capacity  <  (SELECT sum(value) FROM boxes WHERE warehouse  =  (SELECT code FROM warehouses WHERE capacity  <  (SELECT sum(value) FROM boxes WHERE warehouse  =  (SELECT code FROM warehouses WHERE capacity  <  (SELECT sum(value) FROM boxes))
SELECT T1.code FROM warehouses AS T1 JOIN boxes AS T2 ON T1.code  =  T2.warehouse WHERE T2.value  >  T1.capacity
SELECT sum(value) FROM boxes WHERE warehouse NOT IN (SELECT code FROM warehouses WHERE LOCATION  =  'Chicago')
SELECT sum(T2.value) FROM warehouses AS T1 JOIN boxes AS T2 ON T1.code  =  T2.warehouse WHERE T1.location !=  'Chicago'
SELECT University_Name ,  City ,  State FROM university ORDER BY University_Name
SELECT University_Name ,  City ,  State FROM university ORDER BY University_Name
SELECT count(*) FROM university WHERE state  =  "Illinois" OR state  =  "Ohio"
SELECT count(*) FROM university WHERE state  =  "Illinois" OR state  =  "Ohio"
SELECT max(Enrollment) ,  avg(Enrollment) ,  min(Enrollment) FROM university
SELECT max(Enrollment) ,  avg(Enrollment) ,  min(Enrollment) FROM university
SELECT team_name FROM university WHERE enrollment  >  (SELECT avg(enrollment) FROM university)
SELECT team_name FROM university WHERE enrollment  >  (SELECT avg(enrollment) FROM university)
SELECT DISTINCT Home_Conference FROM university
SELECT DISTINCT Home_Conference FROM university
SELECT home_conference ,  count(*) FROM university GROUP BY home_conference
SELECT home_conference ,  count(*) FROM university GROUP BY home_conference
SELECT state FROM university GROUP BY state ORDER BY count(*) DESC LIMIT 1
SELECT state FROM university GROUP BY state ORDER BY count(*) DESC LIMIT 1
SELECT Home_Conference FROM university WHERE Enrollment  >  2000 GROUP BY Home_Conference
SELECT Home_Conference FROM university GROUP BY Home_Conference HAVING avg(Enrollment)  >  2000
SELECT Home_Conference FROM university GROUP BY Home_Conference ORDER BY sum(Enrollment) LIMIT 1
SELECT home_conference FROM university GROUP BY home_conference ORDER BY count(*) ASC LIMIT 1
SELECT major_name ,  major_code FROM major ORDER BY major_code
SELECT Major_Name ,  Major_Code FROM major ORDER BY Major_Code
SELECT T3.Major_Name ,  T2.Rank FROM university AS T1 JOIN major_ranking AS T2 ON T1.University_ID  =  T2.University_ID JOIN major AS T3 ON T2.Major_ID  =  T3.Major_ID WHERE T1.University_Name  =  "Augustana College"
SELECT T2.major_name ,  T1.major_id FROM major_ranking AS T1 JOIN major AS T2 ON T1.major_id  =  T2.major_id JOIN university AS T3 ON T1.university_id  =  T3.university_id WHERE T3.university_name  =  "Augustana College"
SELECT T3.University_Name ,  T3.City ,  T3.State FROM major_ranking AS T1 JOIN major AS T2 ON T1.Major_ID  =  T2.Major_ID JOIN university AS T3 ON T1.University_ID  =  T3.University_ID WHERE T2.Major_Name  =  "Accounting" AND T1.Rank  =  1
SELECT T3.University_Name ,  T3.City ,  T3.State FROM major_ranking AS T1 JOIN major AS T2 ON T1.Major_ID  =  T2.Major_ID JOIN university AS T3 ON T1.University_ID  =  T3.University_ID WHERE T2.Major_Name  =  "Accounting" AND T1.Rank  =  1
SELECT T2.University_Name FROM major_ranking AS T1 JOIN university AS T2 ON T1.University_ID  =  T2.University_ID WHERE T1.Rank  =  1 GROUP BY T1.University_ID ORDER BY count(*) DESC LIMIT 1
SELECT T3.university_name FROM major_ranking AS T1 JOIN major AS T2 ON T1.major_id  =  T2.major_id JOIN university AS T3 ON T1.university_id  =  T3.university_id WHERE T1.rank  =  1 GROUP BY T1.university_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.university_name FROM university AS T1 JOIN major_ranking AS T2 ON T1.university_id  =  T2.university_id WHERE T2.rank !=  1
SELECT T1.university_name FROM university AS T1 JOIN major_ranking AS T2 ON T1.university_id  =  T2.university_id WHERE T2.rank !=  1
SELECT T3.university_name FROM major_ranking AS T1 JOIN major AS T2 ON T1.major_id  =  T2.major_id JOIN university AS T3 ON T1.university_id  =  T3.university_id WHERE T2.major_name  =  'Accounting' INTERSECT SELECT T3.university_name FROM major_ranking AS T1 JOIN major AS T2 ON T1.major_id  =  T2.major_id JOIN university AS T3 ON T1.university_id  =  T3.university_id WHERE T2.major_name  =  'Urban Education'
SELECT T3.university_name FROM major_ranking AS T1 JOIN major AS T2 ON T1.major_id  =  T2.major_id JOIN university AS T3 ON T1.university_id  =  T3.university_id WHERE T2.major_name  =  'Accounting' INTERSECT SELECT T3.university_name FROM major_ranking AS T1 JOIN major AS T2 ON T1.major_id  =  T2.major_id JOIN university AS T3 ON T1.university_id  =  T3.university_id WHERE T2.major_name  =  'Urban Education'
SELECT T2.university_name ,  T1.rank FROM overall_ranking AS T1 JOIN university AS T2 ON T1.university_id  =  T2.university_id WHERE T2.state  =  "Wisconsin"
SELECT t2.rank ,  t1.university_name FROM university AS t1 JOIN overall_ranking AS t2 ON t1.university_id  =  t2.university_id WHERE t1.state  =  "Wisconsin"
SELECT T2.University_Name FROM overall_ranking AS T1 JOIN university AS T2 ON T1.University_ID  =  T2.University_ID ORDER BY T1.Research_point DESC LIMIT 1
SELECT T2.University_Name FROM overall_ranking AS T1 JOIN university AS T2 ON T1.University_ID  =  T2.University_ID ORDER BY T1.Research_point DESC LIMIT 1
SELECT T1.University_Name FROM university AS T1 JOIN overall_ranking AS T2 ON T1.University_ID  =  T2.University_ID ORDER BY T2.Reputation_point
SELECT T2.University_Name FROM overall_ranking AS T1 JOIN university AS T2 ON T1.University_ID  =  T2.University_ID ORDER BY T1.Reputation_point
SELECT T3.University_Name FROM major_ranking AS T1 JOIN major AS T2 ON T1.Major_ID  =  T2.Major_ID JOIN university AS T3 ON T1.University_ID  =  T3.University_ID WHERE T2.Major_Name  =  "Accounting" AND T1.Rank  >=  3
SELECT T3.University_Name FROM major_ranking AS T1 JOIN major AS T2 ON T1.Major_ID  =  T2.Major_ID JOIN university AS T3 ON T1.University_ID  =  T3.University_ID WHERE T2.Major_Name  =  "Accounting" AND T1.Rank  >=  3
SELECT sum(T2.Enrollment) FROM university AS T1 JOIN overall_ranking AS T2 ON T1.University_ID  =  T2.University_ID WHERE T2.Rank  <=  5
SELECT sum(T2.Enrollment) FROM university AS T1 JOIN overall_ranking AS T2 ON T1.University_ID  =  T2.University_ID WHERE T2.Rank  <=  5
SELECT T1.university_name ,  T2.Citation_point FROM university AS T1 JOIN overall_ranking AS T2 ON T1.university_id  =  T2.university_id WHERE T2.reputation_point  >=  (SELECT max(reputation_point) FROM overall_ranking ORDER BY reputation_point DESC LIMIT 3)
SELECT T1.university_name ,  T2.citation_point FROM university AS T1 JOIN overall_ranking AS T2 ON T1.university_id  =  T2.university_id ORDER BY T2.reputation_point DESC LIMIT 3
SELECT state FROM university WHERE enrollment  <  3000 GROUP BY state HAVING count(*)  >  2
SELECT state FROM university WHERE enrollment  <  3000 GROUP BY state HAVING count(*)  >  2
SELECT title FROM movies WHERE rating  =  ''
SELECT Title FROM Movies WHERE Rating  =  "null"
SELECT T2.name FROM movies AS T1 JOIN movietheaters AS T2 ON T1.code  =  T2.movie WHERE T1.rating  =  'G'
SELECT title FROM movies WHERE rating  =  'G'
SELECT T2.title FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie  =  T2.Code WHERE T1.Name  =  "Odeon"
SELECT T2.Title FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie  =  T2.Code WHERE T1.Name  =  "Odeon"
SELECT T2.Name ,  T1.Title FROM MovieTheaters AS T1 JOIN MovieTheaters AS T2 ON T1.Code  =  T2.Movie GROUP BY T1.Code
SELECT T2.Name ,  T1.Title FROM Movies AS T1 JOIN MovieTheaters AS T2 ON T1.Code  =  T2.Movie
SELECT count(*) FROM Movies WHERE Rating  =  "G"
SELECT count(*) FROM Movies WHERE Rating  =  'G'
SELECT count(DISTINCT Movie) FROM MovieTheaters
SELECT count(DISTINCT Movie) FROM MovieTheaters
SELECT count(DISTINCT Movie) FROM MovieTheaters
SELECT count(DISTINCT Movie) FROM MovieTheaters
SELECT count(DISTINCT name) FROM MovieTheaters
SELECT count(DISTINCT name) FROM MovieTheaters
SELECT rating FROM movies WHERE title LIKE "%Citizen%"
SELECT T2.Rating FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie  =  T2.Code WHERE T1.Name LIKE '%Citizen%'
SELECT T2.name FROM movies AS T1 JOIN movieTheaters AS T2 ON T1.code  =  T2.movie WHERE T1.rating  =  'G' OR T1.rating  =  'PG'
SELECT T2.name FROM movies AS T1 JOIN movietheaters AS T2 ON T1.code  =  T2.movie WHERE T1.rating  =  'G' OR T1.rating  =  'PG'
SELECT T2.title FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie  =  T2.Code WHERE T1.Name  =  "Odeon" OR T1.Name  =  "Imperial"
SELECT DISTINCT T1.Title FROM Movies AS T1 JOIN MovieTheaters AS T2 ON T1.Code  =  T2.Movie WHERE T2.Name  =  'Odeon' OR T2.Name  =  'Imperial'
SELECT T2.title FROM movietheaters AS T1 JOIN movies AS T2 ON T1.movie  =  T2.code WHERE T1.name  =  'Odeon' INTERSECT SELECT T2.title FROM movietheaters AS T1 JOIN movies AS T2 ON T1.movie  =  T2.code WHERE T1.name  =  'Imperial'
SELECT T1.title FROM movies AS T1 JOIN movietheaters AS T2 ON T1.code  =  T2.movie WHERE T2.name  =  'Odeon' INTERSECT SELECT T1.title FROM movies AS T1 JOIN movietheaters AS T2 ON T1.code  =  T2.movie WHERE T2.name  =  'Imperial'
SELECT T2.title FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie  =  T2.Code WHERE T1.Name !=  'Odeon'
SELECT T2.title FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie  =  T2.Code WHERE T1.Name !=  'Odeon'
SELECT Title FROM Movies ORDER BY Title
SELECT Title FROM Movies ORDER BY Title
SELECT title FROM movies ORDER BY rating
SELECT title FROM movies ORDER BY rating
SELECT T2.name ,  T1.movie FROM movies AS T1 JOIN movietheaters AS T2 ON T1.code  =  T2.movie GROUP BY T1.movie ORDER BY count(*) DESC LIMIT 1
SELECT T2.name FROM movies AS T1 JOIN movietheaters AS T2 ON T1.code  =  T2.movie GROUP BY T2.name ORDER BY count(*) DESC LIMIT 1
SELECT T2.title ,  T1.movie FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie  =  T2.Code GROUP BY T1.Movie ORDER BY count(*) DESC LIMIT 1
SELECT T2.title ,  T1.movie FROM movietheaters AS T1 JOIN movies AS T2 ON T1.movie  =  T2.code GROUP BY T1.movie ORDER BY count(*) DESC LIMIT 1
SELECT count(*) ,  rating FROM movies GROUP BY rating
SELECT count(*) ,  rating FROM movies GROUP BY rating
SELECT count(*) FROM movies WHERE rating IS NOT NULL
SELECT count(*) FROM Movies WHERE Rating != "null"
SELECT DISTINCT name FROM MovieTheaters
SELECT Name FROM MovieTheaters
SELECT Name FROM MovieTheaters WHERE Movie IS NULL
SELECT Name FROM MovieTheaters WHERE Code NOT IN (SELECT Movie FROM MovieTheaters)
SELECT T2.name FROM movies AS T1 JOIN movie_theaters AS T2 ON T1.code  =  T2.movie WHERE T1.rating  =  'G'
SELECT T3.Name FROM Movies AS T1 JOIN MovieTheaters AS T2 ON T1.Code  =  T2.Movie JOIN MovieTheaters AS T3 ON T2.Name  =  T3.Name WHERE T1.Rating  =  "G"
SELECT Title FROM Movies
SELECT DISTINCT title FROM Movies
SELECT DISTINCT Rating FROM Movies
SELECT DISTINCT Rating FROM Movies
SELECT * FROM Movies WHERE Rating  =  "null"
SELECT * FROM Movies WHERE Rating  =  "unrated"
SELECT title FROM movies WHERE code NOT IN (SELECT movie FROM MovieTheaters)
SELECT Title FROM Movies WHERE Code NOT IN (SELECT Movie FROM MovieTheaters)
SELECT T1.name FROM client AS T1 JOIN package AS T2 ON T1.accountnumber  =  T2.recipient ORDER BY T2.weight DESC LIMIT 1
SELECT T2.Name FROM Package AS T1 JOIN Client AS T2 ON T1.Recipient  =  T2.AccountNumber ORDER BY T1.Weight DESC LIMIT 1
SELECT sum(weight) FROM client AS T1 JOIN package AS T2 ON T1.accountnumber  =  T2.sender WHERE T1.name  =  'Leo Wong'
SELECT sum(weight) FROM package WHERE Sender  =  'Leo Wong'
SELECT POSITION FROM Employee WHERE Name  =  "Amy Wong"
SELECT POSITION FROM Employee WHERE Name  =  "Amy Wong"
SELECT Salary ,  POSITION FROM Employee WHERE Name  =  "Turanga Leela"
SELECT salary ,  position FROM Employee WHERE Name  =  "Turanga Leela"
SELECT avg(salary) FROM employee WHERE POSITION  =  'Intern'
SELECT avg(salary) FROM employee WHERE POSITION  =  'Intern'
SELECT LEVEL FROM HAS_CLEARANCE WHERE Employee  =  "Physician"
SELECT LEVEL FROM HAS_CLEARANCE WHERE Employee  =  (SELECT EmployeeID FROM Employee WHERE POSITION  =  "Physician")
SELECT PackageNumber FROM PACKAGE WHERE Sender  =  'Leo Wong'
SELECT count(*) FROM Package WHERE Sender  =  'Leo Wong'
SELECT packageNumber FROM Package AS T1 JOIN Client AS T2 ON T1.Recipient  =  T2.AccountNumber WHERE T2.Name  =  "Leo Wong"
SELECT PackageNumber FROM Package WHERE Recipient  =  (SELECT AccountNumber FROM Client WHERE Name  =  "Leo Wong")
SELECT * FROM Package WHERE Sender  =  'Leo Wong' OR Recipient  =  'Leo Wong'
SELECT DISTINCT PackageNumber FROM PACKAGE WHERE Sender  =  'Leo Wong' OR Recipient  =  'Leo Wong'
SELECT count(*) FROM Package AS T1 JOIN Client AS T2 ON T1.Sender  =  T2.AccountNumber WHERE T2.Name  =  'Ogden Wernstrom' INTERSECT SELECT count(*) FROM Package AS T1 JOIN Client AS T2 ON T1.Recipient  =  T2.AccountNumber WHERE T2.Name  =  'Leo Wong'
SELECT count(*) FROM Package AS T1 JOIN Client AS T2 ON T1.Recipient  =  T2.AccountNumber JOIN Client AS T3 ON T1.Sender  =  T3.AccountNumber WHERE T3.Name  =  'Ogden Wernstrom' AND T2.Name  =  'Leo Wong'
SELECT Contents FROM Package AS T1 JOIN Client AS T2 ON T1.Sender  =  T2.AccountNumber WHERE T2.Name  =  "John Zoidfarb"
SELECT T2.Contents FROM Client AS T1 JOIN Package AS T2 ON T1.AccountNumber  =  T2.Sender WHERE T1.Name  =  "John Zoidfarb"
SELECT T2.packageNumber ,  T2.Weight FROM CLIENT AS T1 JOIN PACKAGE AS T2 ON T1.AccountNumber  =  T2.Recipient WHERE T1.Name LIKE '%John%' ORDER BY T2.Weight DESC LIMIT 1
SELECT PackageNumber ,  Weight FROM Package AS T1 JOIN Client AS T2 ON T1.Sender  =  T2.AccountNumber WHERE T2.Name LIKE 'John%' ORDER BY T1.Weight DESC LIMIT 1
SELECT PackageNumber ,  Weight FROM Package ORDER BY Weight ASC LIMIT 3
SELECT PackageNumber ,  Weight FROM Package ORDER BY Weight ASC LIMIT 3
SELECT T1.name ,  count(*) FROM client AS T1 JOIN package AS T2 ON T1.accountnumber  =  T2.sender GROUP BY T1.accountnumber ORDER BY count(*) DESC LIMIT 1
SELECT T1.Name ,  COUNT(*) FROM Client AS T1 JOIN Package AS T2 ON T1.AccountNumber  =  T2.Sender GROUP BY T2.Sender ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.Name ,  count(*) FROM package AS T1 JOIN client AS T2 ON T1.Recipient  =  T2.AccountNumber GROUP BY T1.Recipient ORDER BY count(*) ASC LIMIT 1
SELECT min(count(*) ,  T1.Name ,  T2.Name FROM package AS T1 JOIN client AS T2 ON T1.recipient  =  T2.accountnumber GROUP BY T1.recipient
SELECT T1.Name FROM  Client AS T1 JOIN Package AS T2 ON T1.AccountNumber  =  T2.Sender GROUP BY T2.Sender HAVING count(*)  >  1
SELECT T2.name FROM package AS T1 JOIN client AS T2 ON T1.sender  =  T2.accountnumber GROUP BY T2.name HAVING count(*)  >  1
SELECT Coordinates FROM Planet WHERE Name  =  "Mars"
SELECT Coordinates FROM Planet WHERE Name  =  "Mars"
SELECT Name ,  Coordinates FROM Planet ORDER BY Name
SELECT name ,  coordinates FROM planet ORDER BY name
SELECT ShipmentID FROM Shipment WHERE Manager  =  'Phillip J. Fry'
SELECT T2.ShipmentID FROM Employee AS T1 JOIN Shipment AS T2 ON T1.EmployeeID  =  T2.Manager WHERE T1.Name  =  "Phillip J Fry"
SELECT Date FROM Shipment
SELECT Date FROM Shipment
SELECT ShipmentID FROM Shipment WHERE Planet  =  "Mars"
SELECT ShipmentID FROM Shipment WHERE Planet  =  "Mars"
SELECT shipmentid FROM shipment WHERE planet  =  "Mars" AND manager  =  "Turanga Leela"
SELECT T2.shipmentid FROM employee AS T1 JOIN shipment AS T2 ON T1.employeeid  =  T2.manager WHERE T1.name  =  "Turanga Leela" AND T2.planet  =  "Mars"
SELECT shipmentid FROM shipment WHERE planet  =  "Mars" UNION SELECT shipmentid FROM shipment WHERE manager  =  "Turanga Leela"
SELECT T2.shipmentid FROM employee AS T1 JOIN shipment AS T2 ON T1.employeeid  =  T2.manager WHERE T1.name  =  'Turanga Leela' AND T2.planet  =  'Mars'
SELECT T2.Name ,  count(*) FROM shipment AS T1 JOIN planet AS T2 ON T1.planet  =  T2.planetid GROUP BY T1.planet
SELECT T2.Name ,  COUNT(*) FROM shipment AS T1 JOIN planet AS T2 ON T1.planet  =  T2.planetid GROUP BY T1.planet
SELECT T2.Name FROM Shipment AS T1 JOIN Planet AS T2 ON T1.Planet  =  T2.PlanetID GROUP BY T1.Planet ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.Name FROM Shipment AS T1 JOIN Planet AS T2 ON T1.Planet  =  T2.PlanetID GROUP BY T1.Planet ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.Name ,  COUNT(*) FROM Employee AS T1 JOIN Shipment AS T2 ON T1.EmployeeID  =  T2.Manager GROUP BY T2.Manager
SELECT count(*) ,  T1.Name FROM Employee AS T1 JOIN Shipment AS T2 ON T1.EmployeeID  =  T2.Manager GROUP BY T1.Name
SELECT sum(weight) FROM Package AS T1 JOIN Shipment AS T2 ON T1.shipment  =  T2.shipmentid JOIN planet AS T3 ON T2.planet  =  T3.planetid WHERE T3.name  =  'Mars'
SELECT sum(weight) FROM shipment AS T1 JOIN package AS T2 ON T1.shipmentid  =  T2.shipment WHERE T1.planet  =  "Mars"
SELECT T1.name ,  sum(T2.weight) FROM planet AS T1 JOIN package AS T2 ON T1.planetid  =  T2.shipment GROUP BY T1.planetid
SELECT sum(T3.Weight) ,  T2.Name FROM shipment AS T1 JOIN planet AS T2 ON T1.planet  =  T2.planetid JOIN package AS T3 ON T3.shipment  =  T1.shipmentid GROUP BY T2.Name
SELECT T2.Name FROM Package AS T1 JOIN Planet AS T2 ON T1.Planet  =  T2.PlanetID GROUP BY T1.Planet HAVING sum(T1.Weight)  >  30
SELECT T2.name FROM package AS T1 JOIN planet AS T2 ON T1.planet  =  T2.planetid GROUP BY T1.planet HAVING sum(T1.weight)  >  30
SELECT T3.packageNumber FROM shipment AS T1 JOIN planet AS T2 ON T1.planet  =  T2.planetid JOIN package AS T3 ON T3.shipment  =  T1.shipmentid WHERE T2.name  =  'Omicron Persei 8' AND T3.sender  =  'Zapp Brannigan'
SELECT count(*) FROM Package AS T1 JOIN SHIPMENT AS T2 ON T1.Shipment  =  T2.ShipmentID JOIN planet AS T3 ON T2.planet  =  T3.planetid WHERE T3.name  =  'Omicron Persei 8' AND T1.Sender  =  'Zapp Brannigan'
SELECT T3.packageNumber FROM planet AS T1 JOIN shipment AS T2 ON T1.planetid  =  T2.planet JOIN package AS T3 ON T3.shipment  =  T2.shipmentid WHERE T1.name  =  'Omicron Persei 8' OR T3.sender  =  'Zapp Brannigan'
SELECT count(*) FROM shipment AS T1 JOIN package AS T2 ON T1.shipmentid  =  T2.shipment WHERE T1.planet  =  "Omicron Persei 8" UNION SELECT count(*) FROM package AS T2 JOIN client AS T1 ON T2.sender  =  T1.accountnumber WHERE T1.name  =  "Zapp Brannigan"
SELECT PackageNumber ,  Weight FROM Package WHERE Weight BETWEEN 10 AND 30
SELECT PackageNumber ,  Weight FROM Package WHERE Weight BETWEEN 10 AND 30
SELECT T2.Name FROM Has_Clearance AS T1 JOIN Employee AS T2 ON T1.Employee  =  T2.EmployeeID WHERE T1.Planet  =  'Mars' EXCEPT SELECT T2.Name FROM Has_Clearance AS T1 JOIN Employee AS T2 ON T1.Employee  =  T2.EmployeeID WHERE T1.Planet  =  'Mars'
SELECT Name FROM Employee EXCEPT SELECT T2.Name FROM Has_Clearance AS T1 JOIN Employee AS T2 ON T1.Employee  =  T2.EmployeeID JOIN Planet AS T3 ON T1.Planet  =  T3.PlanetID WHERE T3.Name  =  "Mars"
SELECT T3.Name FROM Has_Clearance AS T1 JOIN Employee AS T2 JOIN Planet AS T4 JOIN T1 ON T1.Employee  =  T2.EmployeeID ON T1.Planet  =  T4.PlanetID WHERE T4.Name  =  'Omega III'
SELECT T3.Name FROM Has_Clearance AS T1 JOIN Employee AS T2 JOIN Planet AS T4 ON T1.Employee  =  T2.EmployeeID AND T1.Planet  =  T4.PlanetID WHERE T4.Name  =  'Omega III'
SELECT T2.Name FROM Has_Clearance AS T1 JOIN Planet AS T2 ON T1.Planet  =  T2.PlanetID GROUP BY T1.Planet HAVING COUNT(*)  =  1
SELECT T3.Name FROM HAS_CLEARANCE AS T1 JOIN Employee AS T2 ON T1.Employee  =  T2.EmployeeID JOIN Planet AS T3 ON T1.Planet  =  T3.PlanetID GROUP BY T1.Planet HAVING COUNT(*)  =  1
SELECT Name FROM Employee WHERE Salary BETWEEN 5000 AND 10000
SELECT Name FROM Employee WHERE Salary BETWEEN 5000 AND 10000
SELECT name FROM employee WHERE salary  >  (SELECT avg(salary) FROM employee) OR salary  >  5000
SELECT Name FROM Employee WHERE Salary  >  (SELECT avg(Salary) FROM Employee) OR Salary  >  5000
SELECT count(*) FROM HAS_CLEARANCE WHERE planetid != (SELECT planetid FROM planet WHERE name  =  'Mars')
SELECT count(*) FROM employee WHERE employeeid NOT IN ( SELECT employee FROM has_clearance WHERE planetid  =  ( SELECT planetid FROM planet WHERE name  =  'Mars' ) )
SELECT count(*) FROM game
SELECT count(*) FROM game
SELECT title ,  developers FROM game ORDER BY Units_sold_Millions DESC
SELECT title ,  developers FROM game ORDER BY Units_sold_Millions DESC
SELECT avg(Units_sold_Millions) FROM game WHERE Developers != "Nintendo"
SELECT avg(Units_sold_Millions) FROM game WHERE Developers != "Nintendo"
SELECT platform_name ,  market_district FROM platform
SELECT platform_name ,  market_district FROM platform
SELECT platform_name ,  platform_id FROM platform WHERE Download_rank  =  1
SELECT platform_name ,  platform_id FROM platform WHERE Download_rank  =  1
SELECT max(Rank_of_the_year) ,  min(Rank_of_the_year) FROM player
SELECT max(Rank_of_the_year) ,  min(Rank_of_the_year) FROM player
SELECT count(*) FROM player WHERE Rank_of_the_year  <  3
SELECT count(*) FROM player WHERE Rank_of_the_year  <=  3
SELECT Player_name FROM player ORDER BY Player_name ASC
SELECT Player_name FROM player ORDER BY Player_name ASC
SELECT Player_name ,  College FROM player ORDER BY Rank_of_the_year DESC
SELECT Player_name ,  College FROM player ORDER BY Rank_of_the_year DESC
SELECT T3.Player_name ,  T3.Rank_of_the_year FROM game_player AS T1 JOIN game AS T2 ON T1.Game_ID  =  T2.Game_ID JOIN player AS T3 ON T1.Player_ID  =  T3.Player_ID WHERE T2.Title  =  "Super Mario World"
SELECT T3.Player_name ,  T3.Rank_of_the_year FROM game AS T1 JOIN game_player AS T2 ON T1.Game_ID  =  T2.Game_ID JOIN player AS T3 ON T2.Player_ID  =  T3.Player_ID WHERE T1.Title  =  "Super Mario World"
SELECT DISTINCT T1.developers FROM game AS T1 JOIN game_player AS T2 ON T1.Game_ID  =  T2.Game_ID JOIN player AS T3 ON T2.Player_ID  =  T3.Player_ID WHERE T3.College  =  "Auburn"
SELECT DISTINCT T2.Developers FROM game_player AS T1 JOIN game AS T2 ON T1.Game_ID  =  T2.Game_ID JOIN player AS T3 ON T1.Player_ID  =  T3.Player_ID WHERE T3.College  =  "Auburn"
SELECT avg(T1.Units_sold_Millions) FROM game AS T1 JOIN game_player AS T2 ON T1.Game_ID  =  T2.Game_ID JOIN player AS T3 ON T2.Player_ID  =  T3.Player_ID WHERE T3.Position  =  "Guard"
SELECT avg(T2.Units_sold_Millions) FROM game_player AS T1 JOIN game AS T2 ON T1.Game_ID  =  T2.Game_ID JOIN player AS T3 ON T1.Player_ID  =  T3.Player_ID WHERE T3.Position  =  "Guard"
SELECT T2.title ,  T1.platform_name FROM platform AS T1 JOIN game AS T2 ON T1.platform_id  =  T2.platform_id
SELECT T2.title ,  T1.platform_name FROM platform AS T1 JOIN game AS T2 ON T1.platform_id  =  T2.platform_id
SELECT T2.title FROM platform AS T1 JOIN game AS T2 ON T1.platform_id  =  T2.platform_id WHERE T1.market_district  =  'Asia' OR T1.market_district  =  'USA'
SELECT T2.title FROM platform AS T1 JOIN game AS T2 ON T1.platform_id  =  T2.platform_id WHERE T1.Market_district  =  'Asia' OR T1.Market_district  =  'USA'
SELECT Franchise ,  COUNT(*) FROM game GROUP BY Franchise
SELECT Franchise ,  COUNT(*) FROM game GROUP BY Franchise
SELECT Franchise FROM game GROUP BY Franchise ORDER BY COUNT(*) DESC LIMIT 1
SELECT Franchise FROM game GROUP BY Franchise ORDER BY COUNT(*) DESC LIMIT 1
SELECT Franchise FROM game GROUP BY Franchise HAVING COUNT(*)  >=  2
SELECT Franchise FROM game GROUP BY Franchise HAVING COUNT(*)  >=  2
SELECT player_name FROM player WHERE player_id NOT IN (SELECT player_id FROM game_player)
SELECT Player_name FROM player WHERE Player_ID NOT IN (SELECT Player_ID FROM game_player)
SELECT T3.title FROM game_player AS T1 JOIN player AS T2 ON T1.Player_ID  =  T2.Player_ID JOIN game AS T3 ON T1.Game_ID  =  T3.Game_ID WHERE T2.College  =  "Oklahoma" INTERSECT SELECT T3.title FROM game_player AS T1 JOIN player AS T2 ON T1.Player_ID  =  T2.Player_ID JOIN game AS T3 ON T1.Game_ID  =  T3.Game_ID WHERE T2.College  =  "Auburn"
SELECT T3.Title FROM game_player AS T1 JOIN player AS T2 ON T1.Player_ID  =  T2.Player_ID JOIN game AS T3 ON T1.Game_ID  =  T3.Game_ID WHERE T2.College  =  "Oklahoma" OR T2.College  =  "Auburn"
SELECT DISTINCT Franchise FROM game
SELECT DISTINCT Franchise FROM game
SELECT title FROM game EXCEPT SELECT T1.title FROM game AS T1 JOIN game_player AS T2 ON T1.game_id  =  T2.game_id JOIN player AS T3 ON T2.player_id  =  T3.player_id WHERE T3.position  =  "Guard"
SELECT title FROM game EXCEPT SELECT T1.title FROM game AS T1 JOIN game_player AS T2 ON T1.game_id  =  T2.game_id JOIN player AS T3 ON T2.player_id  =  T3.player_id WHERE T3.position  =  "Guard"
SELECT name FROM press ORDER BY Year_Profits_billion DESC
SELECT name FROM press ORDER BY Year_Profits_billion DESC
SELECT name FROM press WHERE YEAR_Profits_billion  >  15 OR MONTH_Profits_billion  >  1
SELECT name FROM press WHERE YEAR_Profits_billion  >  15 OR MONTH_Profits_billion  >  1
SELECT avg(Year_Profits_billion) ,  max(Year_Profits_billion) FROM press
SELECT avg(Year_Profits_billion) ,  max(Year_Profits_billion) FROM press
SELECT name FROM press ORDER BY month_profits_billion DESC LIMIT 1
SELECT Name FROM press ORDER BY Month_Profits_billion DESC LIMIT 1
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
SELECT count(*) ,  Book_Series FROM book GROUP BY Book_Series
SELECT Title ,  Release_date FROM book ORDER BY Sale_Amount DESC LIMIT 5
SELECT Title ,  Release_date FROM book ORDER BY Sale_Amount DESC LIMIT 5
SELECT Book_Series FROM book WHERE Sale_Amount  >  1000 INTERSECT SELECT Book_Series FROM book WHERE Sale_Amount  <  500
SELECT Book_Series FROM book WHERE Sale_Amount  >  1000 INTERSECT SELECT Book_Series FROM book WHERE Sale_Amount  <  500
SELECT T1.name FROM author AS T1 JOIN book AS T2 ON T1.author_id  =  T2.author_id WHERE T2.book_series  =  "MM" INTERSECT SELECT T1.name FROM author AS T1 JOIN book AS T2 ON T1.author_id  =  T2.author_id WHERE T2.book_series  =  "LT"
SELECT T1.name FROM author AS T1 JOIN book AS T2 ON T1.author_id  =  T2.author_id WHERE T2.book_series  =  "MM" INTERSECT SELECT T1.name FROM author AS T1 JOIN book AS T2 ON T1.author_id  =  T2.author_id WHERE T2.book_series  =  "LT"
SELECT name ,  age FROM author WHERE author_id NOT IN (SELECT author_id FROM book)
SELECT name FROM author WHERE author_id NOT IN (SELECT author_id FROM book)
SELECT T2.name FROM book AS T1 JOIN author AS T2 ON T1.Author_ID  =  T2.Author_ID GROUP BY T1.author_ID HAVING count(*)  >  1
SELECT T2.name FROM book AS T1 JOIN author AS T2 ON T1.author_id  =  T2.author_id GROUP BY T2.name HAVING count(*)  >  1
SELECT T1.title ,  T2.name ,  T3.Name FROM book AS T1 JOIN author AS T2 ON T1.Author_ID  =  T2.Author_ID JOIN press AS T3 ON T1.Press_ID  =  T3.Press_ID ORDER BY T1.Sale_Amount DESC LIMIT 3
SELECT T1.title ,  T2.name ,  T3.Name FROM book AS T1 JOIN author AS T2 ON T1.Author_ID  =  T2.Author_ID JOIN press AS T3 ON T1.Press_ID  =  T3.Press_ID ORDER BY T1.Sale_Amount DESC LIMIT 3
SELECT T2.Name ,  sum(T1.Sale_Amount) FROM book AS T1 JOIN press AS T2 ON T1.Press_ID  =  T2.Press_ID GROUP BY T1.Press_ID
SELECT T2.Name ,  sum(T1.Sale_Amount) FROM book AS T1 JOIN press AS T2 ON T1.Press_ID  =  T2.Press_ID GROUP BY T1.Press_ID
SELECT T2.Name ,  count(*) FROM book AS T1 JOIN press AS T2 ON T1.Press_ID  =  T2.Press_ID WHERE T1.Sale_Amount  >  1000 GROUP BY T2.Name
SELECT T2.name ,  count(*) FROM book AS T1 JOIN press AS T2 ON T1.press_id  =  T2.press_id WHERE T1.sale_amount  >  1000 GROUP BY T2.press_id
SELECT T2.name FROM book AS T1 JOIN author AS T2 ON T1.Author_ID  =  T2.Author_ID ORDER BY T1.Sale_Amount DESC LIMIT 1
SELECT T2.name FROM book AS T1 JOIN author AS T2 ON T1.author_id  =  T2.author_id ORDER BY T1.sale_amount DESC LIMIT 1
SELECT T2.name ,  T2.gender FROM book AS T1 JOIN author AS T2 ON T1.Author_ID  =  T2.Author_ID GROUP BY T1.Author_ID ORDER BY count(*) DESC LIMIT 1
SELECT T2.name ,  T2.gender FROM book AS T1 JOIN author AS T2 ON T1.Author_ID  =  T2.Author_ID GROUP BY T1.author_ID ORDER BY count(*) DESC LIMIT 1
SELECT T1.name FROM author AS T1 JOIN book AS T2 ON T1.author_id  =  T2.author_id EXCEPT SELECT T4.name FROM author AS T4 JOIN book AS T5 ON T4.author_id  =  T5.author_id JOIN press AS T3 ON T3.press_id  =  T5.press_id WHERE T3.name  =  "Accor"
SELECT T2.name FROM book AS T1 JOIN author AS T2 ON T1.Author_ID  =  T2.Author_ID JOIN press AS T3 ON T1.Press_ID  =  T3.Press_ID WHERE T3.name !=  "Accor" GROUP BY T2.name HAVING count(*)  =  0
SELECT T2.name ,  T2.Year_Profits_billion FROM book AS T1 JOIN press AS T2 ON T1.Press_ID  =  T2.Press_ID GROUP BY T1.Press_ID HAVING count(*)  >  2
SELECT T2.name ,  T2.Year_Profits_billion FROM book AS T1 JOIN press AS T2 ON T1.Press_ID  =  T2.Press_ID GROUP BY T1.Press_ID HAVING count(*)  >  2
SELECT count(*) FROM AUTHORS
SELECT author_name FROM AUTHORS
SELECT author_name ,  other_details FROM AUTHORS
SELECT other_details FROM AUTHORS WHERE author_name  =  "Addison Denesik"
SELECT count(*) FROM documents
SELECT author_name FROM Documents WHERE document_id = 4
SELECT author_name FROM Documents WHERE document_name  =  "Travel to Brazil"
SELECT count(*) FROM documents WHERE author_name  =  "Era Kerluke"
SELECT document_name ,  document_description FROM Documents
SELECT document_id ,  document_name FROM Documents WHERE author_name  =  "Bianka Cummings"
SELECT author_name ,  other_details FROM Documents WHERE document_name  =  "Travel to China"
SELECT author_name ,  count(*) FROM Documents GROUP BY author_name
SELECT author_name FROM documents GROUP BY author_name ORDER BY count(*) DESC LIMIT 1
SELECT T1.author_name FROM Authors AS T1 JOIN Documents AS T2 ON T1.author_name  =  T2.author_name GROUP BY T1.author_name HAVING count(*)  >=  2
SELECT count(*) FROM Business_Processes
SELECT next_process_id ,  process_name ,  process_description FROM Business_Processes WHERE process_id = 9
SELECT process_name FROM Business_Processes WHERE process_id = 9
SELECT count(*) FROM Process_Outcomes
SELECT process_outcome_code ,  process_outcome_description FROM Process_Outcomes
SELECT process_outcome_description FROM Process_Outcomes WHERE process_outcome_code  =  "working"
SELECT count(*) FROM Process_Status
SELECT process_status_code ,  process_status_description FROM Process_Status
SELECT process_status_description FROM Process_Status WHERE process_status_code  =  "ct"
SELECT count(*) FROM staff
SELECT staff_id ,  staff_details FROM Staff
SELECT staff_details FROM staff WHERE staff_id = 100
SELECT count(*) FROM Ref_Staff_Roles
SELECT staff_role_code ,  staff_role_description FROM Ref_Staff_Roles
SELECT staff_role_description FROM Ref_Staff_Roles WHERE staff_role_code  =  "HR"
SELECT count(*) FROM document_processes
SELECT process_id FROM Documents_Processes
SELECT document_id FROM documents EXCEPT SELECT document_id FROM documents_processes
SELECT process_id FROM Business_Processes EXCEPT SELECT process_id FROM Documents_Processes
SELECT T1.process_outcome_description ,  T2.process_status_description FROM Process_Outcomes AS T1 JOIN Process_Status AS T2 ON T1.process_outcome_code  =  T2.process_status_code JOIN Documents_Processes AS T3 ON T2.process_status_code  =  T3.process_status_code WHERE T3.document_id  =  0
SELECT t3.process_name FROM documents AS t1 JOIN documents_processes AS t2 ON t1.document_id  =  t2.document_id JOIN business_processes AS t3 ON t2.process_id  =  t3.process_id WHERE t1.document_name  =  "Travel to Brazil"
SELECT process_id ,  count(*) FROM Documents_processes GROUP BY process_id
SELECT count(*) FROM staff_in_processes WHERE document_id = 0 AND process_id = 9
SELECT staff_id ,  count(*) FROM Staff_in_processes GROUP BY staff_id
SELECT T1.staff_role_code ,  count(*) FROM Ref_Staff_Roles AS T1 JOIN Staff_in_Processes AS T2 ON T1.staff_role_code  =  T2.staff_role_code GROUP BY T1.staff_role_code
SELECT count(*) FROM Staff_in_Processes WHERE staff_id  =  3
SELECT count(*) FROM Agencies
SELECT count(*) FROM Agencies
SELECT agency_id ,  agency_details FROM Agencies
SELECT agency_id ,  agency_details FROM Agencies
SELECT count(*) FROM CLIENTS
SELECT count(*) FROM Clients
SELECT client_id ,  client_details FROM CLIENTS
SELECT client_id ,  client_details FROM CLIENTS
SELECT agency_id ,  count(*) FROM CLIENTS GROUP BY agency_id
SELECT T1.agency_details ,  count(*) FROM Agencies AS T1 JOIN Clients AS T2 ON T1.agency_id  =  T2.agency_id GROUP BY T1.agency_id
SELECT T1.agency_id ,  T1.agency_details FROM Agencies AS T1 JOIN Clients AS T2 ON T1.agency_id  =  T2.agency_id GROUP BY T1.agency_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.agency_id ,  T1.agency_details FROM Agencies AS T1 JOIN Clients AS T2 ON T1.agency_id  =  T2.agency_id GROUP BY T1.agency_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.agency_id ,  T1.agency_details FROM Agencies AS T1 JOIN Clients AS T2 ON T1.agency_id  =  T2.agency_id GROUP BY T1.agency_id HAVING count(*)  >=  2
SELECT T1.agency_id ,  T1.agency_details FROM Agencies AS T1 JOIN Clients AS T2 ON T1.agency_id  =  T2.agency_id GROUP BY T1.agency_id HAVING count(*)  >=  2
SELECT T1.agency_details FROM agencies AS T1 JOIN clients AS T2 ON T1.agency_id  =  T2.agency_id WHERE T2.client_details  =  'Mac'
SELECT T1.agency_details FROM Agencies AS T1 JOIN Clients AS T2 ON T1.agency_id  =  T2.agency_id WHERE T2.client_details  =  "Mac"
SELECT T1.client_details ,  T2.agency_details FROM CLIENTS AS T1 JOIN AGENCIES AS T2 ON T1.agency_id  =  T2.agency_id
SELECT T1.client_details ,  T2.agency_details FROM Clients AS T1 JOIN Agencies AS T2 ON T1.agency_id  =  T2.agency_id
SELECT sic_code ,  count(*) FROM Clients GROUP BY sic_code
SELECT sic_code ,  count(*) FROM Clients GROUP BY sic_code
SELECT client_id ,  client_details FROM Clients WHERE sic_code  =  "Bad"
SELECT client_details FROM CLIENTS WHERE sic_code  =  "Bad"
SELECT T1.agency_id ,  T1.agency_details FROM Agencies AS T1 JOIN Clients AS T2 ON T1.agency_id  =  T2.agency_id
SELECT T1.agency_id ,  T1.agency_details FROM Agencies AS T1 JOIN Clients AS T2 ON T1.agency_id  =  T2.agency_id
SELECT agency_id FROM Agencies EXCEPT SELECT agency_id FROM Clients
SELECT agency_id FROM agencies EXCEPT SELECT agency_id FROM clients
SELECT count(*) FROM INVOICES
SELECT count(*) FROM INVOICES
SELECT T1.invoice_id ,  T1.invoice_status ,  T1.invoice_details FROM INVOICES AS T1 JOIN CLIENTS AS T2 ON T1.client_id  =  T2.client_id
SELECT invoice_id ,  invoice_status ,  invoice_details FROM INVOICES
SELECT client_id ,  count(*) FROM INVOICES GROUP BY client_id
SELECT count(*) ,  client_id FROM INVOICES GROUP BY client_id
SELECT T1.client_id ,  T1.client_details FROM CLIENTS AS T1 JOIN INVOICES AS T2 ON T1.client_id  =  T2.client_id GROUP BY T1.client_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.client_id ,  T1.client_details FROM CLIENTS AS T1 JOIN INVOICES AS T2 ON T1.client_id  =  T2.client_id GROUP BY T1.client_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.client_id FROM CLIENTS AS T1 JOIN INVOICES AS T2 ON T1.client_id  =  T2.client_id GROUP BY T1.client_id HAVING count(*)  >=  2
SELECT client_id FROM INVOICES GROUP BY client_id HAVING count(*)  >=  2
SELECT invoice_status ,  count(*) FROM INVOICES GROUP BY invoice_status
SELECT invoice_status ,  count(*) FROM INVOICES GROUP BY invoice_status
SELECT invoice_status FROM INVOICES GROUP BY invoice_status ORDER BY count(*) DESC LIMIT 1
SELECT invoice_status FROM INVOICES GROUP BY invoice_status ORDER BY count(*) DESC LIMIT 1
SELECT T1.invoice_status ,  T1.invoice_details ,  T2.client_id ,  T3.agency_id ,  T2.client_details ,  T3.agency_details FROM INVOICES AS T1 JOIN CLIENTS AS T2 ON T1.client_id  =  T2.client_id JOIN AGENCIES AS T3 ON T2.agency_id  =  T3.agency_id
SELECT T1.invoice_status ,  T1.invoice_details ,  T2.client_id ,  T3.client_details ,  T4.agency_id ,  T5.agency_details FROM INVOICES AS T1 JOIN CLIENTS AS T2 ON T1.client_id  =  T2.client_id JOIN CLIENTS AS T3 ON T2.agency_id  =  T3.agency_id JOIN AGENCIES AS T4 ON T4.agency_id  =  T3.agency_id JOIN AGENCIES AS T5 ON T5.agency_id  =  T4.agency_id
SELECT meeting_type ,  purpose_of_meeting FROM Meetings
SELECT meeting_type ,  other_details FROM Meetings
SELECT meeting_outcome ,  purpose_of_meeting FROM MEETINGS
SELECT DISTINCT meeting_outcome ,  purpose_of_meeting FROM Meetings
SELECT T2.payment_id ,  T2.payment_details FROM INVOICES AS T1 JOIN Payments AS T2 ON T1.invoice_id  =  T2.invoice_id WHERE T1.invoice_status  =  'Working'
SELECT T1.payment_id ,  T1.payment_details FROM PAYMENTS AS T1 JOIN INVOICES AS T2 ON T1.invoice_id  =  T2.invoice_id WHERE T2.invoice_status  =  'Working'
SELECT invoice_id ,  invoice_status FROM INVOICES EXCEPT SELECT T1.invoice_id ,  T1.invoice_status FROM INVOICES AS T1 JOIN Payments AS T2 ON T1.invoice_id  =  T2.invoice_id
SELECT invoice_id ,  invoice_status FROM INVOICES EXCEPT SELECT T1.invoice_id ,  T1.invoice_status FROM INVOICES AS T1 JOIN Payments AS T2 ON T1.invoice_id  =  T2.invoice_id
SELECT count(*) FROM Payments
SELECT count(*) FROM Payments
SELECT T1.payment_id ,  T2.invoice_id ,  T2.invoice_details FROM Payments AS T1 JOIN Invoices AS T2 ON T1.invoice_id  =  T2.invoice_id
SELECT payment_id ,  invoice_id ,  payment_details FROM Payments
SELECT DISTINCT T1.invoice_id ,  T1.invoice_status FROM INVOICES AS T1 JOIN Payments AS T2 ON T1.invoice_id  =  T2.payment_id
SELECT DISTINCT invoice_id ,  invoice_status FROM PAYMENTS
SELECT invoice_id ,  count(*) FROM Payments GROUP BY invoice_id
SELECT count(*) ,  T1.invoice_id FROM Payments AS T1 JOIN Invoices AS T2 ON T1.invoice_id  =  T2.invoice_id GROUP BY T1.invoice_id
SELECT T1.invoice_id ,  T1.invoice_status ,  T1.invoice_details FROM invoices AS T1 JOIN payments AS T2 ON T1.invoice_id  =  T2.invoice_id GROUP BY T1.invoice_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.invoice_id ,  T1.invoice_status ,  T1.invoice_details FROM invoices AS T1 JOIN payments AS T2 ON T1.invoice_id  =  T2.invoice_id GROUP BY T1.invoice_id ORDER BY count(*) DESC LIMIT 1
SELECT count(*) FROM Staff
SELECT count(*) FROM Staff
SELECT agency_id ,  count(*) FROM Staff GROUP BY agency_id
SELECT agency_id ,  count(*) FROM Staff GROUP BY agency_id
SELECT T1.agency_id ,  T1.agency_details FROM Agencies AS T1 JOIN Staff AS T2 ON T1.agency_id  =  T2.agency_id GROUP BY T1.agency_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.agency_id ,  T1.agency_details FROM Agencies AS T1 JOIN Staff AS T2 ON T1.agency_id  =  T2.agency_id GROUP BY T1.agency_id ORDER BY count(*) DESC LIMIT 1
SELECT meeting_outcome ,  count(*) FROM MEETINGS GROUP BY meeting_outcome
SELECT meeting_outcome ,  count(*) FROM MEETINGS GROUP BY meeting_outcome
SELECT T1.client_id ,  count(*) FROM CLIENTS AS T1 JOIN MEETINGS AS T2 ON T1.client_id  =  T2.client_id GROUP BY T1.client_id
SELECT T1.client_id ,  count(*) FROM CLIENTS AS T1 JOIN MEETINGS AS T2 ON T1.client_id  =  T2.client_id GROUP BY T1.client_id
SELECT T1.meeting_type ,  count(*) FROM MEETINGS AS T1 JOIN clients AS T2 ON T1.client_id  =  T2.client_id GROUP BY T1.meeting_type
SELECT meeting_type ,  count(*) FROM Meetings GROUP BY meeting_type
SELECT T1.meeting_id ,  T1.meeting_outcome ,  T1.meeting_type ,  T3.client_details FROM MEETINGS AS T1 JOIN CLIENTS AS T2 ON T1.client_id  =  T2.client_id JOIN INVOICES AS T3 ON T3.client_id  =  T2.client_id
SELECT T1.meeting_id ,  T1.meeting_outcome ,  T1.meeting_type ,  T2.client_details FROM MEETINGS AS T1 JOIN CLIENTS AS T2 ON T1.client_id  =  T2.client_id
SELECT T1.meeting_id ,  count(*) FROM MEETINGS AS T1 JOIN Staff_in_Meetings AS T2 ON T1.meeting_id  =  T2.meeting_id GROUP BY T1.meeting_id
SELECT T1.meeting_id ,  count(*) FROM MEETINGS AS T1 JOIN Staff_in_Meetings AS T2 ON T1.meeting_id  =  T2.meeting_id GROUP BY T1.meeting_id
SELECT T1.staff_id ,  count(*) FROM Staff_in_Meetings AS T1 JOIN MEETINGS AS T2 ON T1.meeting_id  =  T2.meeting_id GROUP BY T1.staff_id ORDER BY count(*) ASC LIMIT 1
SELECT T1.staff_id FROM STAFF_IN_MEETINGS AS T1 JOIN MEETINGS AS T2 ON T1.meeting_id  =  T2.meeting_id GROUP BY T1.staff_id ORDER BY count(*) ASC LIMIT 1
SELECT count(*) FROM Staff_in_Meetings
SELECT count(DISTINCT staff_id) FROM Staff_in_Meetings
SELECT count(*) FROM staff WHERE staff_id NOT IN ( SELECT staff_id FROM Staff_in_Meetings );
SELECT count(*) FROM staff WHERE staff_id NOT IN ( SELECT staff_id FROM Staff_in_Meetings )
SELECT T1.client_id ,  T1.client_details FROM Clients AS T1 JOIN Invoices AS T2 ON T1.client_id  =  T2.client_id UNION SELECT T1.client_id ,  T1.client_details FROM Clients AS T1 JOIN Meetings AS T2 ON T1.client_id  =  T2.client_id
SELECT T1.client_id ,  T1.client_details FROM CLIENTS AS T1 JOIN INVOICES AS T2 ON T1.client_id  =  T2.client_id UNION SELECT T1.client_id ,  T1.client_details FROM CLIENTS AS T1 JOIN METHODS AS T2 ON T1.client_id  =  T2.client_id
SELECT T1.staff_id ,  T1.staff_details FROM STAFF AS T1 JOIN Staff_in_Meetings AS T2 ON T1.staff_id  =  T2.staff_id WHERE T1.staff_details LIKE '%s%' GROUP BY T1.staff_id HAVING count(*)  >=  1
SELECT T1.staff_id ,  T1.staff_details FROM Staff AS T1 JOIN Staff_in_Meetings AS T2 ON T1.staff_id  =  T2.staff_id WHERE T1.staff_details LIKE "%s%"
SELECT T1.client_id ,  T1.sic_code ,  T1.agency_id FROM CLIENTS AS T1 JOIN METHOD AS T2 ON T1.client_id  =  T2.client_id GROUP BY T1.client_id HAVING count(*)  =  1
SELECT T1.client_id ,  T1.sic_code ,  T1.agency_id FROM Clients AS T1 JOIN Invoices AS T2 ON T1.client_id = T2.client_id JOIN Meetings AS T3 ON T2.client_id = T3.client_id GROUP BY T1.client_id HAVING count(*)  =  1
SELECT T3.start_date_time ,  T3.end_date_time ,  T2.client_details ,  T4.staff_details FROM Staff_in_Meetings AS T1 JOIN Meetings AS T3 ON T1.meeting_id  =  T3.meeting_id JOIN Clients AS T2 ON T2.client_id  =  T3.client_id JOIN Staff AS T4 ON T4.staff_id  =  T1.staff_id
SELECT T3.start_date_time ,  T3.end_date_time ,  T2.staff_details ,  T4.client_details FROM Staff_in_Meetings AS T1 JOIN Staff AS T2 ON T1.staff_id  =  T2.staff_id JOIN Meetings AS T3 ON T1.meeting_id  =  T3.meeting_id JOIN Clients AS T4 ON T3.client_id  =  T4.client_id
