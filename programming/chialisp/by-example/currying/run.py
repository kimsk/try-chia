from cdv.util.load_clvm import load_clvm
from chia.types.blockchain_format.program import Program

hidden = load_clvm(
    "addition.clsp", package_or_requirement=__name__, search_paths=["../include"]
) 
main = load_clvm(
    "main.clsp", package_or_requirement=__name__, search_paths=["../include"]
)

print(hidden)
print(main)

solution = Program.to([hidden, [1, 2]])
print(solution)
result = main.run(solution)
print(result)
main_curried = main.curry(hidden)
print(main_curried)
result = main_curried.run(Program.to([[1,2]]))
print(result)
