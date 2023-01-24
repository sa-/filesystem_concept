from times import Time
import options

type
  FsConcept* = concept
    proc catFile(fs: Self, path: string): string
    proc checksum(fs: Self, path: string): string
    proc createdTime(fs: Self, path: string): Time
    proc lastModified(fs: Self, path: string): Time
    proc getFileInfo(fs: Self, path: string)
    proc isDir(fs: Self, path: string): bool
    proc isFile(fs: Self, path: string): bool
    proc size(fs: Self, path: string): int
    proc sizes(fs: Self, paths: string): openArray[int]
    proc mkdir(fs: Self, path: string, createParents=true, existsOk=true): void
    proc copy(fs: Self, path1: string, path2, recursive=false, on_error= -1)  # TODO on_error
    proc delete(fs: Self, path: string, recursive=false, maxDepth= -1)
    proc diskUsage(fs: Self, path: string, total=true, maxDepth= -1)
    proc download(fs: Self, remote_path: string, local_path: string, recursive=false)
    proc exists(fs: Self, path: string): bool
    proc listDir(fs: Self, path: string, detail=true): openArray[string]
    proc find(fs: Self, path: string, maxDepth= -1, withDirs=false, detail=false)
    proc glob(fs: Self, path: string)
    proc move(fs: Self, path1: string, path2: string)
    proc open(fs: Self, path: string, mode:FileMode=fmRead, blockSize= -1, cacheOptions= -1, compression="none") 
    proc write(fs: Self, path: string, value: openArray[byte])
    proc writeString(fs: Self, path: string, value: string, encoding= -1, errors= -1, newLine="\n") # todo enums
    proc readBlock(fs: Self, path: string, offset: int, length: int, delimiter:Option[string])
    proc readBytes(fs: Self, path: string, start= -1, finish= -1)
    proc touch(fs: Self, path: string, truncate=true)
    proc upload(fs: Self, localPath: string, remotePath, recursive=false)
    proc walk(fs: Self, path: string, maxDepth= -1, topdown=true)
