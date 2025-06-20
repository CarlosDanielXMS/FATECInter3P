insert into Cliente (nome,telefone,email,senha,status)values
('Carlos',17996710451,'Carlinho@gmail.com','23or2o3nd33d3',1),
('Santiago',17996789873,'Santi@gmail.com','34f3g1d3fc31c',1),
('Alvaro',17238402749,'Alvo@gmail.com','23r2323c31c3rv',1),
('Gabriel',17235739036,'Gabizinho@.hotmail.com','34523d313v13vv',1),
('Fernando',17992751489,'fernandinhoreis@gmail.com','23d23dv31vr1v',1)

insert into Profissional(nome,telefone,email,salarioFixo,comissao,senha,status)values
('Mario da silva',1723453223,'mario@hotmail.com',3000,0.05,'23d321d123r1v31',1),
('Cleber fernando',1791283182,'cleber@gmail.com',4000,0.07,'32d23d23dq13rvv',1),
('Daniel Xavier',1726127676,'Daniel@outlook.com',3500,0.09,'23ed22d3rv31v',1),
('Carmem queiroz',1734738282,'Carmem@hotmail.com',2500,0.04,'32d2d23v13v',1),
('Felipe anderson de souza',1743524352,'FelipinZN@gmail.com',1500,0.09,'32d2d2d3vr314',1)

insert into Agenda(idCliente,dataHora,tempoTotal,valorTotal,status)values
(1,'2025-05-20 13:30:00.000',0.5,20,1),
(1,'2025-05-20 14:00:00.000',0.5,20,1),
(2,'2025-05-20 14:30:00.000',0.5,20,1),
(4,'2025-05-20 15:00:00.000',0.5,20,1),
(3,'2025-05-20 15:30:00.000',0.5,20,1)

insert into Servico(descricao,valor,tempoMedio,status)values
('Corte Cabelo',40,25,1),
('Corte Barba',20,30,1),
('Pintura Cabelo',50,20,1),
('Lavagem Cabelo',20,10,1),
('Escova Cabelo',40,60,1)

insert into Servico_Agendado(idAgenda,idServico,idProfissional,valor,status)values
(1,1,1,23,1),
(2,2,1,25,1),
(3,3,2,43,1),
(4,4,3,32,1),
(5,2,4,36,1)

insert into Catalogo(idProfissional,idServico,status)values
(1,1,1),
(2,2,1),
(3,3,1),
(4,4,1),
(5,5,1)


UPDATE Profissional 
set email = 'felipin@gmail.com'
where id = 5;

UPDATE Cliente
set senha = 'senhanova'
where id = 3;

UPDATE Agenda
set status = 1
where id = 2;

UPDATE Catalogo
set status = 2
where idProfissional IN (1,2);

UPDATE Servico
set valor = valor*1.3
where id =3;


DELETE from Servico_Agendado where idAgenda = 1;
DELETE from Agenda where id = 1;
DELETE from Catalogo where idProfissional = 3;

DELETE FROM Servico_Agendado
DELETE FROM Agenda
DELETE FROM Catalogo
DELETE FROM Cliente
DELETE FROM Profissional
DELETE FROM Servico

select * from Cliente
select * from Profissional
select * from Agenda
select * from Servico
select * from Servico_Agendado
select * from Catalogo
