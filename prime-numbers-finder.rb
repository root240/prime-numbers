def sieve_of_eratosthenes(n)
  primes = Array.new(n + 1, true)
  primes[0] = primes[1] = false

  (2..Math.sqrt(n).ceil).each do |p|
    next unless primes[p]
    (p * p..n + 1).step(p) { |i| primes[i] = false }
  end

  primes.each_index.select { |i| primes[i] }
end

# Example usage:
limit = 100000
start_time = Time.now
prime_numbers = sieve_of_eratosthenes(limit)
end_time = Time.now

puts "Found #{prime_numbers.length} prime numbers up to #{limit} in #{end_time - start_time} seconds."
# Print the first 20 primes for demonstration
puts prime_numbers[0..19]
