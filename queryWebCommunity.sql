
-- Elenco degli eventi già svolti, in ordine alfabetico di provincia;
Select e.*
From webcommunity.evento e
Join webcommunity.territorioprovinciale t On e.TerritorioProvinciale_idTerritorioProvinciale = t.idTerritorioProvinciale 
Where str_to_date(e.dataEvento,'%d-%m-%Y') < sysdate()
order by t.siglaProvincia;



-- Elenco dei membri che non hanno mai inserito un commento;
Select m.*
From webcommunity.membrowebcommunity m
Where m.idMembroWebCommunity not in (Select distinct(cc.MembroWebCommunity_idMembroWebCommunity)
									  From webcommunity.commento cc
									);



-- Per ogni evento il voto medio ottenuto in ordine di categoria e titolo;
Select e.idEvento, e.titoloEvento, avg(c.votoEvento) votoMedio
From webcommunity.evento e
Join webcommunity.commento c On e.idEvento = c.Evento_idEvento
group by c.Evento_idEvento;



-- I dati dell'utente che ha registrato il maggior numero di eventi; 
Select m.idMembroWebCommunity, m.nomeMembro, m.cognomeMembro, count(c.MembroWebCommunity_idMembroWebCommunity)
From webcommunity.membrowebcommunity m
Join webcommunity.commento c On m.idMembroWebCommunity = c.MembroWebCommunity_idMembroWebCommunity
group by c.MembroWebCommunity_idMembroWebCommunity
order by 4 desc