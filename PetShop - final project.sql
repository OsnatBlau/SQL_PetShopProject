CREATE database PetShop;

use PetShop;

CREATE TABLE Items (
    id_item int NOT NULL,
    type_item varchar(60) NOT NULL,
    name_item varchar(60) NOT NULL,
    price_item int NOT NULL,
    amount_item int NOT NULL,
    PRIMARY KEY (id_item)
);

CREATE TABLE Employees (
    id_employee int NOT NULL,
    name_employee varchar(60) NOT NULL,
    role_employee varchar(60) NOT NULL,
    address_employee varchar(60) NOT NULL,
    phone_number_employee int NOT NULL,
    PRIMARY KEY (id_employee)
);

CREATE TABLE Pets (
    id_pet int NOT NULL,
    type_pet varchar(60) NOT NULL,
    name_pet varchar(60) NOT NULL,
    age_pet int NOT NULL,
    PRIMARY KEY (id_pet)
);

CREATE TABLE Costumers (
    id_client int NOT NULL,
    name_client varchar(60) NOT NULL,
    address_client varchar(60) NOT NULL,
    phone_number_client int NOT NULL,
    id_pet int,
    PRIMARY KEY (id_client),
    FOREIGN KEY (id_pet) REFERENCES Pets(id_pet)
);

CREATE TABLE Orders (
    id_order int NOT NULL,
    order_date date NOT NULL,
    date_shipping date NOT NULL,
    price_order int NOT NULL,
    price_shipping int NOT NULL,
    id_delivery_person int,
    id_client int,
    id_employee int,
    id_item int,
    PRIMARY KEY (id_order),
    FOREIGN KEY (id_delivery_person) REFERENCES Employees(id_employee),
    FOREIGN KEY (id_client) REFERENCES Costumers(id_client),
    FOREIGN KEY (id_employee) REFERENCES Employees(id_employee),
    FOREIGN KEY (id_item) REFERENCES Items(id_item)
);

CREATE TABLE PetShop (
    id_store int NOT NULL,
    name_store varchar(60) NOT NULL,
    address_store varchar(60) NOT NULL,
    phone_number_store int NOT NULL,
    id_item int,
    id_employee int,
    id_client int,
    PRIMARY KEY (id_store),
    FOREIGN KEY (id_item) REFERENCES Items(id_item),
    FOREIGN KEY (id_employee) REFERENCES Employees(id_employee),
    FOREIGN KEY (id_client) REFERENCES Costumers(id_client)
);


INSERT INTO Items VALUES (1, "beds", "red small dogs bed", 149, 3);
INSERT INTO Items VALUES (2, "dogs food", "small dogs food", 249, 4);
INSERT INTO Items VALUES (3, "dogs food", "big dogs food", 299, 5);
INSERT INTO Items VALUES (4, "cats food ", "cats food", 149, 3);
INSERT INTO Items VALUES (5, "beds", "green cats bed", 149, 2);
INSERT INTO Items VALUES (6, "beds", "red cats bed", 149, 1);
INSERT INTO Items VALUES (7, "aquariums", "big aquarium", 149, 8);
INSERT INTO Items VALUES (8, "aquariums", "small aquarium", 49, 4);
INSERT INTO Items VALUES (9, "cages", "Rabbits cage", 149, 3);
INSERT INTO Items VALUES (10, "cages", "medium dogs cage", 149, 3);

INSERT INTO Employees VALUES (1, "Ido", "seller", "HaShoshanim 3 Ramat Gan", 0522222222);
INSERT INTO Employees VALUES (2, "Efrat", "warehouseman", "Bialik 63 Ramat Gan", 0524924949);
INSERT INTO Employees VALUES (3, "Ronit", "seller", "Bialik 163 Ramat Hasharon", 0533333792);
INSERT INTO Employees VALUES (4, "Shlomi", "warehouseman", "Bialik 68 Tel Aviv", 0544098098);
INSERT INTO Employees VALUES (5, "Lotem", "delivery person", "HaShoteret 6 Ramat Gan", 0533909099);
INSERT INTO Employees VALUES (6, "Roni", "seller", "HaShalom 63 Ramat Gan", 0533909091);
INSERT INTO Employees VALUES (7, "Itamar", "delivery person", "Bazel 63 Tel Aviv", 0544446767);
INSERT INTO Employees VALUES (8, "Maya", "seller", "Bazel 3 Tel Aviv", 0533389898);
INSERT INTO Employees VALUES (9, "Nadav", "seller", "Mozkin 6 Tel Aviv", 0533310101);
INSERT INTO Employees VALUES (10, "Hani", "delivery person", "Mozkin 10 Tel Aviv", 0556677889);

INSERT INTO Pets VALUES (1, "a dog", "Loka", 4.5);
INSERT INTO Pets VALUES (2, "a dog", "Panda", 4);
INSERT INTO Pets VALUES (3, "a dog", "Daisy", 1.2);
INSERT INTO Pets VALUES (4, "a dog", "Mona", 5);
INSERT INTO Pets VALUES (5, "a dog", "Rokky", 11);
INSERT INTO Pets VALUES (6, "a cat", "Rio", 1);
INSERT INTO Pets VALUES (7, "a cat", "Lio", 8);
INSERT INTO Pets VALUES (8, "a fish", "Golden boy", 0.2);
INSERT INTO Pets VALUES (9, "a rabbit", "Carrot", 9);
INSERT INTO Pets VALUES (10, "a rabbit", "Spinach", 3);

INSERT INTO Costumers VALUES (1, "Yonit", "Herzel 5 Ramat Gan", 0523232333, 1);
INSERT INTO Costumers VALUES (2, "Oran", "Herzel 75 Ramat Gan", 0544778899, 2);
INSERT INTO Costumers VALUES (3, "Shani", "Haroe 125 Ramat Gan", 0532397977, 3);
INSERT INTO Costumers VALUES (4, "Neomi", "Dizengoff 102 Tel Aviv", 0505557878, 4);
INSERT INTO Costumers VALUES (5, "Atar", "Dizengoff 100 Tel Aviv", 0505999000, 5);
INSERT INTO Costumers VALUES (6, "Sahar", "Dizengoff 203 Tel Aviv", 0550009898, 6);
INSERT INTO Costumers VALUES (7, "Shira", "Dizengoff 1 Tel Aviv", 0556600111, 7);
INSERT INTO Costumers VALUES (8, "Shirel", "Yarden 2 Tel Aviv", 0546789022, 8);
INSERT INTO Costumers VALUES (9, "Adi", "Sigalit 10 Tel Aviv", 0549871234, 9);
INSERT INTO Costumers VALUES (10, "Daniel", "Bet-El 4 Tel Aviv", 0522678910, 10);

INSERT INTO Orders VALUES (1, "2022-08-01", "2022-08-02", 149, 20, 5, 1, 1, 1);
INSERT INTO Orders VALUES (2, "2022-07-01", "2022-07-03", 249, 0, 5, 3, 3, 2);
INSERT INTO Orders VALUES (3, "2022-07-01", "2022-07-01", 149, 20, 5, 3, 6, 10);
INSERT INTO Orders VALUES (4, "2022-07-07", "2022-07-10", 299, 0, 5, 4, 8, 3);
INSERT INTO Orders VALUES (5, "2022-03-03", "2022-03-05", 249, 0, 7, 5, 9, 2);
INSERT INTO Orders VALUES (6, "2022-08-10", "2022-08-12", 149, 30, 7, 6, 9, 4);
INSERT INTO Orders VALUES (7, "2022-08-05", "2022-08-06", 149, 30, 7, 7, 8, 6);
INSERT INTO Orders VALUES (8, "2022-08-03", "2022-08-05", 149, 30, 7, 8, 1, 7);
INSERT INTO Orders VALUES (9, "2022-08-02", "2022-08-05", 149, 30, 7, 9, 3, 9);
INSERT INTO Orders VALUES (10, "2022-08-03", "2022-08-07", 149, 30, 5, 10, 6, 9);

INSERT INTO PetShop(id_store,name_store,address_store,phone_number_store) 
    VALUES (1, "Panda", "Herzel 25 Ramat Gan", 036728393);

SELECT * FROM Items;
select * from Employees;
select*from Orders;
select*from Costumers;
select*from Orders order by price_order;

SELECT * FROM Orders 
WHERE date between date_sub(now(),INTERVAL 1 WEEK) and now();

SELECT Employees.name_employee FROM Orders inner join Employees on Orders.id_employee=Employees.id_employee group by Employees.name_employee order by count(*) desc limit 1;

SELECT Employees.name_employee FROM Orders inner join Employees on Orders.id_employee=Employees.id_employee group by Employees.name_employee order by price_order desc limit 1;

SELECT *,name_client FROM Orders
INNER JOIN Costumers
	ON Orders.id_client = Costumers.id_client
WHERE order_date >= now()
ORDER BY order_date;

SELECT name_client FROM Costumers
left JOIN Orders
	ON Orders.id_client = Costumers.id_client 
where Orders.id_client is null;
    
SELECT name_client,count(*) FROM Costumers
INNER JOIN Orders
	ON Orders.id_client = Costumers.id_client group by name_client
having count(*) > 1 ;

SELECT price_order, price_delivery FROM Orders
WHERE date between date_sub(now(),INTERVAL 1 WEEK) and now();


UPDATE Orders SET date_order = now() WHERE id_order = 1 and id_delivery_person = 1;

SELECT id_item FROM Orders 
INNER JOIN Items
	ON Orders.id_item = Items.id_item
WHERE date between date_sub(now(),INTERVAL 1 DAY) and now()
ORDER BY count(id_item);

UPDATE Orders SET price_order = price_order*x() WHERE id_order = 1 and x() = 1;

SELECT name_employee, price_order FROM Orders
INNER JOIN Employees
	ON Orders.id_employee = Employees.id_employee
WHERE date between date_sub(now(),INTERVAL 1 MONTH) and date_sub(now(),INTERVAL 1 YEAR) and now()
		and id_employee = 1;