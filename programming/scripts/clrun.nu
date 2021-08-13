def clrun [
        name: string,
        --solution: string
    ] {
    let clsp = (open $name);
    let clvm = (run $name);
    if ($solution == '') { 
        [["clsp" "clvm"]; [$clsp $clvm]];
    } {
        let output = (brun $clvm $solution)
        [["clsp" "clvm" "solution" "output"]; [$clsp $clvm $solution $output]];
    };
}