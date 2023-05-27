module ACTRPVT
    using Distributions: ContinuousUnivariateDistribution
    using Distributions: Uniform
    using Distributions: Logistic
    import Distributions: rand 

    export PVTModel
    export rand 

    include("structs.jl")
    include("functions.jl")
end
