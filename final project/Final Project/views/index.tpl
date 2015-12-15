<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Flight_Reservation</title>

<!-- Bootstrap -->
<link rel="stylesheet" href="\static\bootstrap.css">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
	<style type="text/css">
/*# sourceMappingURL=bootstrap.css.map */

#table1, #table2, #table3 {
    display: none;
}
body {
	font-size: 14px;
	line-height: 1.42857143;
	color: #333;
	 background-repeat: repeat-x;
	background-image: url("/static/backgrounds.jpg");
}
	</style>
	<script type="text/javascript">
	function show(nr) {
    document.getElementById("table1").style.display="none";
    document.getElementById("table2").style.display="none";
    document.getElementById("table3").style.display="none";
    document.getElementById("table"+nr).style.display="block";
	document.getElementById("table"+nr).style.width="90%";
}
	</script>
</head>
<body>

  <div class="container">
<div class="row">
    <div class="col-xs-7">
        <div class="media">
          <div class="media-left"> <a href="#"> <img class="media-object img-rounded" src="/static/airplane_2.svg" alt="..."> </a> </div>
          <div class="media-body">
            <h2 class="media-heading">Welcome to Ali Taheri &nbsp; &nbsp; &nbsp; Flight Reservation &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; System</h2>
            This Web Site is made To Provide The Easiest Way To Book A Reservation Over Hundred Airline Componies And Airport To comfort You To Enjoy The Simple Way of World Wide Web Experience! </div>
        </div>
      </div>
      <div class="alert-info">
        <div class="row">
          <h4 class="col-lg-4">Phone : 123-456-7890</h4>
          <h4 class="alert-info col-lg-4"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span> : ali@kent.edu</h4>
</div>
</div>
    </div>
<div class="col-sm-8 col-lg-12"><strong class="btn-primary" id="Header" name="Header">Customers</strong> </div>
<div class="bg-primary" id="form_div">
    <form id="form1" name="form1" method="post" action="/new">
        <br>
        <br>
<br>
<label for="textfield3">Name: </label>
<input type="text" name="name" maxlength="100" value="name"id="name">
      <label for="textfield2">Address: </label>
        <input type="text" name="address" maxlength="100" value="address" id="address">
        <label for="select">Gender: </label>
        <select name="gender" id="select" >
          <option value="F" id="genderF">Female</option>
          <option value="M" id="genderM">Male</option>
        </select>
        <br>
<label for="select2">Airline Company Name:</label>

        <select name="airline" id="airline">
        %for row in rows:
       <option > {{row[1]}}</option>
		%end
        </select>
<label for="select3">Class: </label>
        <select name="class" id="class">
		%for row in rows:
       <option> {{row[2]}}</option>
		%end
        </select>
<label for="select3">Airport Name:</label>
<select name="airport" id="airport">
		%for row2 in rows2:
       <option> {{row2[1]}}</option>
		%end
</select>
<br>
<label for="select3">Flight Number:</label>
<select name="flightnum" id="flightnum">
		%for row2 in rows2:
       <option> {{row2[2]}}</option>
        %end
</select>
<label for="select3">Gate:</label>
<select name="gate" id="gate">
		%for row2 in rows2:
       <option> {{row2[3]}}</option>
		%end
</select>
<br>
<br>
<input name="insert_btn" type="submit" id="insert_btn" title="Insert" value="Submit">
<br>
<br>
&nbsp;
    </form>
</div>
<div class="col-sm-8 col-lg-12"><strong class="btn-primary" id="Header2" name="Header">View</strong></div>
<div class="bg-primary" id="form_div2">
  <div id="div_view" name="view1">
	<select name="gender" id="select" onchange="show(value)">
		<option value="2" id="airline">Airlines</option>
		<option value="3" id="airport">AirPort</option>
		<option value="1" id="customers">Customers</option>
	</select>
	<br/>
	<table id="table1" width="90%" border="1">
  <tbody>
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Name</th>
      <th scope="col">Gender</th>
      <th scope="col">Address</th>
	  <th scope="col">Delete</th>
    </tr>
		%for row3 in rows3:
    <tr>

      <td><a  style="color:#FFFFFF" href="/editc/{{row3[0]}}">{{row3[0]}}</a></td>
      <td><a  style="color:#FFFFFF" href="/editc/{{row3[0]}}">{{row3[1]}}</a></td>
      <td><a  style="color:#FFFFFF" href="/editc/{{row3[0]}}">{{row3[2]}}</a></td>
      <td><a  style="color:#FFFFFF" href="/editc/{{row3[0]}}">{{row3[3]}}</a></td>
	  <td><a  style="color:#FFFFFF" href="/deletec/{{row3[0]}}"><img src="/static/trash.png" style="width:16px;height:16px;border:0;"/></a></td>
    </tr>
	    %end
  </tbody>
</table>
	<table id="table2" width="90%" border="1">
  <tbody>
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Airline Company Name</th>
      <th scope="col">Class</th>
	  <th scope="col">Delete</th>
    </tr>
		%for row in rows:
    <tr>

      <td><a  style="color:#FFFFFF" href="/edital/{{row[0]}}">{{row[0]}}</a></td>
      <td><a  style="color:#FFFFFF" href="/edital/{{row[0]}}">{{row[1]}}</a></td>
      <td><a  style="color:#FFFFFF" href="/edital/{{row[0]}}">{{row[2]}}</a></td>
	  <td><a  style="color:#FFFFFF" href="/deleteal/{{row[0]}}"><img src="/static/trash.png" style="width:16px;height:16px;border:0;"/></a></td>
    </tr>
	    %end
  </tbody>
</table>
	<table id="table3" width="90%" border="1">
  <tbody>
    <tr>
      <th scope="col">ID</th>
      <th scope="col">AirPort Name</th>
      <th scope="col">Flight</th>
      <th scope="col">Gate</th>
	  <th scope="col">Delete</th>
    </tr>
		%for row2 in rows2:
    <tr>

      <td><a  style="color:#FFFFFF" href="/editap/{{row2[0]}}">{{row2[0]}}</a></td>
      <td><a  style="color:#FFFFFF" href="/editap/{{row2[0]}}">{{row2[1]}}</a></td>
      <td><a  style="color:#FFFFFF" href="/editap/{{row2[0]}}">{{row2[2]}}</a></td>
      <td><a  style="color:#FFFFFF" href="/editap/{{row2[0]}}">{{row2[3]}}</a></td>
	  <td><a  style="color:#FFFFFF" href="/deleteap/{{row2[0]}}"><img src="/static/trash.png" style="width:16px;height:16px;border:0;"/></a></td>
    </tr>
	    %end
  </tbody>
</table>
  </div>
</div>
</div>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
<script src="file:///C|/Users/Betis/Documents/Database/js/jquery-1.11.2.min.js"></script> 
<!-- Include all compiled plugins (below), or include individual files as needed --> 
<script src="file:///C|/Users/Betis/Documents/Database/js/bootstrap.min.js"></script>
</body>
</html>
