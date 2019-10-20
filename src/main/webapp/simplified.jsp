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
        var i = 0;
        var list;
        var tableCreation = `<p>Max Of 10 Records Will Be Displayed Per Table</p>
                    <table id="table1" border="1px solid black" cellpadding="5px">
                            <tr>
                                <td onclick="sort()">Name</td>
                                <td>Phone</td>
                                <td>Email Address</td>
                            </tr>                            
                    </table><br>`;
        var noOfButtons;


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

        function add() {
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    let l = JSON.parse(this.responseText);
                    list = l;
                    if ((l.length % 10) == 0)
                        noOfButtons = (l.length / 10);
                    else
                        noOfButtons = (l.length / 10) + 1;
                    let tablceCreated = tableCreation;
                    for (let i = 1; i <= noOfButtons; i++) {
                        tablceCreated = tablceCreated + `<button onclick="pagination(` + i + `)">` + i + `</button>`;
                    }
                    tablceCreated = tablceCreated +
                        `<br><br><button onclick="count()">Count</button>`;
                    document.getElementById("table2").innerHTML = tablceCreated;
                    document.getElementById("count").innerHTML = "";
                    let counter = 0;
                    for (let i = 0; i < l.length; i++) {
                        if (counter < 10) {
                            let row = document.getElementById("table1").insertRow();
                            let cell1 = row.insertCell(0);
                            let cell2 = row.insertCell(1);
                            let cell3 = row.insertCell(2);
                            cell1.innerHTML = l[i].name;
                            cell2.innerHTML = l[i].phone;
                            cell3.innerHTML = l[i].email;
                            counter++;
                        } else {
                            document.getElementById("table2").innerHTML = tablceCreated;
                            counter = 0;
                        }
                    }
                }
            };
            xhttp.open("GET", "http://localhost:8080/add/" + document.getElementById("enteredText").value, true);
            xhttp.send();
        }

        // Counting Of Records
        function count() {
            let arr = [];
            let print = [];
            let f = 0;
            for (i in list) {
                for (j in arr) {
                    if (list[i].name == arr[j].name) {
                        arr[j].count++;
                        f = 1;
                        break;
                    } else {
                        f = 0;
                    }
                }
                if (f == 0) {
                    arr.push({ "name": list[i].name, "count": 1 });
                    f = 0;
                }
            }
            for (k in arr) {
                let count = "<h5>Name : " + arr[k].name + "</h5></br>" +
                    "<h5>Count : " + arr[k].count + "</h5></br>";
                print.push(count);
            }
            for (k in print) {

                document.getElementById("count").innerHTML = print.join();
            }
        }



        function sort() {
            list.sort(function (a, b) {
                if (a.name > b.name) {

                    return 1;
                }
                else {

                    return -1;
                }
            });
            document.getElementById("count").innerHTML = "";
            let tablceCreated = tableCreation;
            for (let i = 1; i <= noOfButtons; i++) {
                tablceCreated = tablceCreated + `<button onclick="pagination(` + i + `)">` + i + `</button>`;
            }
            tablceCreated = tablceCreated +
                `<br><br><button onclick="count()">Count</button>`;
            document.getElementById("table2").innerHTML = tablceCreated;
            let counter = 0;
            for (let i = 0; i < list.length; i++) {
                if (counter < 10) {
                    let row = document.getElementById("table1").insertRow();
                    let cell1 = row.insertCell(0);
                    let cell2 = row.insertCell(1);
                    let cell3 = row.insertCell(2);
                    cell1.innerHTML = list[i].name;
                    cell2.innerHTML = list[i].phone;
                    cell3.innerHTML = list[i].email;
                    counter++;
                }
            }
        }

        // Code For Pagination
        function page(start, end) {

            document.getElementById("count").innerHTML = "";
            var tablceCreated = tableCreation;
            for (let i = 1; i <= noOfButtons; i++) {
                tablceCreated = tablceCreated + `<button onclick="pagination(` + i + `)">` + i + `</button>`;
            }
            tablceCreated = tablceCreated +
                `<br><br><button onclick="count()">Count</button>`;
            document.getElementById("table2").innerHTML = tablceCreated;
            for (let i = start; i < end; i++) {
                var row = document.getElementById("table1").insertRow();
                var cell1 = row.insertCell(0);
                var cell2 = row.insertCell(1);
                var cell3 = row.insertCell(2);
                cell1.innerHTML = list[i].name;
                cell2.innerHTML = list[i].phone;
                cell3.innerHTML = list[i].email;

            }
        }

        // Code For Functioning of Page Numbers
        function pagination(index) {
            if (index * 10 < list.length)
                page((index * 10) - 10, index * 10);
            else
                page((index * 10) - 10, list.length);
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
        <br>
        <div id="count">

        </div>
    </div>
</body>
</html>