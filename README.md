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
Option 2 is to install via a custom registry. The advantage of this approach is greater version control through Julia's package management system. This entails two simple steps. 

1. Install the registry using the directions found [here](https://github.com/itsdfish/Registry.jl).
2. Add the package by typing `]` into the REPL and then typing (or pasting):

```julia
add ACTRPVT
```

I recommend adding the package to a [project-specific environment](https://pkgdocs.julialang.org/v1/environments/) and specifying version constraints in the Project.toml to ensure reproducibility. For an example, see the [Project.toml](Project.toml) file associated with this package.  

## Help

More extensive documentation is planned for the future. In the meantime, you can view the docstrings in the REPL by entering `?` and typing the name of a function or type. For example:

```julia 
help?> PVTModel
search: PVTModel

  PVTModel

  An ACT-R model of the psychomotor vigilance test.

  Fields
  ≡≡≡≡≡≡

    •  υ: mean production rule utility

    •  τ: production rule selection threshold

    •  λ: utility microlapse decrement

    •  γ: mean conflict resolution time

  References
  ≡≡≡≡≡≡≡≡≡≡

  Gunzelmann, G., Gross, J. B., Gluck, K. A., & Dinges, D. F. (2009). Sleep deprivation and
  sustained attention performance: Integrating mathematical and cognitive modeling. Cognitive
  science, 33(5), 880-910.

  Walsh, Matthew M., Glenn Gunzelmann, and Hans PA Van Dongen. "Computational cognitive
  modeling of the temporal dynamics of fatigue from sleep loss." Psychonomic bulletin &
  review 24 (2017): 1785-1807.

  ───────────────────────────────────────────────────────────────────────────────────────────

  PVTModel(;υ, τ, λ, γ)

  A constructor for the ACT-R PVT model.

  Keywords
  ≡≡≡≡≡≡≡≡

    •  υ: mean production rule utility

    •  τ: production rule selection threshold

    •  λ: utility microlapse decrement

    •  γ: mean conflict resolution time
```

# References

Gunzelmann, G., Gross, J. B., Gluck, K. A., & Dinges, D. F. (2009). Sleep deprivation and sustained attention performance: Integrating mathematical and cognitive modeling. Cognitive science, 33(5), 880-910.
