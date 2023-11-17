import Trie "mo:base/Trie";
import Principal "mo:base/Principal";
import Text "mo:base/Text";
import Blob "mo:base/Blob";
import Iter "mo:base/Iter";
import Array "mo:base/Array";
import Char "mo:base/Char";
import Nat32 "mo:base/Nat32";
import Nat8 "mo:base/Nat8";
import Map "mo:hashmap/Map";
import Base64 "mo:encoding/Base64";
import Types "types";

module {
    type ID = Types.ID;

    public func keyPrincipal(x : Principal) : Trie.Key<Principal> {
        { key = x; hash = Principal.hash x };
    };

    public func keyText(t : Text) : Trie.Key<Text> {
        { key = t; hash = Text.hash t };
    };

    public func keyNat32(n : Nat32) : Trie.Key<Nat32> {
        { key = n; hash = Map.hashNat32 n };
    };

    // public func generateId() : async ID {
    //     let ae = AsyncSource.Source();
    //     let id = await ae.new();
    //     Text.map(UUID.toText(id), Prim.charToLower);
    // };

    func arrayToText(arr : [Nat8]) : Text {
        Text.fromIter(
            Iter.fromArray(
                Array.map<Nat8, Char>(
                    arr,
                    func(n : Nat8) : Char = Char.fromNat32(Nat32.fromNat(Nat8.toNat(n)))
                )
            )
        );
    };

    public func base64(b : Blob) : Text {
        let bytes = Blob.toArray(b);
        arrayToText(Base64.StdEncoding.encode(bytes));
    };
};
