/************************************************************************************/
/* Script02a																		*/
/* Beschreibung: Welche Datebanken führen die meisen Lese-/Schreibvorgänge auf		*/
/* logische Seiten aus																*/
/************************************************************************************/
-- Total reads/writes nach Datenbank
SELECT TOP 10 
		Datenbank = DB_NAME(querytext.dbid),
        [Total Reads] = SUM(total_logical_reads),
		[Total Writes] = SUM(total_logical_writes)
		,[Execution count] = SUM(querystats.execution_count)
FROM sys.dm_exec_query_stats querystats
CROSS APPLY sys.dm_exec_sql_text(querystats.sql_handle) as querytext
GROUP BY DB_NAME(querytext.dbid)
ORDER BY [Total Reads], [Total Writes] DESC;