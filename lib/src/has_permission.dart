
/// See http://dartbug.com/22036
library which.src.has_permission;

enum FilePermission { EXECUTE, WRITE, READ, SET_UID, SET_GID, STICKY }
enum FilePermissionRole { WORLD, GROUP, OWNER }

bool hasPermission(int fileStatMode, FilePermission permission, {FilePermissionRole role: FilePermissionRole.WORLD}) {
  var bitIndex = _getPermissionBitIndex(permission, role);
  return (fileStatMode & (1 << bitIndex)) != 0;
}

int _getPermissionBitIndex(FilePermission permission, FilePermissionRole role) {
  switch (permission) {
    case FilePermission.SET_UID: return 11;
    case FilePermission.SET_GID: return 10;
    case FilePermission.STICKY: return 9;
    default: return (role.index * 3) + permission.index;
  }
}
