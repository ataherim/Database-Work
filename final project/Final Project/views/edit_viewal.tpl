<p>Edit Airline with ID = {{id}}</p>
<form action="/edital/{{id}}" method="post">
<label for="select3">Airline Name:</label>
<input type="text" name="name" value="{{name}}" size="100" maxlength="100">
<br/>
<label for="select3">Class:</label>
<input type="text" name="p_class" value="{{p_class}}" size="100" maxlength="100">
<br/>
<br/>
<input type="submit" name="save" value="save">
</form>