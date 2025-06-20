-- Listar Agendamentos
SELECT *
FROM Agenda

-- Serviço mais Caro
SELECT TOP 1 * FROM Servico
ORDER BY valor

-- Clientes atendidos por profissional
SELECT Profissional.id as idProfissional, Profissional.nome as Nome, COUNT(DISTINCT Servico_Agendado.idAgenda) as 'Clientes Atendidos'
FROM Servico_Agendado, Profissional
WHERE Profissional.id = Servico_Agendado.idProfissional
GROUP BY Profissional.id, Profissional.nome

-- Cliente mais frequente.
SELECT TOP 1 Cliente.id as 'idCliente', Cliente.nome as 'Cliente', COUNT(Agenda.idCliente) as 'Agendamentos'
FROM Cliente, Agenda
WHERE Cliente.id = Agenda.idCliente
GROUP BY Cliente.id, Cliente.nome
ORDER BY 'Agendamentos' DESC

-- Top 3 serviços mais solicitados
SELECT TOP 3 Servico.id as idServico, Servico.descricao as 'Serviço', COUNT(Servico_Agendado.idServico) as 'Solicitações'
FROM Servico, Servico_Agendado
WHERE Servico.id = Servico_Agendado.idServico
GROUP BY Servico.id, Servico.descricao
ORDER BY 'Solicitações' DESC

-- Serviço mais solicitado por Profissional
SELECT Profissional.id, Profissional.nome, Servico.descricao, COUNT(Servico_Agendado.idServico) as 'Solicitações'
FROM Servico, Servico_Agendado, Profissional
WHERE Servico.id = Servico_Agendado.idServico and Profissional.id = Servico_Agendado.idProfissional
GROUP BY Profissional.id, Profissional.nome, Servico.descricao
ORDER BY 'Solicitações' DESC

-- Horário de pico
SELECT Agenda.dataHora, COUNT(*) Servico_Agendado
FROM Servico_Agendado, Agenda
WHERE Servico_Agendado.idAgenda = Agenda.id
GROUP BY Agenda.dataHora

-- Tempo médio das Agendas
SELECT SUM(tempoTotal)/COUNT(id) as TempoMedio
FROM Agenda

-- Profissional com a maior comissão
SELECT TOP 1 id, nome, comissao
FROM Profissional
ORDER BY comissao DESC

-- Número de serviços agendados por agenda
SELECT Agenda.id, Agenda.dataHora, COUNT(Servico_Agendado.idAgenda) as NumeroAgendamentos
FROM Servico_Agendado, Agenda
GROUP BY Agenda.id, Agenda.dataHora


select * from Agenda
