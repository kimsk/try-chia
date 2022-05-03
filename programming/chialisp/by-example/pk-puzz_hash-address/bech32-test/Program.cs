// puzz_hash:      eff07522495060c066f66f32acc2a77e3a3e737aca8baea4d1a64ea4cdc13da9

// > cdv encode 9e2e4b1edd32baedf2efc5bf9e43f0d95cc711a1cbe4c73046d2bbdce8c09f05 --prefix txch
// txch1nchyk8kax2awmuh0ckleuslsm9wvwydpe0jvwvzx62aae6xqnuzs0hzeea
// > cdv decode txch1nchyk8kax2awmuh0ckleuslsm9wvwydpe0jvwvzx62aae6xqnuzs0hzeea
// 9e2e4b1edd32baedf2efc5bf9e43f0d95cc711a1cbe4c73046d2bbdce8c09f05

using chia.dotnet.bech32;

var puzz_hash = "9e2e4b1edd32baedf2efc5bf9e43f0d95cc711a1cbe4c73046d2bbdce8c09f05";
Console.WriteLine(puzz_hash);

var bech32 = new Bech32M("txch");
var address = bech32.PuzzleHashToAddress(puzz_hash);

Console.WriteLine(address);
var _puzz_hash = Bech32M.AddressToPuzzleHashString(address);
Console.WriteLine(_puzz_hash);
