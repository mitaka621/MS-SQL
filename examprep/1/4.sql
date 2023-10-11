
delete from CreatorsBoardgames
where BoardgameId in (1,16,31,47)

delete from Boardgames
where PublisherId in (1,16)

delete from Publishers
where AddressId=5

delete from Addresses
where Town like 'L%'