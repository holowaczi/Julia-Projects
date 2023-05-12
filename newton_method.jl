using ForwardDiff
function newton_method(f::Function, x0, N)
    g= t-> ForwardDiff.derivative(t->f(t) , t)
    xn = x0
    for i in 1:N
        xn -= f(xn)/g(xn)
    end
    return xn
end

#dla f(x)=x^3-x^2+1 jedno miejsce zerowe dla x∈R
newton_method(x->x^3-x^2+1,-3,10^3)

#dla f(x)=x^2-2*cos(x)+exp(x) dwa miejsca zerowe dla x∈R, uzyskamy jedno z nich w zależności od wybranego x0
newton_method(x->x^2-2*cos(x)+exp(x),-1,10^3)
newton_method(x->x^2-2*cos(x)+exp(x),1,10^3)


