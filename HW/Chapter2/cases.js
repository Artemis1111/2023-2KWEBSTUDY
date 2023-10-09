const permutation = (n, r) => {
    ans = 1
    for (step = n-r+1; step <= n; step ++){
        ans = ans*step
    }
    return ans
};

const combination = (n, r) => {
    ans = 1
    for (step = 1; step <= r; step ++){
        ans = ans*(n + 1 - step)/step
    }
    return ans
};

module.exports = {
    permutation,
    combination,
    multiPermutation: (n, r) => n**r,
    multiCombination: (n, r) => combination(n+r-1, r),
    };