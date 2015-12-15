<p>Edit Airport with ID = {{id}}</p>
<form action="/editap/{{id}}" method="post">
<label for="select3">Airport Name:</label>
<input type="text" name="name" value="{{name}}" size="100" maxlength="100">
<br/>
<label for="select3">Flight Number:</label>
<input type="text" name="flight_num" value="{{flight_num}}" size="100" maxlength="100">
<br/>
<label for="select3">Gate:</label>
<input type="text" name="gate" value="{{gate}}" size="100" maxlength="100">
<br/>
<br/>
<input type="submit" name="save" value="save">
</form>