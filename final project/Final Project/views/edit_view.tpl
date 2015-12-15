<p>Edit Customer with ID = {{id}}</p>
<form action="/editc/{{id}}" method="post">
<label for="select3">Name:</label>
<input type="text" name="name" value="{{name}}" size="100" maxlength="100">
<br/>
<label for="select3">Gender:</label>
<input type="text" name="gender" value="{{gender}}" size="100" maxlength="100">
<br/>
<label for="select3">Address:</label>
<input type="text" name="address" value="{{address}}" size="100" maxlength="100">
<br/>
<br/>
<input type="submit" name="save" value="save">
</form>