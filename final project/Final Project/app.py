from bottle import default_app, run, route
from bottle import get, put, post, request, template
from bottle import static_file

from models import *

@get('/')
@get('/index')
@get('/index/<status:int>')
def get_list(status=-1):
	if (status >= 0):
		query =  Airlines.select().where(Airlines.status == status).order_by(Airlines.name.asc())
		query2 = Airport.select().where(Airport.status == status).order_by(Airport.name.asc())
		query3 = Customers.select().where(Customers.status == status).order_by(Customers.name.asc())
	else:
		query = Airlines.select().order_by(Airlines.name.asc())
		query2 = Airport.select().order_by(Airport.name.asc())
		query3 = Customers.select().order_by(Customers.name.asc())
	result = []
	result2 = []
	result3 = []
	for airlines in query:
		result.append((airlines.id,airlines.name,airlines.p_class,airlines.status))
	for airport in query2:
		result2.append((airport.id,airport.name,airport.flight_num,airport.gate,airport.status))
	for customers in query3:
		result3.append((customers.id,customers.name,customers.gender,customers.address,customers.status))
	return template('index', rows=result,rows2=result2,rows3=result3)

@get('/new') 
def get_new():
    return get_list()
    
@post('/new')
def post_new():
	name_ = request.forms.get('name', '').strip()
	address_ = request.forms.get('address', '').strip()
	gender_ = request.forms.get('gender', '').strip()
	airline_ = request.forms.get('airline', '').strip()
	class_ = request.forms.get('class', '').strip()
	airport_ = request.forms.get('airport', '').strip()
	flightnum = request.forms.get('flightnum', '').strip()
	gate_ = request.forms.get('gate', '').strip()
	airlines = Airlines.create(name = airline_ ,p_class = class_,status = 1)
	airport = Airport.create(name = airport_ ,flight_num = flightnum, gate = gate_,  status = 1)
	customers = Customers.create(name = name_ ,gender = gender_,address = address_,  status = 1)
	return get_list()

@get('/editc/<id:int>')
def get_edit(id):
    customers = Customers.get(id=id)
    return template('edit_view', id=id, name=customers.name, gender=customers.gender,address = customers.address, status=customers.status)

@post('/editc/<id:int>')
def post_edit(id):
	name = request.forms.get('name', '').strip()
	gender = request.forms.get('gender','').strip()
	address = request.forms.get('address','').strip()
	customers = Customers.get(id=id)
	customers.name = name
	customers.gender = gender
	customers.address = address
	customers.save()
	return get_list()
@get('/deletec/<id:int>')
def confirm_delete_item(id):
    customers = Customers.get(id=id)
    return template('delete_view', id=id, name=customers.name)

@post('/deletec/<id:int>')
def delete_item(id):
    customers = Customers.get(id=id)
    customers.delete_instance()
    return get_list()

@get('/edital/<id:int>')
def get_edit(id):
	airline = Airlines.get(id=id)
	return template('edit_viewal', id=id, name=airline.name, p_class=airline.p_class)

@post('/edital/<id:int>')
def post_edit(id):
	name = request.forms.get('name', '').strip()
	p_class = request.forms.get('p_class', '').strip()
	airline = Airlines.get(id=id)
	airline.name = name
	airline.p_class = p_class
	airline.save()
	return get_list()

@get('/deleteal/<id:int>')
def confirm_delete_item(id):
	airline = Airlines.get(id=id)
	return template('delete_viewal', id=id, name=airline.name, p_class=airline.p_class)

@post('/deleteal/<id:int>')
def delete_item(id):
	airline = Airlines.get(id=id)
	airline.delete_instance()
	return get_list()

@get('/editap/<id:int>')
def get_edit(id):
	airport = Airport.get(id=id)
	return template('edit_viewap', id=id, name=airport.name, flight_num=airport.flight_num,gate = airport.gate)

@post('/editap/<id:int>')
def post_edit(id):
	name = request.forms.get('name', '').strip()
	flight_num = request.forms.get('flight_num', '').strip()
	gate = request.forms.get('gate', '').strip()
	airport = Airport.get(id=id)
	airport.name = name
	airport.flight_num = flight_num
	airport.gate = gate
	airport.save()
	return get_list()

@get('/deleteap/<id:int>')
def confirm_delete_item(id):
	airport = Airport.get(id=id)
	return template('delete_viewap', id=id, name=airport.name, flight_num=airport.flight_num,gate = airport.gate)

@post('/deleteap/<id:int>')
def delete_item(id):
	airport = Airport.get(id=id)
	airport.delete_instance()
	return get_list()

@get('/static/<filename>')
def server_static(filename):
    print(filename)
    return static_file(filename, root='static')

if __name__ == "__main__":
    run(reloader = True, host="0.0.0.0")
else:
    application = default_app()

