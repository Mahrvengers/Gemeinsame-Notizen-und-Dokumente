/************************************************************************** ******************/
/* Script03.																				 */
/* Beschreibung: Ermittelt die Anzahl der fehlenden Indizes über alle Datenbanken hinweg	 */
/*																							 */
/*********************************************************************************************/
SELECT 
	Datenbank = DB_NAME(database_id)
	,[Anzahl fehlender Indizes] = count(*) 
FROM sys.dm_db_missing_index_details
GROUP BY DB_NAME(database_id)
ORDER BY [Anzahl fehlender Indizes] DESC;