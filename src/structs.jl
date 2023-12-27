"""
    PVTModel

An ACT-R model of the psychomotor vigilance test. 

# Fields

- `υ`: mean production rule utility 
- `τ`: production rule selection threshold 
- `λ`: utility microlapse decrement
- `γ`: mean conflict resolution time 

# References 

Gunzelmann, G., Gross, J. B., Gluck, K. A., & Dinges, D. F. (2009). Sleep deprivation and sustained attention performance: Integrating mathematical and cognitive modeling. Cognitive science, 33(5), 880-910.

Walsh, Matthew M., Glenn Gunzelmann, and Hans PA Van Dongen. "Computational cognitive modeling of the temporal dynamics of fatigue from sleep loss." Psychonomic bulletin & review 24 (2017): 1785-1807.
"""
struct PVTModel{T} <: ContinuousUnivariateDistribution
    υ::T
    τ::T
    λ::T
    γ::T
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

function PVTModel(υ, τ, λ, γ)
    υ, τ, λ, γ = promote(υ, τ, λ, γ)
    return PVTModel(υ, τ, λ, γ)
end