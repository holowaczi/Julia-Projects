using Random, Distributions, HypothesisTests, LinearAlgebra, Plots, StatsBase
#Define Poisson process by times of jumps
function Poisson_process(T,λ)
    t=0
    ts= Float64[]
    while t<T
        t = t + rand(Exponential(λ^(-1)))
        if t<T
            push!(ts,t)
        end
    end
    return ts
end
#Set paraameters
T=10
λ=1
ts = Poisson_process(T,λ)

#Plot of poisson process
scatter(ts,[i for i in 0:length(ts)-1],seriestype = :steppost,markershape = :circle, markercolor=:black, legend=false)
scatter!(ts[2:end],[i-1 for i in 1:length(ts)],seriestype = :steppre,markershape = :circle, markercolor=:white)

for i in 1:length(ts)-1
    plot!([ts[i],ts[i+1]],[i-1,i-1], color=:black)
end
plot!([ts[end],T],[length(ts)-1,length(ts)-1],color=:black)

#Counting function
N(t,ts) = count(ts.<=t)

N(T,ts)


#Count number of jumps before t=5 in 10^6 Poisson processes
ns = Vector(undef,10^6)

for i in 1:10^6
    ns[i] = N(5,Poisson_process(T,λ))
end

#Plot results
histogram(ns, normalize=:pdf, linewidth=0, bins=-0.5:1:20.5)
scatter!(x->pdf(Poisson(λ*5),x), 0:1:20,linewidth=2)


#ChisqTesting function
O = [count(ns.==i) for i in 0:15]
E = normalize(pdf.(Poisson(5*λ), 0:15),1)

ChisqTest(O,E)
