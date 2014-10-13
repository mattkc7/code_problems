=begin

By definition, the first two numbers in the Fibonacci sequence are 0 and 1, and each subsequent number is the sum of the previous two.

For example, the first ten Fibonacci numbers are:

0, 1, 1, 2, 3, 5, 8, 13, 21, 34
Write a function that accepts a number and returns the number at that position in the fibonnaci sequence.

=end

# recursive
def fib_recursion(n)
	return n if n == 0 || n == 1
	fib_recursion(n-1) + fib_recursion(n-2)
end

def fib_memoize(n)
	fib_values = [0, 1]
	while n > 2
		fib_values << fib_values[-1] + fib_values[-2]
		n -= 1
	end
	fib_values.last
end

def fib_loop(n)
	fib_a = 0
	fib_b = 1
	fib_c = fib_a + fib_b

	while n > 3
		fib_a = fib_b
		fib_b = fib_c
		fib_c = fib_a + fib_b
		n -= 1
	end

	fib_c
end

fib_input = 10

start_time = Time.now
val = fib_recursion(fib_input)
end_time = Time.now
puts "Fibonacci with recursion took #{end_time - start_time} seconds to get #{val}"

start_time = Time.now
val = fib_memoize(fib_input)
end_time = Time.now
puts "Fibonacci with memoizing took #{end_time - start_time} seconds to get #{val}"


start_time = Time.now
val = fib_loop(fib_input)
end_time = Time.now
puts "Fibonacci with looping took #{end_time - start_time} seconds to get #{val}"