# This file contains functions for different tasks

"""
    cumulsum(x)

Calculate the cumulative sum of elements in a nested array `x`.

# Arguments
- `x::AbstractArray`: Nested array to compute the cumulative sum.

# Returns
- The cumulative sum of all scalar elements in the nested array `x`.

# Examples
```julia
julia> cumulsum([1, 3])
4

julia> cumulsum([1, 2.5, 3])
6.5

julia> cumulsum([[1, 2], [3], [4, 5, 6]])
21
```
"""
function cumulsum(x::AbstractArray)
    total::Union{Int, Float64} = 0  # both integer and floating-point values
    for num in x
        total += (num isa AbstractArray) ? cumulsum(num) : num
    end
    return total
end