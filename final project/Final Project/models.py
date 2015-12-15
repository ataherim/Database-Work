from peewee import *

database = SqliteDatabase('airline.db')

class BaseModel(Model):
    class Meta:
        database = database

class Airlines(BaseModel):
	name = CharField()
	p_class = CharField()
	status = BooleanField()

class Airport(BaseModel):
	name = CharField()
	flight_num = BigIntegerField()
	gate = CharField()
	status = BooleanField()

class Customers(BaseModel):
	name = CharField()
	gender = CharField()
	address = CharField()
	status = BooleanField()

	class Meta:
		db_table = 'customers'
