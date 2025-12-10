using Pkg
Pkg.activate(".")

include("src/julia/QMLattice/QMLattice.jl")
using .QMLattice

println("Testing QMLattice module...")

try
    h = HilbertSpace(2)
    println("HilbertSpace created: ", h)
catch e
    println("Error creating HilbertSpace: ", e)
end

try
    ρ = [0.5 0.0 0.0 0.5; 0.0 0.0 0.0 0.0; 0.0 0.0 0.0 0.0; 0.5 0.0 0.0 0.5]
    pt = partial_trace(ρ, [2, 2], 2)
    println("Partial trace executed.")
catch e
    println("Error executing partial_trace: ", e)
end
