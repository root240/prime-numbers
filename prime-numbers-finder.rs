use std::time::Instant;

fn sieve_of_eratosthenes(n: usize) -> Vec<usize> {
    let mut primes = vec![true; n + 1];
    let mut p = 2;

    while p * p <= n {
        if primes[p] {
            let mut i = p * p;
            while i <= n {
                primes[i] = false;
                i += p;
            }
        }
        p += 1;
    }

    let mut result = Vec::new();
    for i in 2..=n {
        if primes[i] {
            result.push(i);
        }
    }

    result
}

fn main() {
    let n = 1000000; // Adjust the upper limit as needed
    let start = Instant::now();
    let primes = sieve_of_eratosthenes(n);
    let duration = start.elapsed();

    println!("Found {} primes in {:.2?} seconds.", primes.len(), duration.as_secs_f64());

    // Print the first 20 primes for demonstration
    for (i, p) in primes.iter().enumerate().take(20) {
        print!("{} ", p);
        if (i + 1) % 10 == 0 {
            println!();
        }
    }
}
