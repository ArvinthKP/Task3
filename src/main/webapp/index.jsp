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

        function add() {
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    var l = JSON.parse(this.responseText);
                    // alert(r.name);
                    var ta=` <table id="table1" border="1px solid black" cellpadding="5px">
                            <tr>
                                <td onclick="sort()">Name</td>
                                <td>Phone</td>
                                <td>Email Address</td>
                            </tr>
                            
                        </table>`;
                        document.getElementById("table2").innerHTML = ta;
                    for (i in l) {                        
                            var row = document.getElementById("table1").insertRow();
                            var cell1 = row.insertCell(0);
                            var cell2 = row.insertCell(1);
                            var cell3 = row.insertCell(2);
                            cell1.innerHTML = l[i].name;
                            cell2.innerHTML = l[i].phone;
                            cell3.innerHTML = l[i].email;
                        
                    }
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
                    var arr=[];
                    var print=[];                   
                   var f=0;
                
                    for (i in l) {                        
                            for(j in arr)
                            {
                                if(l[i].name==arr[j].name){
                                    arr[j].count++;
                                    f=1;  
                                    break;                                  
                                }else{
                                    f=0;
                                }
                            }  
                            if(f==0)
                            {
                                arr.push({"name":l[i].name,"count":1});
                                f=0;
                            }                         
                        }                   
                    
                        console.log(arr);
                    for(k in arr){
                        var count="<h5>Name : " + arr[k].name + "</h5></br>" +
                        "<h5>Count : " + arr[k].count + "</h5></br>" ;
                        print.push(count);
                    }
                    for(k in print){
                        
                        document.getElementById("count").innerHTML = print.join();
                    }
                }
            };
            xhttp.open("GET", "http://localhost:8080/count", true);

            xhttp.send();
        }

        function sort(){
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    var l = JSON.parse(this.responseText);
                    var arr=[];
                    var print=[];
                   // console.log(arr);
                   for(i in l)
                   {
                         l.sort(function(a, b){
                         return a.name - b.name;
                        });
                   }
                   
                   var ta=` <table id="table1" border="1px solid black" cellpadding="5px">
                            <tr>
                                <td onclick="sort()">Name</td>
                                <td>Phone</td>
                                <td>Email Address</td>
                                <td>Sort</td>
                            </tr>
                            
                        </table>`;
                        document.getElementById("table2").innerHTML = ta;
                    for (i in l) {                        
                            var row = document.getElementById("table1").insertRow();
                            var cell1 = row.insertCell(0);
                            var cell2 = row.insertCell(1);
                            var cell3 = row.insertCell(2);
                            cell1.innerHTML = l[i].name;
                            cell2.innerHTML = l[i].phone;
                            cell3.innerHTML = l[i].email;
                        
                    }
                   
                   
                   var f=0;
                    for (i in l) {
                        
                            for(j in arr)
                            {
                                if(l[i].name==arr[j].name){
                                    arr[j].count++;
                                    f=1;  
                                    break;                                  
                                }else{
                                    f=0;
                                }
                            }  
                            if(f==0)
                            {
                                arr.push({"name":l[i].name,"count":1});
                                f=0;
                            }                         
                        }                        
                    
                        console.log(arr);
                        arr=arr.sort();
                    for(k in arr){
                        var count="<h5>Name : " + arr[k].name + "</h5></br>" +
                        "<h5>Count : " + arr[k].count + "</h5></br>" ;
                        print.push(count);
                    }
                    print=print.sort();
                    for(k in print){
                        
                        document.getElementById("count").innerHTML = print.join();
                    }
                }
            };
            xhttp.open("GET", "http://localhost:8080/count", true);

            xhttp.send();
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
        <div>
            <button onclick="count()">Count</button>
        </div>
        <br>
        <div id="count">

        </div>
    </div>



</body>

</html>