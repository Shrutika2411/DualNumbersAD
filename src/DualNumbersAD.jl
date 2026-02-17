
module DualNumbersAD
export Dual

import Base: +, -, *, /, ^, sin, cos, exp, sqrt


# Dual Number Type
struct Dual{T}
    value::T
    epsilon::T
end


Dual(a::T) where {T} = Dual{T}(a, zero(T))

# Arithmetic Operations

# Addition
+(x::Dual, y::Dual) = Dual(x.value + y.value, x.epsilon + y.epsilon)
+(a::Number, x::Dual) = Dual(a + x.value, x.epsilon)
+(x::Dual, a::Number) = a + x

# Subtraction
-(x::Dual, y::Dual) = Dual(x.value - y.value, x.epsilon - y.epsilon)
-(a::Number, x::Dual) = Dual(a - x.value, -x.epsilon)
-(x::Dual, a::Number) = Dual(x.value - a, x.epsilon)

# Multiplication
*(x::Dual, y::Dual) = Dual(x.value*y.value, x.value*y.epsilon + x.epsilon*y.value)
*(a::Number, x::Dual) = Dual(a * x.value, a * x.epsilon)
*(x::Dual, a::Number) = a * x

# Division
/(x::Dual, y::Dual) = Dual(x.value/y.value, (x.epsilon*y.value - x.value*y.epsilon)/y.value^2)
/(a::Number, x::Dual) = Dual(a / x.value, -a * x.epsilon / x.value^2)
/(x::Dual, a::Number) = Dual(x.value / a, x.epsilon / a)

# Powers
^(x::Dual, n::Number) = Dual(x.value^n, n*x.value^(n-1)*x.epsilon)
^(a::Number, x::Dual) = Dual(a^x.value, a^x.value*log(a)*x.epsilon)


# Elementary Functions

sin(x::Dual) = Dual(sin(x.value), cos(x.value)*x.epsilon)
cos(x::Dual) = Dual(cos(x.value), -sin(x.value)*x.epsilon)
exp(x::Dual) = Dual(exp(x.value), exp(x.value)*x.epsilon)
sqrt(x::Dual) = Dual(sqrt(x.value), x.epsilon / (2*sqrt(x.value)))

# Printing

Base.show(io::IO, x::Dual) = print(io, "$(x.value) + $(x.epsilon)ε")

end # module
