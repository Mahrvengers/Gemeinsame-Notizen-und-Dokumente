SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

/************************************************************************************/
/* sqlXpert GmbH - Erste Hilfe														*/
/* Script01																			*/
/* Beschreibung: Herausfinden, welche Objekte Wartezeiten verursachen				*/
/*          																		*/
/************************************************************************************/
SELECT TOP 10
	[Wartetyp] = wait_type,
	[Wartezeit (sek.)] = wait_time_ms / 1000,
	[% warten] = CONVERT(DECIMAL(12,2), wait_time_ms * 100.0 / SUM(wait_time_ms) OVER())
FROM sys.dm_os_wait_stats
WHERE wait_type NOT LIKE '%SLEEP%' 
ORDER BY [% warten] DESC;
