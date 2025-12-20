using Pkg
Pkg.activate(".")

using Test
using Oscar
using TensorCategories

# Include the module relative to this file's location in tests/
# When running from root as `julia tests/test_fusioncategories.jl`, relative include from file works.
include("../src/julia/FusionCategories/fusion_ring.jl")
using .FusionCategories

println("Testing FusionCategories module (TensorCategories backend)...")

@testset "Fibonacci Category" begin
    Fib = fibonacci_category()
    
    @test is_fusion(Fib)
    @test is_rigid(Fib)
    @test n_simples(Fib) == 2
    
    s = simples(Fib)
    # Fibonacci simples: 1, τ
    # We assume standard ordering or check identity
    one_obj = one(Fib)
    tau = s[2] # Usually the second one, but let's verifying
    
    if is_isomorphic(s[1], one_obj)[1]
        tau = s[2]
    else
        tau = s[1]
    end

    # Check indices
    @test simple_index(Fib, one_obj) > 0
    @test simple_index(Fib, tau) > 0
    
    # Check fusion rules: τ ⊗ τ = 1 ⊕ τ
    # Multiplicities
    id_idx = simple_index(Fib, one_obj)
    tau_idx = simple_index(Fib, tau)
    
    @test fusion_multiplicity(Fib, tau_idx, tau_idx, id_idx) == 1
    @test fusion_multiplicity(Fib, tau_idx, tau_idx, tau_idx) == 1
    @test fusion_multiplicity(Fib, id_idx, tau_idx, tau_idx) == 1
    
    # Check fusion coefficients API
    coeffs = fusion_coefficients(Fib, tau_idx, tau_idx)
    @test coeffs[id_idx] == 1
    @test coeffs[tau_idx] == 1
    
    # Check dim
    @test dim(one_obj) == 1
    # dim(τ) = golden ratio = (1+√5)/2 ≈ 1.618
    @test dim(tau)^2 == 1 + dim(tau)
end

@testset "Ising Category" begin
    Ising = ising_category()
    
    @test is_fusion(Ising)
    @test is_rigid(Ising)
    @test n_simples(Ising) == 3
    
    # Ising simples: 1, σ, ψ
    # Rules:
    # σ ⊗ σ = 1 ⊕ ψ
    # σ ⊗ ψ = σ
    # ψ ⊗ ψ = 1
    
    s = simples(Ising)
    one_obj = one(Ising)
    
    # Identify objects by dimension
    # dim(1)=1, dim(ψ)=1, dim(σ)=√2
    
    sigma = nothing
    psi = nothing
    
    for x in s
        if is_isomorphic(x, one_obj)[1]
            continue
        elseif dim(x)^2 == 2
            sigma = x
        elseif dim(x) == 1
            psi = x
        end
    end
    
    @test !isnothing(sigma)
    @test !isnothing(psi)
    
    sigma_idx = simple_index(Ising, sigma)
    psi_idx = simple_index(Ising, psi)
    one_idx = simple_index(Ising, one_obj)
    
    # Test σ ⊗ σ = 1 ⊕ ψ
    @test fusion_multiplicity(Ising, sigma_idx, sigma_idx, one_idx) == 1
    @test fusion_multiplicity(Ising, sigma_idx, sigma_idx, psi_idx) == 1
    @test fusion_multiplicity(Ising, sigma_idx, sigma_idx, sigma_idx) == 0
    
    # Test Hom space dimension directly
    @test dim(Hom(sigma ⊗ sigma, one_obj)) == 1
end

@testset "Direct Sum & Decompose" begin
    Fib = fibonacci_category()
    s = simples(Fib)
    tau = s[2] # Assuming ordered
    if is_isomorphic(s[1], one(Fib))[1]
        tau = s[2]
    else
        tau = s[1]
    end
    
    prod = tau ⊗ tau
    dec = decompose(prod)
    
    # Expect 1 and τ with coeff 1
    found_one = false
    found_tau = false
    
    for (obj, mult) in dec
        if is_isomorphic(obj, one(Fib))[1]
            found_one = true
            @test mult == 1
        elseif is_isomorphic(obj, tau)[1]
            found_tau = true
            @test mult == 1
        end
    end
    
    @test found_one
    @test found_tau
end

println("All tests passed!")