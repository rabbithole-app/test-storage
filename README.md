# Test storage capacity

## Prerequisites

1. [dfx](https://github.com/dfinity/sdk)
2. [vessel 0.7.0](https://github.com/dfinity/vessel/releases/tag/v0.7.0) and later
```shell
vessel install
vessel verify --version 0.10.2
```

## Deploy and run

If this is your first time installing a project, then just type:
```sh
yarn install # npm install
./scripts/deploy.sh
node ./scripts/ic.test-storage.mjs
```

## Results with --incremental-gc and Trie

| index | uploaded | stable memory | max live | heap | memory | upgrade successfull | upgrade ex. time | max live postupgrade | heap postupgrade | memory postupgrade |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 0 | 100.00 mb | 100.00 mb | 85.04 mb | 145.20 mb | 224.00 mb | true | 16.34s | 100.02 mb | 102.09 mb | 288.00 mb |
| 1 | 200.00 mb | 200.00 mb | 207.06 mb | 213.15 mb | 448.00 mb | true | 23.32s | 200.03 mb | 202.11 mb | 480.00 mb |
| 2 | 300.00 mb | 300.01 mb | 200.03 mb | 402.35 mb | 480.00 mb | true | 30.73s | 300.04 mb | 302.12 mb | 672.00 mb |
| 3 | 400.00 mb | 400.01 mb | 300.04 mb | 502.36 mb | 672.00 mb | true | 37.43s | 400.06 mb | 402.13 mb | 864.00 mb |
| 4 | 500.00 mb | 500.01 mb | 400.06 mb | 602.38 mb | 864.00 mb | true | 45.11s | 0.00 mb | 1002.16 mb | 1088.00 mb |
| 5 | 600.00 mb | 600.01 mb | 500.07 mb | 702.40 mb | 1088.00 mb | true | 55.66s | 0.00 mb | 1202.17 mb | 1280.00 mb |
| 6 | 700.00 mb | 700.02 mb | 600.08 mb | 802.41 mb | 1280.00 mb | true | 61.70s | 0.00 mb | 1402.19 mb | 1472.00 mb |
| 7 | 800.00 mb | 800.02 mb | 700.09 mb | 902.42 mb | 1472.00 mb | true | 67.33s | 0.00 mb | 1602.20 mb | 1696.00 mb |
| 8 | 900.00 mb | 900.02 mb | 800.11 mb | 1002.43 mb | 1696.00 mb | true | 75.98s | 0.00 mb | 1802.22 mb | 1920.00 mb |
| 9 | 1000.00 mb | 1000.02 mb | 900.12 mb | 1102.45 mb | 1920.00 mb | true | 86.50s | 0.00 mb | 2002.23 mb | 2144.00 mb |
| 10 | 1100.00 mb | 1100.02 mb | 1000.13 mb | 1202.46 mb | 2144.00 mb | true | 94.26s | 0.00 mb | 2202.24 mb | 2336.00 mb |
| 11 | 1200.00 mb | 1200.03 mb | 1100.15 mb | 1302.47 mb | 2336.00 mb | true | 103.88s | 0.00 mb | 2402.26 mb | 2528.00 mb |
| 12 | 1300.00 mb | 1300.03 mb | 1200.16 mb | 1402.49 mb | 2528.00 mb | true | 113.27s | 0.00 mb | 2602.27 mb | 2720.00 mb |
| 13 | 1400.00 mb | 1400.03 mb | 1300.17 mb | 1502.51 mb | 2720.00 mb | true | 120.29s | 0.00 mb | 2802.29 mb | 2944.00 mb |
| 14 | 1500.00 mb | 1500.03 mb | 1400.18 mb | 1602.51 mb | 2944.00 mb | true | 126.74s | 0.00 mb | 3002.30 mb | 3136.00 mb |
| 15 | 1600.00 mb | 1600.04 mb | 1500.20 mb | 1702.53 mb | 3136.00 mb | true | 134.69s | 0.00 mb | 3202.32 mb | 3360.00 mb |
| 16 | 1700.00 mb | 1700.04 mb | 1600.21 mb | 1802.54 mb | 3360.00 mb | true | 139.43s | 0.00 mb | 3402.33 mb | 3552.00 mb |
| 17 | 1800.00 mb | 1800.04 mb | 1700.22 mb | 1902.56 mb | 3552.00 mb | true | 147.50s | 0.00 mb | 3602.35 mb | 3776.00 mb |
| 18 | 1900.00 mb | 1900.04 mb | 1800.23 mb | 2002.57 mb | 3776.00 mb | false | 138.42s | 1800.23 mb | 2002.57 mb | 3776.00 mb |

```
Caused by: Failed while trying to deploy canisters.
  Failed while trying to install all canisters.
    Failed to install wasm module to canister 'storage'.
      Failed during wasm installation call: The replica returned a replica error: reject code CanisterError, reject message Canister a4tbr-q4aaa-aaaaa-qaafq-cai trapped explicitly: RTS error: Cannot grow memory, error code None
```