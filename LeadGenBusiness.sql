/*Marcelo Aceituno R
Full Stack JAVA 0034 */

/*1. ¿Qué consulta ejecutaría para obtener los ingresos totales para marzo de 2012?*/

SELECT
SUM(amount) AS Total_Marzo_2012 
FROM billing

WHERE charged_datetime LIKE '2012%03%'


/*2. ¿Qué consulta ejecutaría para obtener los ingresos totales recaudados del cliente con una identificación de 2?*/

SELECT
	clients.client_id,
	clients.first_name,
	clients.last_name,
	SUM(amount) AS Total_Cliente_ID2
FROM billing
JOIN clients on clients.client_id = billing.client_id
WHERE clients.client_id = 2


/*3. ¿Qué consulta ejecutaría para obtener todos los sitios que posee client = 10?*/

SELECT
	clients.client_id,
    clients.first_name,
	clients.last_name,
	sites.domain_name
FROM sites
JOIN clients on clients.client_id = sites.client_id
WHERE clients.client_id = 10


/*4. ¿Qué consulta ejecutaría para obtener el número total de sitios creados por mes por año para el cliente con una identificación de 1? 
¿Qué pasa con el cliente = 20?*/

SELECT
	clients.client_id,
    clients.first_name,
	clients.last_name,
    sites.created_datetime,
	sites.domain_name
FROM sites
JOIN clients on clients.client_id = sites.client_id
WHERE clients.client_id = 1 
ORDER BY clients.client_id 


/*5. ¿Qué consulta ejecutaría para obtener el número total de clientes potenciales 
generados para cada uno de los sitios entre el 1 de enero de 2011 y el 15 de febrero de 2011?*/

SELECT 
	clients.client_id,
    clients.first_name,
	clients.last_name,
    sites.created_datetime,
	sites.domain_name
FROM sites
JOIN clients on clients.client_id = sites.client_id
WHERE created_datetime AND Date >= '2011/01/01' AND Date < '2011/02/15'


/* NO ENTENDI ESO DE LOS CLIENTES POTENCIALES GENERADOS*/
/* NO ENTENDI ESO DE LOS CLIENTES POTENCIALES GENERADOS*/
/* NO ENTENDI ESO DE LOS CLIENTES POTENCIALES GENERADOS*/

/*9. Escriba una sola consulta que recupere los ingresos totales recaudados de cada cliente para cada mes del año. 
Pídalo por ID de cliente.*/

SELECT 
	clients.client_id,
    clients.first_name,
	clients.last_name,
    sum(billing.amount)
FROM billing
JOIN clients on clients.client_id = billing.client_id
WHERE clients.client_id =2



/*10. Escriba una sola consulta que recupere todos los sitios que posee cada cliente. 
Agrupe los resultados para que cada fila muestre un nuevo cliente. 
Se volverá más claro cuando agregue un nuevo campo llamado 'sitios' que tiene todos los sitios que posee el cliente. (SUGERENCIA: use GROUP_CONCAT)*/

SELECT 
	clients.client_id,
    clients.first_name,
	clients.last_name,
    GROUP_CONCAT(domain_name , ' || ')         
FROM sites
JOIN clients on sites.client_id = clients.client_id 
group by sites.client_id
