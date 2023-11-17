let upstream = https://github.com/dfinity/vessel-package-set/releases/download/mo-0.10.2-20231113/package-set.dhall sha256:6ce0f76863d2e6c8872a59bf5480b71281eb0e3af14c2bda7a1f34af556abab2
let aviate-labs = https://github.com/aviate-labs/package-set/releases/download/v0.1.8/package-set.dhall sha256:9ab42c1f732299dc8c1f631d39ea6a2551414bf6efc8bbde4e11e36ebc6d7edd

let Package =
    { name : Text, version : Text, repo : Text, dependencies : List Text }

let additions =
  [
    { name = "base"
    , repo = "https://github.com/dfinity/motoko-base"
    , version = "moc-0.10.2"
    , dependencies = [] : List Text
    },
    { name = "sha2"
    , repo = "https://github.com/research-ag/sha2.git"
    , version = "main"
    , dependencies = ["base"] : List Text
    },
    { name = "hashmap"
    , repo = "https://github.com/ZhenyaUsenko/motoko-hash-map"
    , version = "master"
    , dependencies = [] : List Text
    },
    { name = "ic-certification"
    , repo = "https://github.com/nomeata/ic-certification"
    , version = "main"
    , dependencies = ["sha2"] : List Text
    },
  ] : List Package

in  upstream # aviate-labs # additions
