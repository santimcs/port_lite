SELECT a.name,fm_date,to_date,fm_price,to_price,a.qty,a.max_price,a.min_price,t.status 
FROM sales a JOIN stocks t ON a.name = t.name
WHERE to_date = '2017-05-04'
ORDER BY t.status, a.name