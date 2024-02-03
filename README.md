# ACTRPVT

[![Build Status](https://github.com/itsdfish/ACTRPVT.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/itsdfish/ACTRPVT.jl/actions/workflows/CI.yml?query=branch%3Amain)

This repo contains Julia code for simulating an ACT-R model of fatigue in the psychomotor vigalence test. 

# Example

The following example illustrates how to generate simulated data from the model.

```julia
using ACTRPVT
parms = (
    υ = 4.0, # mean production utility 
    τ = 3.5, # production utility threshold
    λ = .98, # micro-lapse utility decrement
    γ = .04  # mean conflict resolution time 
)
isi,rts = rand(PVTModel(;parms...), 10_000)
```

## Installation

There are two methods for installing the package. Option 1 is to install without version control. In the REPL, use `]` to switch to the package mode and enter the following:

```julia
add https://github.com/itsdfish/ACTRPVT.jl
```
Option 2 is to install via a custom registry. The advantage of this approach is that you have more control over version control, expecially if you are using a project-specfic environment. 

1. Install the registry using the directions found [here](https://github.com/itsdfish/Registry.jl).
2. Add the package by typing `]` into the REPL and then typing (or pasting):

```julia
add ACTRPVT
```

# References

Gunzelmann, G., Gross, J. B., Gluck, K. A., & Dinges, D. F. (2009). Sleep deprivation and sustained attention performance: Integrating mathematical and cognitive modeling. Cognitive science, 33(5), 880-910.
