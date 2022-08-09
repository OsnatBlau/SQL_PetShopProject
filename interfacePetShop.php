<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PetShop - Oren & Osnat</title>
</head>
<body>
    <?php
        $dbhost = "148.66.138.145";
        $dbuser = "dbusrShnkr221";
        $dbpass = "dbShUsr22#";
        $dbname = "dbShnkr22stud1";
  
        $connection = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname);

        if(mysqli_connect_errno()) {
            die("DB connection failed: " . mysqli_connect_error() . " (" . mysqli_connect_errno() . ")");
        }
    ?>
    <header>
        <h1><b>PetShop:</b></h1>
    </header>
    <ol>
        <li>Show all items and inventory.</li>
        <li>
            Show all orders in the last 
            <form action="#" method="get" id="my-form" style="display: inline; width: auto;">
                <input type="number" name="query2" id="query2" min="1" required style="width: 50px;">
            </form>
            weeks.
        </li>
        <li>Show the seller with the most sales of items.</li>
        <li>Show the seller with the most income.</li>
        <li>Show all current orders.</li>
        <li>Show all costumers that did not placed any order.</li>
        <li>Show regular costumers.</li>
        <li>
            Show all incomes in the past 
            <form action="#" method="get" id="my-form" style="display: inline; width: auto;">
                <input type="number" name="query8" id="query8" min="1" required style="width: 50px;">
            </form>
            months.
        </li>
    </ol>
    <form action="#" method="get" id="my-form" style="font-size: 21px;">
        <label for="number">Chose a number between 1-8:</label>
        <input type="number" name="number" id="number" min="1" max="8" placeholder="1-8" required>
        <input type="number" name="calc" id="calc" min="1" placeholder="Number" style="display:none">
        <input type="submit" value="Show query">
    </form>
    <?php
        $number=$_GET['number'];
        switch($number){
            case 1:
                $query = "SELECT * FROM Items_team3";
                $result = mysqli_query($connection,$query);
                if ($result->num_rows > 0)
                {
                    echo "<table>"; // start a table tag in the HTML

                    while($row = $result->fetch_assoc()){   //Creates a loop to loop through results
                    echo "  <tr>  
                                <td><b>" . htmlspecialchars($row['id_item']) . "</b></td>
                                <td>" . htmlspecialchars($row['type_item']) . "</td>
                                <td>" . htmlspecialchars($row['name_item']) . "</td>
                                <td>" . htmlspecialchars($row['price_item']) . "</td>
                                <td>" . htmlspecialchars($row['type_item']) . "</td>
                                <td>" . htmlspecialchars($row['amount_item']) . "</td>
                            </tr>";
                    }

                    echo "</table>"; //Close the table in HTML
                }
                else {
                    echo "0 results";
                }
                break;
            case 2:
                $num_weeks=$_GET['query2'];
                $query = "SELECT * FROM Orders_team3 
                            WHERE order_date between date_sub(now(),INTERVAL '.$num_weeks.' WEEK) and now()";
                $result = mysqli_query($connection,$query);
                if ($result->num_rows > 0)
                {
                    echo "<table>"; // start a table tag in the HTML

                    while($row = $result->fetch_assoc()){   //Creates a loop to loop through results
                    echo "  <tr>  
                                <td><b>" . htmlspecialchars($row['id_order']) . "</b></td>
                                <td>" . htmlspecialchars($row['order_date']) . "</td>
                                <td>" . htmlspecialchars($row['date_shipping']) . "</td>
                                <td>" . htmlspecialchars($row['price_order']) . "</td>
                                <td>" . htmlspecialchars($row['price_shipping']) . "</td>
                                <td>" . htmlspecialchars($row['id_delivery_person']) . "</td>
                                <td>" . htmlspecialchars($row['id_client']) . "</td>
                                <td>" . htmlspecialchars($row['id_employee']) . "</td>
                                <td>" . htmlspecialchars($row['id_item']) . "</td>
                            </tr>";
                    }

                    echo "</table>"; //Close the table in HTML
                }
                else {
                    echo "0 results";
                }
                break;
            case 3:
                $query = "SELECT Employees_team3.name_employee FROM Orders_team3 
                            inner join Employees_team3 
                                on Orders_team3.id_employee=Employees_team3.id_employee 
                            group by Employees_team3.name_employee 
                            order by count(*) desc limit 1";
                $result = mysqli_query($connection,$query);
                if ($result->num_rows > 0)
                {
                    echo "<table>"; // start a table tag in the HTML

                    while($row = $result->fetch_assoc()){   //Creates a loop to loop through results
                    echo "  <tr>
                                <td>" . htmlspecialchars($row['name_employee']) . "</td>
                            </tr>";
                    }

                    echo "</table>"; //Close the table in HTML
                }
                else {
                    echo "0 results";
                }
                break;
            case 4:
                $query = "SELECT Employees_team3.name_employee FROM Orders_team3
                            inner join Employees_team3
                                on Orders_team3.id_employee=Employees_team3.id_employee 
                            group by Employees_team3.name_employee 
                            order by price_order desc limit 1";
                $result = mysqli_query($connection,$query);
                if ($result->num_rows > 0)
                {
                    echo "<table>"; // start a table tag in the HTML

                    while($row = $result->fetch_assoc()){   //Creates a loop to loop through results
                    echo "  <tr>
                                <td>" . htmlspecialchars($row['name_employee']) . "</td>
                            </tr>";
                    }

                    echo "</table>"; //Close the table in HTML
                }
                else {
                    echo "0 results";
                }
                break;
            case 5:
                $query = "SELECT *,name_client FROM Orders_team3
                            INNER JOIN Costumers_team3
                                ON Orders_team3.id_client = Costumers_team3.id_client
                            WHERE order_date >= now()
                            ORDER BY order_date";
                $result = mysqli_query($connection,$query);
                if ($result->num_rows > 0)
                {
                    echo "<table>"; // start a table tag in the HTML

                    while($row = $result->fetch_assoc()){   //Creates a loop to loop through results
                    echo "  <tr>  
                                <td><b>" . htmlspecialchars($row['id_order']) . "</b></td>
                                <td><b>" . htmlspecialchars($row['name_client']) . "</b></td>
                                <td>" . htmlspecialchars($row['order_date']) . "</td>
                                <td>" . htmlspecialchars($row['date_shipping']) . "</td>
                                <td>" . htmlspecialchars($row['price_order']) . "</td>
                                <td>" . htmlspecialchars($row['price_shipping']) . "</td>
                                <td>" . htmlspecialchars($row['id_delivery_person']) . "</td>
                                <td>" . htmlspecialchars($row['id_client']) . "</td>
                                <td>" . htmlspecialchars($row['id_employee']) . "</td>
                                <td>" . htmlspecialchars($row['id_item']) . "</td>
                            </tr>";
                    }

                    echo "</table>"; //Close the table in HTML
                }
                else {
                    echo "0 results";
                }
                break;
            case 6:
                $query = "SELECT name_client FROM Costumers_team3
                            left JOIN Orders_team3
                                ON Orders_team3.id_client = Costumers_team3.id_client 
                            where Orders_team3.id_client is null";
                $result = mysqli_query($connection,$query);
                if ($result->num_rows > 0)
                {
                    echo "<table>"; // start a table tag in the HTML

                    while($row = $result->fetch_assoc()){   //Creates a loop to loop through results
                    echo "  <tr>
                                <td>" . htmlspecialchars($row['name_client']) . "</td>
                            </tr>";
                    }

                    echo "</table>"; //Close the table in HTML
                }
                else {
                    echo "0 results";
                }
                break;
            case 7:
                $query = "SELECT name_client,count(*) FROM Costumers_team3
                            INNER JOIN Orders_team3
                                ON Orders_team3.id_client = Costumers_team3.id_client 
                            group by name_client
                            having count(*) > 1";
                $result = mysqli_query($connection,$query);
                if ($result->num_rows > 0)
                {
                    echo "<table>"; // start a table tag in the HTML

                    while($row = $result->fetch_assoc()){   //Creates a loop to loop through results
                    echo "  <tr>
                                <td>" . htmlspecialchars($row['name_client']) . "</td>
                            </tr>";
                    }

                    echo "</table>"; //Close the table in HTML
                }
                else {
                    echo "0 results";
                }
                break;
            case 8:
                $num_months=$_GET['query8'];
                $query = "SELECT price_order, price_shipping FROM Orders_team3
                            WHERE order_date between date_sub(now(),INTERVAL '.$num_months.' MONTH) and now()";
                $result = mysqli_query($connection,$query);
                if ($result->num_rows > 0)
                {
                    $sum = 0;
                    echo "<table>"; // start a table tag in the HTML

                    while($row = $result->fetch_assoc()){   //Creates a loop to loop through results
                    echo "  <tr>
                                <td>" . htmlspecialchars($row['price_order']) . "</td>
                                <td>" . '+' . "</td>
                                <td>" . htmlspecialchars($row['price_shipping']) . "</td>
                            </tr>";
                    $sum = $sum + $row['price_order'] + $row['price_shipping'];
                    }

                    echo "</table>"; //Close the table in HTML
                    echo "<h3>" ."Total incomes: " . $sum . "</h3>";
                }
                else {
                    echo "0 results";
                }
                break;
        }
    ?>
    <?php
        //close DB connection
        mysqli_close($connection);
    ?>
</body>
</html>
