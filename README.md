# ACTRPVT

[![Build Status](https://github.com/itsdfish/ACTRPVT.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/itsdfish/ACTRPVT.jl/actions/workflows/CI.yml?query=branch%3Amain)

This repo contains Julia code for simulating an ACT-R model of fatigue in the psychomotor vigalence test. 

# Example

The following example illustrates how to generate simulated data from the model.

```julia
using ACTRPVT
parms = (υ=4.0, τ=3.5, λ=.98, γ=.04)
isi,rts = rand(PVTModel(;parms...), 10_000)
```

# References

Gunzelmann, G., Gross, J. B., Gluck, K. A., & Dinges, D. F. (2009). Sleep deprivation and sustained attention performance: Integrating mathematical and cognitive modeling. Cognitive science, 33(5), 880-910.