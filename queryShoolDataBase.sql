-- Mostrare l'elenco (matricola, cognome, nome) degli studeti della classe 1A dell'A.S 2017-2018

-- 1 Soluzione
Select s.idStudente, s.matricola, s.nome, s.cognome
From schooldatabase.studente s, schooldatabase.classe c
Where s.Classe_Sezione = c.Sezione
And s.Classe_AnnoScolastico = c.AnnoScolastico
And s.Classe_AnnoAccademico = c.AnnoAccademico
And c.Sezione = 'A'
And c.AnnoScolastico = '2017/2018'
And c.AnnoAccademico = 'I';

-- 2 Soluzione
Select s.idStudente, s.matricola, s.nome, s.cognome 
From schooldatabase.studente as s
Where s.Classe_AnnoScolastico = '2017/2018'
And s.Classe_Sezione = 'A'
And s.Classe_AnnoAccademico = 'I';


*********************************************************************************************************


-- Data una classe, quali studenti di quella classe hanno frequentato i corsi organizzati
-- dalla scuola (ossia non esterni), nell'anno corrente, il titolo del corso e il tipo del
-- corso (recuper/sostegno/arricchimento)

Select s.idStudente, s.Matricola, s.Nome, s.Cognome, c.titolo as TitoloCorso, tc.descrizione as DescrizioneCorso
From schooldatabase.studente_has_corso as shc
Join schooldatabase.studente s 
On shc.Studente_idStudente = s.idStudente
Join schooldatabase.corso c 
On shc.Corso_idCorso = c.idCorso
Join schooldatabase.tipologiacorso tc 
On shc.Corso_TipologiaCorso_idTipologiaCorso = tc.idTipologiaCorso
Where shc.Studente_Classe_AnnoAccademico = 'II'
And shc.Studente_Classe_Sezione = 'B'
And shc.Studente_Classe_AnnoScolastico = '2018/2019'
Order by 1 desc;


*****************************************************************************************************************


-- Date la matricola di uno studente, mostrare i debiti formativi (con la relativa disciplina) 
-- di ogni anno scolastico; 

Select s.idStudente, s.Matricola, c.Titolo, tc.Descrizione, s.Classe_AnnoScolastico, s.Classe_AnnoAccademico, s.Classe_Sezione
From schooldatabase.studente_has_corso shc
Join schooldatabase.studente s On shc.Studente_idStudente = s.idStudente
Join schooldatabase.corso c On shc.Corso_idCorso = c.idCorso
Join schooldatabase.tipologiacorso tc On shc.Corso_TipologiaCorso_idTipologiaCorso = tc.idTipologiaCorso
Where s.matricola = '336811' And s.EsitoConclusivo = 'promosso'
Order by 1 desc;


********************************************************************************************************************

Select * From schooldatabase.studente_has_corso;

Select s.Studente_idStudente
From schooldatabase.studente_has_corso as s
Where s.Studente_Classe_AnnoAccademico = 'II'
And s.Studente_Classe_Sezione = 'A'
And s.Studente_Classe_AnnoScolastico = '2018/2019'
And s.Corso_TipologiaCorso_idTipologiaCorso in (Select tc.idTipologiaCorso 
											   From schooldatabase.tipologiacorso as tc
                                               Where tc.idTipologiaCorso != 4
                                               );
                                               
Select s.Matricola, s.Nome, s.Cognome, s.Classe_AnnoScolastico, s.Classe_Sezione, s.Classe_AnnoAccademico
from schooldatabase.studente s
Where s.idStudente in (
						Select s.Studente_idStudente
						From schooldatabase.studente_has_corso as s
						Where s.Studente_Classe_AnnoAccademico = 'II'
						And s.Studente_Classe_Sezione = 'A'
						And s.Studente_Classe_AnnoScolastico = '2018/2019'
						And s.Corso_TipologiaCorso_idTipologiaCorso in (Select tc.idTipologiaCorso 
																	   From schooldatabase.tipologiacorso as tc
																	   Where tc.idTipologiaCorso != 4
																	   )
					  );


*******************************************************************************************************************