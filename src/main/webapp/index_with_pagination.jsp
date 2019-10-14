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
        // Code For Search
        function search() {
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    var r = JSON.parse(this.responseText);

                    var data = "<h5>Name : " + r.name + "</h5></br>" +
                        "<h5>Country : " + r.country + "</h5></br>" +
                        "<h5>State : " + r.state + "</h5></br>" +
                        "<h5>Pincode : " + r.pincode + "</h5></br>" +
                        "<h5>Phone : " + r.phone + "</h5></br>" +
                        "<h5>Email : " + r.email + "</h5></br>" +
                        "<h5>Address : " + r.address + "</h5></br>";

                    document.getElementById("data").innerHTML =
                        data;
                }
            };
            xhttp.open("GET", "http://localhost:8080/find/" + document.getElementById("enteredText").value, true);
            xhttp.send();

        }

        // Code For Adding To Table

        var i = 0;
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
                    console.log("i= " + i);
                    var dummy_i = i;
                    for (dummy_i; dummy_i < l.length; dummy_i++) {
                        if (counter < 10) {
                            var row = document.getElementById("table1").insertRow();
                            var cell1 = row.insertCell(0);
                            var cell2 = row.insertCell(1);
                            var cell3 = row.insertCell(2);
                            cell1.innerHTML = l[dummy_i].name;
                            cell2.innerHTML = l[dummy_i].phone;
                            cell3.innerHTML = l[dummy_i].email;
                            counter++;
                        } else {
                            document.getElementById("table2").innerHTML = ta;
                            counter = 0;
                        }
                    }
                    counter = 0;
                }
            };
            xhttp.open("GET", "http://localhost:8080/add/" + document.getElementById("enteredText").value, true);

            xhttp.send();
        }


        function count() {

            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    var l = JSON.parse(this.responseText);
                    var arr = [];
                    var print = [];
                    var f = 0;

                    for (ii in l) {
                        for (j in arr) {
                            if (l[ii].name == arr[j].name) {
                                arr[j].count++;
                                f = 1;
                                break;
                            } else {
                                f = 0;
                            }
                        }
                        if (f == 0) {
                            arr.push({ "name": l[ii].name, "count": 1 });
                            f = 0;
                        }
                    }

                    console.log(arr);
                    for (k in arr) {
                        var count = "<h5>Name : " + arr[k].name + "</h5></br>" +
                            "<h5>Count : " + arr[k].count + "</h5></br>";
                        print.push(count);
                    }
                    for (k in print) {

                        document.getElementById("count").innerHTML = print.join();
                    }
                }
            };
            xhttp.open("GET", "http://localhost:8080/count", true);

            xhttp.send();
        }

        function sort() {
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    var l = JSON.parse(this.responseText);
                    var arr = [];
                    var print = [];                    
                    console.log(l.sort(function(a, b){
                         if(a.name > b.name)
                         {
                            
                            return 1;
                         }                         
                         else
                         {
                          
                            return -1;
                         }                         
                        })) ;
                    console.log("inside sort");
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
                    console.log(l);
                    console.log("i= " + i);  
                    for (i in l) {                        
                            var row = document.getElementById("table1").insertRow();
                            var cell1 = row.insertCell(0);
                            var cell2 = row.insertCell(1);
                            var cell3 = row.insertCell(2);
                            cell1.innerHTML = l[i].name;
                            cell2.innerHTML = l[i].phone;
                            cell3.innerHTML = l[i].email;
                        
                    }
                    counter = 0;                  
                
               
            }
        };
        xhttp.open("GET", "http://localhost:8080/count", true);

        xhttp.send();
        }

        // Code For Pagination
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
                    console.log("i= " + i); var dummy_i = i;
                    for (dummy_i; dummy_i < l.length; dummy_i++) {
                        if (counter < 10) {
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
            xhttp.open("GET", "http://localhost:8080/count", true);

            xhttp.send();
        }


        function next() {
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    var l = JSON.parse(this.responseText);
                    console.log("inside next i= " + i);
                    if (l.length > i) {
                        if ((i + 10) < l.length) {
                            i = i + 10;
                        } else {
                            let te = l.length - i;
                            i = te;
                        }
                        page();
                    } else {
                        i = 0;
                    }
                    console.log("after next i= " + i);
                }
            };
            xhttp.open("GET", "http://localhost:8080/count", true);
            xhttp.send();
        }
        function prev() {
            console.log("inside prev i= " + i);
            i = i - 10;
            if (i < 10) {
                i = 0;
            }
            console.log("after prev i= " + i);
            page();
        }
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
        <!-- <div>
            <button onclick="count()">Count</button>
        </div> -->
        <br>
        <div id="count">

        </div>
    </div>



</body>

</html>