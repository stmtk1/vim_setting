use std::io::*;
use std::str::FromStr;

fn read<T: FromStr>() -> T {
    let stdin = stdin();
    let stdin = stdin.lock();
    let token: String = stdin
        .bytes()
        .map(|c| c.expect("faild to read char") as char)
        .take_while(|c| !c.is_whitespace())
        .collect();
    token
        .parse()
        .ok()
        .expect("faild to parse token")
}

fn main(){
    println!("hello world!");
}
