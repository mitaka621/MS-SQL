update PlayersRanges
set PlayersMax+=1
where PlayersMin=2 and PlayersMax=2

update Boardgames
set Name+='V2'
where YearPublished>=2020