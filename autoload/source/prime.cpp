list<ll> get_prime(ll n) {
    list<ll> ret;
    if(n < 2){
        return ret;
    }
    ret.push_back(2);
    for(ll i = 3; i <= n; i += 2) {
        bool prime = true;
        repi(j, ret) {
            if(i < *j * *j) {
                break;
            }
            if(i % *j == 0) {
                prime = false;
                break;
            }
        }
        if(prime) {
            ret.push_back(i);
        }
    }
    return ret;
}
