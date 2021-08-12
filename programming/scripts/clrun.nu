def clrun [
        name: string,
        --solution: string
    ] {
    let clvm = (run $name);
    echo $clvm;
    let output = (brun $clvm $solution)
    echo $output;
    # run $name
}