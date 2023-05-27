using SafeTestsets

@safetestset "quantiles" begin
    using ACTRPVT
    using Statistics
    using Test
    using Random
    Random.seed!(8554)

    n_sims = 100_000
    parms = (υ=3.0885804, τ=3.431231232, λ=0.991,γ=0.0504) 
    _,rts = rand(PVTModel(;parms...), 10_000)
    qs = [mean(rts .< .150); quantile(rts[rts .≥ .150], .1:.1:.9)]
    true_qs = [0.05762,0.29208,0.33355,0.3731,0.41564,0.46351,0.52117,0.59382,0.7011,0.90495]
    @test qs ≈ true_qs rtol = 1e-2
end
