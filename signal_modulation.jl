using Plots
function linear_modulation(A,α,ω_0,Φ_0,k_a,k_Φ,k_f, t_range)
    t = t_range[1]:0.01:t_range[2]
    x = A*(1 .+k_a*α.*t).*cos.(ω_0.*t.+Φ_0.+k_Φ*α.*t.+k_f*α.*t.^2/2)
    return x
end
x1= linear_modulation(1,-1,2*pi*0.1,pi/2,2,0,2,[0,20])
plot(0:0.01:20,x1)

function sinusoidal_modlutaion(A,ω_m,ω_0,Φ_0,k_a,k_Φ,k_f, t_range)
    t = t_range[1]:0.01:t_range[2]
    x = A*(1 .+k_a*cos.(ω_m*t)).*cos.(ω_0.*t.+Φ_0.+k_Φ*cos.(ω_m*t).-k_f*ω_m*sin.(ω_m*t))
    return x
end

x2= linear_modulation(1,2*pi,2*pi*0.1,0,1,0,0,[0,20])
plot(0:0.01:20,x2)