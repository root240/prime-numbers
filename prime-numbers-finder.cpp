#include <iostream>
#include <vector>
#include <cmath>

using namespace std;

vector<int> sieve_of_eratosthenes(int n) {
    vector<bool> is_prime(n + 1, true);
    vector<int> primes;

    for (int p = 2; p * p <= n; p++) {
        if (is_prime[p]) {
            for (int i = p * p; i <= n; i += p) {
                is_prime[i] = false;
            }
        }
    }

    for (int p = 2; p <= n; p++) {
        if (is_prime[p]) {
            primes.push_back(p);
        }
    }

    return primes;
}

int main() {
    int n = 1000000; // Adjust the upper limit as needed
    auto start = chrono::high_resolution_clock::now();
    vector<int> primes = sieve_of_eratosthenes(n);
    auto end = chrono::high_resolution_clock::now();
    auto duration = chrono::duration_cast<chrono::milliseconds>(end - start);

    cout << "Found " << primes.size() << " primes in " << duration.count() << " milliseconds." << endl;

    // Print the first 20 primes for demonstration
    for (int i = 0; i < 20; i++) {
        cout << primes[i] << " ";
    }
    cout << endl;

    return 0;
}
