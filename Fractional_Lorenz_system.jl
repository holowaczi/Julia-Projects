using FractionalDiffEq, Plots

function frac_lorenz(du, x, p, t)
    σ, b ,r = p
    du[1] = σ*(x[2]-x[1])
    du[2] = -x[1]*x[3]+r*x[1]-x[2]
    du[3] = x[1]*x[2]-b*x[3]
end

α = [0.9, 0.95, 0.98];
x0 = [0.1; 0; 0];
h = 0.01; tspan = (0, 50);
p = [10,8/3,28]

prob = FODESystem(frac_lorenz, α, x0, tspan, p)

sol = solve(prob, h, NonLinearAlg())
plot(sol,vars=(1, 2, 3), legend=false)
