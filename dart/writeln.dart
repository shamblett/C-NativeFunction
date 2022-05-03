import 'dart:ffi';
import 'package:ffi/ffi.dart';

typedef Cfunc = Int32 Function(Pointer<Utf8>);
typedef Dartfunc = int Function(Pointer<Utf8>);

int main() {

  print("Opening.....");
  final lib = DynamicLibrary.open('../bin/debug/net6.0/linux-x64/publish/NativeLibrary.so');

  print("Associating.....");
  Pointer<NativeFunction<Cfunc>> cwriteln = lib.lookup<NativeFunction<Cfunc>>('write_line');
  Dartfunc writeln = cwriteln.asFunction<Dartfunc>();

  print("Calling.....");
  final result = writeln('Writeln test'.toNativeUtf8());
    if (result == 0)
    {
        print("Hoorah! the result is $result, this is correct");
    }
    else
    {
        print("Oops something is wrong the result is $result");
    }

 return 0;
   
}