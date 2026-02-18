# DualNumbersAD.jl

This Julia package implements **dual numbers** for automatic differentiation.

## Installation

1. Clone the repository:
   git clone <your-repo-link>

2. Activate package:
   julia> using Pkg
   julia> Pkg.generate("C:/Users/shrut/Desktop/HW/DualNumbersAD")
   julia> Pkg.activate("C:/Users/shrut/Desktop/HW/DualNumbersAD")
   julia> using DualNumbersAD

## Example Usage

```julia
using DualNumbersAD

# First derivative
x = Dual(2.0, 1.0)
f(x) = x^3 + 2x + sin(x)
y = f(x)
println("f'(x) = ", y.epsilon)

# Second derivative
x2 = Dual(Dual(2.0, 1.0), Dual(1.0, 0.0))
y2 = f(x2)
println("f''(x) = ", y2.epsilon.epsilon)
