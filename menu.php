<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
       
        td {
            border: solid 1px black;
        }
        
    </style>
</head>
<body>
    <h1>Menu</h1>

    
    <?php

        $host="localhost";
        $username="root";
        $pass="";
        $dbname= "piekarnia";
        $connect = new mysqli($host,$username,$pass,$dbname);
    

        if ($connect==false) {
            echo("<h2>Connection_failed</h2>");
            exit;
        }
        else{
            echo"Connected....<br>";
        }

        $sql="SELECT menu.nazwa_prod, kategorie_produkt.nazwa_kat, menu.cena, menu.masa_gramy,menu.skladniki,menu.kolor, menu.baza FROM menu inner JOIN kategorie_produkt on menu.kategoria_prod=kategorie_produkt.id;";
        $zapytanie=mysqli_query($connect, $sql);

        echo("<br>");

        
        echo('<table class="tabela" >');
        echo('  <thead>
                    <tr>
                        <th>Nazwa</th>
                        <th>Kategoria</th>
                        <th>cena(zł)</th>
                        <th>waga(g)</th>
                        <th>składniki</th>
                        <th>kolor</th>
                        <th>baza</th>
                    </tr>
                </thead>');
         while ($row = mysqli_fetch_row($zapytanie)) {
            echo("<tr>");
            for ($i=0; $i < count($row) ; $i++) { 
                echo ("<td>" .$row[$i]."</td>");
            }
            echo("</tr>");
        }
        
        echo("</table>");


        
        
        
        mysqli_close($connect);
    ?>

        

</body>
</html>