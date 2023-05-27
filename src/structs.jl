"""
    PVTModel

# Fields

- `υ`: mean production rule utility 
- `τ`: production rule selection threshold 
- `λ`: utility microlapse decrement
- `γ`: mean conflict resolution time 
"""
struct PVTModel{T1,T2,T3,T4} <: ContinuousUnivariateDistribution
    υ::T1
    τ::T2
    λ::T3
    γ::T4
end

"""
    PVTModel(;υ, τ, λ, γ)

A constructor for the ACT-R PVT model. 

# Keywords

- `υ`: mean production rule utility 
- `τ`: production rule selection threshold 
- `λ`: utility microlapse decrement
- `γ`: mean conflict resolution time 
"""
function PVTModel(;υ, τ, λ, γ)
    return PVTModel(υ, τ, λ, γ)
end