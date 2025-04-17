using ACTRPVT
using Documenter

makedocs(
    warnonly = true,
    sitename = "ACTRPVT",
    format = Documenter.HTML(
        assets = [
            asset(
            "https://fonts.googleapis.com/css?family=Montserrat|Source+Code+Pro&display=swap",
            class = :css
        )
        ],
        collapselevel = 1
    ),
    modules = [
        ACTRPVT
    ],
    pages = [
        "Home" => "index.md",
        "Example" => "example.md",
        "Amortized Bayesian Inference" => "amortized_bayesian_inference.md",
        "API" => "api.md"
    ]
)

deploydocs(repo = "github.com/itsdfish/ACTRPVT.jl.git")
