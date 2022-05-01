# chia start crawler -r
# Start-Sleep -Seconds 30
# $n = 0
# while ($n -lt 20) {
#     $peers = sqlite3 "file:./crawler.db?mode=ro" "select * from good_peers;" ".exit" 2>&1
#     if ($peers -like "Error:*") {
#         #Write-Output "Error reading database..."
#         continue
#     }
#     $count = ($peers | Measure-Object -Line).Lines
#     $timestamp = ([DateTimeOffset](Get-Date)).ToUnixTimeSeconds()
#     Write-Output "$n $timestamp : $count"
#     Start-Sleep -Seconds 120
#     $n = $n + 1 
# }
# chia stop crawler
#rm ./crawler.db
chia start crawler -r
Start-Sleep -Seconds 120 
chia stop crawler
Start-Sleep -Seconds 15
sqlite3 "file:./crawler.db?mode=ro" "select count(*) from good_peers;" ".exit"
sqlite3 "file:./crawler.db?mode=ro" `
"select pr.ip_address
from peer_records pr
join good_peers gp
    where pr.ip_address = gp.ip
order by pr.added_timestamp
LIMIT 100;" `
".exit"
sqlite3 "file:./crawler.db?mode=ro" `
"select pr.ip_address
from peer_records pr
join good_peers gp
    where pr.ip_address = gp.ip
order by pr.added_timestamp
LIMIT 100;" `
".exit"

sqlite3 "file:./crawler.db?mode=ro" "select pr.version, count(*) from peer_records pr join good_peers gp on pr.ip_address = gp.ip group by pr.version;" ".exit"
#rm ./crawler.db
