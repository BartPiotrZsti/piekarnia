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
    <h1>Admin
    </h1>

    

    
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

        $sql="SELECT * FROM pracownicy";
        $zapytanie=mysqli_query($connect, $sql);

        echo("<br>");

        echo("Pracownicy"."<br>");
        
        echo('<table class="tabela" >');
        echo('  <thead>
                    <tr>
                        <th>Imie</th>
                        <th>Nazwisko</th>
                        <th>Funkcja</th>
                        <th>Telefon</th>
                        <th>Wiek</th>
                        <th>Adres Zamieszkania</th>
                    </tr>
                </thead>');
         while ($row = mysqli_fetch_row($zapytanie)) {
            echo("<tr>");
            for ($i=0; $i < count($row) -1 ; $i++) { 
                echo ("<td>" .$row[$i]."</td>");
            }
            echo("</tr>");
        }
        
        echo("</table>");


        echo('<h3>Dodaj Pracowników</h3>
            <form method="post">
                <label for="imie_p">Imie</label>
                <input type="text" name="imie_p">
                <br>
                <label for="nazwisko_p">Nazwisko</label>
                <input type="text" name="nazwisko_p">
                <br>
                <label for="funkcja">Funkcja</label>
                <input type="text" name="funkcja">
                <br>
                <label for="telefon_p">Telefon</label>
                <input type="tel" name="telefon_p">
                <br>
                <label for="wiek">Wiek</label>
                <input type="text" name="wiek">
                <br>
                <label for="adres">Adres Zamieszkania</label>
                <input type="text" name="adres">
                <br>
                <button type="reset">Reset</button>
                <button type="submit" name="submit1" value="sub1" >Wyślij</button>
            </form>
            ');

             if (!empty($_POST['imie_p']) && !empty($_POST['nazwisko_p']) && !empty($_POST['funkcja']) && !empty($_POST['telefon_p']) && !empty($_POST['wiek']) && !empty($_POST['adres'])) {
                $imiep = htmlspecialchars($_POST['imie_p']);
                $nazwiskop = htmlspecialchars($_POST['nazwisko_p']);
                $funkcjap = htmlspecialchars($_POST['funkcja']);
                $telefonp = htmlspecialchars($_POST['telefon_p']);
                $wiekp = htmlspecialchars($_POST['wiek']);
                $adresp = htmlspecialchars($_POST['adres']); 

                
                
                $sqlupdate1 = "INSERT INTO pracownicy (imie, nazwisko, funkcja, telefon,wiek, adres_zam ) VALUES ('$imiep','$nazwiskop','$funkcjap', '$telefonp', '$wiekp', '$adresp');";
                

                $sql_check = "SELECT COUNT(*) FROM pracownicy WHERE imie='$imiep' AND nazwisko='$nazwiskop' AND telefon='$telefonp'";
                $sql_check_tel = "SELECT COUNT(*) FROM pracownicy WHERE telefon='$telefonp'";
                $result_tel=mysqli_query($connect,$sql_check_tel);
                $result = mysqli_query($connect, $sql_check);
                $row_tel = mysqli_fetch_array($result_tel);
                $row_check = mysqli_fetch_array($result);
                
                if ($row_check[0] > 0 ) {
                    echo "<h3>Nie można wpisać takiej samej osoby</h3>";
                } else {
                    if ($row_tel[0] > 0) {
                        echo "<h3>Podany numer telefonu jest już w bazie</h3>";
                    }else {
                        $update1 = mysqli_query($connect, $sqlupdate1);
                    }
                        
                }
            }
            else {
                echo"Wpisz wszystkie dane";
            }


        $sql2="SELECT * FROM klienci";
        $zapytanie2=mysqli_query($connect, $sql2);

        echo("<br>"."Klienci"."<br>");

        echo('<table class="tabela" >');
        echo('  <thead>
                    <tr>
                        <th>Imie</th>
                        <th>Nazwisko</th>
                        <th>Adres E-mail</th>
                        <th>Telefon</th>
                    </tr>
                </thead>');
         while ($row = mysqli_fetch_row($zapytanie2)) {
            echo("<tr>");
            for ($i=0; $i < count($row) -1 ; $i++) { 
                echo ("<td>" .$row[$i]."</td>");
            }
            echo("</tr>");
        }
        
        echo("</table>");


        echo('<h3>Dodaj Klientów</h3>
            <form method="post">
                <label for="imie_k">Imie</label>
                <input type="text" name="imie_k">
                <br>
                <label for="nazwisko_k">Nazwisko</label>
                <input type="text" name="nazwisko_k">
                <br>
                <label for="adres_e">Adres E-mail</label>
                <input type="text" name="adres_e">
                <br>
                <label for="telefon_k">Telefon</label>
                <input type="tel" name="telefon_k">
                <br>
                <button type="reset">Reset</button>
                <button type="submit" name="sumbit2" value="sub2">Wyślij</button>
            </form>
            ');

            if (!empty($_POST['imie_k']) && !empty($_POST['nazwisko_k']) && !empty($_POST['adres_e']) && !empty($_POST['telefon_k'])) {
                $imiek = htmlspecialchars($_POST['imie_k']);
                $nazwiskok = htmlspecialchars($_POST['nazwisko_k']);
                $adrese = htmlspecialchars($_POST['adres_e']);
                $telefonk = htmlspecialchars($_POST['telefon_k']);

                
                
                $sqlupdate2 = "INSERT INTO klienci (imie, nazwisko, adres_email, telefon ) VALUES ('$imiek','$nazwiskok','$adrese', '$telefonk');";
                

                $sql_check_k = "SELECT COUNT(*) FROM klienci WHERE imie='$imiek' AND nazwisko='$nazwiskok' AND telefon='$telefonk' AND adres_email='$adrese'";
                $sql_check_tel_k = "SELECT COUNT(*) FROM klienci WHERE telefon='$telefonk'";
                $sql_check_email_k = "SELECT COUNT(*) FROM klienci WHERE adres_email='$adrese'";

                $result_tel_k=mysqli_query($connect,$sql_check_tel_k);
                $result_email_k=mysqli_query($connect,$sql_check_email_k);
                $result_k = mysqli_query($connect, $sql_check_k);
                
                $row_tel_k = mysqli_fetch_array($result_tel_k);
                $row_email_k = mysqli_fetch_array($result_email_k);
                $row_check_k = mysqli_fetch_array($result_k);
                
                if ($row_check_k[0] > 0 ) {
                    echo "<h3>Nie można wpisać takiej samej osoby</h3>";
                } else {
                    if ($row_tel_k[0] > 0) {
                        echo "<h3>Podany numer telefonu jest już w bazie</h3>";
                    }else {
                        if ($row_email_k[0]>0) {
                            echo "<h3>Podany email jest już w bazie</h3>";
                        }else {
                            $update2 = mysqli_query($connect, $sqlupdate2);
                        }
                        
                    }
                        
                }
            }
            else {
                echo"Wpisz wszystkie dane";
            }





        mysqli_close($connect);
    ?>

        

</body>
</html>