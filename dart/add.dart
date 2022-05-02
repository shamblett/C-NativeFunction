import 'dart:ffi';

typedef Cfunc = Int32 Function(Int32, Int32);
typedef Dartfunc = int Function(int, int);

int main() {

  print("Opening.....");
  final lib = DynamicLibrary.open('../bin/debug/net6.0/linux-x64/publish/NativeLibrary.so');

  print("Associating.....");
  Pointer<NativeFunction<Cfunc>> cadd = lib.lookup<NativeFunction<Cfunc>>('add');
  Dartfunc add = cadd.asFunction<Dartfunc>();

  print("Calling.....");
  final result = add(5, 3);
    if (result == 8)
    {
        print("Hoorah! the result is $result, this is correct");
    }
    else
    {
        print("Oops something is wrong the result is $result");
    }

 return 0;
   
}