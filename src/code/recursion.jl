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

"""
    ispalindrome(word)

Check if the given word is a palindrome.

A palindrome is a word, phrase, number, or other 
sequence of characters that reads the same forward 
and backward.

# Arguments
- `word::AbstractString`: The word to check for palindrome.

# Returns
- `true` if the word is a palindrome, `false` otherwise.

# Examples
```julia
julia> ispalindrome("radar")
true

julia> ispalindrome("hello")
false
```
"""
function ispalindrome(word::AbstractString)::Bool
    len::Int = length(word)

    if len <= 1
        return true
    elseif word[1] == word[end]
        return ispalindrome(word[2:end-1])
    else
        return false
    end
end

# Alternative code
# function ispalindrome(word::AbstractString)::Bool
#     return word == reverse(word)
# end

"""

"""
mutable struct Mytime 
	hour::Int
	minute::Int
	second::Int
end

"""
    update_time!(time::Mytime, seconds::Int)

Increment a Mytime object by the specified number of seconds.

This function modifies the input Mytime object `time` by 
adding the specified number of seconds.

# Arguments
- `time::Mytime`: The Mytime object to be incremented.
- `seconds::Int`: The number of seconds to add to the Mytime object.

# Returns
- The modified Mytime object after the increment operation.

# Examples
```julia
julia> time = Mytime(10, 30, 45)
Mytime(10, 30, 45)

julia> update_time!(time, 30)
Mytime(10, 31, 15)

julia> update_time!(time, 200)
Mytime(10, 34, 35)
```
"""
function update_time!(time::Mytime, seconds::Int)
    time.second += seconds

    if time.second >= 60
        time.second -= 60
        time.minute += 1
        update_time!(time, 0)
    end

    if time.minute >= 60
        time.minute -= 60
        time.hour += 1
        update_time!(time, 0)
    end

    # @printf "%02d:%02d:%02d\n" time.hour time.minute time.second

     #### Using while loop
     
    # while time.second >= 60
    # 	time.second -= 60
    # 	time.minute += 1		
    # end
    
    # while time.minute >= 60
    # 		time.minute -= 60
    # 		time.hour += 1
    # end
end