using Distributed

@everywhere include("models.jl")
@everywhere include("integrators.jl")
@everywhere using .Models
@everywhere using .Integrators

include("run_da_ssa.jl")
using .run_da_ssa

M = 30
D = 128
modes = 1:4
osc_vars = 1:D
model = "true"
model_err = "false"
integrator = Integrators.ks_integrate
outfreq = 4
Δt = 0.25
m = 20
cycles = 1000
window = outfreq*Δt
inflation = 1.01
record_length = 10000.0
obs_err_pct = 0.1
ens_err_pct = 0.01
transient = 0

info1, info2 = run_da_ssa.etkf_da_ssa_compare(model, model_err, M, D, modes,
                                              osc_vars, integrator, outfreq, Δt,
                                              m, cycles, window, inflation,
                                              record_length, obs_err_pct,
                                              ens_err_pct, transient)