using DualNumbersAD
using Test


# Test Function

f(x) = x^3 + 2x + sin(x)

# First derivative
x1 = Dual(2.0, 1.0)
y1 = f(x1)
println("f(x) = ", y1.value)
println("f'(x) = ", y1.epsilon)
@test y1.epsilon ≈ 3*2^2 + 2 + cos(2)  # 14.58385...

# Second derivative (nested dual)
x2 = Dual(Dual(2.0, 1.0), Dual(1.0, 0.0))
y2 = f(x2)
println("f''(x) = ", y2.epsilon.epsilon)
@test y2.epsilon.epsilon ≈ 6*2 - sin(2)  # 11.0907...



