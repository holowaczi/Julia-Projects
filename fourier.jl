using Plots,QuadGK
T=1
A=1
n=10

function signal(x)
    type = 2
    T = 1
    A = 2
    if type == 1
        return A*mod(x,T)/T
    end
    if type == 2
        if 0 <= mod(x,T) <= T/2
            return A
        elseif T/2 < mod(x,T) <= T
            return -A
        end
    end
    if type == 3
        return 2*A*mod(x,T)/T - A
    end
    if type == 4
        return A*mod(x,T)^2/T^2
    end
    if type == 5
        return 2*A*mod(x,T)^2/T^2 - A
    end
    if type == 6
        return -mod(x,T)*(mod(x,T)-T)*4*A
    end
end

fourier_a(n) = (2/T)*quadgk(x -> signal(x)*cos(2*n*pi*x/T), 0, T)[1]
fourier_b(n) = (2/T)*quadgk(x -> signal(x)*sin(2*n*pi*x/T), 0, T)[1]

fourier_as = [fourier_a(i) for i in 1:n]
fourier_bs = [fourier_b(i) for i in 1:n]
ns = [i for i in 1:n]

a_0 = fourier_a(0)/2

fourier_val(x) = a_0 + sum(fourier_as.*cos.(2*pi*ns*x/T).+fourier_bs.*sin.(2*pi*ns*x/T))

plot(x->signal(x), 0:0.01:2*T, label="Signal")
plot!(x->fourier_val(x), 0.0,2*T, label="Fourier")


