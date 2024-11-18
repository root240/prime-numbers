def prime_sieve(limit):
  """
  Finds all prime numbers up to a given limit using the Sieve of Eratosthenes.

  Args:
    limit: The upper bound for finding prime numbers.

  Returns:
    A list of prime numbers up to the given limit.
  """

  prime = [True for i in range(limit + 1)]
  p = 2
  while (p * p <= limit):
    if (prime[p] == True):
      for i in range(p * p, limit + 1, p):
        prime[i] = False
    p += 1
  prime[0] = False
  prime[1] = False
  primes = []
  for p in range(limit + 1):
    if prime[p]:
      primes.append(p)
  return primes

# Example usage:
limit = 1000000  # Find primes up to 1 million
primes = prime_sieve(limit)
print(primes)
