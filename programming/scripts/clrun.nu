def clrun [
        name: string,
        --solution: string
    ] {
    let clsp = (open $name);
    let clvm = (run $name);
    if ($solution == '') { 
        [["clsp" "clvm"]; [$clsp $clvm]];
    } {
        let output = (brun $clvm $solution -c);
        [
            ["clsp" "clvm" "solution" "output" "cost"]; 
            [   $clsp
                $clvm
                $solution
                ($output | lines | nth 1)
                ($output | lines | nth 0 | str substring '7,' )
            ]
        ];
    };
}