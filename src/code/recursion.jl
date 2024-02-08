# This file contains functions for different tasks

"""
cumulsum(x)

Calculates the cumulative sum of x

Examples of x
x = [1,2,3]
x = [[1, 2], [3], [4, 5, 6]]
"""
function cumulsum(x)
    total = 0
    for num in x
        total += (num isa Array) ? cumulsum(num) : num
    end
    return total
end