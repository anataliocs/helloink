<p align="center">
  <a href="https://use.ink/docs/v6" target="blank"><img src="img/ink-banner.svg" width="400" alt="Ink Contract banner" /></a>
</p>

# helloink — ink! smart contract (Rust)

<p align="center">
  <a href="https://use.ink/docs/v6" target="blank"><img src="img/built-with-love-for-polkadot.svg" width="240" alt="Polkadot badge" /></a>
</p>

----

## Overview

A minimal [ink!](https://use.ink/docs/v6) smart contract written in Rust. The contract stores a single boolean in
on-chain
storage and provides:

- Constructor: `new(init_value: bool)` — initializes the stored value.
- Message: `flip()` — toggles the stored boolean.
- Message: `get() -> bool` — returns the current value.

The contract is implemented in `lib.rs` using the `#[ink::contract]` macro and includes unit tests and optional
end-to-end (E2E) tests using `ink_e2e`.

## Quickstart

**Build the contract:**

```bash
pop build --release
```

**Run the unit tests:**

```bash
pop test
```

**Deploy to local:**

- Spins up a local ink node
- You will have to download the local ink binary during the first run

```bash
pop up --path . \
  --constructor new \
  --args true \
  --suri //Alice \
  --url ws://localhost:9944
```

**Invoke deployed contract:**

- After deploying your contract, update the hash passed into the `--contract` flag below:
- This will invoke the `flip` message on the deployed contract on your local node

```bash
 pop call contract --path . \
 --contract 0x5801b439a678d9d3a68b8019da6a4abfa507de11 \
 --message flip \
 --url ws://localhost:9944/ \
 --suri //Alice \
 --execute
```

## Tech stack

- Rust (edition 2024)
- **ink!** 6.0.0-beta.1
- Cargo

## Requirements

- Install Brew: https://brew.sh/
- Install [Rust](https://rust-lang.org/tools/install/), [Cargo](https://doc.rust-lang.org/cargo/)
  and [Pop CLI](https://github.com/r0gue-io/pop-cli): https://use.ink/docs/v6/getting-started/setup

## Key Features

- Contract module: `helloink` (in `lib.rs`)
    - Storage: `Helloink { value: bool }`
    - Constructor: `new(init_value: bool) -> Self`
    - Messages:
        - `flip(&mut self)` — toggles `value`
        - `get(&self) -> bool` — reads `value`

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.

