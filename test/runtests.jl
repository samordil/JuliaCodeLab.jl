using JuliaCodeLab
using Test

@testset "JuliaCodeLab.jl" begin
    # Test for cumulsum from recursion.jl file.
    @test JuliaCodeLab.cumulsum([[1, 2], [3], [4, 5, 6]]) == 21
    @test JuliaCodeLab.cumulsum([1,2,3]) == 6

end
