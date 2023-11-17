import Time "mo:base/Time";

import HTTPTypes "http";

module {
    public type ID = Text;

    public type Chunk = {
        batchId : Nat;
        content : Blob;
    };

    public type AssetEncoding = {
        modified : Time.Time;
        chunkIds : [Nat32];
        totalLength : Nat;
    };

    public type AssetKey = {
        id : ID;
        name : Text;
        fileSize : Nat;
        parentId : ?ID;
        // A sha256 representation of the raw content calculated on the frontend side.
        // used for duplicate detection and certification
        sha256 : ?Blob;
    };

    public type Asset = {
        id : ID;
        key : AssetKey;
        headers : [HTTPTypes.HeaderField];
        encoding : AssetEncoding;
    };

    public type Batch = {
        key : AssetKey;
        chunkIds : [Nat32];
        expiresAt : Int;
    };

    public type CommitBatch = {
        batchId : Nat;
        headers : [HTTPTypes.HeaderField];
        chunkIds : [Nat32];
    };

    public type CommitUploadError = {
        #batchNotFound;
        #batchExpired;
        #chunkWrongBatch : Nat32;
        #chunkNotFound : Nat32;
        #empty;
        // #addFile : JournalTypes.FileCreateError;
    };

    public type InitUpload = {
        batchId : Nat;
    };

    public type UploadChunk = {
        chunkId : Nat32;
    };
};
