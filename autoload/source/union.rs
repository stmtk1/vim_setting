struct UnionFind {
    parents: Vec<usize>,
    nums: Vec<u64>,
}

impl UnionFind {
    fn new(n: usize) -> UnionFind {
        UnionFind {
            parents: (0..n).collect(),
            nums: (0..n).map(|_| 1).collect()
        }
    }

    fn find(&mut self, n: usize) {
        if self.parents[n] == n {
            n
        } else {
            self.parents[n] = self.find(self.parents[n]);
            return self.parents[n];
        }
    }

    fn union(&mut self, n: usize, m: usize) {
        let x = self.find(n);
        let y = self.find(m);

        if x == y {
            return;
        }

        self.parents[x] += self.parents[y];
    }
}
