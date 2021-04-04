
#[derive(Clone, Copy)]
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

impl std::ops::AddAssign for ModInt {
    fn add_assign(&mut self, other: ModInt) {
        let ModInt(a) = self;
        let ModInt(b) = other;
        *a = (*a + b) % MOD;
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

impl std::ops::SubAssign for ModInt {
    fn sub_assign(&mut self, other: ModInt) {
        let ModInt(a) = self;
        let ModInt(b) = other;
        *a = (*a + MOD - b) % MOD;
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

impl std::ops::MulAssign for ModInt {
    fn mul_assign(&mut self, other: ModInt) {
        let ModInt(a) = self;
        let ModInt(b) = other;
        *a = (*a * b) % MOD;
    }
}

impl ModInt {
    fn pow(&self, n: u64) -> ModInt {
        if n == 0 {
            return ModInt(1);
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

impl std::fmt::Display for ModInt {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        let ModInt(a) = self;
        write!(f, "{}", a)
    }
}
