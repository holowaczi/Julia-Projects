using Plots, Distributions, Statistics

montecarlointegral(f::Function, a,b,N::Int64) = (b-a)*mean([f((b-a)*rand()+a) for i in 1:N])

xs = [montecarlointegral(sin,0.,pi,10^3) for i in 1:10^4]

histogram(xs)