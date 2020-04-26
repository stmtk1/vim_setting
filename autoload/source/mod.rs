#[derive(Clone)]
struct ModInt(u64);
const MOD: u64 = 1000000007;

impl std::ops::Add for ModInt {
    type Output = ModInt;

    fn add(self, other: ModInt) -> ModInt {
        let ModInt(a) = self;
        let ModInt(b) = other;
        ModInt((a + b) % MOD)
    }
}

impl std::ops::Sub for ModInt {
    type Output = ModInt;

    fn sub(self, other: ModInt) -> ModInt {
        let ModInt(a) = self;
        let ModInt(b) = other;
        ModInt((a + MOD - b) % MOD)
    }
}

impl std::ops::Mul for ModInt {
    type Output = ModInt;

    fn mul(self, other: ModInt) -> ModInt {
        let ModInt(a) = self;
        let ModInt(b) = other;
        ModInt((a * b) % MOD)
    }
}

impl ModInt {
    fn pow(&self, n: u64) -> ModInt {
        if n == 0 {
            return self.clone();
        }
        let prev = self.pow(n / 2);
        if n % 2 == 1 {
            prev.clone() * prev * self.clone()
        } else {
            prev.clone() * prev
        }
    }

    fn inverse(&self) -> ModInt {
        self.pow(MOD - 2)
    }
}

impl std::ops::Div for ModInt {
    type Output = ModInt;

    fn div(self, other: ModInt) -> ModInt {
        self * other.inverse()
    }
}
