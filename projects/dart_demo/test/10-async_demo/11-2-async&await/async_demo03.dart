import 'dart:async';

void main() {
  checkVersion();
}

Future checkVersion() async {
  var entrypoint = await findEntrypoint();
  var exitCode = await runExecutable(entrypoint, 10);
  await flushThenExit(exitCode);
}

String findEntrypoint() {
  // 逻辑...
  return 'entrypoint';
}

String runExecutable(String entrypoint, int args) {
  // 逻辑...
  return 'executable';
}

String flushThenExit(String executable) {
  // 逻辑...
  return 'exit';
}