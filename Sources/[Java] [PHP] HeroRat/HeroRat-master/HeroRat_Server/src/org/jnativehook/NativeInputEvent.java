package org.jnativehook;

import java.awt.Toolkit;
import java.util.EventObject;
import org.jnativehook.GlobalScreen;

public class NativeInputEvent extends EventObject {

   private static final long serialVersionUID = -4115869356455095225L;
   private int id;
   private long when;
   private int modifiers;
   public static final int SHIFT_MASK = 1;
   public static final int CTRL_MASK = 2;
   public static final int META_MASK = 4;
   public static final int ALT_MASK = 8;
   public static final int BUTTON1_MASK = 16;
   public static final int BUTTON2_MASK = 32;
   public static final int BUTTON3_MASK = 64;
   public static final int BUTTON4_MASK = 128;
   public static final int BUTTON5_MASK = 256;


   public NativeInputEvent(GlobalScreen var1, int var2, long var3, int var5) {
      super(var1);
      this.id = var2;
      this.when = var3;
      this.modifiers = var5;
   }

   public int getID() {
      return this.id;
   }

   public long getWhen() {
      return this.when;
   }

   public int getModifiers() {
      return this.modifiers;
   }

   public void setModifiers(int var1) {
      this.modifiers = var1;
   }

   public static String getModifiersText(int var0) {
      StringBuilder var1 = new StringBuilder(255);
      if((var0 & 1) != 0) {
         var1.append(Toolkit.getProperty("AWT.shift", "Shift"));
         var1.append('+');
      }

      if((var0 & 2) != 0) {
         var1.append(Toolkit.getProperty("AWT.control", "Ctrl"));
         var1.append('+');
      }

      if((var0 & 4) != 0) {
         var1.append(Toolkit.getProperty("AWT.meta", "Meta"));
         var1.append('+');
      }

      if((var0 & 8) != 0) {
         var1.append(Toolkit.getProperty("AWT.alt", "Alt"));
         var1.append('+');
      }

      if((var0 & 16) != 0) {
         var1.append(Toolkit.getProperty("AWT.button1", "Button1"));
         var1.append('+');
      }

      if((var0 & 32) != 0) {
         var1.append(Toolkit.getProperty("AWT.button2", "Button2"));
         var1.append('+');
      }

      if((var0 & 64) != 0) {
         var1.append(Toolkit.getProperty("AWT.button3", "Button3"));
         var1.append('+');
      }

      if((var0 & 128) != 0) {
         var1.append(Toolkit.getProperty("AWT.button4", "Button4"));
         var1.append('+');
      }

      if((var0 & 256) != 0) {
         var1.append(Toolkit.getProperty("AWT.button5", "Button5"));
         var1.append('+');
      }

      if(var1.length() > 0) {
         var1.deleteCharAt(var1.length() - 1);
      }

      return var1.toString();
   }

   public String paramString() {
      StringBuilder var1 = new StringBuilder(255);
      var1.append("id=");
      var1.append(this.getID());
      var1.append(',');
      var1.append("when=");
      var1.append(this.getWhen());
      var1.append(',');
      var1.append("mask=");
      var1.append(Integer.toBinaryString(this.getModifiers()));
      var1.append(',');
      var1.append("modifiers=");
      var1.append(getModifiersText(this.getModifiers()));
      return var1.toString();
   }
}
