package org.jnativehook;


public class NativeSystem {

   public static NativeSystem.Family getFamily() {
      String var0 = System.getProperty("os.name");
      NativeSystem.Family var1;
      if(var0.equalsIgnoreCase("freebsd")) {
         var1 = NativeSystem.Family.FREEBSD;
      } else if(var0.equalsIgnoreCase("openbsd")) {
         var1 = NativeSystem.Family.OPENBSD;
      } else if(var0.equalsIgnoreCase("mac os x")) {
         var1 = NativeSystem.Family.OSX;
      } else if(!var0.equalsIgnoreCase("solaris") && !var0.equalsIgnoreCase("sunos")) {
         if(var0.equalsIgnoreCase("linux")) {
            var1 = NativeSystem.Family.LINUX;
         } else if(var0.toLowerCase().startsWith("windows")) {
            var1 = NativeSystem.Family.WINDOWS;
         } else {
            var1 = NativeSystem.Family.UNSUPPORTED;
         }
      } else {
         var1 = NativeSystem.Family.SOLARIS;
      }

      return var1;
   }

   public static NativeSystem.Arch getArchitecture() {
      String var0 = System.getProperty("os.arch");
      NativeSystem.Arch var1;
      if(var0.equalsIgnoreCase("alpha")) {
         var1 = NativeSystem.Arch.ALPHA;
      } else if(var0.toLowerCase().startsWith("arm")) {
         var1 = NativeSystem.Arch.ARM;
      } else if(var0.equalsIgnoreCase("ia64_32")) {
         var1 = NativeSystem.Arch.IA64_32;
      } else if(var0.equalsIgnoreCase("ia64")) {
         var1 = NativeSystem.Arch.IA64;
      } else if(var0.equalsIgnoreCase("mips")) {
         var1 = NativeSystem.Arch.MIPS;
      } else if(var0.equalsIgnoreCase("sparc")) {
         var1 = NativeSystem.Arch.SPARC;
      } else if(var0.equalsIgnoreCase("sparc64")) {
         var1 = NativeSystem.Arch.SPARC64;
      } else if(!var0.equalsIgnoreCase("ppc") && !var0.equalsIgnoreCase("powerpc")) {
         if(!var0.equalsIgnoreCase("ppc64") && !var0.equalsIgnoreCase("powerpc64")) {
            if(!var0.equalsIgnoreCase("x86") && !var0.equalsIgnoreCase("i386") && !var0.equalsIgnoreCase("i486") && !var0.equalsIgnoreCase("i586") && !var0.equalsIgnoreCase("i686")) {
               if(!var0.equalsIgnoreCase("x86_64") && !var0.equalsIgnoreCase("amd64") && !var0.equalsIgnoreCase("k8")) {
                  var1 = NativeSystem.Arch.UNSUPPORTED;
               } else {
                  var1 = NativeSystem.Arch.x86_64;
               }
            } else {
               var1 = NativeSystem.Arch.x86;
            }
         } else {
            var1 = NativeSystem.Arch.PPC64;
         }
      } else {
         var1 = NativeSystem.Arch.PPC;
      }

      return var1;
   }

   public static enum Family {

      FREEBSD("FREEBSD", 0),
      OPENBSD("OPENBSD", 1),
      OSX("OSX", 2),
      SOLARIS("SOLARIS", 3),
      LINUX("LINUX", 4),
      WINDOWS("WINDOWS", 5),
      UNSUPPORTED("UNSUPPORTED", 6);
      // $FF: synthetic field


      private Family(String var1, int var2) {}

   }

   public static enum Arch {

      ALPHA("ALPHA", 0),
      ARM("ARM", 1),
      IA64_32("IA64_32", 2),
      IA64("IA64", 3),
      MIPS("MIPS", 4),
      SPARC("SPARC", 5),
      SPARC64("SPARC64", 6),
      PPC("PPC", 7),
      PPC64("PPC64", 8),
      x86("x86", 9),
      x86_64("x86_64", 10),
      UNSUPPORTED("UNSUPPORTED", 11);
      // $FF: synthetic field
      //private static final NativeSystem.Arch[] $VALUES = new NativeSystem.Arch[]{ALPHA, ARM, IA64_32, IA64, MIPS, SPARC, SPARC64, PPC, PPC64, x86, x86_64, UNSUPPORTED};


      private Arch(String var1, int var2) {}

   }
}
