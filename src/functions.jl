"""
    rand(dist::PVTModel, n_trials::Int; isi_fun = () -> rand(2:10))

Simulates `n_trials` of reaction times for the ACT-R PVT Model

# Arguments

- `υ`: mean production rule utility 
- `τ`: production rule selection threshold 
- `λ`: utility microlapse decrement
- `γ`: mean conflict resolution time 
- `n_trials`: number of simulated trials 

# Keywords

-`isi_fun = () -> rand(2:10)`: function for generating inter-stimulus interval 
"""
function rand(dist::PVTModel, n_trials::Int; isi_fun = () -> rand(2:10))
    (;υ, τ, λ, γ) = dist
    rts = zeros(n_trials)
    isi = fill(0, n_trials)
    for t in 1:n_trials
        isi[t],rts[t] = simulate_trial(υ, τ, λ, γ; isi_fun)
    end
    return isi,rts
end

"""
    rand(dist::PVTModel; isi_fun = () -> rand(2:10))

Simulates a single trial for the ACT-R PVT Model

# Arguments

- `υ`: mean production rule utility 
- `τ`: production rule selection threshold 
- `λ`: utility microlapse decrement
- `γ`: mean conflict resolution time 
- `n_trials`: number of simulated trials 

# Keywords

-`isi_fun = () -> rand(2:10)`: function for generating inter-stimulus interval 
"""
function rand(dist::PVTModel; isi_fun = () -> rand(2:10))
    (;υ, τ, λ, γ) = dist
    return simulate_trial(υ, τ, λ, γ; isi_fun)
end

function simulate_trial(υ, τ, λ, γ; isi_fun = () -> rand(2:10))
    s = 0.45345 ##utility noise free [.45345]
    a_time = 0.085 ##time to attend fixed [.085]
    r_time = 0.06 ##time to respond fixed [.06]
    state = 1 ##[1=wait, 2 = attend 3 = respond]
    t = 0.0 ## model run time
    n_ml = 0 ## microlapse count
    # inter stimulus interval 
    isi = isi_fun()
    ub = isi + 10 ##point at which trial terminates [10 seconds]

    while (state == 1) && (t < ub) ##signal present
        if t ≤ isi 
            utility =  υ * λ^n_ml * [1.0,  0.0] .+ rand(Logistic(0.0, s), 2)
            t += rand_time(γ)  ## duration of conflict resolution
            max_util,max_idx = findmax(utility) ##conflict resolution
            if max_util < τ ##no production exceeds threshold
                n_ml += 1 ## increase microlapse count
            elseif max_idx == 2 ## respond utility exceeds threshold
                state = 4 ##respond
                t += rand_time(r_time)
            end
        else
            # pvt simulus present, prepare to encode
            state = 2
        end
    end

    # reset microlapse count 
    n_ml = 0
    while (state == 2) && (t < ub) ##signal present
        utility =  υ * λ^n_ml * [1.0,  0.0] .+ rand(Logistic(0.0, s), 2)
        t += rand_time(γ)  ## duration of conflict resolution
        max_util,max_idx = findmax(utility) ##conflict resolution
        if max_util < τ ##no production exceeds threshold
            n_ml += 1 ## increase microlapse count
        elseif max_idx == 1 ## attend utility exceeds threshold
            state = 3 ## prepare to respond
            t += rand_time(a_time)
        elseif max_idx == 2 ## respond utility exceeds threshold
            state = 4 ## respond
            t += rand_time(r_time)
        end
    end

    while (state == 3) && (t < ub) ## encoding complete
        utility = υ*λ^n_ml + rand(Logistic(0.0, s))
        t += rand_time(γ) ## duration of conflict resolution
        if utility < τ ## no production exceeds threshold
            n_ml += 1 ## increase microlapse count
        else ## respond utility exceeds threshold
            state = 4 ##respond
            t += rand_time(r_time)
        end
    end
    return isi,t - isi
end

"""
    rand_time(μ)

Sample from a uniform distribution given mean value μ. The range is μ
± μ/3. 

# Arguments

-`μ`: mean of uniform distribution
"""
rand_time(μ) = rand(Uniform(2 / 3 * μ, 4 / 3 * μ))