const ll MOD = 1000000007;

ll gcd(ll a, ll b) {
    return b == 0 ? a : gcd(b, a % b);
}

ll lcm(ll a, ll b) {
    return a / gcd(a, b) * b;
}

ll mod_add(ll a, ll b) {
    return (a + b) % MOD;
}

ll mod_sub(ll a, ll b) {
    return (a + MOD - b) % MOD;
}

ll mod_mul(ll a, ll b){
    return (a * b) % MOD;
}

ll mod_pow(ll base, ll po) {
    if(po == 0)
        return 1;
    else if(po == 1)
        return base;
    ll new_base = mod_pow(base, po / 2);
    return mod_mul(mod_mul(new_base, new_base), po % 2 == 0 ? 1 : base);
}

ll mod_div(ll a, ll b){
    return mod_mul(a, mod_pow(b, MOD - 2));
}
