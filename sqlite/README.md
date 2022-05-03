``` sh
brew install sqlite
```

```
sqlite3 file:blockchain_v1_testnet7.sqlite?mode=ro

sqlite> .tables
block_records          full_blocks
coin_record            sub_epoch_segments_v3

sqlite> select count(*) from block_records;
377302

sqlite>PRAGMA table_info(block_records);
0|header_hash|text|0||1
1|prev_hash|text|0||0
2|height|bigint|0||0
3|block|blob|0||0
4|sub_epoch_summary|blob|0||0
5|is_peak|tinyint|0||0
6|is_block|tinyint|0||0

sqlite>PRAGMA table_info(coin_record);
0|coin_name|text|0||1
1|confirmed_index|bigint|0||0
2|spent_index|bigint|0||0
3|spent|int|0||0
4|coinbase|int|0||0
5|puzzle_hash|text|0||0
6|coin_parent|text|0||0
7|amount|blob|0||0
8|timestamp|bigint|0||

sqlite>.exit
```