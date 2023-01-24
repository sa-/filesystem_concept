import os
from times import Time

type
  FsLocal* = object

let fsLocal* = FsLocal()

proc catFile*(fs: FsLocal, path: string): string =
  return readFile(path)

proc createdTime*(fs: FsLocal, path: string): Time =
  return os.getFileInfo(path).creationTime

proc lastModified*(fs: FsLocal, path: string): Time =
  return os.getFileInfo(path).lastWriteTime

proc isDir*(fs: FsLocal, path: string): bool =
  return os.getFileInfo(path).kind in [os.pcDir, os.pcLinkToDir]

proc isFile*(fs: FsLocal, path: string): bool =
  return os.getFileInfo(path).kind in [os.pcFile, os.pcLinkToFile]

proc size*(fs: FsLocal, path: string): BiggestInt =
  return os.getFileSize(path)

proc mkdir*(fs: FsLocal, path: string, createParents=true, existsOk=true): void =
  if not createParents:
    assert not isDir(fsLocal, path.parentDir())
  if not existsOk:
    assert not isDir(fsLocal, path)
  createDir(path)
