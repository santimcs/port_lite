UPDATE consensus 
SET stock_id =
(SELECT id FROM stocks S
WHERE S.name = consensus.name)