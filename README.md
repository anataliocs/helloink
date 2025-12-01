# helloink — ink! smart contract (Rust)

## Overview

This repository contains a minimal ink! smart contract written in Rust. The contract stores a single boolean in on-chain
storage and provides:

- Constructor: `new(init_value: bool)` — initializes the stored value.
- Message: `flip()` — toggles the stored boolean.
- Message: `get() -> bool` — returns the current value.

The contract is implemented in `lib.rs` using the `#[ink::contract]` macro and includes unit tests and optional
end-to-end (E2E) tests using `ink_e2e`.

## Tech stack

- Language: Rust (edition 2024)
- Framework: ink! 6.0.0-beta.1
- Package manager/build tool: Cargo
- Crate type: library crate (`lib.rs`)

## Requirements

- Rust toolchain with Cargo
    - Edition 2024 is specified in `Cargo.toml`.
    - ink! 6.0.0-beta.1 may require a specific Rust toolchain (nightly) and target setup.
    - TODO: Pin exact Rust toolchain (stable/nightly version) and any required targets/components.
- For E2E tests and deployment:
    - A Substrate node with `pallet-contracts` running locally or remotely.
    - `cargo-contract` CLI for building/instantiating ink! contracts.
    - TODO: Document the exact node (e.g., substrate-contracts-node) and versions used.

## Key Features

- Contract module: `helloink` (in `lib.rs`)
    - Storage: `Helloink { value: bool }`
    - Constructor: `new(init_value: bool) -> Self`
    - Messages:
        - `flip(&mut self)` — toggles `value`
        - `get(&self) -> bool` — reads `value`

## Configuration

`Cargo.toml` highlights:

```toml
[package]
name = "helloink"
edition = "2024"

[dependencies]
ink = { version = "6.0.0-beta.1", default-features = false, features = ["unstable-hostfn"] }

[dev-dependencies]
ink_e2e = { version = "6.0.0-beta.1" }

[features]
default = ["std"]
std = ["ink/std"]
ink-as-dependency = []
e2e-tests = []

[package.metadata.ink-lang]
abi = "ink"
```

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.

