function logpow --description 'Convert from exponential form to logarithmic form'
    set -f argv_joined (string join '' $argv)
    
    switch $argv_joined
        case '*=*'
            for side in (string split = $argv_joined)
                switch $side
                    case '*^*'
                        set -l exponentiation (string split ^ $side)
                        set -f base $exponentiation[1]
                        set -f exponent $exponentiation[2]

                    case '*'
                        set -f result $side
                end
            end

            echo log_\{$base\}\($exponent\) = $result
    end
end