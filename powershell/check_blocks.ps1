$state = cdv rpc state | ConvertFrom-Json

$header_hash = $state.peak.header_hash
$height = $state.peak.height


$spent_block_index = 778356
$header_hash = '0x317e632bdc7fcc28a29cb88b5924fb0d38950c887fbbfdd905d3f66c41d15944'

$blockcoins = cdv rpc blockcoins $header_hash
$blockcoins