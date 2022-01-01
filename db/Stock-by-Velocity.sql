select name, volume, beta, max_price, min_price, qty from stocks
where status = 'O'
order by volume DESC, name