#using Distributed

#rmprocs(procs())
#addprocs()

include("models.jl")
include("integrators.jl")
include("run_ens_forecast.jl")
using .Models
using .Integrators
using .run_ens_forecast

M = 30
D = 9
k = 41
k_r = 5

osc_vars = 1:D
modes = 2:3
model = Models.colpitts_true
model_err = Models.colpitts_err
integrator = Integrators.rk4
outfreq = 4
Δt = 0.1
m = 20
cycles = 1000
window = 40
record_length = 10000.0
ens_err_pct = 0.2
obs_err_pct = 0.1
transient = 1000

info, ssa_info = run_ens_forecast.ens_forecast_compare(model=model, model_err=model_err,
                                              M=M, D=D, k=k, k_r=k_r, modes=modes,
                                              osc_vars=osc_vars,
                                              integrator=integrator,
                                              outfreq=outfreq, Δt=Δt,
                                              m=m, cycles=cycles, window=window,
                                              record_length=record_length,
                                              ens_err_pct=ens_err_pct, obs_err_pct=obs_err_pct,
                                              transient=transient)
