package org.jnativehook;


public class NativeHookException extends Exception {

   private static final long serialVersionUID = 6199753732102764333L;


   public NativeHookException() {}

   public NativeHookException(String var1) {
      super(var1);
   }

   public NativeHookException(String var1, Throwable var2) {
      super(var1, var2);
   }

   public NativeHookException(Throwable var1) {
      super(var1);
   }
}
