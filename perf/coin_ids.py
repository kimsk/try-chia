import sys
from chia.types.blockchain_format.coin import Coin 

def main():
    parent_coin_info = bytes.fromhex("fe9a2901d7edb0e364e94266d0e095f700000000000000000000000000000001")
    puzzle_hash = bytes.fromhex("4721e2d05c7f83452c7918ceac83dd45b36ea98d15826e06498d358049e4fa88")

    max_amount = int(sys.argv[1])

    for amount in range(1, max_amount + 1):
        coin = Coin(parent_coin_info, puzzle_hash, amount)
        coin_id = coin.name() 

if __name__ == "__main__":
    main()