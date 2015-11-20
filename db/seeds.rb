# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).


User.create(id:1, name:"Funcionário", email:"funcionario@gmail.com", password:"123456")
User.create(id:2, name:"Administrador", email:"administrador@gmail.com", password:"1234567")