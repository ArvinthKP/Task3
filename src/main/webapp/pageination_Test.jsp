<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html xmlns:ml="http://www.thymeleaf.org">
<html>

<head>
    <meta charset="ISO-8859-1">
    <title>Retailer</title>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

</head>

<body>

    <script>
        var i=0;
        function add() {
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    var l = JSON.parse(this.responseText);
                    // alert(r.name);
                    var ta = ` <table id="table1" border="1px solid black" cellpadding="5px">
                            <tr>
                                <td onclick="sort()">Name</td>
                                <td>Phone</td>
                                <td>Email Address</td>
                            </tr>
                            
                        </table>
                        <br>
                        <button onclick="next()">Next</button>
                        <button onclick="prev()">Prev</button>
                        <br>
                        <br>
                        <button onclick="count()">Count</button>`;
                    document.getElementById("table2").innerHTML = ta;
                    var currentPage = 0;
                    var maximumRecords = 10;

                    var counter = 0;
                    console.log("i= "+i);
                    var dummy_i=i;
                    for (dummy_i; dummy_i < l.length;dummy_i++ ) {
                        if(counter<10){
                        var row = document.getElementById("table1").insertRow();
                        var cell1 = row.insertCell(0);
                        var cell2 = row.insertCell(1);
                        var cell3 = row.insertCell(2);
                        cell1.innerHTML = l[dummy_i].name;
                        cell2.innerHTML = l[dummy_i].phone;
                        cell3.innerHTML = l[dummy_i].email;
                        counter++;                        
                         }else{
                            document.getElementById("table2").innerHTML = ta;
                            counter=0;
                         }                       

                    }

                    counter = 0;

                }
            };
            xhttp.open("GET", "http://localhost:8080/add/" + document.getElementById("enteredText").value, true);

            xhttp.send();
        }
        function page() {
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    var l = JSON.parse(this.responseText);
                    // alert(r.name);
                    var ta = ` <table id="table1" border="1px solid black" cellpadding="5px">
                            <tr>
                                <td onclick="sort()">Name</td>
                                <td>Phone</td>
                                <td>Email Address</td>
                            </tr>
                            
                        </table>
                        <br>
                        <button onclick="next()">Next</button>
                        <button onclick="prev()">Prev</button>
                        <br>
                        <br>
                        <button onclick="count()">Count</button>`;
                    document.getElementById("table2").innerHTML = ta;
                    var currentPage = 0;
                    var maximumRecords = 10;

                    var counter = 0;
                    console.log("i= "+i);                    var dummy_i=i;
                    for (dummy_i; dummy_i < l.length;dummy_i++ ) {
                        if(counter<10){
                        var row = document.getElementById("table1").insertRow();
                        var cell1 = row.insertCell(0);
                        var cell2 = row.insertCell(1);
                        var cell3 = row.insertCell(2);
                        cell1.innerHTML = l[dummy_i].name;
                        cell2.innerHTML = l[dummy_i].phone;
                        cell3.innerHTML = l[dummy_i].email;
                        counter++;                        
                         }                     

                    }

                    counter = 0;

                }
            };
            xhttp.open("GET", "http://localhost:8080/count" , true);

            xhttp.send();
        }


        function next() {
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    var l = JSON.parse(this.responseText);
                    console.log("inside next i= "+i);
                    if(l.length>i)
                    {
                        if((i+10)<l.length)
                        {
                            i=i+10;
                        }else{
                            let te=l.length-i;
                            i=te;
                        }
                        page();
                    }else{
                        i=0;
                    }
                    console.log("after next i= "+i);
                    
                    
                }
            };
            xhttp.open("GET", "http://localhost:8080/count", true);
            xhttp.send();
        }
        function prev() {
            console.log("inside prev i= "+i);
            i=i-10;
            if(i<10)
            {
                i=0;
            }          
            console.log("after prev i= "+i);  
            page();
        }

        // function next() {
        //     if(i>10)
        //     {
        //         i=i+10;
        //     }
        //     else{
        //         i = i;
        //     }
            
        //     add();
        // }
    </script>


    <div class="container">
        <div style="margin-top: 40px;">
            <input type="text" id="enteredText" placeholder="Enter Retailer ID">
            <button onclick="search()">Search</button>
            <button onclick="add()">Add</button>
        </div>
        <br>
        <br>
        <div id="data">

        </div>
        <br>
        <br>
        <div id="table2">

        </div>
        <br>

        <br>
        <div id="count">

        </div>
    </div>



</body>

</html>